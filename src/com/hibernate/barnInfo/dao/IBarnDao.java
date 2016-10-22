package com.hibernate.barnInfo.dao;

import java.util.List;
import java.util.Set;

import com.hibernate.barnInfo.domain.BarnBean;

public interface IBarnDao {
    public Set<BarnBean> getListByUserId(String id);
    public List<BarnBean> findListByBarnIndex(String barnIndex);
    public void fakeDelateBarnById(String barnId);
}
