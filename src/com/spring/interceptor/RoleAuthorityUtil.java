package com.spring.interceptor;

import com.hibernate.userInfo.damain.RoleBean;

public class RoleAuthorityUtil {

//	LQJC("棚改前期管理",0),
//	LQJC_ZXLQ("入户基础信息管理",1),
//	LQJC_LWYC("粮温预测",2),

//	//系统设置
//	XTSZ("签订协议管理",3),
//	XTSZ_JBXX("顺序号获取",4),

//	//用户管理
//	YHGL("用户管理",12),
//	YHGL_TJYH("添加用户",13),
//	YHGL_FPCF("分配仓房",14),
//	YHGL_BJ("编辑删除用户",15);
	
	
	//  222  222  2222  
	
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
