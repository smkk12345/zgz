package com.common.consts;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

public class Contanst {

    public static int PAGE_SIZE = 15;//每页显示的数量

    public static boolean TEM_STOP = false;//系统暂时锁

    public static String AGREENMENT_TYPE_AZ = "BJFC-PG-LJY-ZZ?B-ZZAZ-";//BJFC-PG-LJY-ZZ1B-ZZAZ-2016-001
    public static String AGREENMENT_TYPE_HB = "BJFC-PG-LJY-ZZ?B-ZZHB-";//BJFC-PG-ZGZ-ZZ1B-ZZHB-2016-001

    public static Integer JFRQ = 10;

    public static HashMap<String,String> sectionMap = new HashMap<String, String>(){{
        put("8", "第八标段");
        put("9", "第九标段");
        put("10", "第十标段");

    }};

    //档案照片分类
    public static List<String[]> archivePhotoCategory = new ArrayList<String[]>(){{
        add(new String[]{"1","入户调查档案"});
        add(new String[]{"2","被征收人证件"});
        add(new String[]{"3","房屋相关证件"});
        add(new String[]{"4","评估档案资料"});
        add(new String[]{"5","测绘档案资料"});
        add(new String[]{"6","补偿协议档案"});
        add(new String[]{"7","选房档案资料"});
        add(new String[]{"8","其他档案资料"});
    }
    };
    
    //**缓存签约情况id
    public static HashSet<String> houseBasicidSet = new HashSet<String>();
    
    //换成IO操作时间 3秒内点击无效
    public static long lasttime = 0;
    
    
    public static HashMap<String,String> export_TitleMap = new HashMap<String, String>(){{
        put("all", "所有标段全信息表");
        put("people", "所有标段人口信息表");
        put("area", "所有标段面积信息表");
    }};
    
    public static HashMap<String,List<HashMap<String,String>>> export_Param_All = new HashMap<String, List<HashMap<String,String>>>(){{
    	put("all1", new ArrayList<HashMap<String,String>>(){{
    		add(new HashMap<String, String>(){{
    			 put("title", "一、基本情况");
    			 put("length", "20");
    		}});
    		add(new HashMap<String, String>(){{
    			 put("title", "二、认定面积信息");
    			 put("length", "6");
    		}});
    		add(new HashMap<String, String>(){{
    			 put("title","三、认定人口信息" );
    			 put("length", "3");
    		}});
    		add(new HashMap<String, String>(){{
    			put("title","四、宅基地腾退补偿款" );
    			put("length", "9");
    		}});
       		add(new HashMap<String, String>(){{
	       		put("title", "五、奖励费、补助费");
	       		put("length", "19");
	   		}});
	   		add(new HashMap<String, String>(){{
	   			put("title", "六、初步选房意向");
	   			put("length", "15");
	   		}});
	   		add(new HashMap<String, String>(){{
		   		put("title", "七、其他");
		   		put("length", "1");
	   		}});
	   		add(new HashMap<String, String>(){{
		   		put("title","八、评估款、补偿款");
		   		put("length", "2");
	   		}});    		
    	}});
    }};
    
    
    public static int yjszs = 238;
    public static int ljs70zs = 216;
    public static int ljs75zs = 140;
    public static int ljs80zs = 110;
    public static int ljs85zs = 292;
    public static int sjszs = 192;
    
}
