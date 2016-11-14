package com.hibernate.houseinfo.domain;

import com.hibernate.base.BaseBean;

/**
 * 被腾退房屋本址在册户籍家庭人口情况和非本址人员情况
 * @author yulei
 */
public class VacatePeople extends BaseBean {
	
	private String housebasicid;
	//类型 
	private String vtype; //0 腾退 1非本地址
	//是否户主
	private String householder; //0 是户主 1 不是户主
	//户籍性质
	private String householdtype; // 0农村  1 城市
	//姓名
	private String name;
	//身份证号
	private String idcard;
	//性别
	private String sex;
	//年龄
	private Integer age;
	//户关  与户主关系
	private String registeredrelate;
	//外籍地址
	private String address;
	//产关  与产权人的关系
	private String changrelate;
	//婚否  0 未婚  1 已婚
	private String hasmarry; //0 已婚 1 未婚
	//工作单位
	private String unit;
	//人口类别    0 婚姻衍生人员 1 配偶 2 新生婴儿 3 现役军人  4院校在校生 5 服役人员 6 其他
	private String peopletype;
	
	//数据导入用到的字段
	private String names;  //户主名称
	//房屋坐落
	private String location;
	
	
	public String getNames() {
		return names;
	}
	public String getLocation() {
		return location;
	}
	public void setNames(String names) {
		this.names = names;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getHousebasicid() {
		return housebasicid;
	}
	public void setHousebasicid(String housebasicid) {
		this.housebasicid = housebasicid;
	}
	public String getVtype() {
		return vtype;
	}
	public void setVtype(String vtype) {
		this.vtype = vtype;
	}
	public String getHouseholder() {
		return householder;
	}
	public void setHouseholder(String householder) {
		this.householder = householder;
	}
	public String getHouseholdtype() {
		return householdtype;
	}
	public void setHouseholdtype(String householdtype) {
		this.householdtype = householdtype;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getRegisteredrelate() {
		return registeredrelate;
	}
	public void setRegisteredrelate(String registeredrelate) {
		this.registeredrelate = registeredrelate;
	}
	public String getChangrelate() {
		return changrelate;
	}
	public void setChangrelate(String changrelate) {
		this.changrelate = changrelate;
	}
	public String getHasmarry() {
		return hasmarry;
	}
	public void setHasmarry(String hasmarry) {
		this.hasmarry = hasmarry;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getPeopletype() {
		return peopletype;
	}
	public void setPeopletype(String peopletype) {
		this.peopletype = peopletype;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress() {
		return address;
	}
	
}
