package com.express.admin.controller;

import com.express.admin.domain.Admin;
import com.express.admin.service.AdminService;
import com.express.commons.util.IDUtils;
import com.express.commons.util.JacksonUtils;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RequestMapping("/adminUser")
@Controller
public class AdminUserController {
    private static final Log LOG = LogFactory.getLog(AdminUserController.class);
    @Autowired
    private AdminService adminService;

    @RequestMapping("/list")
    public ModelAndView listAdmin() {
        List<Admin> admins = adminService.getAllAdmin();
        LOG.info("AdminController.listAdmin:" + admins.toString());
        ModelAndView modelAndView = new ModelAndView("adminUser/overview");
        modelAndView.addObject("admins", admins);
        return modelAndView;
    }

    @RequestMapping("/delete")
    public ModelAndView delete(@RequestParam("id") long id) {
        int result = adminService.delete(id);
        if(result != 1) {
            LOG.error("AdminUserController.delete.ERRPR. id=" + id);
        }
        List<Admin> admins = adminService.getAllAdmin();
        LOG.info("AdminController.listAdmin:" + admins.toString());
        ModelAndView modelAndView = new ModelAndView("adminUser/overview");
        modelAndView.addObject("admins", admins);
        return modelAndView;
    }

    @RequestMapping("/rmDelete")
    public ModelAndView rmDelete(@RequestParam("id") long id) {
        int result = adminService.rmDelete(id);
        if(result != 1) {
            LOG.error("AdminUserController.delete.ERRPR. id=" + id);
        }
        List<Admin> admins = adminService.getAllAdmin();
        LOG.info("AdminController.listAdmin:" + admins.toString());
        ModelAndView modelAndView = new ModelAndView("adminUser/overview");
        modelAndView.addObject("admins", admins);
        return modelAndView;
    }

    @RequestMapping("/reset")
    @ResponseBody
    public String reset(@RequestParam("id") long id) {
        String password = IDUtils.getString();
        LOG.info("AdminUserController.reset {id=" + id + ", password=" + password + "}");
        int result = adminService.reset(id, password);
        if(result != 1) {
            LOG.error("AdminUserController.reset.ERRPR. id=" + id);
        }
        return JacksonUtils.toJson(password);
    }

    @RequestMapping(value="/add",method= RequestMethod.POST,produces="text/html;charset=UTF-8")
    @ResponseBody
    public String add(@RequestParam("name") String name) {
        String account = IDUtils.getString();
        String password = IDUtils.getString();
        LOG.info("ADminUserController.add. {account=" + account + ", password=" + password + ", name=" + name + "}");
        Admin admin = new Admin();
        admin.setAccount(account);
        admin.setName(name);
        admin.setPassword(password);
        int result = adminService.create(admin);
        if(result != 1) {
            LOG.error("AdminUserController.add.ERROR");
            return JacksonUtils.toJson("");
        }
        return JacksonUtils.toJson(admin);
    }
}
