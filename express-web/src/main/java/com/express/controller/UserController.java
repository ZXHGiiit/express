package com.express.controller;

import com.google.common.base.Strings;

import com.express.commons.constant.ErrorCodeEnum;
import com.express.commons.util.RetJacksonUtil;
import com.express.commons.vo.ExpressResult;
import com.express.dao.UserDao;
import com.express.domain.User;
import com.express.interceptor.HostHolder;
import com.express.service.UserService;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.MappingJacksonValue;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by xinghang on 17/9/28.
 */

@Controller
@RequestMapping("/user")
public class UserController {
  private Log LOG = LogFactory.getLog(UserController.class);

  @Autowired
  private UserService userService;

  @Autowired
  private HostHolder holder;
  @Autowired
  private UserDao userDao;

  @RequestMapping("/login")
  @ResponseBody
  public String login(String account, String password, HttpServletRequest req, HttpServletResponse
    resp) {
    //String token = userService.login(account, password, req, resp);
    User user = userService.login(account, password, req, resp);
    if (user == null) {
      LOG.error("UserController.login.ERROR.token is null");
      return RetJacksonUtil.resultWithFailed(ErrorCodeEnum.NO_TOKEN);
    } else {
      //将用户登录信息保存到holder中
      holder.setUser(user);
      return RetJacksonUtil.resultOk();
    }
  }


  @RequestMapping("/token/{token}")
  @ResponseBody
  public Object token(@PathVariable String token, String callback) {
    if (Strings.isNullOrEmpty(token)) {
      LOG.error("UserController.token.token is null");
      return "";
    }
    String result = userService.selByToken(token);
    LOG.info("UserController.token.callback.result = " + result);
    ExpressResult expressResult = new ExpressResult();
    if (!Strings.isNullOrEmpty(result)) {
      expressResult.setStatus(200);
      expressResult.setMsg("OK");
      expressResult.setData(result);
    } else {
      expressResult.setStatus(500);
      expressResult.setMsg("ERROR");
    }
    if (!Strings.isNullOrEmpty(callback)) {
      LOG.info("UserController.token.callback = " + callback);
      MappingJacksonValue mjv = new MappingJacksonValue(expressResult);
      mjv.setJsonpFunction(callback);
      return mjv;
    } else {
      LOG.info("UserController.token.callback is null");
      return expressResult;
    }

  }

  @RequestMapping("/logout")
  @ResponseBody
  public Object logout(HttpServletRequest req, HttpServletResponse resp, String callback) {
    ExpressResult expressResult = new ExpressResult();
    try {
      userService.logout(req, resp);
      expressResult.setStatus(200);
      expressResult.setMsg("OK");
      expressResult.setData("");
    } catch (Exception e) {
      LOG.error("UserController.logout.ERROR", e);
    }
    if (!Strings.isNullOrEmpty(callback)) {
      LOG.info("UserController.logout.callback = " + callback);
      MappingJacksonValue mjv = new MappingJacksonValue(expressResult);
      mjv.setJsonpFunction(callback);
      return mjv;
    } else {
      LOG.info("UserController.logout.callback is null");
      return expressResult;
    }
  }

  @RequestMapping("/register")
  @ResponseBody
  public String register(@RequestParam("email") String email,
                         @RequestParam("password") String password) {
    if (email == null || password == null) {
      LOG.error("UserController.register.parameter is null");
      return RetJacksonUtil.resultWithFailed(ErrorCodeEnum.NO_PARAM);
    }
    LOG.info("UserController.register.params:{email : "+ email + "password : "+ password + "}");
    User user = new User();
    user.setEmail(email);
    user.setAccount(email);
    user.setPassword(password);
    int result = userService.createUser(user);
    if (result != 1) {
      LOG.error("UserController.register.createUser Failed!!!");
      return RetJacksonUtil.resultWithFailed(ErrorCodeEnum.UNKNOWN_ERROR);
    }
    return RetJacksonUtil.resultOk();
  }

  @RequestMapping("/test")
  @ResponseBody
  public String test(@RequestParam("account") String account,
                     @RequestParam("password") String password) {
    LOG.info("UserCOntroller.test.account: " + account);
    User user = new User();
    user.setAccount(account);
    user.setPassword(password);
    int result = userDao.test(user);
    return RetJacksonUtil.resultOk();
  }
}
