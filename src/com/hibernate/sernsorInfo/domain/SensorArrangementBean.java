package com.hibernate.sernsorInfo.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import com.hibernate.base.BaseBean;

public class SensorArrangementBean extends BaseBean implements Serializable {

	public SensorArrangementBean() {
		
	}
	private String id;
	
	private SensorBean sensor;
	/**
	 * 布置简称  如  A传感器隔五布置。。。
	 */
	private String arrangementName;
	
	/**
	 * 粮堆，仓内，仓外
	 */
	private String positionInfo;
	
	private String startPointDirection;
	/**
	 * x,y,y    20,30,40
	 */
	private String startPointPosition;
	//列
	private int columnCount;
	
	private int rowCount;
	
	private int layerCount;
	//缆线方向
	private String cableDirection;
	
	private String pointDirection;
	//距离粮面高度
	private BigDecimal distanceGrainHeight;
	//距离地面高度
	private BigDecimal distanceGroundHeight;
	//距离墙
	private BigDecimal wallDistance;
	//系统默认     0 默认  1自动以
	private String defaultType;
	
	//模板id
	private String templateId;
	//其实缆线位置--东南---西南---西北 ---东北
	private String startCablePos;
	//------点配置模板的路径------
	private String temPath;
	//------缆线个数 ------
	private BigDecimal proCount;
	
	
	public BigDecimal getProCount() {
		return proCount;
	}

	public void setProCount(BigDecimal proCount) {
		this.proCount = proCount;
	}

	public String getTemPath() {
		return temPath;
	}

	public void setTemPath(String temPath) {
		this.temPath = temPath;
	}

	public String getStartCablePos() {
		return startCablePos;
	}

	public void setStartCablePos(String startCablePos) {
		this.startCablePos = startCablePos;
	}

	public String getTemplateId() {
		return templateId;
	}

	public void setTemplateId(String templateId) {
		this.templateId = templateId;
	}

	public String getDefaultType() {
		return defaultType;
	}

	public void setDefaultType(String defaultType) {
		this.defaultType = defaultType;
	}

	public BigDecimal getDistanceGrainHeight() {
		return distanceGrainHeight;
	}

	public void setDistanceGrainHeight(BigDecimal distanceGrainHeight) {
		this.distanceGrainHeight = distanceGrainHeight;
	}

	public BigDecimal getDistanceGroundHeight() {
		return distanceGroundHeight;
	}

	public void setDistanceGroundHeight(BigDecimal distanceGroundHeight) {
		this.distanceGroundHeight = distanceGroundHeight;
	}

	public BigDecimal getWallDistance() {
		return wallDistance;
	}

	public void setWallDistance(BigDecimal wallDistance) {
		this.wallDistance = wallDistance;
	}

	public SensorBean getSensor() {
		return sensor;
	}

	public void setSensor(SensorBean sensor) {
		this.sensor = sensor;
	}

	public String getArrangementName() {
		return arrangementName;
	}

	public void setArrangementName(String arrangementName) {
		this.arrangementName = arrangementName;
	}

	public String getPositionInfo() {
		return positionInfo;
	}

	public void setPositionInfo(String positionInfo) {
		this.positionInfo = positionInfo;
	}

	public String getStartPointDirection() {
		return startPointDirection;
	}

	public void setStartPointDirection(String startPointDirection) {
		this.startPointDirection = startPointDirection;
	}

	public String getStartPointPosition() {
		return startPointPosition;
	}

	public void setStartPointPosition(String startPointPosition) {
		this.startPointPosition = startPointPosition;
	}

	public int getColumnCount() {
		return columnCount;
	}

	public void setColumnCount(int columnCount) {
		this.columnCount = columnCount;
	}

	public int getRowCount() {
		return rowCount;
	}

	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}

	public int getLayerCount() {
		return layerCount;
	}

	public void setLayerCount(int layerCount) {
		this.layerCount = layerCount;
	}

	public String getCableDirection() {
		return cableDirection;
	}

	public void setCableDirection(String cableDirection) {
		this.cableDirection = cableDirection;
	}

	public String getPointDirection() {
		return pointDirection;
	}

	public void setPointDirection(String pointDirection) {
		this.pointDirection = pointDirection;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public SensorArrangementBean clone(SensorArrangementBean result){
		result.setColumnCount(this.getColumnCount());
		result.setDistanceGrainHeight(this.getDistanceGrainHeight());
		result.setDistanceGroundHeight(this.getDistanceGroundHeight());
		result.setLayerCount(this.getLayerCount());
		result.setRowCount(this.getRowCount());
		result.setWallDistance(this.getWallDistance());
		result.setTemplateId(this.getId());
		result.setProCount(this.getProCount());
		return result;
	}
} 
