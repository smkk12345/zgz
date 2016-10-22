package com.ventilate.factory.ventilateImpl;

import com.common.utils.StringUtils;
import com.hibernate.barnInfo.domain.AoJianBean;
import com.hibernate.ventilate.domain.VentModeInstanceBean;
import com.spring.ServiceManager;
import com.ventilate.factory.iVentilate.Ventilate;

public class BaseVentilate implements Ventilate {
	
	private AoJianBean aoJian = null;
	
	private VentModeInstanceBean ventInstanceBean = null;

	@Override
	public boolean getInVentilate() {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean setInVentilate(boolean inVentilate) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public void setAoJianId(String aoJianId) {
		if(!StringUtils.isEmpty(aoJianId)){
			aoJian = ServiceManager.getAoJianServiceImpl().getById(aoJianId);
			initCurVentilateInstance();
		}
	}
	//子类获取当前通风
	public void initCurVentilateInstance(){
		System.out.println("aaa");
		return ;
	}
	
	@Override
	public boolean fitVentilate() {
		if(null == aoJian){
			return false;
		}else{   //如果为空仓，或者没粮食或者没布置信息  都不通风
			if(null == aoJian.getAoJianGrainInfoBean()
					||StringUtils.isEmpty(aoJian.getSensorArrangementbeanId())
					||aoJian.getGrainStatus().equals("0")){
				return false;
			}
			else{
				return isFitVentilate();//子类覆盖的方法
			}
		}
	}
	//该方法留着子类覆盖完成
	public boolean isFitVentilate(){
		return false;
	}
	
	@Override
	public void execute() {
		// TODO Auto-generated method stub
	}
	@Override
	public void pause() {
		// TODO Auto-generated method stub
	}
	@Override
	public void stopVentilate() {
		// TODO Auto-generated method stub
	}
	@Override
	public AoJianBean getAoJian() {
		return aoJian;
	}
	
	@Override
	public VentModeInstanceBean getVentInstanceBean() {
		// TODO Auto-generated method stub
		return ventInstanceBean;
	}
	@Override
	public void setVentInstanceBean(VentModeInstanceBean ventInstanceBean) {
		// TODO Auto-generated method stub
		this.ventInstanceBean = ventInstanceBean;
	}
}
