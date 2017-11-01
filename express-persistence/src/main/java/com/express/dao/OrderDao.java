package com.express.dao;

import com.express.domain.Order;
import com.express.support.MybatisExtendedLanguageDriver;
import com.sun.tracing.dtrace.ProviderAttributes;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Lang;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

public interface OrderDao {
    public static final String TABLE = "orders";
    public static final String COLL_ALL = "auto_id, id, user_id, route_id, send_address, take_address," +
            "send_name, take_name, send_phone, take_phone, goods_name, goods_weight, is_finish," +
            "is_com, score, comment, start_time, end_time, create_time, update_time";//待定

    @Select(" select "
        + COLL_ALL
        + " from "
        + TABLE
    )
    List<Order> selectAllByUserId(@Param("userId") long userId);

    @Select(" select "
            + COLL_ALL
            + " from "
            + TABLE
            + " where is_finish = #{isFinish}"
    )
    List<Order> selectBy(@Param("userId") long userId, @Param("isFinish") boolean isFinish);
    /**
     * 通过认证用户获取task--》orderId--》order--》
     * @param orderIds
     * @return
     */
    @Lang(MybatisExtendedLanguageDriver.class)
    @Select(" select "
        + COLL_ALL
        + " from "
        + TABLE
        + " where "
        + " id in (#{orderId})"
        )
    List<Order> selectAllByOrderIds(@Param("orderId") List<Long> orderIds);

    @Lang(MybatisExtendedLanguageDriver.class)
    @MapKey("id")
    @Select(" select "
            + COLL_ALL
            + " from "
            + TABLE
            + " where "
            + " id in (#{orderId})"
    )
    Map<Long, Order> selectMapByOrderIds(@Param("orderId") List<Long> orderIds);

    @Insert(" insert into "
        + TABLE
        + " set "
        + " id = #{id},"
        + " user_id = #{userId},"
        + " route_id = #{routeId},"
        + " send_address = #{sendAddress},"
        + " take_address = #{takeAddress},"
        + " send_name = #{sendName},"
        + " take_name = #{takeName},"
        + " send_phone = #{sendPhone},"
        + " take_phone = #{takePhone},"
        + " goods_name = #{goodsName},"
        + " goods_weight = #{goodsWeight}"
    )
    int addOrder(Order order);

    @Update( " update "
        + TABLE
        + " set "
        + " is_finish = #{isFinish} "
        + " where "
        + " id = #{orderId}")
    int updateFinish(@Param("isFinish") boolean isFinish,
                     @Param("orderId") long orderId);

    @Update( " update "
        + TABLE
        + " set "
        + " is_com = true, "
        + " score = #{score},"
        + " comment = #{comment}"
        + " where "
        + "id = #{orderId}")
    int updateComment(@Param("score") int score,
                      @Param("comment") String comment,
                      @Param("orderId") long orderId);

}
