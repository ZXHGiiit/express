package com.express.dao;

import com.express.domain.Task;
import com.express.support.MybatisExtendedLanguageDriver;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Lang;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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

    @Select(" select "
            + COLL_ALL
            + " from "
            + TABLE
            + " where "
            + " user_id = #{userId} "
            + " and "
            + " is_finish = #{isFinish}")
    List<Task> selectAllBy(@Param("userId") long userId, @Param("isFinish") boolean isFinish);


    @Insert(" insert into "
        + TABLE
        + " set "
        + " user_id = #{userId}, "
        + " route_id = #{routeId}, "
        + " order_id = #{orderId}, "
        + " route = #{route}")
    int addTask(Task task);

    @Update(" update "
        + TABLE
        + " set "
        + " is_finish = #{isFinish}"
        + " where "
        + " id = #{taskId}")
    int updateFinish(@Param("isFinish") boolean isFinish,
                     @Param("taskId") long taskId);

    @Lang(MybatisExtendedLanguageDriver.class)
    @Update(" update "
            + TABLE
            + " set "
            + " is_finish = #{isFinish}"
            + " where "
            + " id in (#{taskId})")
    int updateAllFinish(@Param("isFinish") boolean isFinish,
                     @Param("taskIds") List<Long> taskIds);

    @Update(" update "
        + TABLE
        + " set "
        + " route = #{route} "
        + " where "
        + " id = #{taskId}")
    int updateRoute(@Param("route") String route,
                    @Param("taskId") long taskId);


    @Select(" select "
        + COLL_ALL
        + " from "
        + TABLE
        + " where "
        + " id = #{taskId}")
    Task selectByTaskId(@Param("taskId") long taskId);

    @Select(" select "
            + COLL_ALL
            + " from "
            + TABLE
            + " where "
            + " order_id = #{orderId}")
    Task selectByOrderId(@Param("orderId") long orderId);
}
