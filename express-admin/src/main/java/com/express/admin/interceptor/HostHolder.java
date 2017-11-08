package com.express.admin.interceptor;

import com.express.admin.domain.Admin;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

@Component
public class HostHolder {
    @Autowired
    private HttpServletRequest request;

    private static final Log LOG = LogFactory.getLog(HostHolder.class);

    private static final String userKey = "user_key_heheda";
    private static final String userIdKey = "user_id_key_heheda";

    public Admin getUser() {
        LOG.info("HostHolder.request = " + request.hashCode());
        return (Admin) request.getSession().getAttribute(userKey);
    }

    public long getUserId() {
        return (Long) request.getSession().getAttribute(userIdKey);
    }

    public void setUser(Admin user) {
        LOG.info("HostHolder.request = " + request.hashCode());
        request.getSession().setAttribute(userKey, user);
    }

    public void setUserId(long userId) {
        request.getSession().setAttribute(userIdKey, userId);
    }
}
