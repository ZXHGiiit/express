package com.express.service.impl;

import com.google.common.base.Strings;

import com.express.commons.service.RedisService;
import com.express.commons.util.CookieUtils;
import com.express.commons.util.JacksonUtils;
import com.express.dao.UserDao;
import com.express.domain.User;
import com.express.service.UserService;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by xinghang on 17/9/28.
 */

@Service
public class UserServiceImpl implements UserService {
  private static final Log LOG = LogFactory.getLog(UserServiceImpl.class);

  private static final String TT_TOKEN = "express-V1.0.0";

  @Autowired
  private UserDao userDao;

  @Autowired
  private RedisService redisService;

  @Override
  public User login(String account, String password, HttpServletRequest req, HttpServletResponse resp) {
    if (Strings.isNullOrEmpty(account) || Strings.isNullOrEmpty(password)) {
      LOG.error("UserServiceImpl.login.account or password is NULL");
      return null;
    }
    User user = userDao.selectByUAP(account, password);
    if (user == null) {
      LOG.info("UserServiceImpl.login incorrect");
      return null;
    }
    LOG.info("UserServiceImpl.login success user: " + user.toString());
    return user;
  }

  /**
   * 若登录成功，将用户信息存入redis，以uuid作为key
   * 将token作为key，uuid作为value建立一个cookie，
   */
  /*
  @Override
  public String login(String account, String password, HttpServletRequest req, HttpServletResponse
    resp) {
    if (Strings.isNullOrEmpty(account) || Strings.isNullOrEmpty(password)) {
      LOG.error("UserServiceImpl.login.account or password is NULL");
      return "";
    }
    User user = userDao.selectByUAP(account, password);
    if (user == null) {
      LOG.info("UserServiceImpl.login incorrect");
      return "";
    }
    LOG.info("UserServiceImpl.login success user: " + user.toString());
    //生成uuid，一个uuid对应一个用户
    String uuid = UUID.randomUUID().toString();
    //将用户信息存入redis，uuid作为key
    redisService.set("express", uuid, JacksonUtils.toJson(user));
    redisService.expire("express", uuid, 30 * 60);

    //将token最为key，uuid作为value，建立cookie。
    CookieUtils.setCookie(req, resp, TT_TOKEN, uuid, 30 * 60);
    return uuid;
  }
  */


  @Override
  public String selByToken(String token) {
    if (Strings.isNullOrEmpty(token)) {
      LOG.error("UserServiceImpl.selByToken.token is null");
      return "";
    }
    return redisService.get("express", token);
  }

  /**
   * 删除保存了用户uuid的cookie和redis缓存
   * 通过req和token来获得该cookie
   */
  @Override
  public void logout(HttpServletRequest req, HttpServletResponse resp) {
    String cookieValue = CookieUtils.getCookieValue(req, TT_TOKEN);
    if (Strings.isNullOrEmpty(cookieValue)) {
      LOG.info("UserServiceImpl.logout.getCookie is failed");
    } else {
      CookieUtils.deleteCookie(req, resp, TT_TOKEN);
      redisService.del("express", cookieValue);
    }
  }

  @Override
  public int createUser(User user) {
    if (user == null) {
      LOG.error("UserServiceImpl.createUser.user is null");
      return -1;
    }

    return userDao.add(user);
  }

  @Override
  public User testFilter(String userName, String password) {
    return null;
  }
}
