package com.express.commons.util;

/**
 * Created by renren on 17/7/20.
 */

import java.util.Date;
import java.util.Random;

/**
 * 各种id生成策略
 */
public class IDUtils {
  private  static final String base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
  /**
   * 图片名生成
   */
  public static String genImageName() {
    long millis = System.currentTimeMillis();
    Random random = new Random();
    //加上3位随机数
    int end3 = random.nextInt(999);
    //不足3位前补0
    String str = millis + String.format("%03d", end3);
    return str;
  }

  /**
   * 商品ID生成
   */
  public static long getItemId() {
    long millis = System.currentTimeMillis();
    Random random = new Random();
    int end2 = random.nextInt(99);
    String str = millis + String.format("%02d", end2);
    long id = new Long(str);
    return id;
  }

  /**
   * 订单id生成
   * @return
   */
  public static long getOrderId() {
    long millis = System.currentTimeMillis();
    Random random = new Random();
    int end2 = random.nextInt(99);
    String str = millis + String.format("%02d", end2);
    long id = new Long(str);
    return id;
  }

  /**
   * 随机字符串生成
   */

  public static String getString() {
    long millis = System.currentTimeMillis();
    int length = 8;
    long time = new Date().getTime();
    Random random = new Random();
    StringBuffer sb = new StringBuffer();
    for (int i = 0; i < length; i++) {
      int number = random.nextInt(base.length());
      sb.append(base.charAt(number));
    }
    //取毫秒的最后3位
    for(int i = 0; i < 3; i++) {
      int number = (int) (millis % 10);
      millis = millis/10;
      sb.append(base.charAt(number));
    }
    return sb.toString();
  }

  public static void main(String[] args) {
    System.out.println(getString());
    System.out.println(System.currentTimeMillis());
  }
}
