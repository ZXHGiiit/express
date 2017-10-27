package com.express.controller;

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


}
