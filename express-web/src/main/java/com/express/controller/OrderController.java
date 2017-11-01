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
    @RequestMapping(value="/listOrder",method= RequestMethod.POST,produces="text/html;charset=UTF-8")
    @ResponseBody
    public String listOrder(@RequestParam("isFinish") boolean isFinish) {
        long userId = holder.getUserId();
        LOG.info("OrderController.listOrder. params {userId=" + userId + ", isFinish=" + isFinish);
        List<Order> orders = orderService.selectBy(userId, isFinish);
        LOG.info("OrderController.listOrder.result :" + orders.toString());
        return JacksonUtils.toJson(orders);
    }

    /**
     * 创建订单，会一起创建运营商用户的task，
     * @return
     */
    @RequestMapping("/createOrder")
    @ResponseBody
    public String createOrder(Order order) {
        if(order == null) {
            LOG.error("OrderController.createOrder.ERROR. Order is null!!!");
            return RetJacksonUtil.resultWithFailed(ErrorCodeEnum.NO_PARAM);
        }
        LOG.info("OrderController.createOrder.params :" + order.toString());
        long userId = holder.getUserId();

        //用于测试
        /*
        order = new Order();
        order.setGoodsName("手机");
        order.setGoodsWeight(150);
        order.setRouteId(1);
        order.setSendPhone(13633843273l);
        order.setTakePhone(15072722945l);
        order.setSendAddress("郑州");
        order.setTakeAddress("北京");
        order.setSendName("周星航");
        order.setTakeName("周星灿");
        */
        //用户测试




        //获取Route
        Route route = routeService.selectByRouteId(order.getRouteId());
        //获取对应的运营商用户
        long routeUserId = route.getUserId();

        //创建Order
        order.setId(IDUtils.getOrderId());
        order.setUserId(userId);
        order.setPrice(route.getPrice());//数据冗余，便于查询
        int resultOfAddOrder = orderService.addOrder(order);

        //创建task
        Task task = new Task();
        task.setUserId(routeUserId);
        //task.setRoute(task.getRoute() + "-" + order.getSendAddress());
        //创建task的时候，不需要先获取route，因为是null。只有update的时候才先获取
        task.setRoute("-" + order.getSendAddress());
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
    @RequestMapping(value="/getRoute",method= RequestMethod.POST,produces="text/html;charset=UTF-8")
    @ResponseBody
    public String getRoute(@RequestParam("orderId") long orderId) {
        Order order = orderService.selectByOrderId(orderId);
        if(order == null) {
            LOG.warn("OrderController.getRoute  Route is NULL");
            return RetJacksonUtil.resultWithFailed(ErrorCodeEnum.RETURN_NULL_ERROR);
        }
        Map<String, Object> info = Maps.newHashMap();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");
        boolean isFinish = order.isFinish();
        String sendAdd = order.getSendAddress();
        String takeAdd = order.getTakeAddress();
        info.put("isFinish", isFinish);
        if(isFinish) {
            info.put("isFinishCN","是");
        } else {
            info.put("isFinishCN", "否");
        }
        info.put("sendAdd", sendAdd);
        info.put("takeAdd", takeAdd);
        Task task = taskService.selectByOrderId(orderId);
        if(task == null) {
            LOG.error("OrderController.getRoute the order don't have task!!!");
            return JacksonUtils.toJson(info);
        }
        String routeInfo = task.getRoute();
        info.put("route", routeInfo);
        Route route = routeService.selectByRouteId(order.getRouteId());
        if(route == null) {
            LOG.error("OrderController.getRoute the order don't have route!!!");
            return JacksonUtils.toJson(info);
        }
        long endTime = route.getEndTime();
        long startTime = route.getStartTime();
        info.put("endTime", sdf.format(new Date(endTime)));
        info.put("startTime", sdf.format(new Date(startTime)));
        String result = JacksonUtils.toJson(info);
        LOG.info("OrderController.getRoute,info : " + result);
        return JacksonUtils.toJson(info);
    }

    /**
     * 通过订单查询订单详情,包括发货人，物品等隐私内容
     * @param orderId
     * @return
     */
    @RequestMapping(value="/getInfo",method= RequestMethod.POST,produces="text/html;charset=UTF-8")
    @ResponseBody
    public String getInfo(@RequestParam("orderId") long orderId) {
        Order order = orderService.selectByOrderId(orderId);
        if(order == null) {
            LOG.warn("OrderController.getRoute  Route is NULL");
            return RetJacksonUtil.resultWithFailed(ErrorCodeEnum.RETURN_NULL_ERROR);
        }
        Map<String, Object> info = Maps.newHashMap();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");
        boolean isFinish = order.isFinish();
        String sendAdd = order.getSendAddress();
        String takeAdd = order.getTakeAddress();
        info.put("isFinish", isFinish);
        if(isFinish) {
            info.put("isFinishCN","是");
        } else {
            info.put("isFinishCN", "否");
        }
        info.put("sendAdd", sendAdd);
        info.put("takeAdd", takeAdd);
        Task task = taskService.selectByOrderId(orderId);
        if(task == null) {
            LOG.error("OrderController.getRoute the order don't have task!!!");
            return JacksonUtils.toJson(info);
        }
        String routeInfo = task.getRoute();
        info.put("route", routeInfo);
        Route route = routeService.selectByRouteId(order.getRouteId());
        if(route == null) {
            LOG.error("OrderController.getRoute the order don't have route!!!");
            return JacksonUtils.toJson(info);
        }
        long endTime = route.getEndTime();
        long startTime = route.getStartTime();
        info.put("endTime", sdf.format(new Date(endTime)));
        info.put("startTime", sdf.format(new Date(startTime)));
        info.put("sendName", order.getSendName());
        info.put("takeName", order.getTakeName());
        info.put("sendPhone", order.getSendPhone());
        info.put("takePhone", order.getTakePhone());
        info.put("goodsName", order.getGoodsName());
        info.put("createTime", task.getCreateTime());
        info.put("price", order.getPrice());
        info.put("id", order.getId());
        String result = JacksonUtils.toJson(info);
        LOG.info("OrderController.getRoute,info : " + result);
        return JacksonUtils.toJson(info);
    }

}
