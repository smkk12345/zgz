package com.hibernate.barnInfo.service;

import java.util.List;
import com.hibernate.barnInfo.domain.AoJianBean;
import com.hibernate.base.IBaseService;

public interface IAoJianService extends IBaseService<AoJianBean> {

    public void clearSensorArrangementInfo(String sensorArrangementId);
    
    public AoJianBean getByBaseId(String id);
    
    public List<AoJianBean> getAoJianByArrangementId(String arrangeId);
    /**
    * @名称: findValidateAoJianList 
    * @日期：2015-10-12 下午1:44:54
    * @作者： lxb
    * @描述: 获取合法的廒间列表，合法标志------grainStatus是1 --sensorArrangementbeanId不能为空
    * @参数 @return    
    * @返回值 List<AoJianBean>    
    * @异常
     */
    public List<AoJianBean> findValidateAoJianList();
    /**
    * @名称: getAoJianListByBarnId 
    * @日期：2015-10-13 下午12:15:37
    * @作者： lxb
    * @描述: 通过仓房id获取廒间列表
    * @参数 @param barnId
    * @参数 @return    
    * @返回值 List<AoJianBean>    
    * @异常
     */
   // public List<AoJianBean> getAoJianListByBarnId(String barnId);
}
