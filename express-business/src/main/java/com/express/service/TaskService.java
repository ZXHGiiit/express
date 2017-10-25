package com.express.service;

import com.express.domain.Task;

import java.util.List;
import java.util.Map;

public interface TaskService {
    Map<String, List<Task>> selectAllByUserId(long userId);


}
