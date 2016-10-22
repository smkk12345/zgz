package com.hibernate.barnInfo.dao;

import java.util.List;
import java.util.Set;

import com.hibernate.barnInfo.domain.AoJianBean;
import com.hibernate.barnInfo.domain.BarnBean;


public interface IAoJianDao {
    /**
     * 通过barnId获取廒间列表
     * @param entity
     * @return
     */
    public List<AoJianBean> findListByBarn(BarnBean barn);
    
    public void updateList(Set<AoJianBean> set);
    
    public void saveList(Set<AoJianBean> set);
    public void clearSensorArrangementInfo(String sensorArrangementId);
    public AoJianBean getByBaseId(String id);
    public List<AoJianBean> getAoJianByArrangementId(String arrangeId);
    public List<AoJianBean> findValidateAoJianList();
}
