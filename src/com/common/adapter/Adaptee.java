package com.common.adapter;

import java.util.List;

import com.hibernate.sernsorInfo.domain.AoJianDataBean;
import com.hibernate.sernsorInfo.domain.SensorDataBean;
import com.spring.ServiceManager;

public class Adaptee {
	
	public Adaptee() {
		// TODO Auto-generated constructor stub
	}
	/**
	 * 数据对象适配器
	 * 包括 每次保存一个廒间数据信息
	 */
	//廒间信息  仓温 仓湿
	private AoJianDataBean aoJianData;
	
	/**
	 * saveData 保存一个廒间数据
	 * @param aoJianData
	 */
	public void save(){
		ServiceManager.getAoJianBlockService().save(aoJianData);
	}
	
	public void setAoJianData(AoJianDataBean aoJianData) {
		this.aoJianData = aoJianData;
	}
	
}
