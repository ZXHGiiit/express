package com.express.service.impl;

import com.google.common.base.Strings;

import com.express.dao.RouteDao;
import com.express.domain.Route;
import com.express.service.RouteService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
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

    @Override
    public List<Route> selectReadyRouteByAdd(String startAdd, String endAdd) {
        if(Strings.isNullOrEmpty(startAdd)|| Strings.isNullOrEmpty(endAdd)){
            return new ArrayList<>();
        }
        return routeDao.selectAllReadyByAdd(startAdd, endAdd);
    }

    @Override
    public Route selectByRouteId(long routeId) {
        return routeDao.selectByRouteId(routeId);
    }
}
