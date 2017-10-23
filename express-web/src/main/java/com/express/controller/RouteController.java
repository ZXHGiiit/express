package com.express.controller;

import com.express.commons.util.RetJacksonUtil;
import com.express.interceptor.HostHolder;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 用户行程Controller
 */

@Controller
@RequestMapping("/route")
public class RouteController {
    private Log LOG = LogFactory.getLog(RouteController.class);

    @Autowired
    private HostHolder holder;

    /**
     * 发布行程
     * @param startAdd
     * @param endAdd
     * @return
     */
    public String add(String startAdd, String endAdd) {
        return RetJacksonUtil.resultOk();
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

}
