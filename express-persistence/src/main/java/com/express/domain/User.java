package com.express.domain;

/**
 * Created by xinghang on 17/9/28.
 */
public class User {
  private String name;
  private String account;
  private String email;
  private String password;
  private boolean isVip;
  private int age;
  private long phone;

  public long getPhone() {
    return phone;
  }

  public void setPhone(long phone) {
    this.phone = phone;
  }

  private long create_time;
  private long update_time;

  public long getCreate_time() {
    return create_time;
  }

  public void setCreate_time(long create_time) {
    this.create_time = create_time;
  }

  public long getUpdate_time() {
    return update_time;
  }

  public void setUpdate_time(long update_time) {
    this.update_time = update_time;
  }

  public String getAccount() {
    return account;
  }

  public void setAccount(String account) {
    this.account = account;
  }

  private long id;

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public boolean isVip() {
    return isVip;
  }

  public void setVip(boolean vip) {
    isVip = vip;
  }

  public int getAge() {
    return age;
  }

  public void setAge(int age) {
    this.age = age;
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }

  @Override
  public String toString() {
    return "User{" +
            "name='" + name + '\'' +
            ", account='" + account + '\'' +
            ", email='" + email + '\'' +
            ", password='" + password + '\'' +
            ", isVip=" + isVip +
            ", age=" + age +
            ", phone=" + phone +
            ", create_time=" + create_time +
            ", update_time=" + update_time +
            ", id=" + id +
            '}';
  }
}
