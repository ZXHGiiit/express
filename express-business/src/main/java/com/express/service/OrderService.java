package com.express.service;

import com.express.domain.Order;

import java.util.List;
import java.util.Map;

public interface OrderService {
    Map<String, Object> selectAllByUserId(long userId);

    int addOrder(Order order);

    int addComment(int score, String comment, long orderId);

    Order selectByOrderId(long orderId);

    int updateFinish(boolean isFinish, long orderId);

    List<Order> selectBy(long userId, boolean isFinish);

    Map<Long, Order> selectByOrderIds(List<Long> orderIds);
}
