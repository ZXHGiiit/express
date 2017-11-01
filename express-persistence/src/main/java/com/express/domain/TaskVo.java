package com.express.domain;

import java.util.Date;

public class TaskVo {
    private long taskId;
    private long orderId;
    private String sendName;
    private long sendPhone;
    private String takeName;
    private long taskPhone;
    private String route;
    private double price;
    private Date createTime;

    public long getTaskId() {
        return taskId;
    }

    public void setTaskId(long taskId) {
        this.taskId = taskId;
    }

    public long getOrderId() {
        return orderId;
    }

    public void setOrderId(long orderId) {
        this.orderId = orderId;
    }

    public String getSendName() {
        return sendName;
    }

    public void setSendName(String sendName) {
        this.sendName = sendName;
    }

    public long getSendPhone() {
        return sendPhone;
    }

    public void setSendPhone(long sendPhone) {
        this.sendPhone = sendPhone;
    }

    public String getTakeName() {
        return takeName;
    }

    public void setTakeName(String takeName) {
        this.takeName = takeName;
    }

    public long getTaskPhone() {
        return taskPhone;
    }

    public void setTaskPhone(long taskPhone) {
        this.taskPhone = taskPhone;
    }

    public String getRoute() {
        return route;
    }

    public void setRoute(String route) {
        this.route = route;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }


}
