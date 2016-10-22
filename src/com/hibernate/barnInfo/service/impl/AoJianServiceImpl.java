package com.hibernate.barnInfo.service.impl;

import java.util.List;

import com.common.utils.GenerateSequenceUtil;
import com.hibernate.barnInfo.dao.impl.AoJianDaoImpl;
import com.hibernate.barnInfo.domain.AoJianBean;
import com.hibernate.barnInfo.service.IAoJianService;

public class AoJianServiceImpl implements IAoJianService {

    private AoJianDaoImpl dao;
    
    public void setDao(AoJianDaoImpl dao) {
        this.dao = dao;
    }

    @Override
    public AoJianBean save(AoJianBean entity) {
        entity.setZyAoJianNum(GenerateSequenceUtil.generateSequenceNo());
        return dao.save(entity);
    }

    @Override
    public void update(AoJianBean entity) {
        dao.update(entity);
    }

    @Override
    public void delete(String id) {
        dao.delete(id);
    }

    @Override
    public void deleteList(List<AoJianBean> beans) {
        //
    }

    @Override
    public AoJianBean getById(String id) {
        return dao.getById(id);
    }

    @Override
    public List<AoJianBean> findAll() {
        return dao.findAll();
    }

    @Override
    public void clearSensorArrangementInfo(String sensorArrangementId) {
        // TODO Auto-generated method stub
        dao.clearSensorArrangementInfo(sensorArrangementId);
    }

    @Override
    public AoJianBean getByBaseId(String id) {
        // TODO Auto-generated method stub
        return dao.getByBaseId(id);
    }

    
    public List<AoJianBean> getAoJianByArrangementId(String arrangeId) {
        // TODO Auto-generated method stub
        return dao.getAoJianByArrangementId(arrangeId);
    }

	@Override
	public List<AoJianBean> findValidateAoJianList() {
		// TODO Auto-generated method stub
		return dao.findValidateAoJianList();
	}

}
