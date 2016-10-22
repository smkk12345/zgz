package com.spring.interceptor;

public enum OperateRightType {
	
						/*权限情况--0不可见--1可见不可操作*--2可见可操作   16个/   
					/*粮情*/	                    /*基本设置 5~11*/          /*用户管理  12~15*/      /*信息管理*/
	 //         0    1  2   3   4       5   6   7   8   9   10  11      12  13  14  15      16  17  18    
	/*--------------------------------------------------------------------------------------------------------------
	 * 	之云系统	2	2	2	2	2		2	2	2	2	2	2	2		2	2	2	2        2   2   2
		库主任	2	2	2	2	2		2	1	1	2	1	1	2		1	1	1	1        2   2   2
		仓储科长	2	2	2	2	2		2	2	2	2	2	2	2		2	2	2	2        2   2   2   
		库管员	2	2	2	2	2		2	1	1	1	1	1	2		1	1	1	1        1   2   0
		粮情员	2	2	2	2	2		2	2	2	1	2	2	2		1	1	1	1        1   2   0
	-------------------------------------------------------------------------------------------------------------------*/
	//粮情检测
	LQJC("粮情检测",0),
	LQJC_ZXLQ("最新粮情",1),
	LQJC_LWYC("粮温预测",2),
	LQJC_LSCX("历史查询",3),
	LQJC_LSXX("粮食信息",4),
	//后续添加
	LQJC_LQBJ("粮情编辑",19),
	
	//系统设置
	XTSZ("系统设置",5),
	XTSZ_JBXX("基本信息配置",6),
	XTSZ_CFBZ("仓房布置",7),//还没做
	XTSZ_CSSZ("参数设置",8),
	XTSZ_CWSBBZ("测温设备布置",9),
	XTSZ_DSJC("定时检测",10),
	XTSZ_ZTST("主题色调",11),
	//用户管理
	YHGL("用户管理",12),
	YHGL_TJYH("添加用户",13),
	YHGL_FPCF("分配仓房",14),
	YHGL_BJ("编辑删除用户",15),
	//信息管理
	XXGL("信息管理",16),
	XXGL_GJCX("告警查询",17),
	XXGL_CZCX("操作查询",18);
	
	private OperateRightType(String operateName, int operateIndex){
		this.operateName = operateName;
		this.operateIndex = operateIndex;
	}
	private String operateName;
	private int operateIndex;
	
	public String getOperateName() {
		return operateName;
	}

	public void setOperateName(String operateName) {
		this.operateName = operateName;
	}

	public int getOperateIndex() {
		return operateIndex;
	}

	public void setOperateIndex(int operateIndex) {
		this.operateIndex = operateIndex;
	}

}
