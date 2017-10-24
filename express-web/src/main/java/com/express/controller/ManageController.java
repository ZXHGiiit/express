package com.express.controller;

import com.express.domain.User;
import com.express.interceptor.HostHolder;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.omg.PortableInterceptor.HOLDING;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManageController {
    private static final Log LOG = LogFactory.getLog(ManageController.class);
    @Autowired
    private HostHolder holder;
    @RequestMapping("/")
    public String welcome() {
        User user = holder.getUser();
        if(user == null) {
            LOG.info("你还未登录，将自动跳转到登录界面");
            return "login";
        }
        return "index";
    }

    @RequestMapping("{page}")
    public String showPage(@PathVariable String page) {
        User user = holder.getUser();
        if(user == null) {
            LOG.info("你还未登录，将自动跳转到登录界面");
            return "login";
        } else {
            LOG.info("we are arriving at " + page);
            return page;
        }
    }
}
