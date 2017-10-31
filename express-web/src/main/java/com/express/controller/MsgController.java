package com.express.controller;

import com.express.commons.util.JacksonUtils;
import com.express.domain.Message;
import com.express.interceptor.HostHolder;
import com.express.service.MessageService;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/msg")
public class MsgController {
    private static final Log LOG = LogFactory.getLog(MsgController.class);
    @Autowired
    private HostHolder holder;
    @Autowired
    private MessageService msgService;

    @RequestMapping("/index")
    public String index() {
        long userId = holder.getUserId();

        List<Message> msgs = msgService.getAllByUserId(userId);
        if(CollectionUtils.isEmpty(msgs)) {
            holder.setAttribute("countNotView", 0);
            holder.setAttribute("count",0);
            holder.setAttribute("countNotViewSys", 0);
            holder.setAttribute("countSys", 0);
            return "news";
        }
        LOG.info("MsgController.index.messages: " + msgs.toString());
        int count = 0;
        int countNotView = 0;
        int countSys = 0;
        int countNotViewSys = 0;
        for(Message msg : msgs) {
            if (msg.isView() && msg.isSys()) {
                countSys ++;
            } else if (msg.isView() && !msg.isSys()){
                count ++;
            } else if (!msg.isView() && msg.isSys()) {
                countNotViewSys ++;
            } else if (!msg.isView() && !msg.isSys()) {
                countNotView ++;
            }
        }
        holder.setAttribute("countViewSys", countSys);
        holder.setAttribute("countView", count);
        holder.setAttribute("countNotView", countNotView);
        holder.setAttribute("countNotViewSys", countNotViewSys);
        return "news";
    }


    @RequestMapping("/list/notView")
    @ResponseBody
    public String listNotView() {
        long userId = holder.getUserId();
        List<Message> msgs = msgService.getBy(userId, false, false);
        return JacksonUtils.toJson(msgs);
    }

    @RequestMapping("/list/notViewSys")
    @ResponseBody
    public String listNotViewSys() {
        long userId = holder.getUserId();
        List<Message> msgs = msgService.getBy(userId, false, true);
        return JacksonUtils.toJson(msgs);
    }

    @RequestMapping("/list/view")
    @ResponseBody
    public String listView() {
        long userId = holder.getUserId();
        List<Message> msgs = msgService.getBy(userId, true, false);
        return JacksonUtils.toJson(msgs);
    }

    @RequestMapping("/list/viewSys")
    @ResponseBody
    public String listViewSys() {
        long userId = holder.getUserId();
        List<Message> msgs = msgService.getBy(userId, true, true);
        return JacksonUtils.toJson(msgs);
    }

    @RequestMapping(value="/list/msg",method= RequestMethod.POST,produces="text/html;charset=UTF-8")
    @ResponseBody
    public String listMsg(@RequestParam("isView") boolean isView, @RequestParam("isSys") boolean isSys) {
        LOG.info("MsgCOntroller.listMsg.params:{isView=" + isView + ", isSys=" + isSys + "}" );
        long userId = holder.getUserId();
        List<Message> msgs = msgService.getBy(userId, isView, isSys);
        return JacksonUtils.toJson(msgs);
    }

    @RequestMapping(value="/view/msg",method= RequestMethod.POST,produces="text/html;charset=UTF-8")
    @ResponseBody
    public String viewMsg(@RequestParam("msgId") long msgId) {
        Message msg = msgService.getById(msgId);
        if(msg == null) {
            LOG.error("MsgController.viewMsg.Message is NULL. msgId=" + msgId);
            msg = new Message();
            return JacksonUtils.toJson(msg);
        }
        LOG.info("MesssageController.viewMsg. msg:" + msg);
        //将msg状态变为已读
        if(!msg.isView()) {
            msgService.updateView(msgId, true);
        }
        return JacksonUtils.toJson(msg);
    }
}
