package com.express.controller;

import com.express.commons.util.JacksonUtils;
import com.express.dao.OrderDao;
import com.express.domain.Order;
import com.express.interceptor.HostHolder;
import com.express.service.OrderService;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/order")
public class OrderController {
    private static final Log LOG = LogFactory.getLog(OrderController.class);
    @Autowired
    HostHolder holder;
    @Autowired
    OrderService orderService;

    @RequestMapping(value="//listOrder",method= RequestMethod.GET,produces="text/html;charset=UTF-8")
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

}
