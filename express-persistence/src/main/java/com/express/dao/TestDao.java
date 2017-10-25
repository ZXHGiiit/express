package com.express.dao;

import org.apache.ibatis.annotations.Select;

public interface TestDao {
    public static final String TABLE = "user";
    public static final String COLL_ALL = "id, account, password, name, phone, email, age, is_vip";

    @Select(" select "
        + "count(id)"
        + " from "
        + TABLE)
    int selectCount();


}
