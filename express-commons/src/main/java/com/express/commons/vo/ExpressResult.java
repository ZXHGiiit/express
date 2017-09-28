package com.express.commons.vo;

/**
 * Created by xinghang on 17/9/28.
 * Controller返回前台结果封装
 */
public class ExpressResult {
  private int status;

  private Object data;

  private String msg;

  public ExpressResult() {
  }

  public ExpressResult(int status, Object data, String msg) {
    this.status = status;
    this.data = data;
    this.msg = msg;
  }

  public int getStatus() {
    return status;
  }

  public void setStatus(int status) {
    this.status = status;
  }

  public Object getData() {
    return data;
  }

  public void setData(Object data) {
    this.data = data;
  }

  public String getMsg() {
    return msg;
  }

  public void setMsg(String msg) {
    this.msg = msg;
  }
}
