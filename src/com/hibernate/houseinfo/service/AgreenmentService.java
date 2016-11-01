package com.hibernate.houseinfo.service;

import com.common.utils.StringUtils;
import com.hibernate.houseinfo.dao.AgreenmentDao;
import com.hibernate.houseinfo.domain.Agreement;

public class AgreenmentService {
	
	
	private AgreenmentDao agreenmentDao;

	public void setAgreenmentDao(AgreenmentDao agreenmentDao) {
		this.agreenmentDao = agreenmentDao;
	}
	
	/**
	 * 保存
	 * @param agreenment
	 * @return
	 */
	public Agreement save(Agreement agreenment){
		if(StringUtils.isBlank(agreenment.getId())){
			return agreenmentDao.save(agreenment);
		}
		else{
			agreenmentDao.update(agreenment);
			return agreenment;
		}
	}
	
	/**
	 * 编辑  
	 */
	public void update(Agreement agreenment){
		agreenmentDao.update(agreenment);
	}
	
	/**
	 * 删除
	 */
	public boolean delete(String id){
		agreenmentDao.delete(id);
		return true;
	}
	/**
	 * 通过id获取
	 */
	public Agreement getById(String id){
		return agreenmentDao.getById(id);
	}
	
}
