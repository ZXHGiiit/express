package com.express.admin.dao;

import com.express.admin.domain.Admin;
import com.sun.tracing.dtrace.ProviderAttributes;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.UpdateProvider;

import java.util.List;

public interface AdminDao {
    public static final String TABLE = "admin";
    public static final String COLL_ALL = "id, account, password, name, is_delete, is_super, update_time, create_time";

    @Select(" select "
        + COLL_ALL
        + " from "
        + TABLE
        + " where "
        + " account = #{account} "
        + " and "
        + " password = #{password}"
        + " and "
        + " is_delete = false")
    Admin selectByUAP(@Param("account") String account, @Param("password") String password);

    @Select(" select "
        + COLL_ALL
        + " from "
        + TABLE
        + " where is_super = false"
    )
    List<Admin> selectAllAdmin();

    @Update(" update "
        + TABLE
        + " set is_delete = true"
        + " where "
        + "id = #{id}")
    int delete(@Param("id") long id);

    @Update(" update "
            + TABLE
            + " set is_delete = false"
            + " where "
            + " id = #{id}")
    int updateDelete(@Param("id") long id);

    @Update(" update "
        + TABLE
        + " set password = #{password} "
        + " where "
        + " id = #{id}")
    int updatePwd(@Param("id") long id, @Param("password") String password);

    @Insert(" insert into "
        + TABLE
        + " set "
        + " account = #{account},"
        + " name = #{name},"
        + " password = #{password}")
    int create(Admin admin);
}
