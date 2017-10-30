package com.express.domain;

public class RouteInfoVo {
    private String taskUserName;
    private long routeId;
    private int taskSize;
    private double price;
    private boolean isOnday;
    private String startAdd;
    private String endAdd;
    private int maxScore;
    private int sumScore;
    private int minScore;
    private int countOfTask;
    private double avgScore;

    public String getTaskUserName() {
        return taskUserName;
    }

    public void setTaskUserName(String taskUserName) {
        this.taskUserName = taskUserName;
    }

    public long getRouteId() {
        return routeId;
    }

    public void setRouteId(long routeId) {
        this.routeId = routeId;
    }

    public int getTaskSize() {
        return taskSize;
    }

    public void setTaskSize(int taskSize) {
        this.taskSize = taskSize;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public boolean isOnday() {
        return isOnday;
    }

    public void setOnday(boolean onday) {
        isOnday = onday;
    }

    public String getStartAdd() {
        return startAdd;
    }

    public void setStartAdd(String startAdd) {
        this.startAdd = startAdd;
    }

    public String getEndAdd() {
        return endAdd;
    }

    public void setEndAdd(String endAdd) {
        this.endAdd = endAdd;
    }

    public int getMaxScore() {
        return maxScore;
    }

    public void setMaxScore(int maxScore) {
        this.maxScore = maxScore;
    }

    public int getSumScore() {
        return sumScore;
    }

    public void setSumScore(int sumScore) {
        this.sumScore = sumScore;
    }

    public int getMinScore() {
        return minScore;
    }

    public void setMinScore(int minScore) {
        this.minScore = minScore;
    }

    public int getCountOfTask() {
        return countOfTask;
    }

    public void setCountOfTask(int countOfTask) {
        this.countOfTask = countOfTask;
    }

    public double getAvgScore() {
        return avgScore;
    }

    public void setAvgScore(double avgScore) {
        this.avgScore = avgScore;
    }

    @Override
    public String toString() {
        return "RouteInfoVo{" +
                "taskUserName='" + taskUserName + '\'' +
                ", routeId=" + routeId +
                ", taskSize=" + taskSize +
                ", price=" + price +
                ", isOnday=" + isOnday +
                ", startAdd='" + startAdd + '\'' +
                ", endAdd='" + endAdd + '\'' +
                ", maxScore=" + maxScore +
                ", sumScore=" + sumScore +
                ", minScore=" + minScore +
                ", countOfTask=" + countOfTask +
                ", avgScore=" + avgScore +
                '}';
    }
}
