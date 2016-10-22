package com.hibernate.utils;

import org.hibernate.cfg.Configuration;

import org.hibernate.tool.hbm2ddl.SchemaExport;

public class ExportToDB {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Configuration cfg = new Configuration().configure();
		SchemaExport se = new SchemaExport(cfg);
		se.create(true,true);
	}

}
