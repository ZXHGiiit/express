package com.express.commons.util;

import com.express.commons.constant.ErrorCodeEnum;
import com.express.commons.constant.StringConstants;
import com.express.commons.exception.ExpressException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/**
 * Created by xinghang on 17/9/28.
 */
public class RetJacksonUtil {


  public static void safePut(ObjectNode node, String key, String value) {
    if (null == node || null == key || null == value)
      return;
    node.put(key, value);

  }

  @Deprecated
  public static ObjectNode result(ObjectMapper mapper, ErrorCodeEnum errorCodeEnum) {
    return result(mapper, errorCodeEnum.getErrorCode(), null,
      errorCodeEnum.getErrorMsg());

  }

  @Deprecated
  public static ObjectNode result(ObjectMapper mapper, ErrorCodeEnum errorCodeEnum, Object data) {
    return result(mapper, errorCodeEnum.getErrorCode(), data,
      errorCodeEnum.getErrorMsg());

  }

  @Deprecated
  public static ObjectNode result(ObjectMapper mapper, int errorCode,
                                  Object data, String errorMsg) {
    ObjectNode result = mapper.createObjectNode();
    ObjectNode status = mapper.createObjectNode();
    status.put(StringConstants.RESULT_CODE, errorCode);
    safePut(status, StringConstants.RESULT_MSG, errorMsg);
    result.put(StringConstants.RESULT_STATUS, status);
    if (null != data) {
      if (data instanceof JsonNode)
        result.put(
          StringConstants.RESULT_DATA, (JsonNode) data);
      else if (data instanceof String)
        result.put(
          StringConstants.RESULT_DATA, (String) data);
      else if (data instanceof Integer)
        result.put(
          StringConstants.RESULT_DATA, (Integer) data);
      else if (data instanceof Double)
        result.put(
          StringConstants.RESULT_DATA, (Double) data);
      else if (data instanceof Float)
        result.put(
          StringConstants.RESULT_DATA, (Float) data);
    }
    return result;
  }

  @Deprecated
  public static ObjectNode resultOK(ObjectMapper mapper) {
    return result(mapper, ErrorCodeEnum.OK);
  }

  @Deprecated
  public static ObjectNode resultOK(ObjectMapper mapper, Object data) {
    return result(mapper, ErrorCodeEnum.OK, data);
  }

  @Deprecated
  public static ObjectNode resultOK() {
    ObjectMapper mapper = new ObjectMapper();
    return result(mapper, ErrorCodeEnum.OK, null);
  }

  /**
   * 返回不带数据的成功的串
   */
  public static String resultOk() {
    return result(ErrorCodeEnum.OK, null);
  }

  /**
   * 成功时，在data中返回key value对
   */
  public static String resultOk(String key, Object value) {
    Map<String, Object> data = new HashMap<String, Object>();
    data.put(key, value);
    return result(ErrorCodeEnum.OK, data);
  }

  /**
   * 返回成功的key value对，同时配置jsonViewClass
   */
  public static <T> String resultOk(String key, Object value,
                                    Class<T> viewClazz) {
    Map<String, Object> data = new HashMap<String, Object>();
    data.put(key, value);
    return result(ErrorCodeEnum.OK, data, viewClazz);
  }

  /**
   * 返回成功的数据
   */
  public static String resultOk(Object data) {
    return result(ErrorCodeEnum.OK, data);
  }

  /**
   * 返回成功的数据
   */
  public static <T> String resultOk(Object data, Class<T> jsonViewClazz) {
    return result(ErrorCodeEnum.OK, data, jsonViewClazz);
  }

  /**
   * 返回带错误码的数据
   */
  public static String result(ErrorCodeEnum errorCodeEnum, Object data) {
    return result(errorCodeEnum.getErrorCode(),
      errorCodeEnum.getErrorMsg(), data);
  }

  public static String result(ErrorCodeEnum errorCodeEnum, String key, Object value) {
    Map<String, Object> data = new HashMap<String, Object>();
    data.put(key, value);
    return result(errorCodeEnum, data);
  }

  /**
   * 返回带有错误码的数据， 配置jsonViewClazz
   */
  public static <T> String result(ErrorCodeEnum errorCodeEnum, Object data,
                                  Class<T> jsonViewClazz) {
    return result(errorCodeEnum.getErrorCode(),
      errorCodeEnum.getErrorMsg(), data, jsonViewClazz);
  }

  /**
   * 返回带错误码的数据
   */
  public static String resultWithFailed(ErrorCodeEnum errorCodeEnum) {
    return result(errorCodeEnum.getErrorCode(),
      errorCodeEnum.getErrorMsg(), null);
  }

  public static String resultWithFailed(ErrorCodeEnum errorCodeEnum, Object... args) {
    String msg = String.format(errorCodeEnum.getErrorMsg(), args);
    return result(errorCodeEnum.getErrorCode(), msg, null);
  }

  /**
   * 返回封装后的json
   */
  public static String result(int resultCode, String resultMsg, Object data) {
    return result(resultCode, resultMsg, data, null);
  }

  /**
   * 根据提供的view对data中的对象中的字段进行定制输出
   */
  public static <T> String result(int resultCode, String resultMsg,
                                  Object data, Class<T> jsonViewClazz) {
    Map<String, Object> result = getResultMap(resultCode, resultMsg, data);
    if (null == jsonViewClazz) {
      return JacksonUtils.toJson(result);
    } else {
      return JacksonUtils.toJson(result, jsonViewClazz);
    }
  }

  /**
   * 返回成功的数据，并指定相应的类型应该排除的字段
   *
   * @param data          返回的数据
   * @param clazz         指定的类型
   * @param excludeFileds 需要排除的字段
   */
  @SuppressWarnings("rawtypes")
  public static String resultOkWithExclude(Object data, Class clazz,
                                           String... excludeFileds) {
    return resultWithExclude(ErrorCodeEnum.OK, data, clazz, excludeFileds);
  }

  /**
   * 返回包含ErrorCodeEnum的数据， 并指定相应类型需要排除的字段
   *
   * @param errorCodeEnum 错误类型
   * @param data          返回的数据
   * @param clazz         类型
   * @param excludeFileds 需要排除的字段
   */
  @SuppressWarnings("rawtypes")
  public static String resultWithExclude(ErrorCodeEnum errorCodeEnum,
                                         Object data, Class clazz, String... excludeFileds) {
    Map<Class, Set<String>> exclude = new HashMap<Class, Set<String>>();
    exclude.put(clazz, new HashSet<String>(Arrays.asList(excludeFileds)));
    return result(errorCodeEnum.getErrorCode(),
      errorCodeEnum.getErrorMsg(), data, null, exclude);
  }

  /**
   * 返回包含ErrorCodeEnum的数据，并指定多个类型及其对应的需要排除的字段
   *
   * @param errorCodeEnum 错误类型
   * @param data          返回的数据
   * @param exclude       多个类型及其对应的需要排除的字段
   */
  @SuppressWarnings("rawtypes")
  public static String resultWithExclude(ErrorCodeEnum errorCodeEnum,
                                         Object data, Map<Class, Set<String>> exclude) {
    return result(errorCodeEnum.getErrorCode(),
      errorCodeEnum.getErrorMsg(), data, null, exclude);
  }

  /**
   * 返回包含resultCode, resultMsg的数据，并指定多个类型及其对应的需要排除的字段
   *
   * @param resultCode 返回码
   * @param resultMsg  返回描述信息
   * @param data       返回数据
   * @param exclude    多个类型及其对应的需要排除的字段
   */
  @SuppressWarnings("rawtypes")
  public static String resultWithExclude(int resultCode, String resultMsg,
                                         Object data, Map<Class, Set<String>> exclude) {
    return result(resultCode, resultMsg, data, null, exclude);
  }

  /**
   * 返回表示操作成功的数据，并指定相应类型及其需要包含的输出字段
   *
   * @param data          返回的数据
   * @param clazz         指定类型
   * @param includeFileds 指定类型需要包含的字段
   */
  @SuppressWarnings("rawtypes")
  public static String resultOkWithInclude(Object data, Class clazz,
                                           String... includeFileds) {
    return resultWithInclude(ErrorCodeEnum.OK, data, clazz, includeFileds);
  }

  /**
   * 返回表示操作成功与否的ErrorCodeEnum的数据，并指定相应类型及其需要包含的输出字段
   *
   * @param errorCodeEnum 表示成功与否的枚举
   * @param data          返回的数据
   * @param clazz         指定的类型
   * @param includeFileds 指定类型需要包含的字段
   */
  @SuppressWarnings("rawtypes")
  public static String resultWithInclude(ErrorCodeEnum errorCodeEnum,
                                         Object data, Class clazz, String... includeFileds) {
    Map<Class, Set<String>> include = new HashMap<Class, Set<String>>();
    include.put(clazz, new HashSet<String>(Arrays.asList(includeFileds)));
    return result(errorCodeEnum.getErrorCode(),
      errorCodeEnum.getErrorMsg(), data, include, null);
  }

  /**
   * 返回表示操作成功与否的ErrorCodeEnum的数据，并指定多个类型及其需要包含的输出字段
   *
   * @param errorCodeEnum 表示操作成功与否的枚举
   * @param data          返回的数据
   * @param include       指定多个类型及其需要包含的输出字段
   */
  @SuppressWarnings("rawtypes")
  public static String resultWithInclude(ErrorCodeEnum errorCodeEnum,
                                         Object data, Map<Class, Set<String>> include) {
    return result(errorCodeEnum.getErrorCode(),
      errorCodeEnum.getErrorMsg(), data, include, null);
  }

  /**
   * 返回表示操作成功与否的resultCode, resultMsg的数据，并指定多个类型及其需要包含的输出字段
   *
   * @param resultCode 成功与否的代码
   * @param resultMsg  成功与否的输出信息
   * @param data       返回的数据
   * @param include    多个类型及其需要包含的输出字段
   */
  @SuppressWarnings("rawtypes")
  public static String resultWithInclude(int resultCode, String resultMsg,
                                         Object data, Map<Class, Set<String>> include) {
    return result(resultCode, resultMsg, data, include, null);
  }

  /**
   * 返回表示成功与否的ErrorCodeEnum的数据，并指定多个类型及其包含的需要包含的字段、多个类型及其需要包含的字段
   *
   * @param errorCodeEnum 表示操作成功与否的枚举
   * @param data          返回的数据
   * @param include       指定多个类型及其需要包含的输出字段
   * @param exclude       多个类型及其对应的需要排除的字段
   */
  @SuppressWarnings("rawtypes")
  public static String result(ErrorCodeEnum errorCodeEnum, Object data,
                              Map<Class, Set<String>> include, Map<Class, Set<String>> exclude) {
    return result(errorCodeEnum.getErrorCode(),
      errorCodeEnum.getErrorMsg(), data, include, exclude);
  }

  /**
   * 返回表示成功与否的resultCode, resultMsg的数据，并指定多个类型及其包含的需要包含的字段、多个类型及其需要包含的字段
   *
   * @param resultCode 成功与否的代码
   * @param resultMsg  成功与否的输出信息
   * @param data       返回数据
   * @param include    多个类型及其需要包含的输出字段
   * @param exclude    多个类型及其对应的需要排除的字段
   */
  @SuppressWarnings("rawtypes")
  public static String result(int resultCode, String resultMsg, Object data,
                              Map<Class, Set<String>> include, Map<Class, Set<String>> exclude) {
    Map<String, Object> result = getResultMap(resultCode, resultMsg, data);
    return JacksonUtils.toJson(result, include, exclude);
  }

  private static Map<String, Object> getResultMap(int resultCode, String resultMsg, Object data) {
    Map<String, Object> status = new HashMap<String, Object>();
    status.put(StringConstants.RESULT_CODE, resultCode);
    status.put(StringConstants.RESULT_MSG, String.valueOf(resultMsg));

    Map<String, Object> result = new HashMap<String, Object>();
    result.put(StringConstants.RESULT_STATUS, status);
    if (null != data) {
      result.put(StringConstants.RESULT_DATA, data);
    }
    return result;
  }

  /**
   * 返回封装后的json
   */
  public static String resultWithException(int resultCode, String resultMsg,
                                           String data) {
    return result(resultCode, resultMsg, data, null, null);
  }

  public static String result(ExpressException expressException) {
    return resultWithException(expressException.getErrorCode(), expressException.getErrorMsg(),
      expressException.getErrorData().toString());
  }

}
