package com.express.commons.util;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.SimpleHttpConnectionManager;
import org.apache.commons.httpclient.methods.DeleteMethod;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.PutMethod;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by xinghang on 17/8/18.
 */
public class HttpUtil {
  private static final String CHARSET = "UTF-8";
  private static final int TIMEOUT_MS = 50000;

  private HttpUtil() {

  }

  public static HttpResult getMethod(String methodName, NameValuePair[] parameters)
    throws HttpException, IOException {
    HttpClient httpClient = null;
    GetMethod method = null;
    InputStream inputStream = null;
    BufferedReader br = null;
    try {
      httpClient = new HttpClient();
      if (null != System.getProperty("http.proxyHost")) {
        httpClient.getHostConfiguration().setProxy(System.getProperty("http.proxyHost"),
          Integer.parseInt(System.getProperty("http.proxyPort")));
      }
      // 设置 Http 连接超时为50秒
      httpClient.getHttpConnectionManager().getParams().setConnectionTimeout(TIMEOUT_MS);
            /* 2 生成 GetMethod 对象并设置参数 */
      method = new GetMethod(methodName);
      if (null != parameters && parameters.length != 0) {
        method.setQueryString(parameters);
      }
            /* 3 执行 HTTP GET 请求 */
      int statusCode = httpClient.executeMethod(method);
            /* 4 判断访问的状态码 */

      if (statusCode >= HttpStatus.SC_MOVED_PERMANENTLY) { //只有大于等于301才打印出请求参数
        StringBuilder nameValuePairBuilder = new StringBuilder();
        if (null != parameters && parameters.length != 0) {
          for (NameValuePair nameValuePair : parameters) {
            nameValuePairBuilder.append(nameValuePair.getName());
            nameValuePairBuilder.append("=");
            nameValuePairBuilder.append(nameValuePair.getValue());
          }
        }
        System.err
          .println("Request URL:" + methodName + "|params:" + nameValuePairBuilder.toString()
            + "|statusLine:" + method.getStatusLine());
      }
            /* 5 处理 HTTP 响应内容 */
      inputStream = method.getResponseBodyAsStream();
      br = new BufferedReader(new InputStreamReader(inputStream));
      StringBuffer stringBuffer = new StringBuffer();
      String str = "";
      while ((str = br.readLine()) != null) {
        stringBuffer.append(str);
      }
      HttpResult result = new HttpResult(statusCode, stringBuffer.toString());
      return result;
    } finally {
      method.releaseConnection();
      ((SimpleHttpConnectionManager) httpClient.getHttpConnectionManager()).shutdown();
      if (null != inputStream) {
        inputStream.close();
      }
      if (null != br) {
        br.close();
      }
    }
  }

  public static HttpResult getMethod(String methodName, NameValuePair[] parameters, List<Header> headerList)
    throws HttpException, IOException {
    HttpClient httpClient = null;
    GetMethod method = null;
    InputStream inputStream = null;
    BufferedReader br = null;
    try {
      httpClient = new HttpClient();
      if (null != System.getProperty("http.proxyHost")) {
        httpClient.getHostConfiguration().setProxy(System.getProperty("http.proxyHost"),
          Integer.parseInt(System.getProperty("http.proxyPort")));
      }
      // 设置 Http 连接超时为50秒
      httpClient.getHttpConnectionManager().getParams().setConnectionTimeout(TIMEOUT_MS);
            /* 2 生成 GetMethod 对象并设置参数 */
      method = new GetMethod(methodName);
      if (null != parameters && parameters.length != 0) {
        method.setQueryString(parameters);
      }
      if (null != headerList && headerList.size() > 0) {
        for (Header header : headerList) {
          method.addRequestHeader(header);
        }
      }
            /* 3 执行 HTTP GET 请求 */
      int statusCode = httpClient.executeMethod(method);
            /* 4 判断访问的状态码 */

      if (statusCode >= HttpStatus.SC_MOVED_PERMANENTLY) { //只有大于等于301才打印出请求参数
        StringBuilder nameValuePairBuilder = new StringBuilder();
        if (null != parameters && parameters.length != 0) {
          for (NameValuePair nameValuePair : parameters) {
            nameValuePairBuilder.append(nameValuePair.getName());
            nameValuePairBuilder.append("=");
            nameValuePairBuilder.append(nameValuePair.getValue());
          }
        }
        System.err
          .println("Request URL:" + methodName + "|params:" + nameValuePairBuilder.toString()
            + "|statusLine:" + method.getStatusLine());
      }
            /* 5 处理 HTTP 响应内容 */
      inputStream = method.getResponseBodyAsStream();
      br = new BufferedReader(new InputStreamReader(inputStream));
      StringBuffer stringBuffer = new StringBuffer();
      String str = "";
      while ((str = br.readLine()) != null) {
        stringBuffer.append(str);
      }
      HttpResult result = new HttpResult(statusCode, stringBuffer.toString());
      return result;
    } finally {
      method.releaseConnection();
      ((SimpleHttpConnectionManager) httpClient.getHttpConnectionManager()).shutdown();
      if (null != inputStream) {
        inputStream.close();
      }
      if (null != br) {
        br.close();
      }
    }
  }

  public static HttpResult postMethod(String methodName, NameValuePair[] parameters)
    throws HttpException, IOException {
    HttpClient httpClient = null;
    PostMethod method = null;
    InputStream inputStream = null;
    BufferedReader br = null;
    try {
      httpClient = new HttpClient();
      if (null != System.getProperty("http.proxyHost")) {
        httpClient.getHostConfiguration().setProxy(System.getProperty("http.proxyHost"),
          Integer.parseInt(System.getProperty("http.proxyPort")));
      }
      // 设置 Http 连接超时为50秒
      httpClient.getHttpConnectionManager().getParams().setConnectionTimeout(TIMEOUT_MS);
            /* 2 生成 PostMethod 对象并设置参数 */
      method = new PostMethod(methodName);
      method.getParams().setContentCharset(CHARSET);
      method.setRequestBody(parameters);
            /* 3 执行 HTTP post 请求 */
      int statusCode = httpClient.executeMethod(method);
            /* 4 判断访问的状态码 */
      if (statusCode >= HttpStatus.SC_MOVED_PERMANENTLY) { //只有大于等于301才打印出请求参数
        StringBuilder nameValuePairBuilder = new StringBuilder();
        for (NameValuePair nameValuePair : parameters) {
          nameValuePairBuilder.append(nameValuePair.getName());
          nameValuePairBuilder.append(nameValuePair.getValue());
        }
        System.err
          .println("Request URL:" + methodName + "|params:" + nameValuePairBuilder.toString()
            + "|statusLine:" + method.getStatusLine());
      }
            /* 5 处理 HTTP 响应内容 */
      inputStream = method.getResponseBodyAsStream();
      br = new BufferedReader(new InputStreamReader(inputStream));
      StringBuffer stringBuffer = new StringBuffer();
      String str = "";
      while ((str = br.readLine()) != null) {
        stringBuffer.append(str);
      }
      HttpResult result = new HttpResult(statusCode, stringBuffer.toString());
      return result;
    } finally {
      method.releaseConnection();
      ((SimpleHttpConnectionManager) httpClient.getHttpConnectionManager()).shutdown();
      if (null != inputStream) {
        inputStream.close();
      }
      if (null != br) {
        br.close();
      }
    }
  }

  public static HttpResult postMethod(String methodName, NameValuePair[] parameters,
                                      List<Header> headerList)
    throws HttpException, IOException {
    HttpClient httpClient = null;
    PostMethod method = null;
    InputStream inputStream = null;
    BufferedReader br = null;
    try {
      httpClient = new HttpClient();
      if (null != System.getProperty("http.proxyHost")) {
        httpClient.getHostConfiguration().setProxy(System.getProperty("http.proxyHost"),
          Integer.parseInt(System.getProperty("http.proxyPort")));
      }
      // 设置 Http 连接超时为5秒
      httpClient.getHttpConnectionManager().getParams().setConnectionTimeout(TIMEOUT_MS);
                /* 2 生成 PostMethod 对象并设置参数 */
      method = new PostMethod(methodName);
      method.getParams().setContentCharset(CHARSET);
      method.setRequestBody(parameters);
      if (null != headerList && headerList.size() > 0) {
        for (Header header : headerList) {
          method.addRequestHeader(header);
        }
      }
                /* 3 执行 HTTP post 请求 */
      int statusCode = httpClient.executeMethod(method);
                /* 4 判断访问的状态码 */
      if (statusCode >= HttpStatus.SC_MOVED_PERMANENTLY) { //只有大于等于301才打印出请求参数
        System.err.println("Request URL:" + methodName + "|params:" + parameters
          + "|statusLine:" + method.getStatusLine());
      }
                /* 5 处理 HTTP 响应内容 */
      inputStream = method.getResponseBodyAsStream();
      br = new BufferedReader(new InputStreamReader(inputStream));
      StringBuffer stringBuffer = new StringBuffer();
      String str = "";
      while ((str = br.readLine()) != null) {
        stringBuffer.append(str);
      }
      HttpResult result = new HttpResult(statusCode, stringBuffer.toString());
      return result;
    } finally {
      method.releaseConnection();
      ((SimpleHttpConnectionManager) httpClient.getHttpConnectionManager()).shutdown();
      if (null != inputStream) {
        inputStream.close();
      }
      if (null != br) {
        br.close();
      }
    }
  }

  public static HttpResult postMethod(String methodName, String parameters, List<Header> headerList)
    throws HttpException, IOException {
    HttpClient httpClient = null;
    PostMethod method = null;
    InputStream inputStream = null;
    BufferedReader br = null;
    try {
      httpClient = new HttpClient();
      if (null != System.getProperty("http.proxyHost")) {
        httpClient.getHostConfiguration().setProxy(System.getProperty("http.proxyHost"),
          Integer.parseInt(System.getProperty("http.proxyPort")));
      }
      // 设置 Http 连接超时为5秒
      httpClient.getHttpConnectionManager().getParams().setConnectionTimeout(TIMEOUT_MS);
                /* 2 生成 PostMethod 对象并设置参数 */
      method = new PostMethod(methodName);
      method.getParams().setContentCharset(CHARSET);
      method.setRequestBody(parameters);
      if (null != headerList && headerList.size() > 0) {
        for (Header header : headerList) {
          method.addRequestHeader(header);
        }
      }
                /* 3 执行 HTTP post 请求 */
      int statusCode = httpClient.executeMethod(method);
                /* 4 判断访问的状态码 */
      if (statusCode >= HttpStatus.SC_MOVED_PERMANENTLY) { //只有大于等于301才打印出请求参数
        System.err.println("Request URL:" + methodName + "|params:" + parameters
          + "|statusLine:" + method.getStatusLine());
      }
                /* 5 处理 HTTP 响应内容 */
      inputStream = method.getResponseBodyAsStream();
      br = new BufferedReader(new InputStreamReader(inputStream));
      StringBuffer stringBuffer = new StringBuffer();
      String str = "";
      while ((str = br.readLine()) != null) {
        stringBuffer.append(str);
      }
      HttpResult result = new HttpResult(statusCode, stringBuffer.toString());
      return result;
    } finally {
      method.releaseConnection();
      ((SimpleHttpConnectionManager) httpClient.getHttpConnectionManager()).shutdown();
      if (null != inputStream) {
        inputStream.close();
      }
      if (null != br) {
        br.close();
      }
    }
  }


  public static HttpResult put(String url, String parameters, List<Header> headerList)
    throws HttpException, IOException {
    HttpClient httpClient = null;
    PutMethod method = null;
    InputStream inputStream = null;
    BufferedReader br = null;
    try {
      httpClient = new HttpClient();
      if (null != System.getProperty("http.proxyHost")) {
        httpClient.getHostConfiguration().setProxy(System.getProperty("http.proxyHost"),
          Integer.parseInt(System.getProperty("http.proxyPort")));
      }
      // 设置 Http 连接超时为5秒
      httpClient.getHttpConnectionManager().getParams().setConnectionTimeout(TIMEOUT_MS);
                /* 2 生成 PostMethod 对象并设置参数 */
      method = new PutMethod(url);
      method.setRequestBody(parameters);
      if (null != headerList && headerList.size() > 0) {
        for (Header header : headerList) {
          method.addRequestHeader(header);
        }
      }
                /* 3 执行 HTTP post 请求 */
      int statusCode = httpClient.executeMethod(method);
                /* 4 判断访问的状态码 */
      if (statusCode >= HttpStatus.SC_MOVED_PERMANENTLY) { //只有大于等于301才打印出请求参数
        System.err.println("Request URL:" + url + "|params:" + parameters
          + "|statusLine:" + method.getStatusLine());
      }
                /* 5 处理 HTTP 响应内容 */
      inputStream = method.getResponseBodyAsStream();
      br = new BufferedReader(new InputStreamReader(inputStream));
      StringBuffer stringBuffer = new StringBuffer();
      String str = "";
      while ((str = br.readLine()) != null) {
        stringBuffer.append(str);
      }
      HttpResult result = new HttpResult(statusCode, stringBuffer.toString());
      return result;
    } finally {
      method.releaseConnection();
      ((SimpleHttpConnectionManager) httpClient.getHttpConnectionManager()).shutdown();
      if (null != inputStream) {
        inputStream.close();
      }
      if (null != br) {
        br.close();
      }
    }
  }

  public static HttpResult deleteMethod(String url, List<Header> headerList)
    throws HttpException, IOException {
    HttpClient httpClient = null;
    DeleteMethod method = null;
    InputStream inputStream = null;
    BufferedReader br = null;
    try {
      httpClient = new HttpClient();
      if (null != System.getProperty("http.proxyHost")) {
        httpClient.getHostConfiguration().setProxy(System.getProperty("http.proxyHost"),
          Integer.parseInt(System.getProperty("http.proxyPort")));
      }
      // 设置 Http 连接超时为5秒
      httpClient.getHttpConnectionManager().getParams().setConnectionTimeout(50000);
      method = new DeleteMethod(url);
      if (null != headerList && headerList.size() > 0) {
        for (Header header : headerList) {
          method.addRequestHeader(header);
        }
      }
            /* 3 执行 HTTP delete 请求 */
      int statusCode = httpClient.executeMethod(method);
            /* 4 打印出请求参数 */
      System.out.println("Request URL:" + url
        + "|statusLine:" + method.getStatusLine());
            /* 5 处理 HTTP 响应内容 */
      inputStream = method.getResponseBodyAsStream();
      br = new BufferedReader(new InputStreamReader(inputStream));
      StringBuffer stringBuffer = new StringBuffer();
      String str = "";
      while ((str = br.readLine()) != null) {
        stringBuffer.append(str);
      }
      HttpResult result = new HttpResult(statusCode, stringBuffer.toString());
      return result;
    } finally {
      method.releaseConnection();
      ((SimpleHttpConnectionManager) httpClient.getHttpConnectionManager()).shutdown();
      if (null != inputStream) {
        inputStream.close();
      }
      if (null != br) {
        br.close();
      }
    }
  }


  /**
   * UnsupportedEncodingException一定不会出现在线上环境，故借此方法隐去异常，简化代码
   *
   * @return UTF-8编码的URLEncoded字符串
   */
  public static String getURLEncodedString(String src) {
    return getURLEncodedString(src, CHARSET);
  }

  /**
   * UnsupportedEncodingException一定不会出现在线上环境，故借此方法隐去异常，简化代码
   */
  public static String getURLEncodedString(String src, String charset) {
    String result = "";
    try {
      result = URLEncoder.encode(src, charset);
    } catch (UnsupportedEncodingException e) {
      e.printStackTrace();
    }
    return result;
  }

  /**
   * UnsupportedEncodingException一定不会出现在线上环境，故借此方法隐去异常，简化代码
   *
   * @return UTF-8编码URLDecoded字符串
   */
  public static String getURLDecodedString(String encodedString) {
    return getURLDecodedString(encodedString, CHARSET);
  }

  /**
   * UnsupportedEncodingException一定不会出现在线上环境，故借此方法隐去异常
   */
  public static String getURLDecodedString(String encodedString, String charset) {
    String result = "";
    try {
      result = URLDecoder.decode(encodedString, charset);
    } catch (UnsupportedEncodingException e) {
      e.printStackTrace();
    }
    return result;
  }

  private static final String AUTHORIZATION_HEADER = "Authorization";
  private static final Pattern PATTERN = Pattern.compile("Bearer (.*)");

  /**
   * 从Request中解析出Authorization头中的Token
   */
  public static String getApiToken(HttpServletRequest request) {
    String authorizationInfo = request.getHeader(AUTHORIZATION_HEADER);
    if (null == authorizationInfo) {
      return null;
    }

    Matcher matcher = PATTERN.matcher(authorizationInfo);
    if (matcher.find()) {
      return matcher.group(1);
    }

    return null;
  }

}
