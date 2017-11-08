package com.express.admin.service;

import com.express.admin.domain.Admin;

import org.springframework.stereotype.Service;

import java.util.List;

public interface AdminService {
    List<Admin> getAllAdmin();

    Admin selectByUAP(String account , String password);

    int delete(long id);

    int rmDelete(long id);

    int reset(long id, String password);

    int create(Admin admin);
}
