package com.express.admin.service;

import com.express.admin.domain.Admin;

import org.springframework.stereotype.Service;

import java.util.List;

public interface AdminService {
    List<Admin> getAllAdmin();
}
