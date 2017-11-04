package com.express.commons.util;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;


import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

public class IDCardUtil {
    private static final Log LOG = LogFactory.getLog(IDCardUtil.class);

    public static void main(String[] args) {
        check(421182199507095513l, "周星航");
    }

    public static void check(long cardNo, String name) {
        String host = "https://aliyun-idcard-verify.apistore.cn";
        String path = "/idcard";
        String method = "GET";
        String appcode = "2b52848ad8eb41838fdba9429efb9879";
        Map<String, String> headers = new HashMap<String, String>();
        //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
        headers.put("Authorization", "APPCODE " + appcode);
        Map<String, String> querys = new HashMap<String, String>();
        querys.put("cardNo", String.valueOf(cardNo));
        querys.put("realName", name);


        try {
            /**
             * 重要提示如下:
             * HttpUtils请从
             * https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/src/main/java/com/aliyun/api/gateway/demo/util/HttpUtils.java
             * 下载
             *
             * 相应的依赖请参照
             * https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/pom.xml
             */
            HttpResponse response = HttpUtils.doGet(host, path, method, headers, querys);
            LOG.info(response.toString());
            HttpEntity entity = response.getEntity();
            InputStream in = entity.getContent();
            //获取response的body
            System.out.println(EntityUtils.toString(response.getEntity()));
            byte[] arrs = EntityUtils.toByteArray(entity);
            for(byte arr : arrs) {
                System.out.println(arr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
