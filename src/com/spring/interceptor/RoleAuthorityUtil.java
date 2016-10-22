package com.spring.interceptor;

import com.hibernate.userInfo.damain.RoleBean;

public class RoleAuthorityUtil {

//	LQJC("粮情检测",0),
//	LQJC_ZXLQ("最新粮情",1),
//	LQJC_LWYC("粮温预测",2),
//	LQJC_LSCX("历史查询",3),
//	LQJC_LSXX("粮食信息",4),
//	//系统设置
//	XTSZ("系统设置",5),
//	XTSZ_JBXX("基本信息配置",6),
//	XTSZ_CFBZ("仓房布置",7),
//	XTSZ_CSSZ("参数设置",8),
//	XTSZ_CWSBBZ("测温设备布置",9),
//	XTSZ_DSJC("定时检测",10),
//	XTSZ_ZTST("主题色调",11),
//	//用户管理
//	YHGL("用户管理",12),
//	YHGL_TJYH("添加用户",13),
//	YHGL_FPCF("分配仓房",14),
//	YHGL_BJ("编辑删除用户",15);
	
	public static Boolean hasLQJCAuthority(RoleBean role){
		boolean hasAuthority = false;
		if(role.getRoleAuthority().charAt(0)=='2'){
			hasAuthority = true;
		}
		return hasAuthority;
	}
	
	public static Boolean hasLQJC_ZXLQAuthority(RoleBean role){
		boolean hasAuthority = false;
		if(role.getRoleAuthority().charAt(1)=='2'){
			hasAuthority = true;
		}
		return hasAuthority;
	}
	
	public static Boolean hasLQJC_LWYCAuthority(RoleBean role){
		boolean hasAuthority = false;
		if(role.getRoleAuthority().charAt(2)=='2'){
			hasAuthority = true;
		}
		return hasAuthority;
	}
	
	public static Boolean hasLQJC_LSCXAuthority(RoleBean role){
		boolean hasAuthority = false;
		if(role.getRoleAuthority().charAt(3)=='2'){
			hasAuthority = true;
		}
		return hasAuthority;
	}
	
	public static Boolean hasLQJC_LSXXAuthority(RoleBean role){
		boolean hasAuthority = false;
		if(role.getRoleAuthority().charAt(4)=='2'){
			hasAuthority = true;
		}
		return hasAuthority;
	}
	
	public static Boolean hasXTSZAuthority(RoleBean role){
		boolean hasAuthority = false;
		if(role.getRoleAuthority().charAt(5)=='2'){
			hasAuthority = true;
		}
		return hasAuthority;
	}
	
	public static Boolean hasXTSZ_JBXXAuthority(RoleBean role){
		boolean hasAuthority = false;
		if(role.getRoleAuthority().charAt(6)=='2'){
			hasAuthority = true;
		}
		return hasAuthority;
	}
	public static Boolean hasXTSZ_CFBZAuthority(RoleBean role){
		boolean hasAuthority = false;
		if(role.getRoleAuthority().charAt(7)=='2'){
			hasAuthority = true;
		}
		return hasAuthority;
	}
	public static Boolean hasXTSZ_CSSZAuthority(RoleBean role){
		boolean hasAuthority = false;
		if(role.getRoleAuthority().charAt(8)=='2'){
			hasAuthority = true;
		}
		return hasAuthority;
	}
	public static Boolean hasXTSZ_CWSBBZAuthority(RoleBean role){
		boolean hasAuthority = false;
		if(role.getRoleAuthority().charAt(9)=='2'){
			hasAuthority = true;
		}
		return hasAuthority;
	}
	public static Boolean hasXTSZ_DSJCAuthority(RoleBean role){
		boolean hasAuthority = false;
		if(role.getRoleAuthority().charAt(10)=='2'){
			hasAuthority = true;
		}
		return hasAuthority;
	}
	public static Boolean hasXTSZ_ZTSTAuthority(RoleBean role){
		boolean hasAuthority = false;
		if(role.getRoleAuthority().charAt(11)=='2'){
			hasAuthority = true;
		}
		return hasAuthority;
	}
	public static Boolean hasYHGLAuthority(RoleBean role){
		boolean hasAuthority = false;
		if(role.getRoleAuthority().charAt(12)=='2'){
			hasAuthority = true;
		}
		return hasAuthority;
	}
	public static Boolean hasYHGL_TJYHAuthority(RoleBean role){
		boolean hasAuthority = false;
		if(role.getRoleAuthority().charAt(13)=='2'){
			hasAuthority = true;
		}
		return hasAuthority;
	}
	public static Boolean hasYHGL_FPCFAuthority(RoleBean role){
		boolean hasAuthority = false;
		if(role.getRoleAuthority().charAt(14)=='2'){
			hasAuthority = true;
		}
		return hasAuthority;
	}
	public static Boolean hasYHGL_BJAuthority(RoleBean role){
		boolean hasAuthority = false;
		if(role.getRoleAuthority().charAt(15)=='2'){
			hasAuthority = true;
		}
		return hasAuthority;
	}
}
