package com.ventilate.factory.ventilateImpl;

import com.common.consts.WebConstConfig;
import com.hibernate.barnInfo.domain.AoJianBean;
import com.hibernate.ventilate.domain.VentModeBean;
import com.hibernate.ventilate.domain.VentModeInstanceBean;
import com.spring.ServiceManager;

//降温通风
public class CoolingVentilate extends BaseVentilate{
	
	
	public boolean isFitVentilate(){
		return false;
	}
	/**
	* @名称: initCurVentilateInstance 
	* @日期：2015-12-11 下午3:47:07
	* @作者： lxb
	* @描述: 初始化当前通风bean对象，通过廒间Id从数据库中获取status = start 或者status = pause的通风对象--
	* @描述： 如果获取到的为空，则new一个对象，不保存，当用户点击启动通风的时候保存
	* @描述： 或者当前通风为自动通风模式时再判断保存
	* @返回值 void    
	* @异常
	 */
	public void initCurVentilateInstance(){
		VentModeInstanceBean ventBean = ServiceManager.getVentModeInstanceServiceImpl().getCurVentByAoJianIdAndStatus(getAoJian().getZyAoJianNum(), "start#pause", WebConstConfig.jwtf);
		if(null == ventBean){
			VentModeBean modeBean = ServiceManager.getVentModeServiceImpl().getVentModeByType(WebConstConfig.jwtf);
			ventBean = modeBean.cloneInstance();
		}
		setVentInstanceBean(ventBean);
	}
	
}
