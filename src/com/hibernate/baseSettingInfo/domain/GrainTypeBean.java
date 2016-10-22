package com.hibernate.baseSettingInfo.domain;

import java.util.Date;
import com.hibernate.base.BaseBean;

//粮食类别信息
public class GrainTypeBean  extends BaseBean implements java.io.Serializable {

    public GrainTypeBean(){};
    
    private String id;
    //类型  
    private String grainType;
    //备注
    private String remarks;
    //系统默认的粮食品种不能删 不能改
    private String defaultGrain;
    /*--通风参数 --*/
    //目标水份
    private Double targetWet;
    private Double defaultTargetWet;
    //安全水份
    private Double safeWet;
    private Double defaultSafeWet;
    
    
    public Double getTargetWet() {
        return targetWet;
    }
    public void setTargetWet(Double targetWet) {
        this.targetWet = targetWet;
    }
    public Double getDefaultTargetWet() {
        return defaultTargetWet;
    }
    public void setDefaultTargetWet(Double defaultTargetWet) {
        this.defaultTargetWet = defaultTargetWet;
    }
    public Double getSafeWet() {
        return safeWet;
    }
    public void setSafeWet(Double safeWet) {
        this.safeWet = safeWet;
    }
    public Double getDefaultSafeWet() {
        return defaultSafeWet;
    }
    public void setDefaultSafeWet(Double defaultSafeWet) {
        this.defaultSafeWet = defaultSafeWet;
    }
    public String getDefaultGrain() {
        return defaultGrain;
    }
    public void setDefaultGrain(String defaultGrain) {
        this.defaultGrain = defaultGrain;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getGrainType() {
        return grainType;
    }
    public void setGrainType(String grainType) {
        this.grainType = grainType;
    }
    public String getRemarks() {
        return remarks;
    }
    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    
}
