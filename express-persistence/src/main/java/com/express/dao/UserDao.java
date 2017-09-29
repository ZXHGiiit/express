package com.express.dao;

import com.express.domain.User;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * Created by xinghang on 17/9/28.
 */
public interface UserDao {
  String TABLE = "user";
  String COLL_ALL = "id, account, pasword, name, phone, email, creat_time, updat_time";//待定

  @Select(" select "
    + COLL_ALL
    + " from "
    + TABLE
    + " where "
    + " name = = #{name}"
    + " password = #{password}"
  )
  User selectByUAP(@Param("username") String name, @Param("password") String password);

  @Insert(" inster into "
    + TABLE
    + " set "
    + " id = #{id}, "
    + " account = #{account}, "
    + " name = #{name}, "
    + " password = #{password}, "
    + " phone = #{phone}, "
    + " email = #{email}, "
    + " creat_time = #{creatTime}, "
    + " update_time = #{updateTime} "
  )
  int add(User user);
}
