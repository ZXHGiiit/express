package com.express.controller;

import com.google.common.collect.Maps;

import com.express.commons.constant.ErrorCodeEnum;
import com.express.commons.util.JacksonUtils;
import com.express.commons.util.RetJacksonUtil;
import com.express.domain.Route;
import com.express.interceptor.HostHolder;
import com.express.service.RouteService;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * 用户行程Controller
 */

@Controller
@RequestMapping("/route")
public class RouteController {
    private Log LOG = LogFactory.getLog(RouteController.class);

    @Autowired
    private HostHolder holder;
    @Autowired
    private RouteService routeService;

    /**
     * 发布行程
     * @param startAdd
     * @param endAdd
     * @return
     */
    public String add(@RequestParam("startAdd") String startAdd,
                      @RequestParam("endAdd") String endAdd,
                      @RequestParam("price") double price,
                      @RequestParam("startTime") long startTime,
                      @RequestParam("endTime") long endTime) {
        long userId = holder.getUserId();
        Route route = new Route();
        route.setStartAddress(startAdd);
        route.setEndAddress(endAdd);
        route.setPrice(price);
        route.setStartTime(startTime);
        route.setEndTime(endTime);
        route.setUserId(userId);
        int result = routeService.addRoute(route);
        if(result == 1) {
            return RetJacksonUtil.resultOk();
        } else {
            return RetJacksonUtil.resultWithFailed(ErrorCodeEnum.DB_ERROR);
        }
    }

    /**
     * 删除行程
     * @return
     */
    public String delete() {
        return RetJacksonUtil.resultOk();
    }

    /**
     * 修改行程
     * @param startAdd
     * @param endAdd
     * @return
     */
    public String update(String startAdd, String endAdd) {
        return RetJacksonUtil.resultOk();
    }

    /**
     * 发布行程之前，需要检查该用户是否有已经存在的正在进行的行程
     * @return
     */
    @RequestMapping("/check")
    @ResponseBody
    public String checkRoute() {
        long userId = holder.getUserId();
        boolean hasRoute = routeService.hasRoute(userId);
        Map<String, Object> result = Maps.newHashMap();
        result.put("hasRoute", hasRoute);
        return JacksonUtils.toJson(result);
    }


}
