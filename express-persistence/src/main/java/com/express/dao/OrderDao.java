package com.express.dao;

import com.express.domain.Order;
import com.express.support.MybatisExtendedLanguageDriver;
import com.sun.tracing.dtrace.ProviderAttributes;

import org.apache.ibatis.annotations.Lang;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface OrderDao {
    public static final String TABLE = "orders";
    public static final String COLL_ALL = "auto_id, id, user_id, route_id, send_address, take_address, send_name, take_name, send_phone, take_phone, goods_name, goods_weight, is_finish, start_time, end_time, create_time, update_time";//待定

    @Select(" select "
        + COLL_ALL
        + " from "
        + TABLE
    )
    List<Order> selectAllByUserId(@Param("userId") long userId);

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



}
