package com.express.dao;

import com.express.domain.Route;
import com.express.support.MybatisExtendedLanguageDriver;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Lang;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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
        + " start_address like '%${startAdd}%'"
        + " and "
        + " end_address like '%${endAdd}%'"
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
        + " status not in ('cancle','finish')")
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

    @Lang(MybatisExtendedLanguageDriver.class)
    @Select(" select "
            + COLL_ALL
            + " from "
            + TABLE
            + " where "
            + " user_id = #{userId} "
            + " and "
            + " status in (#{statusList})"
    )
    List<Route> selectAllByUserId(@Param("userId") long userId,@Param("statusList") List<String> statusList);

    @Update(" update "
        + TABLE
        + " set status = #{status} "
        + " where "
        + " id = #{routeId}")
    int updateStatus(@Param("routeId") long routeId, @Param("status") String status);
}
