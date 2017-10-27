package com.express.service;

import com.express.domain.Task;

import java.util.List;
import java.util.Map;

public interface TaskService {
    Map<String, List<Task>> selectAllByUserId(long userId);

    int addTask(Task task);

    int updateFinish(boolean isFinish, long taskId);

    int updateAllFinish(boolean isFinish, List<Long> taskIds);

    int updateRoute(String route, long routeId);

    Task selectByTaskId(long taskId);
}
