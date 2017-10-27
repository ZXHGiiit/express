package com.express.service;

import com.express.domain.Route;

public interface RouteService {
    boolean hasRoute(long userId);

    int addRoute(Route route);

}
