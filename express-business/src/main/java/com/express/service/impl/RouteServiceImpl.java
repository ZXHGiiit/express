package com.express.service.impl;

import com.express.dao.RouteDao;
import com.express.domain.Route;
import com.express.service.RouteService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.Collections;
import java.util.List;

@Service
public class RouteServiceImpl implements RouteService {
    @Autowired
    private RouteDao routeDao;

    @Override
    public boolean hasRoute(long userId) {
        List<Route> routes = routeDao.selectRouteByUserId(userId);
        if(CollectionUtils.isEmpty(routes)) {
            return false;
        } else {
            return true;
        }
    }

    @Override
    public int addRoute(Route route) {
        if(route == null) {
            return -1;
        }
        return routeDao.addRoute(route);
    }
}
