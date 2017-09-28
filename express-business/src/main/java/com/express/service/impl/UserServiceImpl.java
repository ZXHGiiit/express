package com.express.service.impl;

import com.express.commons.service.RedisService;
import com.express.dao.UserDao;
import com.express.domain.User;
import com.express.service.UserService;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
  public String login(String name, String password, HttpServletRequest req, HttpServletResponse
    resp) {
    return null;
  }

  @Override
  public String selByToken(String token) {
    return null;
  }

  @Override
  public void logout(HttpServletRequest req, HttpServletResponse resp) {

  }

  @Override
  public User testFilter(String userName, String password) {
    return null;
  }
}
