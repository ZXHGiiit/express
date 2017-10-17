package com.express.interceptor;

import com.express.domain.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

/**
 * @Title: HostHolder.java
 * @ClassName: HostHolder
 * @Description: 存储用户id
 * @author xinghang
 *
 */
@Component
public class HostHolder {
    @Autowired
    private HttpServletRequest request;

    private static final String userKey = "user_key_heheda";
    private static final String userIdKey = "user_id_keyheheda";

    public User getUser() {
        return (User) request.getAttribute(userKey);
    }

    public long getUserId() {
        return (Long) request.getAttribute(userIdKey);
    }

    public void setUser(User user) {
        request.setAttribute(userKey, user);
    }

    public void setUserIdKey(long userId) {
        request.setAttribute(userIdKey, userId);
    }
}
