package com.ventilate.factory.iVentilate;

import com.hibernate.barnInfo.domain.AoJianBean;
import com.hibernate.ventilate.domain.VentModeInstanceBean;

public interface Ventilate {
	/**
	 * 通风----通风条件判别----执行通风----暂停通风---停止通风
	 */
	//是否正在通风
	public boolean getInVentilate();
	
	public boolean setInVentilate(boolean inVentilate);
	
	//廒间Id
	public void setAoJianId(String aoJianId);
	
	public AoJianBean getAoJian();
	
	public VentModeInstanceBean getVentInstanceBean();
	public void setVentInstanceBean(VentModeInstanceBean ventInstanceBean);
	/*
	 * 是否适合通风
	 */
	public boolean fitVentilate();
	/**
	 * 执行通风
	* @名称: execute 
	* @日期：2015-12-7 下午2:54:39
	* @作者： lxb
	* @描述: TODO 
	* @参数     
	* @返回值 void    
	* @异常
	 */
	public void execute();
	public void pause();
	public void stopVentilate();
}
