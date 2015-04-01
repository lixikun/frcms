package com.flyrui.dao.common;

import java.sql.Connection;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;

public class BaseDAO extends SqlSessionTemplate
{
    public BaseDAO(SqlSessionFactory sqlSessionFactory){
        super(sqlSessionFactory);
    }
    
}
