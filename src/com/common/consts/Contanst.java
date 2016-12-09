package com.common.consts;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Contanst {

    public static int PAGE_SIZE = 15;//每页显示的数量

    public static boolean TEM_STOP = false;//系统暂时锁

    public static String AGREENMENT_TYPE_AZ = "BJFC-PG-ZGZ-ZZ?B-ZZAZ-";//BJFC-PG-ZGZ-ZZ1B-ZZAZ-2016-001
    public static String AGREENMENT_TYPE_HB = "BJFC-PG-ZGZ-ZZ?B-ZZHB-";//BJFC-PG-ZGZ-ZZ1B-ZZHB-2016-001

    public static Integer JFRQ = 10;

    public static HashMap<String,String> sectionMap = new HashMap<String, String>(){{
        put("1", "第一标段");
        put("2", "第二标段");
        put("3", "第三标段");
        put("4", "第四标段");
        put("5", "第五标段");
        put("6", "第六标段");
        put("7", "第七标段");
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
}
