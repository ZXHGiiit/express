package com.express.service;

import com.express.domain.Route;

import java.util.List;

public interface RouteService {
    boolean hasRoute(long userId);

    int addRoute(Route route);

    List<Route> selectReadyRouteByAdd(String startAdd, String endAdd);

    Route selectByRouteId(long routeId);
}
