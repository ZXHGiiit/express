package com.express.service;

import com.express.domain.User;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by xinghang on 17/9/28.
 */
public interface UserService {
  //String login(String account, String password, HttpServletRequest req, HttpServletResponse resp);

  User login(String account, String password, HttpServletRequest req, HttpServletResponse resp);

  String selByToken(String token);

  void logout(HttpServletRequest req, HttpServletResponse resp);

  int createUser(User user);

  User testFilter(String userName, String password);

  Map<String, Object> commentInfo(long userId);
}
