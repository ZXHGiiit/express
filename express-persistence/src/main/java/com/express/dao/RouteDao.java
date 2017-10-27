package com.express.dao;

import com.express.domain.Route;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface RouteDao {
    public static final String TABLE = "route";
    public static final String COLL_ALL = "id, user_id, start_address, end_address, price, " +
            "status, start_time, end_time, create_time, update_time";


    @Select(" select "
        + COLL_ALL
        + " from "
        + TABLE
        + " where "
        + " start_address = #{startAdd}"
        + " and "
        + " end_address = #{endAdd}"
        + " and "
        + " status = 'ready'")
    List<Route> selectAllReadyByAdd(@Param("startAdd") String startAdd,
                               @Param("endAdd") String endAdd);

    @Select(" select "
        + COLL_ALL
        + " from "
        + TABLE
        + " where "
        + " user_id = #{userId} "
        + " and "
        + " status <> 'cancle'")
    List<Route> selectRouteByUserId(@Param("userId") long userId);

    @Insert(" insert into "
        + TABLE
        + " set "
        + " user_id = #{userId}, "
        + " start_address = #{startAddress}, "
        + " end_address = #{endAddress}, "
        + " price = #{price}, "
        //+ " status = #{status}, "     //status默认是ready
        + " start_time = #{startTime}, "
        + " end_time = #{endTime}"
    )
    int addRoute(Route route);


    @Select(" select "
        + COLL_ALL
        + " from "
        + TABLE
        + " where "
        + " id = #{routeId}"
    )
    Route selectByRouteId(@Param("routeId") long routeId);
}
