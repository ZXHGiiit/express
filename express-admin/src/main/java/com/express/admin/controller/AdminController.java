package com.express.admin.controller;

import com.express.admin.annotation.LoginRequired;
import com.express.admin.domain.Admin;
import com.express.admin.interceptor.HostHolder;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 超管后台：登入、登出、跳转、短信验证
 */

@Controller
public class AdminController {
    private static final Log logger = LogFactory.getLog(AdminController.class);
    @Autowired
    private HostHolder hostHolder;

    @RequestMapping("/admin-login")
    public ModelAndView gotoAdminLoginPage(HttpServletRequest request) {
        logger.info("admin-login==============>");
        return new ModelAndView("admin/login");
    }

    @RequestMapping("/home")
    @LoginRequired
    public ModelAndView gotoAdminCosole(HttpServletRequest request) {
        return new ModelAndView("admin/console");
    }

    @RequestMapping("/dashboad")
    @LoginRequired
    public ModelAndView gotoAdminDashBoard(HttpServletRequest request) {
        return new ModelAndView("admin/dashboard");
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView redictLogin() {
        RedirectView view = new RedirectView("home", false);
        return new ModelAndView(view);
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(Locale locale,
                              HttpServletRequest request,
                              HttpServletResponse response,
                              @RequestParam(value = "account") String account,
                              @RequestParam(value = "password") String password) {
        RedirectView view = new RedirectView("home", false);
        return new ModelAndView();
    }

    @LoginRequired
    @RequestMapping(value = "/logout")
    public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
        Admin admin = hostHolder.getUser();

        RedirectView view = new RedirectView("admin-login", false);
        return new ModelAndView(view);
    }

}
