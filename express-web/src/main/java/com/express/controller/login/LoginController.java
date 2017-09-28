package com.express.controller.login;

import com.google.common.base.Strings;

import com.express.commons.constant.ErrorCodeEnum;
import com.express.commons.util.RetJacksonUtil;
import com.express.commons.vo.ExpressResult;
import com.express.service.UserService;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by xinghang on 17/9/28.
 */

@Controller("/login")
public class LoginController {
  private Log LOG = LogFactory.getLog(LoginController.class);

  @Autowired
  private UserService userService;

  @RequestMapping("/login")
  @ResponseBody
  public String login(String name, String password, HttpServletRequest req, HttpServletResponse
    resp) {
    String token = userService.login(name, password, req, resp);
    if (token == null) {
      LOG.error("UserController.login.ERROR.token is null");
      return RetJacksonUtil.resultWithFailed(ErrorCodeEnum.NO_TOKEN);
    } else {
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
    LOG.info("LoginController.token.callback.result = " + result);
    ExpressResult expressResult = new ExpressResult();


  }

}
