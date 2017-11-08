package com.express.admin.dao;

import com.express.domain.User;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface UserDao {
    public static final String TABLE = "user";
    public static final String COLL_ALL = "id, account, password, name, id_number, email, is_vip," +
            "is_review, age, phone, post_code, bank_account, bank_phone, address, nick_name, motto, create_time, update_time";

    @Select(" select "
        + COLL_ALL
        + " from "
        + TABLE
        + " where is_review = false")
    List<User> selectToVipUser();

    @Update(" update "
        + TABLE
        + " set "
        + " is_vip = #{isVip}, "
        + " is_review = true "
        + " where id = #{userId}")
    int updateVip(@Param("userId") long userId, @Param("isVip") boolean isVip);
}
