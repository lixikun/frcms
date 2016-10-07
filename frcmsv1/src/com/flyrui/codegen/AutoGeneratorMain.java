package com.flyrui.codegen;

import com.flyrui.codegen.generator.AutoGenerator;
import com.flyrui.codegen.generator.ConfigGenerator;
import com.flyrui.codegen.generator.annotations.IdType;

public class AutoGeneratorMain{
    public static void main(String[] args) {
        ConfigGenerator cg = new ConfigGenerator();

        // 配置 MySQL 连接
        cg.setDbDriverName("com.mysql.jdbc.Driver");
        cg.setDbUser("root");
        cg.setDbPassword("zzulixikun");
        cg.setDbUrl("jdbc:mysql://127.0.0.1:3306/fengruidb?characterEncoding=utf8");

        // 配置包名
        /* */
        cg.setEntityPackage("com.flyrui.dao.pojo.salary");
        cg.setMapperPackage("com.flyrui.dao.mapper");
        cg.setServicePackage("com.flyrui.salary.service");
        cg.setXmlPackage("config.mybatis.sqlMap.mysql");
        cg.setServiceImplPackage("com.flyrui.salary.service.impl");
        
        /*cg.setEntityPackage("test");
        cg.setMapperPackage("test");
        cg.setServicePackage("test");
        cg.setXmlPackage("test");
        cg.setServiceImplPackage("test.impl"); */
        
        cg.setTableNames(new String[]{"bus_salary_base","bus_salary_extend"});
        cg.setDbColumnUnderline(true);//设置数据库是否为下划线
        cg.setIdType(IdType.INPUT);//设置ID主键策略

        // 配置保存路径
        cg.setSaveDir("E:\\work\\dev\\git\\frcms\\frcmsv1\\src");

        // 其他参数请根据上面的参数说明自行配置，当所有配置完善后，运行AutoGenerator.run()方法生成Code
        // 生成代码
        try {
			AutoGenerator.run(cg);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
