package com.express.service;

import com.express.domain.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by xinghang on 17/9/28.
 */
public interface UserService {
  String login(String name, String password, HttpServletRequest req, HttpServletResponse resp);

  String selByToken(String token);

  void logout(HttpServletRequest req, HttpServletResponse resp);

  User testFilter(String userName, String password);
}
