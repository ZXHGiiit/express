package com.express.controller;

import com.express.commons.service.RedisService;
import com.express.dao.TestDao;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by xinghang on 17/8/30.
 */

@Controller
@RequestMapping("/demo")
public class DemoController {
  private Log LOG = LogFactory.getLog(DemoController.class);

  @Autowired
  private TestDao testDao;
  @Autowired
  private RedisService redisService;

  @RequestMapping("/index")
  public String index() {
    LOG.info("DemoController.index=============>");
    return "index";
  }

  @RequestMapping("/hello")
  @ResponseBody
  public String hello() {
    LOG.info("DemoController.hello==============>");
    redisService.set("test", "name", "zhouxinghang");
    String result = redisService.get("test", "name");
    LOG.info("DemoController.redisResult = " + result);
    return "hello";
  }


  @RequestMapping("/test")
  @ResponseBody
  public String test() {
    LOG.info("DemoController.hello==============>");
    int result = testDao.selectCount();
    LOG.info("DemoController.selectCountFromUSer: " + result);
    return "zhengzhou";
  }

}
