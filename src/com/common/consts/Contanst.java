package com.common.consts;

import java.util.HashMap;

public class Contanst {
	
	public static int PAGE_SIZE = 15;//每页显示的数量
	
	public static boolean TEM_STOP = false;//系统暂时锁
	
	public static String AGREENMENT_TYPE_AZ = "BJFC-PG-ZGZ-ZZ?B-ZZAZ-";//BJFC-PG-ZGZ-ZZ1B-ZZAZ-2016-001
	public static String AGREENMENT_TYPE_HB = "BJFC-PG-ZGZ-ZZ?B-ZZHB-";//BJFC-PG-ZGZ-ZZ1B-ZZHB-2016-001
	
//	public static String AGREENMENT_TYPE_HB = "HB";
	
	public static HashMap<String,String> sectionMap = new HashMap<String, String>(){{
		put("1", "第一标段");
		put("2", "第二标段");
		put("3", "第三标段");
		put("4", "第四标段");
		put("5", "第五标段");
		put("6", "第六标段");
		put("7", "第七标段");
	}};
	
}
