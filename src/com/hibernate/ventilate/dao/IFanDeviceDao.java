/**  

* @Title: IFanDeviceDao.java 

* @Package com.hibernate.ventilate.dao 

* @Description: TODO(用一句话描述该文件做什么) 

* @author lxb  

* @date 2015-9-8 上午11:20:11 

* @version V1.0  

*/ 
package com.hibernate.ventilate.dao;

import java.util.List;
import com.hibernate.base.IBaseDao;
import com.hibernate.ventilate.domain.BaseDevice;
import com.hibernate.ventilate.domain.FanDeviceBean;

/**
 * @author zhiyun3
 *
 */
public interface IFanDeviceDao extends IBaseDao<FanDeviceBean> {
	public List<BaseDevice> getDeviceListByAoJianId(String aoJianId);
}
