package com.express.dao;

import com.express.domain.User;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * Created by xinghang on 17/9/28.
 */
public interface UserDao {
  String TABLE = "user";
  String COLL_ALL = "id, name, pasword, phone, email, created, updated";//待定

  @Select(" select "
    + COLL_ALL
    + " from "
    + TABLE
    + " where "
    + " name = = #{name}"
    + " password = #{password}"
  )
  User selectByUAP(@Param("username") String name, @Param("password") String password);
}
