package com.hibernate.base;

import java.sql.Types;

import org.hibernate.Hibernate;
import org.hibernate.dialect.MySQL5Dialect;

public class ZJCMySQLDialect extends MySQL5Dialect {
	
	/**
	 * 数据库类型个java类型对应
	 */
	public ZJCMySQLDialect() {
		super();
		registerHibernateType(Types.DECIMAL, Hibernate.BIG_DECIMAL.getName());
		registerHibernateType(-1,Hibernate.STRING.getName());
	}
}
