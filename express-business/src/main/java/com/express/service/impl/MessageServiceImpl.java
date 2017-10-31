package com.express.service.impl;

import com.express.dao.MessageDao;
import com.express.domain.Message;
import com.express.service.MessageService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {
    @Autowired
    private MessageDao messageDao;
    @Override
    public int countOfNotView(long userId) {
        int count = messageDao.selectCountByUserId(userId, false);
        return count;
    }

    @Override
    public List<Message> getAllByUserId(long userId) {
        List<Message> messages = messageDao.selectAllByUserId(userId);
        return messages;
    }

    @Override
    public List<Message> getBy(long userId, boolean isView, boolean isSys) {
        return messageDao.selectAllBy(userId, isView, isSys);
    }

    @Override
    public Message getById(long id) {
        return messageDao.selectById(id);
    }

    @Override
    public int updateView(long id, boolean isView) {
        return messageDao.updateView(id, isView);
    }

}
