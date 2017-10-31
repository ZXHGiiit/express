package com.express.interceptor;

import com.express.domain.User;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
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

    private static final Log LOG = LogFactory.getLog(HostHolder.class);

    private static final String userKey = "user_key_heheda";
    private static final String userIdKey = "user_id_key_heheda";
    private static final String countNewsKey = "count_news_key_heheda";

    public User getUser() {
        LOG.info("HostHolder.request = " + request.hashCode());
        return (User) request.getSession().getAttribute(userKey);
    }

    public long getUserId() {
        return (Long) request.getSession().getAttribute(userIdKey);
    }

    public void setUser(User user) {
        LOG.info("HostHolder.request = " + request.hashCode());
        request.getSession().setAttribute(userKey, user);
    }

    public void setUserId(long userId) {
        request.getSession().setAttribute(userIdKey, userId);
    }

    public int getCountNews() {
        return (int) request.getSession().getAttribute(countNewsKey);
    }

    public void setCountNews(int countNews) {
        request.getSession().setAttribute(countNewsKey, countNews);
    }
}
