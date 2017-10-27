package com.express.controller;

import com.google.common.collect.Maps;

import com.express.commons.constant.ErrorCodeEnum;
import com.express.commons.util.IDUtils;
import com.express.commons.util.JacksonUtils;
import com.express.commons.util.RetJacksonUtil;
import com.express.dao.OrderDao;
import com.express.domain.Order;
import com.express.domain.Route;
import com.express.domain.Task;
import com.express.interceptor.HostHolder;
import com.express.service.OrderService;
import com.express.service.RouteService;
import com.express.service.TaskService;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

@Controller
@RequestMapping("/order")
public class OrderController {
    private static final Log LOG = LogFactory.getLog(OrderController.class);
    @Autowired
    private HostHolder holder;
    @Autowired
    private OrderService orderService;
    @Autowired
    private RouteService routeService;
    @Autowired
    private TaskService taskService;
    /**
     * 获取用户的所有订单
     * @return
     */
    @RequestMapping(value="/listOrder",method= RequestMethod.GET,produces="text/html;charset=UTF-8")
    @ResponseBody
    public String listOrder() {
        long userId = holder.getUserId();
        LOG.info("OrderController.getUserId : " + userId);
        Map<String, Object> result = orderService.selectAllByUserId(userId);
        LOG.info("OrderController.listOrder.result :" + result.toString());
        String resultJson = JacksonUtils.toJson(result);
        Date date = new Date();
        long time = date.getTime();
        return resultJson;
    }

    /**
     * 创建订单，会一起创建运营商用户的task，
     * @return
     */
    @RequestMapping("/addOrder")
    @ResponseBody
    public String addOrder(@RequestParam("order") Order order) {
        if(order == null) {
            return RetJacksonUtil.resultWithFailed(ErrorCodeEnum.NO_PARAM);
        }
        //获取Route
        Route route = routeService.selectByRouteId(order.getRouteId());
        //获取对应的运营商用户
        long routeUserId = route.getUserId();

        //创建Order
        order.setId(IDUtils.getOrderId());
        int resultOfAddOrder = orderService.addOrder(order);

        //创建task
        Task task = new Task();
        task.setUserId(routeUserId);
        task.setRoute(task.getRoute() + "-" + order.getSendAddress());
        task.setRouteId(route.getId());
        task.setOrderId(order.getId());
        int resultOfAddTask = taskService.addTask(task);

        if(resultOfAddOrder != 1 || resultOfAddTask != 1) {
            return RetJacksonUtil.resultWithFailed(ErrorCodeEnum.DB_ERROR);
        }
        return RetJacksonUtil.resultOk();
    }

    /**
     * 添加评论
     * @param score
     * @param comment
     * @return
     */
    @RequestMapping("/addComment")
    @ResponseBody
    public String addComment(@RequestParam("score") int score,
                             @RequestParam("comment") String comment,
                             @RequestParam("orderId") long orderId) {
        //需要检验该order是否是属于该用户的
        long userId = holder.getUserId();
        Order order = orderService.selectByOrderId(orderId);
        if(order == null || order.getUserId() != userId) {
            LOG.error("OrderController.addComment.the order is not belong to hostUser");
            return RetJacksonUtil.resultWithFailed(ErrorCodeEnum.NO_AUTH);
        }
        int result = orderService.addComment(score, comment, orderId);
        if(result != 1) {
            LOG.error("OrderController.addComment.ERROR");
            return RetJacksonUtil.resultWithFailed(ErrorCodeEnum.DB_ERROR);
        }
        return RetJacksonUtil.resultOk();
    }

    /**
     * 通过订单查询订单详情，行程，时间
     * @param orderId
     * @return
     */
    @RequestMapping("/getRoute")
    @ResponseBody
    public String getRoute(long orderId) {
        Order order = orderService.selectByOrderId(orderId);
        if(order == null) {
            LOG.warn("OrderController.getRoute  Route is NULL");
            return RetJacksonUtil.resultWithFailed(ErrorCodeEnum.RETURN_NULL_ERROR);
        }
        Map<String, Object> info = Maps.newHashMap();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");
        long startTime = order.getStartTime();
        boolean isFinish = order.isFinish();
        info.put("startTime", sdf.format(new Date(startTime)));
        info.put("isFinish", isFinish);
        Task task = taskService.selectByOrderId(orderId);
        if(task == null) {
            LOG.error("OrderController.getRoute the order don't have task!!!");
            return JacksonUtils.toJson(info);
        }
        String routeInfo = task.getRoute();
        info.put("route", routeInfo);
        if(isFinish) {
            //若订单结束，就直接通过order中的updateTime来充当订单结束时间
            Date endTime = order.getUpdateTime();
            info.put("endTime", sdf.format(endTime));
        } else {
            //若订单未结束，则通过route中的endTime来充当预计结束时间
            Route route = routeService.selectByRouteId(order.getRouteId());
            if(route == null) {
                LOG.error("OrderController.getRoute the order don't have route!!!");
                return JacksonUtils.toJson(info);
            }
            long endTimeMay = route.getEndTime();
            info.put("endTimeMay", sdf.format(new Date(endTimeMay).toString()));
        }
        String result = JacksonUtils.toJson(info);
        LOG.info("OrderController.getRoute,info : " + result);
        return result;
    }
}
