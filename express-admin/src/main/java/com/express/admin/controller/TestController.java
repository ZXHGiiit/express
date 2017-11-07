package com.express.admin.controller;

import com.express.commons.util.JacksonUtils;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/test")
public class TestController {
    private static final Log LOG = LogFactory.getLog(TestController.class);

    @RequestMapping("/hello")
    @ResponseBody
    public String hello() {
        LOG.info("TestController.hello================>");
        return JacksonUtils.toJson("hello");
    }

}
