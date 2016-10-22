package com.hibernate.houseinfo.domain;

import com.hibernate.base.BaseBean;
/**
 * 其他信息
 * @author yulei
 *
 */
public class OtherInfo extends BaseBean {
	
	//
	private String housebasicid;
	//姓名
	private String name;
	private String otype;
	//户籍序号
	private String peopleid;
	//证书号  是低保  就是低保证号  残疾就是残疾证号
	private String certificatenum;
	//残疾证 审核有效期
	private String validatedate;
	//25种大病
	private String illnessname;
	//大病证明
	private String illnessprove;
	
}
