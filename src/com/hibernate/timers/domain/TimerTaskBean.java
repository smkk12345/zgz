package com.hibernate.timers.domain;

import java.io.Serializable;
import java.util.Date;
import com.hibernate.base.BaseBean;

public class TimerTaskBean extends BaseBean implements Serializable {

    /**
     * 任务ID
     */
    private String id = null;

    /**
     * 任务名称
     */
    private String taskName = null;

    /**
     * 类名称
     */
    private String className = null;

    /**
     * 方法名
     */
    private String methodName = null;

    /**
     * 定时类型
     */
    private String timerType = null;

    /**
     * 时间
     */
    private String vertime = null;

    /**
     * 启动时间
     */
    private Date startTime = null;

    /**
     * 启动时间
     */
    private Date stopTime = null;

    /**
     * 周期
     */
    private int period = 0;

    /**
     * 单位
     */
    private String units = null;

    /**
     * 状态
     */
    private int status = 0;

    /**
     * 任务描述
     */
    private String taskDesc = null;

    //type
    private String type = "";

    //廒间ids
    private String aoJianIds;

    public String getAoJianIds() {
        return aoJianIds;
    }

    public void setAoJianIds(String aoJianIds) {
        this.aoJianIds = aoJianIds;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTaskDesc() {
        return taskDesc;
    }

    public void setTaskDesc(String taskDesc) {
        this.taskDesc = taskDesc;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getMethodName() {
        return methodName;
    }

    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }

    public String getTimerType() {
        return timerType;
    }

    public void setTimerType(String timerType) {
        this.timerType = timerType;
    }

    public String getVertime() {
        return vertime;
    }

    public void setVertime(String vertime) {
        this.vertime = vertime;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getStopTime() {
        return stopTime;
    }

    public void setStopTime(Date stopTime) {
        this.stopTime = stopTime;
    }

    public int getPeriod() {
        return period;
    }

    public void setPeriod(int period) {
        this.period = period;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public String getUnits() {
        return units;
    }

    public void setUnits(String units) {
        this.units = units;
    }

}
