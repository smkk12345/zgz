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
	//户关  与户主关系
	private String registeredrelate;
	//产关  与产权人的关系
	private String changrelate;
	//婚否  0 未婚  1 已婚
	private String hasmarry; //0 已婚 1 未婚
	//工作单位
	private String unit;
	//人口类别    0 婚姻衍生人员 1 配偶 2 新生婴儿 3 现役军人  4院校在校生 5 服役人员 6 其他
	private String peopletype;
	
}
