package com.express.service.impl;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

import com.express.dao.OrderDao;
import com.express.domain.Order;
import com.express.service.OrderService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderDao orderDao;

    @Override
    public Map<String, Object> selectAllByUserId(long userId) {
        List<Order> orders = orderDao.selectAllByUserId(userId);
        if(orders == null) {
            return new HashMap<>();
        }
        Map<String, Object> result = Maps.newHashMap();
        List<Order> finishOrders = Lists.newArrayList();
        List<Order> doingOrders = Lists.newArrayList();
        for(Order order : orders) {
            if(order.isFinish()) {
                finishOrders.add(order);
            } else {
                doingOrders.add(order);
            }
        }
        result.put("finishOrders", finishOrders);
        result.put("doingOrders", doingOrders);
        return result;
    }
}
