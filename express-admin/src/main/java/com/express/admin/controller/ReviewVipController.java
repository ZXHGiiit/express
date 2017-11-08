package com.express.admin.controller;


import com.express.admin.service.AdminService;
import com.express.admin.service.MessageService;
import com.express.admin.service.UserService;
import com.express.commons.util.JacksonUtils;
import com.express.domain.User;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
    @Autowired
    private MessageService msgService;

    @RequestMapping("/overview")
    public ModelAndView index() {
        List<User> users = userService.getToVipUser();
        ModelAndView modelAndView = new ModelAndView("reviewVip/overview");
        LOG.info("ReviewVipController");
        modelAndView.addObject("users", users);
        return modelAndView;
    }


    /**
     * 通过审核成为承运方
     * @return
     */
    @RequestMapping("/pass")
    public ModelAndView pass(@RequestParam("id") long id) {
        int updateResult = userService.updateVip(id, true);
        if(updateResult != 1) {
            LOG.error("ReviewController.pass.updateVip.ERROR");
        }
        int msgResult = msgService.createMsg(id, "承运方申请结果通知", "尊敬的用户，您好。恭喜您通过了我们的审核，您可以享用我们的平台里发布行程运输快递的服务了", true);
        if(msgResult != 1) {
            LOG.error("ReviewController.pass.sendMsg.ERROR");
        }
        List<User> users = userService.getToVipUser();
        ModelAndView modelAndView = new ModelAndView("reviewVip/overview");
        LOG.info("ReviewVipController");
        modelAndView.addObject("users", users);
        return modelAndView;
    }

    /**
     * 拒绝审核
     * @return
     */
    @RequestMapping("/refuse")
    public ModelAndView refuse(@RequestParam("id") long id) {
        int updateResult = userService.updateVip(id, false);
        if(updateResult != 1) {
            LOG.error("ReviewController.pass.updateVip.ERROR");
        }
        int msgResult = msgService.createMsg(id, "承运方申请结果通知", "尊敬的用户，您好。非常抱歉，由于您的资料不完善或与我们的要求不相符，我们不能接受您的申请。您可以在一周之后重新申请，感谢您对全民速递的大力支持。", true);
        if(msgResult != 1) {
            LOG.error("ReviewController.pass.sendMsg.ERROR");
        }
        List<User> users = userService.getToVipUser();
        ModelAndView modelAndView = new ModelAndView("reviewVip/overview");
        LOG.info("ReviewVipController");
        modelAndView.addObject("users", users);
        return modelAndView;
    }

    @RequestMapping("/hello")
    @ResponseBody
    public String hello() {
        LOG.info("TestController.hello================>");
        return JacksonUtils.toJson("hello");
    }

}
