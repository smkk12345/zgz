package com.hibernate.userInfo.damain;

import com.hibernate.base.BaseBean;

public class RoleBean extends BaseBean implements java.io.Serializable {

	// Fields    
	private String id;
	
	private String roleName;//角色名称
	
	private String roleAuthority;//角色权限
	
	private String remarks;//备注

	private String defaultRole;//默认 1  0
	
	private String builtInRole;//内置的超级管理员
	public String getBuiltInRole() {
		return builtInRole;
	}

	public void setBuiltInRole(String builtInRole) {
		this.builtInRole = builtInRole;
	}

	public String getDefaultRole() {
		return defaultRole;
	}

	public void setDefaultRole(String defaultRole) {
		this.defaultRole = defaultRole;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleAuthority() {
		return roleAuthority;
	}

	public void setRoleAuthority(String roleAuthority) {
		this.roleAuthority = roleAuthority;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

}