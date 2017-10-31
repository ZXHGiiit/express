package com.express.dao;

import com.express.domain.Message;
import com.sun.javafx.scene.control.behavior.TextAreaBehavior;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface MessageDao {
    public static final String TABLE = "message";
    public static final String COLL_ALL = "id, user_id, send_id, title, msg, is_view, is_sys, create_time, update_time";

    @Select(" select "
        + COLL_ALL
        + " from "
        + TABLE
        + " where "
        + " user_id = #{userId}")
    List<Message> selectAllByUserId(@Param("userId") long userId);

    @Select(" select "
        + COLL_ALL
        + " from "
        + TABLE
        + " where "
        + " user_id = #{userId} "
        + " and is_view = #{isView} "
        + " and is_sys = #{isSys}"
    )
    List<Message> selectAllBy(@Param("userId") long userId, @Param("isView") boolean isView,
                              @Param("isSys") boolean isSys);

    @Select(" select "
        + " count(id) "
        + " from "
        + TABLE
        + " where "
        + " user_id = #{userId} "
        + " and "
        + " is_view = #{isView}")
    int selectCountByUserId(@Param("userId") long userId, @Param("isView") boolean isView);

    @Select(" select "
        + COLL_ALL
        + " from "
        + TABLE
        + " where id = #{id}")
    Message selectById(@Param("id") long id);

    @Update(" update "
        + TABLE
        + " set "
        + " is_view = #{isView}"
        + " where id = #{id}")
    int updateView(@Param("id") long id, @Param("isView") boolean isView);
}
