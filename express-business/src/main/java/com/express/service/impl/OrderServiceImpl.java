package com.express.service.impl;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

import com.express.dao.OrderDao;
import com.express.domain.Order;
import com.express.service.OrderService;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl implements OrderService {
    private static final Log LOG = LogFactory.getLog(OrderServiceImpl.class);
    @Autowired
    private OrderDao orderDao;

    /**
     * 获取用户的所有订单
     * 按照完成，未完成分类
     * @param userId
     * @return
     */
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

    @Override
    public int addOrder(Order order) {
        if(order == null) {
            LOG.error("OrderServiceImpl.addOrder.order is null!!!");
            return -1;
        }
        return orderDao.addOrder(order);
    }

    /**
     * 添加评论
     * @param score
     * @param comment
     * @param orderId
     * @return
     */
    @Override
    public int addComment(int score, String comment, long orderId) {
        return orderDao.updateComment(score, comment, orderId);
    }

    @Override
    public Order selectByOrderId(long orderId) {
        List<Long> orderIds = Lists.newArrayList();
        orderIds.add(orderId);
        List<Order> orders = orderDao.selectAllByOrderIds(orderIds);
        if(CollectionUtils.isEmpty(orderIds)) {
            LOG.info("OrderServiceImpl.selectByOrderId.is Empty");
            return null;
        }
        return orders.get(0);
    }

    @Override
    public int updateFinish(boolean isFinish, long orderId) {
        return orderDao.updateFinish(isFinish, orderId);
    }
}
