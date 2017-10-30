package com.express.commons.util;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;

import java.util.HashMap;
import java.util.Map;


/**
 * 发送短信验证码
 */
public class SmsUtil {
    private static final String APP_CODE = "2b52848ad8eb41838fdba9429efb9879";

    public static String sendCode(long phone, String name, int code) {
        String host = "https://smsapi.api51.cn";
        String path = "/single_sms_get/";
        String method = "GET";
        String appcode = APP_CODE;
        Map<String, String> headers = new HashMap<String, String>();
        //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
        headers.put("Authorization", "APPCODE " + appcode);
        Map<String, String> querys = new HashMap<String, String>();
        querys.put("mobile", String.valueOf(phone));
        querys.put("params", name + "," + String.valueOf(code));
        querys.put("sign", "全名快递");
        querys.put("tpl_id", "47331");
        HttpEntity result = null;
        try {
            HttpResponse response = HttpUtils.doGet(host, path, method, headers, querys);
            System.out.println(response.toString());
            //获取response的body
            result = response.getEntity();
        } catch (Exception e) {
            e.printStackTrace();
            return "Error";
        }
        return "OK";
    }



    public static void main(String[] args) {
        String result = SmsUtil.sendCode(13633843273l, "周星航", 1024 );
        System.out.println(result);
    }


}
