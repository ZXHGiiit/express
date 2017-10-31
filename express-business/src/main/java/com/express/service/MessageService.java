package com.express.service;

import com.express.domain.Message;

import java.util.List;

public interface MessageService {

    int countOfNotView(long userId);

    List<Message> getAllByUserId(long userId);
}
