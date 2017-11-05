package com.express.controller;

import com.google.common.collect.Lists;

import com.express.commons.constant.ErrorCodeEnum;
import com.express.commons.util.JacksonUtils;
import com.express.commons.util.RetJacksonUtil;
import com.express.commons.util.SmsUtil;
import com.express.domain.Order;
import com.express.domain.Task;
import com.express.domain.TaskVo;
import com.express.domain.User;
import com.express.interceptor.HostHolder;
import com.express.service.MessageService;
import com.express.service.OrderService;
import com.express.service.TaskService;
import com.express.service.UserService;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.stream.Collectors;

import redis.clients.jedis.BinaryClient;

/**
 * 用户任务Controller
 */

@Controller
@RequestMapping("/task")
public class TaskController {
    private static final Log LOG = LogFactory.getLog(TaskController.class);
    @Autowired
    private TaskService taskService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private HostHolder holder;
    @Autowired
    private UserService userService;
    @Autowired
    private MessageService msgService;
    /**
     * 发布任务
     * @param startAdd
     * @param endAdd
     * @return
     */
    public String add(String startAdd, String endAdd) {
        return RetJacksonUtil.resultOk();
    }

    /**
     * 删除任务
     * 可有多个任务，通过id来删除
     * @return
     */
    public String delete(int taskId) {
        return RetJacksonUtil.resultOk();
    }

    /**
     * 修改任务
     * @param startAdd
     * @param endAdd
     * @return
     */
    public String update(int taskId, String startAdd, String endAdd) {
        return RetJacksonUtil.resultOk();
    }

    /**
     * 获取运营商用户任务清单。一个route可以对应多个task
     * @return
     */
    @RequestMapping("/listTasks")
    @ResponseBody
    public String listTasks() {
        long userId = holder.getUserId();
        Map<String, List<Task>> result = taskService.selectAllByUserId(userId);
        LOG.info("TaskController.listTasks.result : " + result.toString());
        return JacksonUtils.toJson(result);
    }

    /**
     * 获取运营商用户任务清单。一个route可以对应多个task
     * @return
     */
    @RequestMapping(value="/listTask",method= RequestMethod.POST,produces="text/html;charset=UTF-8")
    @ResponseBody
    public String listTask(@RequestParam("isFinish") boolean isFinish) {
        List<TaskVo> vos = Lists.newArrayList();
        long userId = holder.getUserId();
        List<Task> tasks = taskService.selectBy(userId, isFinish);
        if(CollectionUtils.isEmpty(tasks)) {
            LOG.info("TaskController.listTask Task is NULL. Params:{userId=" + userId + ", isFinish=" + isFinish + "}");
            return JacksonUtils.toJson(vos);
        }
        LOG.info("TaskController.listTasks.result : " + tasks.toString());
        List<Long> orderIds = tasks.stream().map(i -> i.getOrderId()).collect(Collectors.toList());
        Map<Long, Order> orderMap = orderService.selectMapByOrderIds(orderIds);
        for(Task task : tasks) {
            TaskVo vo = new TaskVo();
            vo.setTaskId(task.getId());
            vo.setOrderId(task.getOrderId());
            Order order = orderMap.get(task.getOrderId());
            if(order != null) {
                vo.setTakeName(order.getTakeName());
                vo.setCreateTime(order.getCreateTime());
            }
            vos.add(vo);
        }
        LOG.info("TaskController.listTask. taskVos:" + vos.toString());
        return JacksonUtils.toJson(vos);
    }

    /**
     * 运营商用户更新任务，
     * 对应的order也要实时更新
     * 这里虽然数据有冗余，但是对业务需求有优化
     * 若更新一个成功，更新另一个失败，就设计到事务的一致性
     * @return
     */
    @RequestMapping(value="/update/finish",method= RequestMethod.POST,produces="text/html;charset=UTF-8")
    @ResponseBody
    public String updateFinish(@RequestParam("isFinish") boolean isFinish,
                               @RequestParam("taskId") long taskId,
                               @RequestParam("code") int code) {

        //先判断该task是否属于该用户
        long userId = holder.getUserId();
        Task task = taskService.selectByTaskId(taskId);
        if(task==null || userId != task.getUserId()) {
            LOG.error("TaskController.updateFinish.the task is not belong to hostUser！！！");
            return RetJacksonUtil.resultWithFailed(ErrorCodeEnum.NO_AUTH);
        }
        //验证码检验
        Order order = orderService.selectByOrderId(task.getOrderId());
        if(order == null) {
            LOG.error("TaskCOntroller.updateFinish.order is null");
            return JacksonUtils.toJson("错误，order为NULL");
        }
        int codeOlder = (int)holder.getAttribute(String.valueOf(order.getTakePhone()));
        if(codeOlder != code) {
            LOG.error("TaskCOntroller.updateFinish.code is warn");
            return JacksonUtils.toJson("验证码错误");
        }
        //更新task
        int resultTask = taskService.updateFinish(isFinish, taskId);

        //更新对应的order
        int resultOrder = orderService.updateFinish(isFinish, task.getOrderId());

        //通知发货人，order已被签收
        msgService.createMsg(order.getUserId(), "订单完成通知", "尊敬的用户,您好。您从" + order.getSendAddress()
                + "发往" + order.getTakeAddress() + "的订单，已被签收。", false);

        if(resultOrder != 1 || resultTask != 1) {
            LOG.error("TaskController.updateFinish.ERROR");
            return RetJacksonUtil.resultWithFailed(ErrorCodeEnum.DB_ERROR);
        }
        return JacksonUtils.toJson("更新成功");
    }


    /**
     * 更新task行程
     * @param taskId
     * @param route
     * @return
     */
    @RequestMapping("/update/route")
    @ResponseBody
    public String updateRoute(@RequestParam("taskId") long taskId,
                              @RequestParam("route") String route) {
        int result = taskService.updateRoute(route, taskId);
        if(result != 1) {
            LOG.error("TaskController.updateRoute.ERROR");
            return RetJacksonUtil.resultWithFailed(ErrorCodeEnum.DB_ERROR);
        }
        return RetJacksonUtil.resultOk();
    }

    @RequestMapping("/sendCode")
    @ResponseBody
    public String sendCode(@RequestParam("taskId") long taskId) {
        Task task = taskService.selectByTaskId(taskId);
        if(task == null) {
            LOG.error("TaskController.sendCode.error");
            return JacksonUtils.toJson("error");
        }
        Order order = orderService.selectByOrderId(task.getOrderId());
        if(order == null) {
            LOG.error("TaskCOntroller.sendCode.error");
            return JacksonUtils.toJson("error");
        }
        Random random = new Random();
        int code =  random.nextInt(999999);
        //将产生的验证码放入到session中
        holder.setAttribute(String.valueOf(order.getTakePhone()), code);
        SmsUtil.sendCode(order.getTakePhone(), order.getTakeName(), code);
        LOG.info("TaskController.sendCode.SUCCESS code=" + code);
        return JacksonUtils.toJson("success");
    }
}
