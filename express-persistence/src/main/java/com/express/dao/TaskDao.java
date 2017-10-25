package com.express.dao;

import com.express.domain.Task;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface TaskDao {
    public static final String TABLE = "task";
    public static final String COLL_ALL = "id, user_id, route_id, order_id, is_finish, route," +
            "create_time, update_time";

    @Select(" select "
        + COLL_ALL
        + " from "
        + TABLE
        + " where "
        + " user_id = #{userId}")
    List<Task> selectAllByUserId(@Param("userId") long userId);





}
