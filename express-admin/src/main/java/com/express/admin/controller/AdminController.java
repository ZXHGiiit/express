package com.express.admin.controller;

import com.google.common.collect.ImmutableMap;

import com.express.admin.annotation.LoginRequired;
import com.express.admin.constant.WebCodeEnum;
import com.express.admin.domain.Admin;
import com.express.admin.interceptor.HostHolder;
import com.express.admin.service.AdminService;
import com.express.commons.constant.StringConstants;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.logging.Logger;

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
    @Autowired
    private AdminService adminService;
    @RequestMapping("/admin-login")
    public ModelAndView gotoAdminLoginPage(HttpServletRequest request) {
        logger.info("admin-login==============>");
        return new ModelAndView("admin/login");
    }

    @RequestMapping("/home")
    @LoginRequired
    public ModelAndView gotoAdminCosole(HttpServletRequest request) {
        if(hostHolder.getUser() == null) {
            return new ModelAndView("admin/login");
        }
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
        logger.info("AdminController.login.params : {account=" + account + ", password=" + password + "}");
        Admin admin = adminService.selectByUAP(account, password);
        if(admin == null) {
            logger.error("AdminController.login.用户名或密码错误");
            return getErrorView(locale, WebCodeEnum.LOGIN_ACCOUNT_PWD_ERROR);
        }
        hostHolder.setUser(admin);
        RedirectView view = new RedirectView("home", false);
        return new ModelAndView(view);
    }

    @LoginRequired
    @RequestMapping(value = "/logout")
    public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
        Admin admin = hostHolder.getUser();

        RedirectView view = new RedirectView("admin-login", false);
        return new ModelAndView(view);
    }

    //error view
    public ModelAndView getErrorView(Locale locale, WebCodeEnum webCodeEnum) {
        MappingJackson2JsonView jsonView = new MappingJackson2JsonView();
        Map<String, Object> status = new HashMap<String, Object>();
        status.put(StringConstants.RESULT_CODE, webCodeEnum.getErrorCode());
        status.put(StringConstants.RESULT_MSG, webCodeEnum.getErrorMsg(locale));
        return new ModelAndView(jsonView, ImmutableMap.of(StringConstants.RESULT_STATUS, status));
    }
}
