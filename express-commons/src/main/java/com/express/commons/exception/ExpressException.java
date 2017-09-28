package com.express.commons.exception;

import com.express.commons.constant.ErrorCodeEnum;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

/**
 * Created by xinghang on 17/9/28.
 */
public class ExpressException extends Exception {
  private static final ObjectMapper mapper = new ObjectMapper();

  /**
   * @param ece  ErrorCodeEnum
   * @param args 格式化时要用到的参数列表，可以为空
   * @return 用ErrorCodeEnum中的code作为code， 用msg格式化参数列表args后的值作为errorMessage，来生成异常
   */
  public static ExpressException format(ErrorCodeEnum ece, Object... args) {
    if (ece == null) {
      ece = ErrorCodeEnum.UNKNOWN_ERROR;
    }
    int code = ece.getErrorCode();
    String errorMessage = String.format(ece.getErrorMsg(), args);
    return new ExpressException(code, errorMessage);
  }

  /**
   * @return 在ErrorCodeEnum之后增加args中的参数, 来生成异常
   */
  public static ExpressException append(ErrorCodeEnum ece, Object... args) {
    if (ece == null) {
      ece = ErrorCodeEnum.UNKNOWN_ERROR;
    }
    if (args == null || args.length <= 0) {
      return new ExpressException(ece);
    }
    StringBuilder sb = new StringBuilder();
    for (Object obj : args) {
      sb.append(obj);
    }
    return new ExpressException(ece, ":", sb);
  }

  /**
   * @return 根据一个异常来生成TeachApplicationException
   */
  public static ExpressException newException(Exception e) {
    if (e == null) {
      return new ExpressException(ErrorCodeEnum.UNKNOWN_ERROR, "e==null");
    }
    if (e instanceof ExpressException) {
      return (ExpressException) e;
    }
    int code = ErrorCodeEnum.UNKNOWN_ERROR.getErrorCode();
    String msg = e.getClass().getSimpleName() + ':' + e.getMessage();
    return new ExpressException(code, msg);
  }

  /**
   * @return 根据errorCode和errorMsg得到description
   */
  private static String getDescription(int errorCode, String errorMsg) {
    return ExpressException.class.getSimpleName() + ":errorCode=" + errorCode + ",errorMsg=" +
      errorMsg;
  }

  /**
   * @return 根据一个ErrorCodeEnum和不定长数组args得到errorMsg. 把args的内容添加到ErrorCodeEnum的errorMsg后面
   */
  private static String getErrorMsg(ErrorCodeEnum e, Object... args) {
    String errorMsg = e.getErrorMsg();
    if (args == null || args.length <= 0) {
      return errorMsg;
    }
    StringBuilder sb = new StringBuilder(errorMsg);
    for (Object obj : args) {
      sb.append(obj);
    }
    errorMsg = sb.toString();
    return errorMsg;
  }

  private final int errorCode;

  private final String errorMsg;

  private ObjectNode errorData = null;

  /**
   * added by xiaolong.zhang
   */
  private ErrorCodeEnum errorCodeEnum;

  public ExpressException(int errorCode, String errorMsg, ObjectNode errorData) {
    super(getDescription(errorCode, errorMsg));
    this.errorCode = errorCode;
    this.errorMsg = errorMsg;
    this.errorData = errorData;
  }

  public ExpressException(int errorCode, String errorMsg) {
    super(getDescription(errorCode, errorMsg));
    this.errorCode = errorCode;
    this.errorMsg = errorMsg;
  }

  public ExpressException(ErrorCodeEnum e) {
    this(e.getErrorCode(), e.getErrorMsg());
    this.errorCodeEnum = e;
  }

  public ExpressException(ErrorCodeEnum e, Object... args) {
    this(e.getErrorCode(), getErrorMsg(e, args));
    this.errorCodeEnum = e;
  }

  public ExpressException(ErrorCodeEnum e, ObjectNode errorData) {
    this(e.getErrorCode(), e.getErrorMsg(), errorData);
    this.errorCodeEnum = e;
  }

  public int getErrorCode() {
    return errorCode;
  }

  public String getErrorMsg() {
    return errorMsg;
  }

  public ErrorCodeEnum getCodeEnum() {
    if (errorCodeEnum == null) {
      return ErrorCodeEnum.UNKNOWN_ERROR;
    }
    return errorCodeEnum;
  }

  public ObjectNode getErrorData() {
    return errorData;
  }
}
