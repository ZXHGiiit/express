package com.express.admin.service;

import com.express.domain.User;

import org.springframework.stereotype.Service;

import java.util.List;

public interface UserService {

    List<User> getToVipUser();

}
