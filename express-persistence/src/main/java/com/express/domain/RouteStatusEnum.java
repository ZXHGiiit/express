package com.express.domain;

public enum RouteStatusEnum {
    READY(0, "ready"),
    DOING(1, "doing"),
    FINISH(2, "finish"),
    CANCLE(-1, "cancle")
    ;
    private int code;
    private String status;

    RouteStatusEnum(int code, String status) {
        this.code = code;
        this.status = status;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
