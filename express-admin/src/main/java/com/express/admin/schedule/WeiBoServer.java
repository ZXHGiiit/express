package com.express.admin.schedule;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import weibo4j.Timeline;
import weibo4j.http.HttpClient;
import weibo4j.http.ImageItem;
import weibo4j.model.PostParameter;
import weibo4j.model.Status;
import weibo4j.model.WeiboException;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

@Component("weiBoServer")
public class WeiBoServer {
    private static final Log LOG = LogFactory.getLog(WeiBoServer.class);

    //@Scheduled(fixedRate = 2000)
    @Scheduled(fixedRate = 60000)
    public void updatetask() {
        //LOG.info("WeiBoServer.updateStatus.is begin===================>");
        //获取当前的系统时间
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm");
        String time = dateFormat.format(date);
        String[] t = time.split(":");
        int hour = Integer.parseInt(t[0]);
        int min = Integer.parseInt(t[1]);
        String status = "";
        //如果为整点，则发送整点微博。
        if(t[1].equals("00")) {
            LOG.info("WeiBoServer.updateStatus is begin===============>" + time);
            status = makeContent(hour);
            updateStatusWithPic(status, hour);
        } else if (hour == min) {
            LOG.info("WeiBoServer.updateStatus is begin===============>" + time);
            //若果是这样的就发送小猪佩奇图片。
            status = "芥末小姐@芥末小姐a,叫我每当分钟和时种一样的时候，发送一张小猪佩奇图片。";
            int picNum = new Random().nextInt(16) + 23;
            updateStatusWithPic(status, picNum);
        }


        //LOG.info("WeiBoServer.updatetask.is finish==================>");
    }

    public String makeContent (int hour24) {
        StringBuilder status = new StringBuilder();
        if(hour24 == 0) {
            return "现在是零点整。新的一天又开始了。";
        }
        for(int i = 0; i < hour24; i++) {
            status.append("铛～");
        }
        status.append("现在是" + hour24 + "点整。");

        return status.toString();
    }

    public void updateStatus(String statuses) {
        HttpClient client = new weibo4j.http.HttpClient();
        String access_token = "2.00IvkYAHTBvsZDf6aa6a5f86E3y3FD";
        String URL = "http://zhouxinghang.com";
        Timeline tm = new Timeline(access_token);

        try {
            Status status = tm.updateStatus(statuses+URL);
            LOG.info(status.toString());
            LOG.info("WeiBoServer.updateStatus.SUCCESS.content:" + statuses);
        } catch (WeiboException e) {
            e.printStackTrace();
        }
    }

    public void updateStatusWithPic(String statuses, int hour) {
        String filename = "/home/temp/weibo/"+String.valueOf(hour)+".jpg";
        String URL = "http://zhouxinghang.com";
        try {
            try {
                byte[] content = readFileImage(filename);
                System.out.println("content length:" + content.length);
                ImageItem pic = new ImageItem("pic", content);
                String s = java.net.URLEncoder.encode(statuses+URL, "utf-8");
                String access_token = "2.00IvkYAHTBvsZDf6aa6a5f86E3y3FD";
                Timeline tm = new Timeline(access_token);
                Status status = tm.uploadStatus(s, pic);
                LOG.info(status.toString());
                LOG.info("WeiBoServer.updateStatus.SUCCESS.content:" + statuses);
            } catch (Exception e1) {
                e1.printStackTrace();
            }
        } catch (Exception ioe) {
            LOG.error("WeiBoServer.updateStatusWithPic.ERROR");
        }
    }

    //读取文件
    public byte[] readFileImage(String filename) throws IOException {
        BufferedInputStream bufferedInputStream = new BufferedInputStream(
                new FileInputStream(filename));
        int len = bufferedInputStream.available();
        byte[] bytes = new byte[len];
        int r = bufferedInputStream.read(bytes);
        if (len != r) {
            bytes = null;
            throw new IOException("读取文件不正确");
        }
        bufferedInputStream.close();
        return bytes;
    }

    public static void main(String[] args) {
        System.out.println(new WeiBoServer().makeContent(23));
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm");
        String time = dateFormat.format(date);
        System.out.println(time);
        int a = Integer.parseInt("03");
        System.out.println(a);
        /*
        WeiBoServer server = new WeiBoServer();
        String statuses = server.makeContent(22);
        server.updateStatusWithPic(statuses,22);
        */
        int num = new Random().nextInt(25);
        System.out.println(num);
    }

}
