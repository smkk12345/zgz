/**  

* @Title: WindDetectionDevice.java 

* @Package com.hibernate.ventilate.domain 

* @Description: TODO(用一句话描述该文件做什么) 

* @author lxb  

* @date 2015-9-8 上午10:52:28 

* @version V1.0  

*/ 
package com.hibernate.ventilate.domain;

import java.io.Serializable;

/**
 * @author lxb
 *	风力检测
 */
public class WindDetectionDeviceBean extends BaseDevice implements Serializable {

	//
	private static final long serialVersionUID = 3340776927329635233L;
	//设备厂家
	private String deviceFactory;
	//设备厂家编号
	private String deviceNum;
	
	public String getDeviceFactory() {
		return deviceFactory;
	}
	public void setDeviceFactory(String deviceFactory) {
		this.deviceFactory = deviceFactory;
	}
	public String getDeviceNum() {
		return deviceNum;
	}
	public void setDeviceNum(String deviceNum) {
		this.deviceNum = deviceNum;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
