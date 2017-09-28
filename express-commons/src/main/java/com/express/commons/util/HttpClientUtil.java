package com.express.commons.util;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.net.URI;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by renren on 17/7/25.
 */
public class HttpClientUtil {
  private static final Log LOG = LogFactory.getLog(HttpClientUtil.class);

  public static String doGet(String url, Map<String, String> params) {
    if (url == null || url.equals("") || params.isEmpty()) {
      LOG.error("HttpClientUtil.doGet.url or params is null");
      return "";
    }
    LOG.info("HttpClientUtil.doGet.url = " + url + "params = " + params.toString());
    //创建HttpClient对象
    CloseableHttpClient httpClient = HttpClients.createDefault();

    String resultString = "";
    CloseableHttpResponse response = null;
    try {
      //创建uri
      URIBuilder builder = new URIBuilder(url);
      for (String key : params.keySet()) {
        builder.addParameter(key, params.get(key));
      }
      URI uri = builder.build();
      //创建http Get请求
      HttpGet httpGet = new HttpGet(uri);
      //执行请求
      response = httpClient.execute(httpGet);
      //判断返回状态是否是200
      if (response.getStatusLine().getStatusCode() == 200) {
        resultString = EntityUtils.toString(response.getEntity(), "UTF-8");
      } else {
        LOG.error("HttpClientUtil.doGet.ERROR responseStatus = " + response.getStatusLine()
          .getStatusCode());
      }
    } catch (Exception e) {
      LOG.error("HttpClientUtil.doGet.ERROR", e);
      e.printStackTrace();
    } finally {
      try {
        if (response != null) {
          response.close();
        }
        httpClient.close();
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
    return resultString;
  }

  public static String doGet(String url) {
    if (url == null || url.equals("")) {
      LOG.error("HttpClientUtil.doGet.url is null");
      return "";
    }
    LOG.info("HttpClientUtil.doGet.url = " + url);
    //创建HttpClient对象
    CloseableHttpClient httpClient = HttpClients.createDefault();

    String resultString = "";
    CloseableHttpResponse response = null;
    try {
      //创建uri
      URIBuilder builder = new URIBuilder(url);
      URI uri = builder.build();
      //创建http Get请求
      HttpGet httpGet = new HttpGet(uri);
      //执行请求
      response = httpClient.execute(httpGet);
      //判断返回状态是否是200
      if (response.getStatusLine().getStatusCode() == 200) {
        resultString = EntityUtils.toString(response.getEntity(), "UTF-8");
      } else {
        LOG.error("HttpClientUtil.doGet.ERROR responseStatus = " + response.getStatusLine()
          .getStatusCode());
      }
    } catch (Exception e) {
      LOG.error("HttpClientUtil.doGet.ERROR", e);
      e.printStackTrace();
    } finally {
      try {
        if (response != null) {
          response.close();
        }
        httpClient.close();
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
    return resultString;
  }

  public static String doPost(String url, Map<String, String> params) {
    if (url == null || url.equals("") || params.isEmpty()) {
      LOG.error("HttpClientUtil.doPost.url or params is null");
      return "";
    }
    LOG.info("HttpClientUtil.doPost.url = " + url + ", params = " + params.toString());
    CloseableHttpClient httpClient = HttpClients.createDefault();
    CloseableHttpResponse response = null;
    String resultString = "";
    try {
      //创建httpPost请求
      HttpPost httpPost = new HttpPost(url);
      List<NameValuePair> paramList = new ArrayList<NameValuePair>();
      for (String key : params.keySet()) {
        paramList.add(new BasicNameValuePair(key, params.get(key)));
      }
      //模拟表单
      UrlEncodedFormEntity entity = new UrlEncodedFormEntity(paramList, "UTF-8");
      httpPost.setEntity(entity);
      //执行http请求
      response = httpClient.execute(httpPost);
      resultString = EntityUtils.toString(response.getEntity(), "UTF-8");
    } catch (Exception e) {
      LOG.error("HttpClientUtil.doPost.ERROR", e);
    } finally {
      try {
        if (response != null) {
          response.close();
        }
        httpClient.close();
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
    return resultString;
  }

  public static String doPost(String url) {
    if (url == null || url.equals("")) {
      LOG.error("HttpClientUtil.doPost.url is null");
      return "";
    }
    LOG.info("HttpClientUtil.doPost.url = " + url);
    CloseableHttpClient httpClient = HttpClients.createDefault();
    CloseableHttpResponse response = null;
    String resultString = "";
    try {
      //创建httpPost请求
      HttpPost httpPost = new HttpPost(url);
      //执行http请求
      response = httpClient.execute(httpPost);
      resultString = EntityUtils.toString(response.getEntity(), "UTF-8");
    } catch (Exception e) {
      LOG.error("HttpClientUtil.doPost.ERROR", e);
    } finally {
      try {
        if (response != null) {
          response.close();
        }
        httpClient.close();
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
    return resultString;
  }

  public static String doPostJson(String url, String json) {
    if (url == null || url.equals("") || json == null || json.equals("")) {
      LOG.error("HttpClientUtil.doPostJson.url or json is null");
      return "";
    }
    LOG.info("HttpClientUtil.doPost.url = " + url + ", json = " + json);
    //创建HttpCLient对象
    CloseableHttpClient httpClient = HttpClients.createDefault();
    CloseableHttpResponse response = null;
    String resultString = "";
    try {
      //创建HttpPost对象
      HttpPost httpPost = new HttpPost(url);
      //创建请求内容
      StringEntity entity = new StringEntity(json, ContentType.APPLICATION_JSON);
      httpPost.setEntity(entity);
      //执行http请求
      response = httpClient.execute(httpPost);
      resultString = EntityUtils.toString(response.getEntity());
    } catch (Exception e) {
      LOG.error("HttpClientUtil.doPostJson.ERROR");
    } finally {
      try {
        if (response != null) {
          response.close();
        }
        httpClient.close();
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
    return resultString;
  }

  public static void main(String[] args) {
        /*//整个程序入口
        CloseableHttpClient httpClient = HttpClients.createDefault();
        //post请求
        HttpPost httpPost = new HttpPost("http://localhost:8081/content/category/list");
        //设置参数
        List<NameValuePair> params = new ArrayList<NameValuePair>();
        params.add(new BasicNameValuePair("id","30"));
        CloseableHttpResponse response = null;
        try {
            httpPost.setEntity(new UrlEncodedFormEntity(params,"UTF-8"));
            response = httpClient.execute(httpPost);
            String result = EntityUtils.toString(response.getEntity(),"UTF-8");
            System.out.println(result);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                httpClient.close();
                if(response != null) {
                    response.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        }*/
    String sql = "select COALESCE(sum(duration),0)  from vcall_stat  where dialer_call_record_id " +
      "in (select id from dialer_call_record where user_id =#{userId} and create_time between " +
      "#{beginTime} and #{endTime})";
    System.out.println(sql);
  }
}
