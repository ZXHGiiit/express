package com.express.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.MappingJacksonValue;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.express.commons.constant.ErrorCodeEnum;
import com.express.commons.util.JacksonUtils;
import com.express.commons.util.RetJacksonUtil;
import com.express.commons.vo.ExpressResult;
import com.express.dao.UserDao;
import com.express.domain.User;
import com.express.interceptor.HostHolder;
import com.express.service.MessageService;
import com.express.service.UserService;
import com.google.common.base.Strings;

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
  @Autowired
  private MessageService messageService;
  //跳转到登录页面
  @RequestMapping("/loginPage")
  public String returnLogin(){
    return "login";
  }

  @ResponseBody
  @RequestMapping("/login")
  public String login(String account, String password, HttpServletRequest req, HttpServletResponse resp) {
    //String token = userService.login(account, password, req, resp);
    User user = userService.login(account, password, req, resp);
    Map result=new HashMap();
    if (user == null) {
      LOG.error("UserController.login.ERROR.token is null");
      result.put("result", false);
      result.put("message", "用户名和密码错误,请重新输入");
    } else {
      LOG.info("UserController.login.user:" + user.toString()) ;
      result.put("result", true);
      result.put("message", "登录成功!!");
      //获取用户的未读消息数量
      int countOfNews = messageService.countOfNotView(user.getId());
      holder.setCountNews(countOfNews);
      //将用户登录信息保存到holder中
      holder.setUser(user);
      holder.setUserId(user.getId());
    }
    return JacksonUtils.toJson(result);
  }


  @RequestMapping("/token/{token}")
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
  public Object logout(HttpServletRequest req, HttpServletResponse resp, String callback) {
    ExpressResult expressResult = new ExpressResult();
    try {
      userService.logout(req, resp);
      return "login";
    } catch (Exception e) {
      LOG.error("UserController.logout.ERROR", e);
      return "index";
    }
  }

  @RequestMapping("/register")
  @ResponseBody
  public String register(User user) {
    if (user.getAccount() == null ||user.getPassword() == null) {
      LOG.error("UserController.register.parameter is null");
      return RetJacksonUtil.resultWithFailed(ErrorCodeEnum.NO_PARAM);
    }
    LOG.info("UserController.register.params:{account : "+ user.getAccount() + "password : "+ user.getPassword() + "}");

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

  /**
   * 获取认证用户的评分相关信息
   * 通过userId--》task--》orderId--》order--》score
   * 每一个task对应一个order
   * @return
   */
  @RequestMapping("/score")
  @ResponseBody
  public String scoreInfo() {
    long userId = holder.getUserId();
    Map<String, Object> info = userService.commentInfo(userId);
    LOG.info("UserController.getUserScoreInfo : " + info);
    String result = JacksonUtils.toJson(info);
    return result;
  }


}
