package com.express.util;

import com.google.common.collect.Maps;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Created by xinghang on 17/8/30.
 */
public class Test {
  public static void main(String[] args) {
    Calendar calendar = Calendar.getInstance();
    calendar.add(Calendar.DATE, 1);
    Date endTime = calendar.getTime();
    calendar.add(Calendar.DATE, -31);
    Date startTime = calendar.getTime();
    System.out.println(startTime + "--" + endTime);
    Map<Long, Student> stuMap = Maps.newHashMap();
    List<Long> stuIds = stuMap.entrySet().stream().map(i -> i.getValue().getId()).collect
      (Collectors.toList());
    System.out.println(stuIds);
    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");
    System.out.println(sdf.format(new Date()));
    System.out.println(new Date().getTime());
  }
}

class Student {
  private long id;
  private String name;

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }
}