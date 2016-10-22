package com.hibernate.barnInfo.service;

import java.util.List;

import com.hibernate.barnInfo.domain.AoJianBean;
import com.hibernate.barnInfo.domain.BarnBean;
import com.hibernate.base.IBaseService;

public interface IBarnService extends IBaseService<BarnBean> {
    public List<AoJianBean> findListByBarn(BarnBean barn);
    public List<BarnBean> findListByBarnIndex(String barnIndex);
    /**
    * @名称: getBarnListWithArrangement 
    * @日期：2015-9-28 下午3:12:27
    * @作者： lxb
    * @描述: 获取有布置信息的仓房，其廒间必须有一个包含布置信息 
    * @参数 @return    
    * @返回值 List<BarnBean>    
    * @异常
     */
    public List<BarnBean> getBarnListWithArrangement();
    /**
    * @名称: fakeDelateBarnById 
    * @日期：2015-10-13 上午10:00:41
    * @作者： lxb
    * @描述: 假删除
    * @参数 @param barnId    
    * @返回值 void    
    * @异常
     */
    public void fakeDelateBarnById(String barnId);
}
