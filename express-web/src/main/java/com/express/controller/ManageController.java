package com.express.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManageController {
    @RequestMapping("/")
    public String welcome() {
        return "index";
    }

    @RequestMapping("{page}")
    public String showPage(@PathVariable String page) {
        return page;
    }
}
