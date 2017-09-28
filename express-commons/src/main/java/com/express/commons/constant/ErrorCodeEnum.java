package com.express.commons.constant;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by xinghang on 17/9/28.
 */
public enum ErrorCodeEnum {
  //0默认错误
  OK(0, "Success"),
  UNKNOWN_ERROR(100000, "Server Error"),
  SIG_ERROR(100001, "Sig Error"),
  SESSION_ERROR(100002, "Session Error"),
  RETURN_NULL_ERROR(100003, "Return Null"),
  DB_ERROR(100004, "DB Error"),
  NO_AUTH(100005, "No Authority");


  private static Map<Integer, String> codeAndMsgMap = new HashMap<Integer, String>();
  //market report


  private int errorCode;
  private String errorMsg;

  private ErrorCodeEnum(int errorCode, String errorMsg) {
    this.errorCode = errorCode;
    this.errorMsg = errorMsg;
  }

  public static ErrorCodeEnum getByCode(int errorCode) {
    for (ErrorCodeEnum errorCodeEnum : ErrorCodeEnum.values()) {
      if (errorCodeEnum.getErrorCode() == errorCode) {
        return errorCodeEnum;
      }
    }
    return null;
  }

  public static Map<Integer, String> getCodeAndMsgMap() {
    if (codeAndMsgMap.keySet().size() == 0) {
      for (ErrorCodeEnum ece : ErrorCodeEnum.values()) {
        codeAndMsgMap.put(ece.getErrorCode(), ece.getErrorMsg());
      }
    }
    return codeAndMsgMap;
  }

  public int getErrorCode() {
    return errorCode;
  }

  public void setErrorCode(int errorCode) {
    this.errorCode = errorCode;
  }

  public String getErrorMsg() {
    return errorMsg;
  }

  public void setErrorMsg(String errorMsg) {
    this.errorMsg = errorMsg;
  }
}
