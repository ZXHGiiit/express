package com.express.admin.service.impl;

import com.express.admin.dao.MessageDao;
import com.express.admin.service.MessageService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageServiceImpl implements MessageService {
    @Autowired
    private MessageDao messageDao;

    @Override
    public int createMsg(long userId, String title, String msg, boolean isSys) {
        return  messageDao.insert(userId, title, msg, isSys);
    }
}
