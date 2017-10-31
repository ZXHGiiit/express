package com.express.dao;

import com.express.domain.Message;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface MessageDao {
    public static final String TABLE = "message";
    public static final String COLL_ALL = "id, user_id, msg, is_view, create_time, update_time";

    @Select(" select "
        + COLL_ALL
        + " from "
        + TABLE
        + " where "
        + " user_id = #{userId}")
    List<Message> selectAllByUserId(@Param("userId") long userId);

    @Select(" select "
        + " count(id) "
        + " from "
        + TABLE
        + " where "
        + " user_id = #{userId} "
        + " and "
        + " is_view = #{isView}")
    int selectCountByUserId(@Param("userId") long userId, @Param("isView") boolean isView);
}
