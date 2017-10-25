package com.express.service.impl;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

import com.express.dao.TaskDao;
import com.express.domain.Task;
import com.express.service.TaskService;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
}
