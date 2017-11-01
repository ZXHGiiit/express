package com.express.domain;

import java.util.Date;

/**
 * Created by xinghang on 17/9/28.
 */
public class User {
  private long id;
  private String account;
  private String password;
  private String name;
  private long idNumber;
  private String email;
  private boolean isVip;
  private int age;
  private long phone;
  private long postCode;
  private long bankAccount;
  private String address;
  private String nickName;
  private String motto;
  private Date createTime;
  private Date updateTime;

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }

  public String getAccount() {
    return account;
  }

  public void setAccount(String account) {
    this.account = account;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public long getIdNumber() {
    return idNumber;
  }

  public void setIdNumber(long idNumber) {
    this.idNumber = idNumber;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public boolean isVip() {
    return isVip;
  }

  public boolean getIsVip(){
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

  public long getPhone() {
    return phone;
  }

  public void setPhone(long phone) {
    this.phone = phone;
  }

  public long getPostCode() {
    return postCode;
  }

  public void setPostCode(long postCode) {
    this.postCode = postCode;
  }

  public long getBankAccount() {
    return bankAccount;
  }

  public void setBankAccount(long bankAccount) {
    this.bankAccount = bankAccount;
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public String getNickName() {
    return nickName;
  }

  public void setNickName(String nickName) {
    this.nickName = nickName;
  }

  public String getMotto() {
    return motto;
  }

  public void setMotto(String motto) {
    this.motto = motto;
  }

  public Date getCreateTime() {
    return createTime;
  }

  public void setCreateTime(Date createTime) {
    this.createTime = createTime;
  }

  public Date getUpdateTime() {
    return updateTime;
  }

  public void setUpdateTime(Date updateTime) {
    this.updateTime = updateTime;
  }

  @Override
  public String toString() {
    return "User{" +
            "id=" + id +
            ", account='" + account + '\'' +
            ", password='" + password + '\'' +
            ", name='" + name + '\'' +
            ", idNumber=" + idNumber +
            ", email='" + email + '\'' +
            ", isVip=" + isVip +
            ", age=" + age +
            ", phone=" + phone +
            ", postCode=" + postCode +
            ", bankAccount=" + bankAccount +
            ", address='" + address + '\'' +
            ", nickName='" + nickName + '\'' +
            ", motto='" + motto + '\'' +
            ", createTime=" + createTime +
            ", updateTime=" + updateTime +
            '}';
  }
}
