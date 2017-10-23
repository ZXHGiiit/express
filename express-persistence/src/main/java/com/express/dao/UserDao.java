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
  String COLL_ALL = "id, account, password, name, phone, email, age, isVip";//待定

  @Select(" select "
    + COLL_ALL
    + " from "
    + TABLE
    + " where "
    + " account = #{account}"
    + " and "
    + " password = #{password}"
  )
  User selectByUAP(@Param("account") String account, @Param("password") String password);

  @Insert(" insert into "
    + TABLE
    + " set "
    + " account = #{account}, "
    + " name = #{name}, "
    + " password = #{password}, "
    + " phone = #{phone}, "
    + " email = #{email}, "
    + " isVip = #{isVip}, "
    + " age = #{age} "
  )
  int add(User user);

  @Insert(" insert into "
    + TABLE
    + " set "
    + " account = #{account}, "
    + " password = #{password}"
  )
  int test(User user);
}
