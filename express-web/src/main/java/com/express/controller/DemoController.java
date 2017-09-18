package com.express.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by xinghang on 17/8/30.
 */

@Controller
public class DemoController {
  private Log LOG = LogFactory.getLog(DemoController.class);

  @RequestMapping("/index")
  public String index() {
    LOG.info("DemoController.index=============>");
    return "index";
  }

  @RequestMapping("/hello")
  @ResponseBody
  public String hello() {
    LOG.info("DemoController.hello==============>");
    return "hello";
  }

}
