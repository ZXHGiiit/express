package com.express.service.impl;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

import com.express.dao.OrderDao;
import com.express.dao.TaskDao;
import com.express.domain.Order;
import com.express.domain.Task;
import com.express.service.TaskService;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class TaskServiceImpl implements TaskService {
    private static final Log LOG = LogFactory.getLog(TaskServiceImpl.class);
    @Autowired
    private TaskDao taskDao;
    @Override
    public Map<String, List<Task>> selectAllByUserId(long userId) {
        List<Task> tasks = taskDao.selectAllByUserId(userId);
        if(tasks == null) {
            LOG.info("TaskServiceImpl.selectAllByUserId is null");
            return new HashMap<String, List<Task>>();
        }
        Map<String, List<Task>> result = Maps.newHashMap();
        List<Task> doingTask = Lists.newArrayList();
        List<Task> finishTask = Lists.newArrayList();
        for(Task task : tasks) {
            if(task.isFinish()) {
                finishTask.add(task);
            } else {
                doingTask.add(task);
            }
        }
        result.put("doingTask", doingTask);
        result.put("finishTask", finishTask);
        return result;
    }

    @Override
    public int addTask(Task task) {
        if(task == null) {
            LOG.error("TaskServiceImpl.addTask.task is null!!!");
            return -1;
        }
        return taskDao.addTask(task);
    }

    @Override
    public int updateFinish(boolean isFinish, long taskId) {
        int result = taskDao.updateFinish(isFinish, taskId);
        return result;
    }

    @Override
    public int updateAllFinish(boolean isFinish, List<Long> taskIds) {
        if(CollectionUtils.isEmpty(taskIds)) {
            LOG.error("TaskServiceImpl.updateAllFinish.taskIds is NULL!!!");
            return -1;
        }
        return taskDao.updateAllFinish(isFinish, taskIds);
    }

    @Override
    public int updateRoute(String route, long routeId) {
        return taskDao.updateRoute(route, routeId);
    }

    @Override
    public Task selectByTaskId(long taskId) {
        Task task = taskDao.selectByTaskId(taskId);
        if(task == null) {
            return new Task();
        }
        return task;
    }

}
