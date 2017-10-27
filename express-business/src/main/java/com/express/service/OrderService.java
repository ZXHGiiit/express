package com.express.service;

import com.express.domain.Order;

import java.util.List;
import java.util.Map;

public interface OrderService {
    Map<String, Object> selectAllByUserId(long userId);

    int addOrder(Order order);
}
