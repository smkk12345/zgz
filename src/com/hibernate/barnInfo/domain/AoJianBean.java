package com.hibernate.barnInfo.domain;

import java.util.Date;
import java.util.Set;

import com.hibernate.sernsorInfo.domain.SensorArrangementBean;
import com.hibernate.userInfo.damain.User;


public class AoJianBean {
	
	public AoJianBean(){};
	
	private String id;
	private String barnId;
	
	private String zyAoJianNum;
	//廒间编号
	private String aoJianIndex;	
	private Double length;
	private Double width;
	private Double height;
	//容量
	private Double capacity;
	//布置Id
	private String sensorArrangementbeanId;
	//分机粮情编号
	private String fjGrainIndex;
	//粮食信息对象  //通过外键关联
	private AoJianGrainInfoBean aoJianGrainInfoBean;
	//cktx    bddb
	private String dataSourceType;
	
	private String remark;
	//当前厫间粮食信息状态
	/*0----空仓----1-----正常储量-----2-----正在通风*/
	private String grainStatus;
	
	public String getGrainStatus() {
		return grainStatus;
	}
	public void setGrainStatus(String grainStatus) {
		this.grainStatus = grainStatus;
	}

	/*------通风廒间参数--------*/
	//通风模式
	private String ventilationMode;
	//开孔率
	private String openRatio;
	//途径比
	private String wayThan;
	//风网阻力
	private String ventResistance;
	//备注
	private String ventRemark;
	/*-------通风廒间参数---------*/
	//数据库表名称
	private String dbName;
	//风道1
	private String fd1;
	//风道2
	private String fd2;
	//风道分机类型
	private String fdfjsz;
	//仓温仓湿探点编号
	private String barnTemHumNumStr;
	//数据调整值
	private Integer adjustTemNum;
	//湿度
	private Integer adjustHumNum;
	//水份
	private Integer adjustWetNum;

	public Integer getAdjustTemNum() {
		return adjustTemNum;
	}
	public void setAdjustTemNum(Integer adjustTemNum) {
		this.adjustTemNum = adjustTemNum;
	}
	public Integer getAdjustHumNum() {
		return adjustHumNum;
	}
	public void setAdjustHumNum(Integer adjustHumNum) {
		this.adjustHumNum = adjustHumNum;
	}
	public Integer getAdjustWetNum() {
		return adjustWetNum;
	}
	public void setAdjustWetNum(Integer adjustWetNum) {
		this.adjustWetNum = adjustWetNum;
	}
	public String getBarnTemHumNumStr() {
		return barnTemHumNumStr;
	}
	public void setBarnTemHumNumStr(String barnTemHumNumStr) {
		this.barnTemHumNumStr = barnTemHumNumStr;
	}
	public String getFdfjsz() {
		return fdfjsz;
	}
	public void setFdfjsz(String fdfjsz) {
		this.fdfjsz = fdfjsz;
	}
	public String getFd1() {
		return fd1;
	}
	public void setFd1(String fd1) {
		this.fd1 = fd1;
	}
	public String getFd2() {
		return fd2;
	}
	public void setFd2(String fd2) {
		this.fd2 = fd2;
	}
	public String getDataSourceType() {
		return dataSourceType;
	}
	public void setDataSourceType(String dataSourceType) {
		this.dataSourceType = dataSourceType;
	}
	public String getDbName() {
		return dbName;
	}
	public void setDbName(String dbName) {
		this.dbName = dbName;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getVentilationMode() {
		return ventilationMode;
	}
	public void setVentilationMode(String ventilationMode) {
		this.ventilationMode = ventilationMode;
	}
	public String getOpenRatio() {
		return openRatio;
	}
	public void setOpenRatio(String openRatio) {
		this.openRatio = openRatio;
	}
	public String getWayThan() {
		return wayThan;
	}
	public void setWayThan(String wayThan) {
		this.wayThan = wayThan;
	}
	public String getVentResistance() {
		return ventResistance;
	}
	public void setVentResistance(String ventResistance) {
		this.ventResistance = ventResistance;
	}
	public String getVentRemark() {
		return ventRemark;
	}
	public void setVentRemark(String ventRemark) {
		this.ventRemark = ventRemark;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBarnId() {
		return barnId;
	}
	public void setBarnId(String barnId) {
		this.barnId = barnId;
	}
	public String getZyAoJianNum() {
		return zyAoJianNum;
	}
	public void setZyAoJianNum(String zyAoJianNum) {
		this.zyAoJianNum = zyAoJianNum;
	}
	public String getAoJianIndex() {
		return aoJianIndex;
	}
	public void setAoJianIndex(String aoJianIndex) {
		this.aoJianIndex = aoJianIndex;
	}
	public Double getLength() {
		return length;
	}
	public void setLength(Double length) {
		this.length = length;
	}
	public Double getWidth() {
		return width;
	}
	public void setWidth(Double width) {
		this.width = width;
	}
	public Double getHeight() {
		return height;
	}
	public void setHeight(Double height) {
		this.height = height;
	}
	public Double getCapacity() {
		return capacity;
	}
	public void setCapacity(Double capacity) {
		this.capacity = capacity;
	}
	public String getSensorArrangementbeanId() {
		return sensorArrangementbeanId;
	}
	public void setSensorArrangementbeanId(String sensorArrangementbeanId) {
		this.sensorArrangementbeanId = sensorArrangementbeanId;
	}
	public String getFjGrainIndex() {
		return fjGrainIndex;
	}
	public void setFjGrainIndex(String fjGrainIndex) {
		this.fjGrainIndex = fjGrainIndex;
	}
	public AoJianGrainInfoBean getAoJianGrainInfoBean() {
		return aoJianGrainInfoBean;
	}
	public void setAoJianGrainInfoBean(AoJianGrainInfoBean aoJianGrainInfoBean) {
		this.aoJianGrainInfoBean = aoJianGrainInfoBean;
	}
	

}
