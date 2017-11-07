package com.express.admin.controller;

import com.express.domain.User;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManageController {
    private static final Log LOG = LogFactory.getLog(ManageController.class);
    @RequestMapping("{page}")
    public String showPage(@PathVariable String page) {
        LOG.info("we are arriving at " + page);
        return page;
    }
}
