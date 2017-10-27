package com.express.controller;

import com.express.commons.constant.ErrorCodeEnum;
import com.express.commons.util.JacksonUtils;
import com.express.commons.util.RetJacksonUtil;
import com.express.domain.Task;
import com.express.interceptor.HostHolder;
import com.express.service.OrderService;
import com.express.service.TaskService;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

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
     * 运营商用户更新任务，
     * 对应的order也要实时更新
     * 这里虽然数据有冗余，但是对业务需求有优化
     * 若更新一个成功，更新另一个失败，就设计到事务的一致性
     * @return
     */
    @RequestMapping("/update/finish")
    @ResponseBody
    public String updateFinish(@RequestParam("isFinish") boolean isFinish,
                               @RequestParam("taksId") long taskId) {
        //先判断该task是否属于该用户
        long userId = holder.getUserId();
        Task task = taskService.selectByTaskId(taskId);
        if(userId != task.getUserId()) {
            LOG.error("TaskController.updateFinish.the task is not belong to hostUser！！！");
            return RetJacksonUtil.resultWithFailed(ErrorCodeEnum.NO_AUTH);
        }

        //更新task
        int resultTask = taskService.updateFinish(isFinish, taskId);

        //更新对应的order
        int resultOrder = orderService.updateFinish(isFinish, task.getOrderId());

        if(resultOrder != 1 || resultTask != 1) {
            LOG.error("TaskController.updateFinish.ERROR");
            return RetJacksonUtil.resultWithFailed(ErrorCodeEnum.DB_ERROR);
        }
        return RetJacksonUtil.resultOk();
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
}
