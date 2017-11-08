package com.express.admin.controller;


import com.express.admin.service.AdminService;
import com.express.admin.service.UserService;
import com.express.commons.util.JacksonUtils;
import com.express.domain.User;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

import javax.annotation.Resource;

@Controller
@RequestMapping("/reviewVip")
public class ReviewVipController {
    private static final Log LOG = LogFactory.getLog(ReviewVipController.class);
    @Autowired
    private AdminService adminService;
    @Autowired
    private UserService userService;

    @RequestMapping("/overview")
    @ResponseBody
    public String index() {
        List<User> users = userService.getToVipUser();
        ModelAndView modelAndView = new ModelAndView("email/overview");
        LOG.info("ReviewVipController");
        modelAndView.addObject("users", users);
        return JacksonUtils.toJson(users);
    }

    @RequestMapping("/hello")
    @ResponseBody
    public String hello() {
        LOG.info("TestController.hello================>");
        return JacksonUtils.toJson("hello");
    }

}
