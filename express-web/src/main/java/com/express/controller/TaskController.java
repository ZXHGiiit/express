package com.express.controller;

import com.express.commons.util.JacksonUtils;
import com.express.commons.util.RetJacksonUtil;
import com.express.domain.Task;
import com.express.interceptor.HostHolder;
import com.express.service.TaskService;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * 用户任务Controller
 */

@Controller
@RequestMapping("/tesk")
public class TaskController {
    private static final Log LOG = LogFactory.getLog(TaskController.class);
    @Autowired
    private TaskService taskService;
    @Autowired
    private HostHolder holder;
    /**
     * 发布任务
     * @param startAdd
     * @param endAdd
     * @return
     */
    public String add(String startAdd, String endAdd) {
        return RetJacksonUtil.resultOk();
    }

    /**
     * 删除任务
     * 可有多个任务，通过id来删除
     * @return
     */
    public String delete(int taskId) {
        return RetJacksonUtil.resultOk();
    }

    /**
     * 修改任务
     * @param startAdd
     * @param endAdd
     * @return
     */
    public String update(int taskId, String startAdd, String endAdd) {
        return RetJacksonUtil.resultOk();
    }

    /**
     * 获取运营商用户任务清单。一个route可以对应多个task
     * @return
     */
    @RequestMapping("/listTasks")
    @ResponseBody
    public String listTasks() {
        long userId = holder.getUserId();
        Map<String, List<Task>> result = taskService.selectAllByUserId(userId);
        LOG.info("TaskController.listTasks.result : " + result.toString());
        return JacksonUtils.toJson(result);
    }
}
