package com.express.admin.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

public interface MessageDao {
    public static final String TABLE = "message";
    public static final String COLL_ALL = "id, user_id, send_id, title, msg, is_view, is_sys, create_time, update_time";

    @Insert( " insert into "
            + TABLE
            + " set "
            + " user_id = #{userId},"
            + " title = #{title},"
            + " msg = #{msg}, "
            + " is_sys = #{isSys}")
    int insert(@Param("userId") long userId, @Param("title") String title, @Param("msg") String msg,
               @Param("isSys") boolean isSys);
}
