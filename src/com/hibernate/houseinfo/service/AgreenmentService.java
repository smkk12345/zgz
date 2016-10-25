package com.hibernate.houseinfo.service;

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
		return agreenmentDao.save(agreenment);
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
