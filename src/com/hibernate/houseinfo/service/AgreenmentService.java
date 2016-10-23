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
	
	
}
