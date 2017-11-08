package com.express.admin.service.impl;

import com.express.admin.dao.AdminDao;
import com.express.admin.domain.Admin;
import com.express.admin.service.AdminService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDao adminDao;

    @Override
    public List<Admin> getAllAdmin() {
        return adminDao.selectAllAdmin();
    }

    @Override
    public Admin selectByUAP(String account, String password) {
        return adminDao.selectByUAP(account, password);
    }

    @Override
    public int delete(long id) {
        return adminDao.delete(id);
    }

    @Override
    public int rmDelete(long id) {
        return adminDao.updateDelete(id);
    }

    @Override
    public int reset(long id, String password) {
        return adminDao.updatePwd(id, password);
    }

    @Override
    public int create(Admin admin) {
        return adminDao.create(admin);
    }
}
