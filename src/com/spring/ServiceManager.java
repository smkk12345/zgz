package com.spring;

import org.hibernate.SessionFactory;
import com.hibernate.baseSettingInfo.service.impl.AlarmServiceImpl;
import com.hibernate.baseSettingInfo.service.impl.BaseSettingServiceImpl;
import com.hibernate.baseSettingInfo.service.impl.GrainTypeServiceImpl;
import com.hibernate.houseinfo.service.HouseBasicService;
import com.hibernate.houseinfo.service.IndexNumService;
import com.hibernate.timers.service.impl.TimerTaskServiceImpl;
import com.hibernate.userInfo.service.impl.RoleServiceImpl;
import com.hibernate.userInfo.service.impl.UserInfoServiceImpl;

public class ServiceManager {

    private static SessionFactory sessionFactory;

    private static UserInfoServiceImpl userInfoServiceImpl;


    private static TimerTaskServiceImpl timerServiceImpl;


    private static AlarmServiceImpl alarmServiceImpl;

    private static RoleServiceImpl roleServiceImpl;


    private static GrainTypeServiceImpl grainTypeServiceImpl;

    private static BaseSettingServiceImpl baseSettingServiceImpl;

    private static IndexNumService indexNumService;
    
    private static HouseBasicService houseBasicService;
    
    public static Object getServiceBean(String beanName) {

        Object serviceBean = null;
        try {
            serviceBean = SpringBeanFactory.getInstance().getBean(beanName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return serviceBean;
    }

    public static SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            sessionFactory = (SessionFactory) ServiceManager.getServiceBean("sessionFactory");
            return sessionFactory;
        } else {
            return sessionFactory;
        }
    }
    
    public static UserInfoServiceImpl getUserService() {
        if (userInfoServiceImpl == null) {
            userInfoServiceImpl = (UserInfoServiceImpl) ServiceManager.getServiceBean("userServiceImpl");
            return userInfoServiceImpl;
        } else {
            return userInfoServiceImpl;
        }
    }

    public static IndexNumService getIndexNumService() {
        if (indexNumService == null) {
        	indexNumService = (IndexNumService) ServiceManager.getServiceBean("indexNumService");
            return indexNumService;
        } else {
            return indexNumService;
        }
    }

    
     public static HouseBasicService getHouseBasicServce(){
    	 if(null == houseBasicService){
    		 houseBasicService = (HouseBasicService) ServiceManager.getServiceBean("houseBasicService");
    		 return houseBasicService;
    	 }else{
    		 return houseBasicService;
    	 }
     }
    /**
     * 定时器serviceBean
     * 
     * @return
     */
    public static TimerTaskServiceImpl getTimerServiceImpl() {
        if (timerServiceImpl == null) {
            timerServiceImpl = (TimerTaskServiceImpl) ServiceManager.getServiceBean("timerServiceImpl");
            return timerServiceImpl;
        } else {
            return timerServiceImpl;
        }
    }

    /**
     * 告警阈值
     * 
     * @return
     */
    public static AlarmServiceImpl getAlarmServiceImpl() {
        if (alarmServiceImpl == null) {
            alarmServiceImpl = (AlarmServiceImpl) ServiceManager.getServiceBean("alarmServiceImpl");
            return alarmServiceImpl;
        } else {
            return alarmServiceImpl;
        }
    }

    /**
     * 用户组--角色
     * 
     * @return
     */
    public static RoleServiceImpl getRoleServiceImpl() {
        if (roleServiceImpl == null) {
            roleServiceImpl = (RoleServiceImpl) ServiceManager.getServiceBean("roleServiceImpl");
            return roleServiceImpl;
        } else {
            return roleServiceImpl;
        }
    }

    /**
     * 基本信息设置Service
     * 
     * @return
     */
    public static BaseSettingServiceImpl getBaseSettingServiceImpl() {
        if (baseSettingServiceImpl == null) {
            baseSettingServiceImpl = (BaseSettingServiceImpl) ServiceManager.getServiceBean("baseSettingServiceImpl");
            return baseSettingServiceImpl;
        } else {
            return baseSettingServiceImpl;
        }
    }

    /**
     * 粮食类别信息设置Service 
     * @return
     */
    public static GrainTypeServiceImpl getGrainTypeServiceImpl(){
        if(grainTypeServiceImpl == null){
            grainTypeServiceImpl = (GrainTypeServiceImpl)ServiceManager.getServiceBean("grainTypeServiceImpl");
            return grainTypeServiceImpl;
        }
        else{
            return grainTypeServiceImpl;
        }
    }


}
