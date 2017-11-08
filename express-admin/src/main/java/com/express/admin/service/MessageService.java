package com.express.admin.service;

public interface MessageService {

    int createMsg(long userId, String title, String msg, boolean isSys);
}
