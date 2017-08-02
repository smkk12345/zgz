package com.hibernate.houseinfo.service;

import java.util.HashMap;
import java.util.Map;

import com.common.consts.Contanst;
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
	
	
	public Agreement getByHouseBasicId(String id) {
		return agreenmentDao.getByHouseBasicId(id);
	}
	/**
	 * 已经签约的
	 * @return
	 */
	private Agreement getLeftHouse(){
		return agreenmentDao.getLeftHouse();
	}
	
	
	public Map<String,Integer> validateHouseOperte(Agreement agreenment){
		Agreement qyHouse =  agreenmentDao.getLeftHouse();
		Map<String,Integer> map = new HashMap<String,Integer>();
		
		if(Contanst.yjszs-qyHouse.getYjs()<agreenment.getYjs()){
			map.put("jys", Contanst.yjszs-qyHouse.getYjs()-agreenment.getYjs());
		}
		
		if(Contanst.ljs70zs-qyHouse.getLjs70()<agreenment.getLjs70()){
			map.put("jys", Contanst.ljs70zs-qyHouse.getLjs70()-agreenment.getLjs70());
		}
		
		if(Contanst.ljs75zs-qyHouse.getLjs75()<agreenment.getLjs75()){
			map.put("jys", Contanst.ljs75zs-qyHouse.getLjs75()-agreenment.getLjs75());
		}
		
		if(Contanst.ljs80zs-qyHouse.getLjs80()<agreenment.getLjs80()){
			map.put("jys", Contanst.ljs80zs-qyHouse.getLjs80()-agreenment.getLjs80());
		}
		
		if(Contanst.ljs85zs-qyHouse.getLjs85()<agreenment.getLjs85()){
			map.put("jys", Contanst.ljs85zs-qyHouse.getLjs85()-agreenment.getLjs85());
		}
		
		if(Contanst.sjszs-qyHouse.getSjs()<agreenment.getSjs()){
			map.put("sjs", Contanst.sjszs-qyHouse.getSjs()-agreenment.getSjs());
		}
		return map;
	}
	
	
}
