package com.express.service;

import com.express.domain.Message;

import java.util.List;

public interface MessageService {

    int countOfNotView(long userId);

    List<Message> getAllByUserId(long userId);

    List<Message> getBy(long userId, boolean isView, boolean isSys);

    Message getById(long id);

    int updateView(long id, boolean isView);
}
