package com.express.domain;

import java.util.Date;

public class Order {
    private long autoId;
    private long id;
    private long userId;
    private long routeId;
    private String sendAddress;
    private String takeAddress;
    private String sendName;
    private String takeName;
    private long sendPhone;
    private long takePhone;
    private String goodsName;
    private long goodsWeight;
    private boolean isFinish;//该订单是否已经完成
    private boolean isCom;//该订单是否评论。不能是 isComment，否则和comment字段的get方法冲突
    private int score;
    private String comment;
    private double price;
    private long startTime;
    private long endTime;
    private Date createTime;
    private Date updateTime;

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public long getAutoId() {
        return autoId;
    }

    public void setAutoId(long autoId) {
        this.autoId = autoId;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public long getRouteId() {
        return routeId;
    }

    public void setRouteId(long routeId) {
        this.routeId = routeId;
    }

    public String getSendAddress() {
        return sendAddress;
    }

    public void setSendAddress(String sendAddress) {
        this.sendAddress = sendAddress;
    }

    public String getTakeAddress() {
        return takeAddress;
    }

    public void setTakeAddress(String takeAddress) {
        this.takeAddress = takeAddress;
    }

    public String getSendName() {
        return sendName;
    }

    public void setSendName(String sendName) {
        this.sendName = sendName;
    }

    public String getTakeName() {
        return takeName;
    }

    public void setTakeName(String takeName) {
        this.takeName = takeName;
    }

    public boolean isCom() {
        return isCom;
    }

    public void setCom(boolean com) {
        isCom = com;
    }

    public long getSendPhone() {
        return sendPhone;
    }

    public void setSendPhone(long sendPhone) {
        this.sendPhone = sendPhone;
    }

    public long getTakePhone() {
        return takePhone;
    }

    public void setTakePhone(long takePhone) {
        this.takePhone = takePhone;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public long getGoodsWeight() {
        return goodsWeight;
    }

    public void setGoodsWeight(long goodsWeight) {
        this.goodsWeight = goodsWeight;
    }

    public boolean isFinish() {
        return isFinish;
    }

    public void setFinish(boolean finish) {
        isFinish = finish;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public long getStartTime() {
        return startTime;
    }

    public void setStartTime(long startTime) {
        this.startTime = startTime;
    }

    public long getEndTime() {
        return endTime;
    }

    public void setEndTime(long endTime) {
        this.endTime = endTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public String toString() {
        return "Order{" +
                "autoId=" + autoId +
                ", id=" + id +
                ", userId=" + userId +
                ", routeId=" + routeId +
                ", sendAddress='" + sendAddress + '\'' +
                ", takeAddress='" + takeAddress + '\'' +
                ", sendName='" + sendName + '\'' +
                ", takeName='" + takeName + '\'' +
                ", sendPhone=" + sendPhone +
                ", takePhone=" + takePhone +
                ", goodsName='" + goodsName + '\'' +
                ", goodsWeight=" + goodsWeight +
                ", isFinish=" + isFinish +
                ", isCom = " + isCom +
                ", score=" + score +
                ", comment='" + comment + '\'' +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                '}';
    }
}
