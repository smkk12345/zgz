package com.spring;

import org.hibernate.SessionFactory;
import com.hibernate.barnInfo.service.impl.AoJianGrainInfoServiceImpl;
import com.hibernate.barnInfo.service.impl.AoJianServiceImpl;
import com.hibernate.barnInfo.service.impl.BarnServiceImpl;
import com.hibernate.baseSettingInfo.service.impl.AlarmServiceImpl;
import com.hibernate.baseSettingInfo.service.impl.BaseSettingServiceImpl;
import com.hibernate.baseSettingInfo.service.impl.GrainTypeServiceImpl;
import com.hibernate.cloudInfo.service.impl.CloudAojianDateServiceImpl;
import com.hibernate.cloudInfo.service.impl.CloudPicServiceImpl;
import com.hibernate.sernsorInfo.service.impl.AlarmDataInfoServiceImpl;
import com.hibernate.sernsorInfo.service.impl.AoJianBlockServiceImpl;
import com.hibernate.sernsorInfo.service.impl.ArrangementDataService;
import com.hibernate.sernsorInfo.service.impl.OperateRecordServiceImpl;
import com.hibernate.sernsorInfo.service.impl.SensorArrangementServiceImpl;
import com.hibernate.sernsorInfo.service.impl.SensorServiceImpl;
import com.hibernate.timers.service.impl.TimerTaskServiceImpl;
import com.hibernate.userInfo.service.impl.RoleServiceImpl;
import com.hibernate.userInfo.service.impl.UserInfoServiceImpl;
import com.hibernate.ventilate.service.impl.FanDeviceServiceImpl;
import com.hibernate.ventilate.service.impl.VentDeviceServiceImpl;
import com.hibernate.ventilate.service.impl.VentModeInstanceServiceImpl;
import com.hibernate.ventilate.service.impl.VentModeServiceImpl;
import com.hibernate.ventilate.service.impl.WindDetectionDeviceServiceImpl;
import com.hibernate.ventilate.service.impl.WindowDeviceServiceImpl;

public class ServiceManager {

    private static SessionFactory sessionFactory;

    private static UserInfoServiceImpl userInfoServiceImpl;

    private static AoJianBlockServiceImpl aoJianBlockServiceImpl;

    private static TimerTaskServiceImpl timerServiceImpl;

    private static SensorServiceImpl sensorServiceImpl;

    private static AlarmServiceImpl alarmServiceImpl;

    private static RoleServiceImpl roleServiceImpl;

    private static BarnServiceImpl barnBeanServiceImpl;

    private static AoJianServiceImpl aoJianServiceImpl;

    private static SensorArrangementServiceImpl sensorArrangementServiceImpl;

    private static AoJianGrainInfoServiceImpl aoJianGrainInfoServiceImpl;

    private static CloudPicServiceImpl cloudPicServiceImpl;
    
    private static CloudAojianDateServiceImpl cloudAojianDateServiceImpl;
    
    private static GrainTypeServiceImpl grainTypeServiceImpl;

    private static BaseSettingServiceImpl baseSettingServiceImpl;

    private static AlarmDataInfoServiceImpl alarmDataInfoServiceImpl;
    
    private static OperateRecordServiceImpl operateRecordServiceImpl;
    
    private static ArrangementDataService arrangementDataServiceImpl;
    //通风的service
    private static FanDeviceServiceImpl fanDeviceServiceImpl;
    
    private static VentDeviceServiceImpl ventDeviceServiceImpl;
    
    private static WindDetectionDeviceServiceImpl windDetectionDeviceServiceImpl;
    
    private static WindowDeviceServiceImpl windowDeviceServiceImpl;
    
    private static VentModeServiceImpl ventModeServiceImpl;
    
    private static VentModeInstanceServiceImpl ventModeInstanceServiceImpl;
    
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

    public static AoJianBlockServiceImpl getAoJianBlockService() {
        if (aoJianBlockServiceImpl == null) {
            aoJianBlockServiceImpl = (AoJianBlockServiceImpl) ServiceManager.getServiceBean("aoJianBlockServiceImpl");
            return aoJianBlockServiceImpl;
        } else {
            return aoJianBlockServiceImpl;
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
     * s 传感器serviceBean
     * 
     * @return
     */
    public static SensorServiceImpl getSensorServiceImpl() {
        if (sensorServiceImpl == null) {
            sensorServiceImpl = (SensorServiceImpl) ServiceManager.getServiceBean("sensorServiceImpl");
            return sensorServiceImpl;
        } else {
            return sensorServiceImpl;
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
     * 仓房service
     * 
     * @return
     */
    public static BarnServiceImpl getBarnServiceImpl() {
        if (barnBeanServiceImpl == null) {
            barnBeanServiceImpl = (BarnServiceImpl) ServiceManager.getServiceBean("barnServiceImpl");
            return barnBeanServiceImpl;
        } else {
            return barnBeanServiceImpl;
        }
    }

    /**
     * 厫间service
     * 
     * @return
     */
    public static AoJianServiceImpl getAoJianServiceImpl() {
        if (aoJianServiceImpl == null) {
            aoJianServiceImpl = (AoJianServiceImpl) ServiceManager.getServiceBean("aoJianServiceImpl");
            return aoJianServiceImpl;
        } else {
            return aoJianServiceImpl;
        }
    }

    /**
     * 检测设备布置service
     * 
     * @return
     */
    public static SensorArrangementServiceImpl getSensorArrangementServiceImpl() {
        if (sensorArrangementServiceImpl == null) {
            sensorArrangementServiceImpl = (SensorArrangementServiceImpl) ServiceManager.getServiceBean("sensorArrangementServiceImpl");
            return sensorArrangementServiceImpl;
        } else {
            return sensorArrangementServiceImpl;
        }
    }

    /**
     * 粮食信息service
     * 
     * @return
     */
    public static AoJianGrainInfoServiceImpl getAoJianGrainInfoServiceImpl() {
        if (aoJianGrainInfoServiceImpl == null) {
            aoJianGrainInfoServiceImpl = (AoJianGrainInfoServiceImpl) ServiceManager.getServiceBean("aoJianGrainInfoServiceImpl");
            return aoJianGrainInfoServiceImpl;
        } else {
            return aoJianGrainInfoServiceImpl;
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


    /**
     * 云图分析
     * 
     * @return
     */
    public static CloudPicServiceImpl getCloudPicServiceImpl() {
        if (cloudPicServiceImpl == null) {
            cloudPicServiceImpl = (CloudPicServiceImpl) ServiceManager.getServiceBean("cloudPicServiceImpl");
            return cloudPicServiceImpl;
        } else {
            return cloudPicServiceImpl;
        }
    }
    public static CloudAojianDateServiceImpl getCloudAojianDateServiceImpl() {
        if (cloudAojianDateServiceImpl == null) {
            cloudAojianDateServiceImpl = (CloudAojianDateServiceImpl) ServiceManager.getServiceBean("cloudAojianDateServiceImpl");
            return cloudAojianDateServiceImpl;
        } else {
            return cloudAojianDateServiceImpl;
        }
    }
    /**
     * 告警
     * @return
     */
    public static AlarmDataInfoServiceImpl getAlarmDataInfoServiceImpl() {
        if (alarmDataInfoServiceImpl == null) {
            alarmDataInfoServiceImpl = (AlarmDataInfoServiceImpl) ServiceManager.getServiceBean("alarmDataInfoServiceImpl");
            return alarmDataInfoServiceImpl;
        } else {
            return alarmDataInfoServiceImpl;
        }
    }
    
    /**
     * 操作查询
     * @return
     */
    public static OperateRecordServiceImpl getOperateRecordServiceImpl() {
        if (operateRecordServiceImpl == null) {
            operateRecordServiceImpl = (OperateRecordServiceImpl) ServiceManager.getServiceBean("operateRecordServiceImpl");
            return operateRecordServiceImpl;
        } else {
            return operateRecordServiceImpl;
        }
    }
    
    /**
     * 风机
     * @return
     */
    public static FanDeviceServiceImpl getFanDeviceServiceImpl() {
        if (fanDeviceServiceImpl == null) {
            fanDeviceServiceImpl = (FanDeviceServiceImpl) ServiceManager.getServiceBean("fanDeviceServiceImpl");
            return fanDeviceServiceImpl;
        } else {
            return fanDeviceServiceImpl;
        }
    }
    
    /**
     * 通风口
     * @return
     */
    public static VentDeviceServiceImpl getVentDeviceServiceImpl() {
        if (ventDeviceServiceImpl == null) {
            ventDeviceServiceImpl = (VentDeviceServiceImpl) ServiceManager.getServiceBean("ventDeviceServiceImpl");
            return ventDeviceServiceImpl;
        } else {
            return ventDeviceServiceImpl;
        }
    }
    
    /**
     * 风力检测
     * @return
     */
    public static WindDetectionDeviceServiceImpl getWindDetectionDeviceServiceImpl() {
        if (windDetectionDeviceServiceImpl == null) {
            windDetectionDeviceServiceImpl = (WindDetectionDeviceServiceImpl) ServiceManager.getServiceBean("windDetectionDeviceServiceImpl");
            return windDetectionDeviceServiceImpl;
        } else {
            return windDetectionDeviceServiceImpl;
        }
    }
    /**
     * 窗户
     * @return
     */
    public static WindowDeviceServiceImpl getWindowDeviceServiceImpl() {
        if (windowDeviceServiceImpl == null) {
            windowDeviceServiceImpl = (WindowDeviceServiceImpl) ServiceManager.getServiceBean("windowDeviceServiceImpl");
            return windowDeviceServiceImpl;
        } else {
            return windowDeviceServiceImpl;
        }
    }
    /**
     * 通风模式
     * @return
     */
    public static VentModeServiceImpl getVentModeServiceImpl() {
        if (ventModeServiceImpl == null) {
            ventModeServiceImpl = (VentModeServiceImpl) ServiceManager.getServiceBean("ventModeServiceImpl");
            return ventModeServiceImpl;
        } else {
            return ventModeServiceImpl;
        }
    }
    
    public static ArrangementDataService getArrangementDataService() {
        if (arrangementDataServiceImpl == null) {
        	arrangementDataServiceImpl = (ArrangementDataService) ServiceManager.getServiceBean("arrangementDataServiceImpl");
            return arrangementDataServiceImpl;
        } else {
            return arrangementDataServiceImpl;
        }
    }
    
    
    public static VentModeInstanceServiceImpl getVentModeInstanceServiceImpl() {
        if (ventModeInstanceServiceImpl == null) {
        	ventModeInstanceServiceImpl = (VentModeInstanceServiceImpl) ServiceManager.getServiceBean("ventModeInstanceServiceImpl");
            return ventModeInstanceServiceImpl;
        } else {
            return ventModeInstanceServiceImpl;
        }
    }
}
