package com.express.admin.service.impl;

import com.express.admin.dao.UserDao;
import com.express.admin.service.UserService;
import com.express.domain.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    public List<User> getToVipUser() {
        return userDao.selectToVipUser();
    }

    @Override
    public int updateVip(long userId, boolean isVip) {
        return 0;
    }
}
