package com.express.dao;

import com.express.domain.User;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * Created by xinghang on 17/9/28.
 */
public interface UserDao {
  public static final String TABLE = "user";
  public static final String COLL_ALL = "id, account, password, name, id_number, email, is_vip," +
          "age, phone, post_code, bank_account, address, nick_name, motto, create_time, update_time";

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
    + " is_vip = #{isVip}, "
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

  @Select(" select "
    + COLL_ALL
    + " from "
    + TABLE
    + " where "
    + " userId = #{userId}")
  User selectByUserId(@Param("userId") long userId);
}
