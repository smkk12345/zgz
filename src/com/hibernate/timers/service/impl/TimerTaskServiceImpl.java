package com.hibernate.timers.service.impl;

import java.util.List;

import com.hibernate.timers.dao.impl.TimerDaoImpl;
import com.hibernate.timers.domain.TimerTaskBean;
import com.hibernate.timers.service.ITimerService;
import com.hibernate.timers.utils.TimerTaskUtil;

public class TimerTaskServiceImpl implements ITimerService {

	private TimerDaoImpl dao;
	
	public void setDao(TimerDaoImpl dao) {
		this.dao = dao;
	}

	@Override
	public TimerTaskBean save(TimerTaskBean entity) {
		entity = dao.save(entity);
		TimerTaskUtil.loadTimerTasks();
		return entity;
	}

	@Override
	public void update(TimerTaskBean entity) {
		// TODO Auto-generated method stub
		dao.update(entity);
		TimerTaskUtil.loadTimerTasks();
	}

	@Override
	public void delete(String id) {
		dao.delete(id);
		TimerTaskUtil.loadTimerTasks();
	}

	@Override
	public void deleteList(List<TimerTaskBean> beans) {
	}

	@Override
	public TimerTaskBean getById(String id) {
		return dao.getById(id);
	}

	@Override
	public List<TimerTaskBean> findAll() {
		return dao.findAll();
	}

}
