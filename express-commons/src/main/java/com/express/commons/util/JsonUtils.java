package com.express.commons.util;

import com.google.common.base.Throwables;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.util.List;

/**
 * Created by renren on 17/7/25.
 */
public class JsonUtils {

  public static final Log LOG = LogFactory.getLog(JsonUtils.class);
  //定义json对象
  private static final ObjectMapper MAPPER = new ObjectMapper();

  /**
   * 将对象转换为json字符串
   */
  public static String objectToJson(Object data) {
    if (data == null) {
      LOG.error("JsonUtils.objectToJson.data is null");
      return null;
    }
    try {
      String string = MAPPER.writeValueAsString(data);
      return string;
    } catch (JsonProcessingException e) {
      LOG.error("JsonUtils.objectToJson.ERROR", e);
    }
    return null;
  }

  /**
   * 将json数据转换为pojo对象
   */
  public static <T> T jsonToPojo(String jsonData, Class<T> beanType) {
    if (jsonData == null || "".equals(jsonData) || beanType == null) {
      LOG.error("JsonUtils.jsonToPojo.jsonDate or beanType is null");
      return null;
    }
    try {
      T t = MAPPER.readValue(jsonData, beanType);
      return t;
    } catch (Exception e) {
      LOG.error("JsonUtils.jsonToPojo.ERROR", e);
    }
    return null;
  }

  /**
   * 将json数据转换为pojo对象list
   */
  public static <T> List<T> jsonToList(String jsonData, Class<T> beanType) {
    if (jsonData == null || "".equals(jsonData) || beanType == null) {
      LOG.error("JsonUtils.jsonToList.jsonDate or beanType is null");
      return null;
    }
    JavaType javaType = MAPPER.getTypeFactory().constructParametricType(List.class, beanType);
    try {
      List<T> list = MAPPER.readValue(jsonData, javaType);
      return list;
    } catch (Exception e) {
      LOG.error("JsonUtils.jsonToList.ERROR", e);
    }
    return null;
  }

  public static JsonNode toJsonNode(String jsonText) {
    JsonNode jsonNode = null;
    try {
      jsonNode = MAPPER.readTree(jsonText);
    } catch (Exception e) {
      throw Throwables.propagate(e);
    }
    return jsonNode;
  }
}
