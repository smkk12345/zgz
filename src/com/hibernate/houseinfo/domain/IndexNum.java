package com.hibernate.houseinfo.domain;

import java.util.Date;

import com.hibernate.base.BaseBean;
import com.hibernate.timers.utils.DateStyle;
import com.hibernate.timers.utils.DateUtil;
/**
 * 生成唯一顺序号的辅助类
 * 通过数据库实现
 * @author yulei
 *
 */
public class IndexNum extends BaseBean {

	private String housebasicid;
	private Long indexnum;
	private Long time;
	private String userid;
	private String operatedate;
	private String serviceip;
	private String displaydate;
	
	public String getDisplaydate() {
		return displaydate;
	}
	public void setDisplaydate(String displaydate) {
		this.displaydate = displaydate;
	}
	public String getHousebasicid() {
		return housebasicid;
	}
	public void setHousebasicid(String housebasicid) {
		this.housebasicid = housebasicid;
	}
	public Long getIndexnum() {
		return indexnum;
	}
	public void setIndexnum(Long indexnum) {
		this.indexnum = indexnum;
	}
	public Long getTime() {
		return time;
	}
	public void setTime(Long time) {
		this.time = time;
		displaydate = DateUtil.DateToString(new Date(time), DateStyle.YYYY_MM_DD_HH_M_SS_SSS);
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getOperatedate() {
		return operatedate;
	}
	public void setOperatedate(String operatedate) {
		this.operatedate = operatedate;
	}
	public String getServiceip() {
		return serviceip;
	}
	public void setServiceip(String serviceip) {
		this.serviceip = serviceip;
	}
}
