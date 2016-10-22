package com.common.adapter;

import java.net.URL;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import com.common.consts.WebConstConfig;
import com.common.dataSource.ExRemoteDBOperater;
import com.common.dataSource.RemoteDBOperater;
import com.common.dataSource.SerialPortDataOperater;
import com.common.utils.CalendarUtil;
import com.common.utils.FileUtils;
import com.common.utils.MathUtil;
import com.common.utils.OverTimeXmlUtils;
import com.common.utils.StringUtils;
import com.formula.HumThreshold;
import com.hibernate.barnInfo.domain.AoJianBean;
import com.hibernate.barnInfo.domain.AoJianGrainInfoBean;
import com.hibernate.barnInfo.domain.BarnBean;
import com.hibernate.baseSettingInfo.domain.AlarmBean;
import com.hibernate.baseSettingInfo.domain.BaseSettingBean;
import com.hibernate.sernsorInfo.domain.AlarmDataInfoBean;
import com.hibernate.sernsorInfo.domain.AoJianDataBean;
import com.hibernate.sernsorInfo.domain.SensorArrangementBean;
import com.hibernate.sernsorInfo.domain.SensorDataBean;
import com.hibernate.userInfo.damain.User;
import com.spring.ServiceManager;
import com.spring.controller.ControllerUtils;

public class Adapter implements ITargetAdapter {
	private Adaptee adaptee = new Adaptee();
	private AoJianBean aoJian;

	public void setAoJian(AoJianBean aoJian) {
		this.aoJian = aoJian;
	}

	@Override
	public void save() {
		// 分析获取数据
		adaptee.save();
	}

	@Override
	public void save1() {
		// 分析获取数据
		adaptee.setAoJianData(null);
		adaptee.save();
	}

	// 第一个 AoJIanBean Ids 第二个 dateString 第三个 logId
	public void getTestData(String aoJianIds, String dateString, String logId) {
		try {
			String cacheTime = "";
			BaseSettingBean bsBean = ServiceManager.getBaseSettingServiceImpl().findValueByKey("cacheTime");
			if (null == bsBean) {
				cacheTime = "0.1";
			} else {
				cacheTime = bsBean.getValue();
			}
			URL path = Thread.currentThread().getContextClassLoader().getResource("");
			String pathStr = path.getPath();
			String[] pathStrArr = pathStr.split("WEB-INF");
			String timeWriteInPath = pathStrArr[0] + "data\\sys\\" + "RecentNewDataTime.txt";
			String timeStr = new FileUtils().read(timeWriteInPath);
			if (StringUtils.isEmpty(timeStr)) {
				Date curDate = new Date();
				timeStr = CalendarUtil.formatStr(curDate, CalendarUtil.DATE_FORMAT_MODE4);
			}
			Date date = CalendarUtil.formatDate(timeStr, CalendarUtil.DATE_FORMAT_MODE4);
			long timeDifference = new Date().getTime() - date.getTime();
			double cacheTimeLong = Double.parseDouble(cacheTime) * 3600 * 1000;
			if (timeDifference - cacheTimeLong > 60000) {
				return;
			} else {
				try {
					getRemoteData(aoJianIds, dateString, logId);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return;
		}
	}

	private boolean isRealTime(String aoJianId) {
		URL path = Thread.currentThread().getContextClassLoader().getResource("");
		String pathStr = path.getPath();
		String[] pathStrArr = pathStr.split("WEB-INF");
		String timeWriteInPath = pathStrArr[0] + "data/sys/" + "RecentNewDataTime.xml";
		String timeStr = OverTimeXmlUtils.getPointValueFromXml(timeWriteInPath, aoJianId);
		if (StringUtils.isEmpty(timeStr)) {
			Date curDate = new Date();
			timeStr = CalendarUtil.formatStr(curDate, CalendarUtil.DATE_FORMAT_MODE4);
		}
		Date date = new Date();
		try {
			date = CalendarUtil.formatDate(timeStr, CalendarUtil.DATE_FORMAT_MODE4);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String cacheTime = "";
		BaseSettingBean bsBean = ServiceManager.getBaseSettingServiceImpl().findValueByKey("cacheTime");
		if(null == bsBean){
			cacheTime = "0.15";
		}else{
			cacheTime = bsBean.getValue();
		}
		long timeDifference = new Date().getTime() - date.getTime();
		double cacheTimeLong = Double.parseDouble(cacheTime) * 3600 * 1000;
		if (timeDifference - cacheTimeLong > 60000) {
			return false;
		}else{
			return true;
		}
	}
	
	public void getRemoteData(String aoJianIds, String dateStr, String logId) throws SQLException {
		System.out.println("start:" + new Date().getMinutes());
		List<AoJianBean> clAoJianList = new ArrayList<AoJianBean>();
		if (!StringUtils.isEmpty(aoJianIds)) {
			String[] idArr = aoJianIds.split("#");
			for (int i = 0; i < idArr.length; i++) {
				AoJianBean curAoJian = ServiceManager.getAoJianServiceImpl().getById(idArr[i]);
				if (StringUtils.isEmpty(curAoJian.getDataSourceType())
						||StringUtils.isEmpty(curAoJian.getSensorArrangementbeanId())
						||null == curAoJian.getAoJianGrainInfoBean()
						) {
					continue;
				}
				if(!isRealTime(idArr[i])){
					continue;
				}
				if (StringUtils.isEmpty(logId)) {
					if ("cktx".equals(curAoJian.getDataSourceType())) {
						clAoJianList.add(curAoJian);
					} else {
						if (!StringUtils.isEmpty(curAoJian.getDbName())) {
							try {
								getSingleRemoteData(curAoJian);
								dataOperating(curAoJian);
							} catch (Exception e) {
								e.printStackTrace();
							}
						}
					}
				} else { // 如果是从传感器获取数据并且是提前五分钟的数据，只是将f105寄存器做置零操作
					if ("cktx".equals(curAoJian.getDataSourceType())) {
						SerialPortDataOperater seialOperate = new SerialPortDataOperater(clAoJianList);
						seialOperate.initRegister();
					}
				}
			}
		}
		if (clAoJianList.size() > 0) {
			SerialPortDataOperater seialOperate = new SerialPortDataOperater(clAoJianList);
			seialOperate.getRunTimeRemoteData(dateStr);
		}
		System.out.println("end:" + new Date().getMinutes());
	}

	public boolean getRunTimeRemoteData(String id, String dateStr) {
		System.out.println("start:" + new Date().getMinutes());
		boolean isOk = true;
		if (!StringUtils.isEmpty(id)) {
			AoJianBean curAoJian = ServiceManager.getAoJianServiceImpl().getById(id);
			if ("cktx".equals(curAoJian.getDataSourceType())) {
				List<AoJianBean> list = new ArrayList<AoJianBean>();
				list.add(curAoJian);
				SerialPortDataOperater seialOperate = new SerialPortDataOperater(list);
				try {
					seialOperate.getRunTimeRemoteData(dateStr);
				} catch (Exception e) {
					e.printStackTrace();
					isOk = false;
					return isOk;
				}
			} else {
				if (!StringUtils.isEmpty(curAoJian.getDbName())) {
					try {
						if (!getSingleRemoteData(curAoJian)) {
							isOk = false;
							return isOk;
						}
					} catch (Exception e) {
						isOk = false;
						return isOk;
					}
					dataOperating(curAoJian);
				} else {
					isOk = false;
					return isOk;
				}
			}
		}
		System.out.println("end:" + new Date().getMinutes());
		return isOk;
	}

	/**
	 * @名称: getSingleRemoteData
	 * @日期：2015-10-12 下午1:40:24
	 * @作者： lxb
	 * @描述: 获取单个廒间数据信息
	 * @参数 @param curAoJian
	 * @返回值 void
	 * @异常
	 */
	private boolean getSingleRemoteData(AoJianBean curAoJian) throws Exception {
		if ("dbdb1".equals(curAoJian.getDataSourceType())) {
			ExRemoteDBOperater remoteDb = new ExRemoteDBOperater();
			if (remoteDb.importRemoteData(curAoJian)) {
				return true;
			} else {
				return false;
			}
		} else if ("dbdb2".equals(curAoJian.getDataSourceType())) {
			RemoteDBOperater remoteDb = new RemoteDBOperater();
			if (remoteDb.importRemoteData(curAoJian)) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}

	}

	/**
	 * @名称: dataOperating
	 * @日期：2015-10-12 下午1:41:15
	 * @作者： lxb
	 * @描述: TODO
	 * @参数 数据处理
	 * @返回值 void
	 * @异常
	 */
	private AoJianDataBean aoJianData;
	public void setAoJianData(AoJianDataBean aoJianData) {
		this.aoJianData = aoJianData;
	}

	public void dataOperating(AoJianBean curAoJian) {
		Adapter a = new Adapter();
		AoJianGrainInfoBean grainBean = curAoJian.getAoJianGrainInfoBean();
		AoJianDataBean dataBean = ServiceManager.getAoJianBlockService().getRecentAoJianDataBeanByGrainId(grainBean.getId());
		a.aoJian = curAoJian;
		a.aoJianData = dataBean;
		SensorArrangementBean sensorArrangementBean = ServiceManager.getSensorArrangementServiceImpl().getById(curAoJian.getSensorArrangementbeanId());
		a.dataOperate(sensorArrangementBean, dataBean);
	}

	// public static void main(String[] args){
	// Adapter a = new Adapter();
	// SensorArrangementBean arrangementBean =
	// ServiceManager.getSensorArrangementServiceImpl().getById("402881eb4ee86725014ee8daeaa40003");
	// AoJianDataBean dataBean =
	// ServiceManager.getAoJianBlockService().getById("402881eb4f40061c014f40061e450001");
	// a.aoJian =
	// ServiceManager.getAoJianServiceImpl().getById("zy073111043135WebConstConfig.errorData");
	// a.dataOperate(arrangementBean, dataBean);
	// }
	/**
	 * 数据解析代码写在这里先， 流程： 组装结果组，按照层，列，行数据 计算，更新数据库 传入一个布置信息，或者一个行列层数据
	 */
	public void dataOperate(SensorArrangementBean arrangementBean, AoJianDataBean dataBean) {
		List<SensorDataBean> sensor = ServiceManager.getAoJianBlockService().getSensorDataList(dataBean, "", "orderIndex");
		Map<String, Map<String, List<Double>>> map = getResultMap(arrangementBean);
		// 求所有点数平均值的map
		Map<String, List<Double>> avgMap = getSubMap();
		Iterator it = sensor.iterator();
		while (it.hasNext()) {
			SensorDataBean sensorDataBean = (SensorDataBean) it.next();
			avgMap = insertData(avgMap, sensorDataBean);
			String pos = sensorDataBean.getSensorIndex();
			Iterator itPos = map.keySet().iterator();
			while (itPos.hasNext()) {
				String curPos = (String) itPos.next();
				Map<String, List<Double>> curMap = map.get(curPos);
				if (isMatchPos(curPos, pos)) {
					curMap = insertData(curMap, sensorDataBean);
				}
			}
		}
		// 数据组装完成
		// 先计算各种平均值，平均温度，湿度，水分,方差
		// whole start
		dataBean.setJwz(MathUtil.getAgeValue(avgMap.get("temperature")));
		dataBean.setJsz(MathUtil.getAgeValue(avgMap.get("humidity")));
		dataBean.setJsf(MathUtil.getAgeValue(avgMap.get("wet")));
		dataBean.setWdjyfcz(MathUtil.getVariance(avgMap.get("temperature"), dataBean.getJwz()));
		dataBean.setSdjjfcz(MathUtil.getVariance(avgMap.get("humidity"), dataBean.getJsz()));
		dataBean.setSfjyfcz(MathUtil.getVariance(avgMap.get("wet"), dataBean.getJsf()));
		Map<String, AlarmBean> alarmMap = getAlarms(dataBean);
		AlarmBean temAlarm = alarmMap.get("tem");// 温度阈值
		AlarmBean humAlarm = alarmMap.get("hum");// 湿度阈值
		AlarmBean wetAlarm = alarmMap.get("wet");// 水分阈值
		List<AlarmDataInfoBean> alarmDataList = new ArrayList<AlarmDataInfoBean>();
		// 计算极差告警
		calcJcMap(alarmDataList, map, temAlarm, humAlarm, wetAlarm, dataBean.getStartDate());
		// 平均温度告警
		if (null !=temAlarm && dataBean.getJwz() > temAlarm.getAverageAttri()) {
			dataBean.setJwaqzt(false);
			// private void builtAlarmData(Date occurTime,String
			// secondAlarmType,String alarmInfo){
			alarmDataList.add(builtAlarmData(dataBean.getStartDate(), "温度告警", "%,%,%","ldjw", "当前粮堆均温(" + dataBean.getJwz() + ")偏高"));
		} else {
			dataBean.setJwaqzt(true);
		}
		// 平均湿度告警
		AoJianGrainInfoBean grainBean = ServiceManager.getAoJianGrainInfoServiceImpl().getById(dataBean.getZyAoJianGrainNum());
		double humAlarmValue = HumThreshold.getHumValue(grainBean.getGrainType(), dataBean.getJwz());
		if (dataBean.getJsz() > humAlarmValue * 100) {
			dataBean.setJsdaqzt(false);
			// private void builtAlarmData(Date occurTime,String
			// secondAlarmType,String alarmInfo){
			alarmDataList.add(builtAlarmData(dataBean.getStartDate(), "湿度告警",  "%,%,%","ldjs", "当前粮堆均湿(" + dataBean.getJsz() + ")偏高"));
		} else {
			dataBean.setJsdaqzt(true);
		}
		// 平均水分告警
		if (null != wetAlarm && dataBean.getJsf() > wetAlarm.getAverageAttri() * 100) {
			dataBean.setJsfaqzt(false);
			// private void builtAlarmData(Date occurTime,String
			// secondAlarmType,String alarmInfo){
			alarmDataList.add(builtAlarmData(dataBean.getStartDate(), "水份告警",  "%,%,%","ldjsf", "当前粮堆平均水份(" + dataBean.getJsf() + ")偏高"));
		} else {
			dataBean.setJsfaqzt(true);
		}
		// whole end
		// face satrt
		// 先计算所有面的平均湿度，温度，水分，露点值
		Map<String, Map<String, Double>> faceAvgMap = getAvgMap(map);
		calcTdMap(alarmDataList, faceAvgMap, temAlarm, humAlarm, wetAlarm, dataBean.getStartDate());
		// Map<String, Map<String, Double>> layerMap = new HashMap<String,
		// Map<String, Double>>();
		// Map<String, Map<String, Double>> rowMap = new HashMap<String,
		// Map<String, Double>>();
		// Map<String, Map<String, Double>> columnMap = new HashMap<String,
		// Map<String, Double>>();
		// Iterator<String> itPos = faceAvgMap.keySet().iterator();
		// while (itPos.hasNext()) {
		// String key = itPos.next();
		// if (key.contains("%,%,")) {
		// columnMap.put(key, faceAvgMap.get(key));
		// }
		// }
		/**
		 * 水平极差 平均值 温度差，湿度差， 水分差 平均值最大的界面 减去平均值最小的界面 Map<String,Double> horJCMap =
		 * getJCMap(layerMap); 垂直极差 平均值 温度差，湿度差， 水分差 Map<String,Map<String,Double>> verRowJCMap =
		 * getJCMap(rowMap); Map<String,Map<String,Double>> verColumnJCMap = getJCMap(columnMap);
		 * 
		 * //水平梯度 相邻截面间的平均 温度差，湿度差， 水分差 Map<String,Double> horTDMap = getTDMap(); //垂直梯度 相邻截面间的平均
		 * 温度差，湿度差， 水分差 Map<String,Double> verTDMap = getTDMap();
		 */
		// dataBean.setLayerAlarmInfo(layerMap.toString());
		// dataBean.setRowAlarmInfo(rowMap.toString());
		// dataBean.setColumnAlarmInfo(columnMap.toString());
		// face end
		// point pos {tem:温度过高;wet:湿度过高}
		Map<String, List<String>> pointResultMap = new HashMap<String, List<String>>();
		Double avgTem = dataBean.getJwz();
		Double avgHum = dataBean.getJsz();
		Double avgWet = dataBean.getJsf();
		// map 的集合 告警的时候用
		Map<String, SensorDataBean> pointDataMap = new HashMap<String, SensorDataBean>();
		// 点大于最大温度的告警集合
		Map<String, List<String>> pointGtMaxResultMap = new HashMap<String, List<String>>();
		List<SensorDataBean> sensorList = ServiceManager.getAoJianBlockService().getSensorDataList(dataBean, "", "orderIndex");
		Iterator<SensorDataBean> itPoints = sensorList.iterator();
		// 计算点告警数量专用
		List<String> pointAlarmStrList = new ArrayList<String>();
		// List<String> pointGTMaxAlarmStrList = new ArrayList<String>();
		while (itPoints.hasNext()) {
			SensorDataBean sensor1 = itPoints.next();
			pointDataMap.put(sensor1.getSensorIndex(), sensor1);
			// 点大于平均温度 --告警
			if(null != temAlarm){
				Double temValue = Math.abs(sensor1.getTemperature() - (avgTem + temAlarm.getGtAverageAttri()));
				if(sensor1.getTemperature()<WebConstConfig.errorData){
					if (sensor1.getTemperature() > avgTem + temAlarm.getGtAverageAttri()) {
						if (pointResultMap.containsKey(sensor1.getSensorIndex())) {
							List<String> pointList = pointResultMap.get(sensor1.getSensorIndex());
							pointList.add("tem:" + MathUtil.getFormatData(temValue, 2) + "℃");
						} else {
							List<String> pointList = new ArrayList<String>();
							pointList.add("tem:" + MathUtil.getFormatData(temValue, 2) + "℃");
							pointResultMap.put(sensor1.getSensorIndex(), pointList);
						}
						if (!pointAlarmStrList.contains(sensor1.getSensorIndex())) {
							pointAlarmStrList.add(sensor1.getSensorIndex());
						}
					}
				}
			}
			if(null != humAlarm){
				if(sensor1.getHumidity()<WebConstConfig.errorData){
					Double humValue = Math.abs(sensor1.getHumidity() / 100 - (avgHum / 100 + humAlarm.getGtAverageAttri())) * 100;
					if (sensor1.getHumidity() / 100 > avgHum / 100 + humAlarm.getGtAverageAttri()) {
						if (pointResultMap.containsKey(sensor1.getSensorIndex())) {
							List<String> pointList = pointResultMap.get(sensor1.getSensorIndex());
							pointList.add("hum:" + MathUtil.getFormatData(humValue, 2) + "%");
						} else {
							List<String> pointList = new ArrayList<String>();
							pointList.add("hum:" + MathUtil.getFormatData(humValue, 2) + "%");
							pointResultMap.put(sensor1.getSensorIndex(), pointList);
						}
						if (!pointAlarmStrList.contains(sensor1.getSensorIndex())) {
							pointAlarmStrList.add(sensor1.getSensorIndex());
						}
					}
				}
			}
			if(null != wetAlarm){
				Double wetValue = Math.abs(sensor1.getWet() / 100 - avgWet / 100 - wetAlarm.getGtAverageAttri()) * 100;
				if (sensor1.getWet() / 100 > avgWet / 100 + wetAlarm.getGtAverageAttri()) {
					if (pointResultMap.containsKey(sensor1.getSensorIndex())) {
						List<String> pointList = pointResultMap.get(sensor1.getSensorIndex());
						pointList.add("wet:" + MathUtil.getFormatData(wetValue, 2) + "%");
					} else {
						List<String> pointList = new ArrayList<String>();
						pointList.add("wet:" + MathUtil.getFormatData(wetValue, 2) + "%");
						pointResultMap.put(sensor1.getSensorIndex(), pointList);
					}
					if (!pointAlarmStrList.contains(sensor1.getSensorIndex())) {
						pointAlarmStrList.add(sensor1.getSensorIndex());
					}
				}
			}
			// 点大于--度温度告警
			if(null != temAlarm){
				Double pointTemValue = sensor1.getTemperature() - temAlarm.getMaxAttri();
				if (pointTemValue > 0) {
					if (pointGtMaxResultMap.containsKey(sensor1.getSensorIndex())) {
						List<String> pointList = pointGtMaxResultMap.get(sensor1.getSensorIndex());
						pointList.add("tem:" + MathUtil.getFormatData(pointTemValue, 2) + "℃");
					} else {
						List<String> pointList = new ArrayList<String>();
						pointList.add("tem:" + MathUtil.getFormatData(pointTemValue, 2) + "℃");
						pointGtMaxResultMap.put(sensor1.getSensorIndex(), pointList);
					}
					if (!pointAlarmStrList.contains(sensor1.getSensorIndex())) {
						pointAlarmStrList.add(sensor1.getSensorIndex());
					}
				}
			}
			if(null != humAlarm){
				Double pointHumValue = sensor1.getHumidity() - humAlarm.getMaxAttri() * 100;
				if (pointHumValue > 0) {
					if (pointGtMaxResultMap.containsKey(sensor1.getSensorIndex())) {
						List<String> pointList = pointGtMaxResultMap.get(sensor1.getSensorIndex());
						pointList.add("hum:" + MathUtil.getFormatData(pointHumValue, 2) + "%");
					} else {
						List<String> pointList = new ArrayList<String>();
						pointList.add("hum:" + MathUtil.getFormatData(pointHumValue, 2) + "%");
						pointGtMaxResultMap.put(sensor1.getSensorIndex(), pointList);
					}
					if (!pointAlarmStrList.contains(sensor1.getSensorIndex())) {
						pointAlarmStrList.add(sensor1.getSensorIndex());
					}
				}
			}
			if(null != wetAlarm){
				Double pointWetValue = sensor1.getWet() - wetAlarm.getMaxAttri() * 100;
				if (pointWetValue > 0) {
					if (pointGtMaxResultMap.containsKey(sensor1.getSensorIndex())) {
						List<String> pointList = pointGtMaxResultMap.get(sensor1.getSensorIndex());
						pointList.add("wet:" + MathUtil.getFormatData(pointWetValue, 2) + "%");
					} else {
						List<String> pointList = new ArrayList<String>();
						pointList.add("wet:" + MathUtil.getFormatData(pointWetValue, 2) + "%");
						pointGtMaxResultMap.put(sensor1.getSensorIndex(), pointList);
					}
					if (!pointAlarmStrList.contains(sensor1.getSensorIndex())) {
						pointAlarmStrList.add(sensor1.getSensorIndex());
					}
				}
			}
		}
			
		beforeBuildAlarmData(alarmDataList, pointDataMap, pointResultMap, dataBean.getStartDate());
		buildGtMaxAlarmData(alarmDataList, pointDataMap, pointGtMaxResultMap, dataBean.getStartDate());
		String pointAlarm = "alarmCount:" + pointAlarmStrList.size() + "," + pointAlarmStrList.toString();
		dataBean.setPointAlarmInfo(pointAlarm);
		try {
			//生成于总的新格式----当前粮堆平均温度值偏高；层[1/2/5]、列[2/4/7]、行[1/6/9/10]截面内温度分布不均匀； 
			//----------------点[(4,0,1)/(2,1,1)]温度偏高；点[(2,1,1)]温度异常高，需重点观察；列1/列2、列3/列4、层1/层2截面间温度梯不均匀，注意观察。
			List<AlarmDataInfoBean> list = createAlarmDataList(alarmDataList);
			ServiceManager.getAlarmDataInfoServiceImpl().batchSave(list);
			ServiceManager.getAoJianBlockService().update(dataBean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	* @名称: createAlarmDataList 
	* @日期：2015-12-3 下午3:44:19
	* @作者： lxb
	* @描述: 创建新格式
	* @参数 @param alarmDataList    
	* @返回值 void    
	* @异常
	 */
	private List<AlarmDataInfoBean> createAlarmDataList(List<AlarmDataInfoBean> alarmDataList) {
		List<AlarmDataInfoBean> result = new ArrayList<AlarmDataInfoBean>();
		if(null == alarmDataList ||alarmDataList.size()<=0){
			return result;
		}
		List<AlarmDataInfoBean> resultList = new ArrayList<AlarmDataInfoBean>();
		//生成于总的新格式----当前粮堆平均温度值偏高；层[1/2/5]、列[2/4/7]、行[1/6/9/10]截面内温度分布不均匀； 
		//----------------点[(4,0,1)/(2,1,1)]温度偏高；点[(2,1,1)]温度异常高，需重点观察；列1/列2、列3/列4、层1/层2截面间温度梯不均匀，注意观察。
		Map<String,List<AlarmDataInfoBean>> temMap = new HashMap<String, List<AlarmDataInfoBean>>();
		Map<String,List<AlarmDataInfoBean>> humMap = new HashMap<String, List<AlarmDataInfoBean>>();
		Map<String,List<AlarmDataInfoBean>> wetMap = new HashMap<String, List<AlarmDataInfoBean>>();
		//数据准备工作
		for (int i = 0; i < alarmDataList.size(); i++) {
			AlarmDataInfoBean alarmData =  alarmDataList.get(i);
			if(alarmData.getSecondAlarmType().equals("温度告警")){
				addAlarmDataByType(alarmData.getThirdAlarmType(),temMap,alarmData);
			}else if(alarmData.getSecondAlarmType().equals("湿度告警")){
				addAlarmDataByType(alarmData.getThirdAlarmType(),humMap,alarmData);
			}else if(alarmData.getSecondAlarmType().equals("水份告警")){
				addAlarmDataByType(alarmData.getThirdAlarmType(),wetMap,alarmData);
			}
		}

		//准备完成之后进行数据组装
		String temStr = "agec[*],l[*],h[*]jmwddiandIndex[*]pointStrycg[*]gyzgztd[*]tdStr";
		String temDisStr = getDisStr(temMap,"ldjw",temStr).replaceAll("#", "温度");
		String humDisStr = getDisStr(humMap,"ldjs",temStr).replaceAll("#", "湿度");
		String wetDisStr = getDisStr(wetMap,"ldjsf",temStr).replaceAll("#", "水份");
		
		AlarmDataInfoBean temBean = alarmDataList.get(0).clone();
		AlarmDataInfoBean humBean = alarmDataList.get(0).clone();
		AlarmDataInfoBean wetBean = alarmDataList.get(0).clone();
		if(!StringUtils.isEmpty(temDisStr)){
			temBean.setAlarmInfo(temDisStr);
			temBean.setSecondAlarmType("温度告警");
			result.add(temBean);
		}
		if(!StringUtils.isEmpty(humDisStr)){
			humBean.setAlarmInfo(humDisStr);
			humBean.setSecondAlarmType("湿度告警");
			result.add(humBean);
		}
		if(!StringUtils.isEmpty(wetDisStr)){
			wetBean.setAlarmInfo(wetDisStr);
			wetBean.setSecondAlarmType("水份告警");
			result.add(wetBean);
		}
		return result;
	}

	private String getDisStr(Map<String, List<AlarmDataInfoBean>> temMap,
			String type, String temStr) {
		String result = temStr;
		String age="当前粮堆平均#值偏高；";
		String jmwd = "截面内#分布不均匀；";
		String pointStr = "#偏高；";
		String tdStr = "截面间#梯度不均匀，注意观察。";
		String dian = "点";
		String gyzgz = "#异常高，需重点观察；";
//		ycg[*]gyzgz
		if(temMap.containsKey(type)){
			result = result.replace("age", age);
		}else{
			result = result.replace("age", "");
		}
		if(temMap.containsKey("jmjc")){
			List<AlarmDataInfoBean> list = temMap.get("jmjc");
			List<String> cSb = new ArrayList<String>();
			List<String> lsb = new ArrayList<String>();
			List<String> hsb = new ArrayList<String>();
			for (int i = 0; i < list.size(); i++) {
				AlarmDataInfoBean data = list.get(i);
				String disStr = getDispalyPos(data.getOrderIndex());
				String pos = data.getOrderIndex();
				String[] posArr = pos.split(",");
				if (pos.contains("%,%,")) {
					cSb.add(Integer.parseInt(posArr[2]) + 1+"");
				} else if (pos.contains(",%,%")) {
					hsb.add(Integer.parseInt(posArr[0]) + 1+"");
				} else {
					lsb.add(Integer.parseInt(posArr[1]) + 1+"");
				}
			}
			if(cSb.size()>0){
				result = result.replace("c[*]", "层"+cSb.toString()+"");
			}
			else{
				result = result.replace("c[*]", "");
			}
			if(hsb.size()>0){
				result = result.replace("h[*]", "行"+hsb.toString()+"");
			}else{
				result = result.replace("h[*]", "");
			}
			if(lsb.size()>0){
				result = result.replace("l[*]", "列"+lsb.toString()+"");
			}else{
				result = result.replace("l[*]", "");
			}
			if(cSb.size()>0||hsb.size()>0||lsb.size()>0){
				result = result.replace("jmwd", jmwd);
			}else{
				result = result.replace("jmwd", "");
			}
		}else{
			result = result.replace("c[*],l[*],h[*]jmwd", "");
		}
		
		//点 String temStr = "agec[*],l[*],h[*]jmwddiand[*]pointStrtd[*]tdStr";
		if(temMap.containsKey("dgj")){
			List<AlarmDataInfoBean> list = temMap.get("dgj");
			result = result.replace("dian",dian);//能进来  肯定是大于零了
			List<String> pontDisStrList = new ArrayList<String>();
			for (int i = 0; i < list.size(); i++) {
				AlarmDataInfoBean pointAlarmData = list.get(i);
				
				pontDisStrList.add("("+dealPointDisplayStr(pointAlarmData.getOrderIndex().trim())+")");
			}
			result = result.replace("dIndex[*]",pontDisStrList.toString());
			result = result.replace("pointStr",pointStr);
		}
		else{
			result = result.replace("diandIndex[*]pointStr", "");
		}
		//梯度     列1/列2、列3/列4、层1/层2截面间温度梯不均匀，注意观察。
		if(temMap.containsKey("jmtd")){
			List<AlarmDataInfoBean> list = temMap.get("jmtd");
			List<String> tdDisStrList = new ArrayList<String>();
			for (int i = 0; i < list.size(); i++) {
				AlarmDataInfoBean pointAlarmData = list.get(i);
				tdDisStrList.add(pointAlarmData.getAlarmInfo().substring(0, 5).replace("与", "/"));
			}
			result = result.replace("td[*]",tdDisStrList.toString());
			result = result.replace("tdStr",tdStr);
		}else{
			result = result.replace("td[*]tdStr", "");
		} //ycg[*]gyzgz
		if(temMap.containsKey("dgjgtmax")){
			List<AlarmDataInfoBean> list = temMap.get("dgjgtmax");
			result = result.replace("yc",dian);//能进来  肯定是大于零了
			List<String> pontDisStrList = new ArrayList<String>();
			for (int i = 0; i < list.size(); i++) {
				AlarmDataInfoBean pointAlarmData = list.get(i);
				pontDisStrList.add("("+dealPointDisplayStr(pointAlarmData.getOrderIndex().trim())+")");
			}
			result = result.replace("g[*]",pontDisStrList.toString());
			result = result.replace("gyzgz",gyzgz);
		}else{
			result = result.replace("ycg[*]gyzgz", "");
		}
		return result;
	}

	private String dealPointDisplayStr(String orderStr){
		String result = "";
		String[] strArr = orderStr.split(",");
		strArr[0] = Integer.parseInt(strArr[0])+1+"";
		strArr[1] = Integer.parseInt(strArr[1])+1+"";
		strArr[2] = Integer.parseInt(strArr[2])+1+"";
		return strArr[0]+","+strArr[1]+","+strArr[2];
	}
	
	private void addAlarmDataByType(String type,Map<String,List<AlarmDataInfoBean>> temMap,AlarmDataInfoBean alarmData){
		if(temMap.containsKey(type)){
			temMap.get(type).add(alarmData);
		}else{
			List<AlarmDataInfoBean> list = new ArrayList<AlarmDataInfoBean>();
			list.add(alarmData);
			temMap.put(type, list);
		}
	}
	/**
	 * 生成点的告警信息
	 * 
	 * @param pointDataMap
	 * @param pointResultMap
	 * @param date
	 */
	private void beforeBuildAlarmData(List<AlarmDataInfoBean> alarmDataList, Map<String, SensorDataBean> pointDataMap, Map<String, List<String>> pointResultMap, Date date) {
		Iterator<String> it = pointResultMap.keySet().iterator();
		while (it.hasNext()) {
			String key = (String) it.next();
			SensorDataBean sensorData = pointDataMap.get(key);
			List<String> strList = pointResultMap.get(key);
			Iterator<String> subIt = strList.iterator();
			while (subIt.hasNext()) {
				String alarmType = subIt.next();
				if (alarmType.indexOf("tem") >-1) {
					alarmDataList.add(builtAlarmData(date, "温度告警", key, "dgj", "点(" + key + ")温度(" + sensorData.getTemperature() + ")偏高(+" + alarmType.split(":")[1] + ")"));
				} else if (alarmType.indexOf("hum") >-1) {
					alarmDataList.add(builtAlarmData(date, "湿度告警", key, "dgj", "点(" + key + ")湿度(" + sensorData.getHumidity() + ")偏高(+" + alarmType.split(":")[1] + ")"));
				} else {
					alarmDataList.add(builtAlarmData(date, "水份告警", key, "dgj", "点(" + key + ")水份(" + sensorData.getWet() + ")偏高(+" + alarmType.split(":")[1] + ")"));
				}
			}
		}
	}

	/**
	 * 生成点的告警信息
	 * 
	 * @param pointDataMap
	 * @param pointResultMap
	 * @param date
	 */
	private void buildGtMaxAlarmData(List<AlarmDataInfoBean> alarmDataList, Map<String, SensorDataBean> pointDataMap, Map<String, List<String>> pointResultMap, Date date) {
		Iterator<String> it = pointResultMap.keySet().iterator();
		while (it.hasNext()) {
			String key = (String) it.next();
			SensorDataBean sensorData = pointDataMap.get(key);
			List<String> strList = pointResultMap.get(key);
			Iterator<String> subIt = strList.iterator();
			while (subIt.hasNext()) {
				String alarmType = subIt.next();
				if (alarmType.indexOf("tem") > -1) {
					alarmDataList.add(builtAlarmData(date, "温度告警", key, "dgjgtmax", "点(" + key + ")温度(" + sensorData.getTemperature() + ")高于粮堆最高温告警阈值(+" + alarmType.split(":")[1] + ")"));
				} else if (alarmType.indexOf("hum") > -1) {
					alarmDataList.add(builtAlarmData(date, "湿度告警", key, "dgjgtmax", "点(" + key + ")湿度(" + sensorData.getHumidity() + ")高于粮堆最高湿度告警阈值(+" + alarmType.split(":")[1] + ")"));
				} else {
					alarmDataList.add(builtAlarmData(date, "水份告警", key, "dgjgtmax", "点(" + key + ")水份(" + sensorData.getWet() + ")高于粮堆最高水份告警阈值(+" + alarmType.split(":")[1] + ")"));
				}
			}
		}
	}

	/**
	 * 将 %，%，1 转换为 2层----------
	 * 
	 * @param pos
	 * @return
	 */
	private String getDispalyPos(String pos) {
		String result = "";
		String[] posArr = pos.split(",");
		if (pos.contains("%,%,")) {
			result = "层" + (Integer.parseInt(posArr[2]) + 1);
		} else if (pos.contains(",%,%")) {
			result = "行" + (Integer.parseInt(posArr[0]) + 1);
		} else {
			result = "列" + (Integer.parseInt(posArr[1]) + 1);
		}
		return result;
	}

	/**
	 * 组装告警信息
	 * 
	 * @param occurTime
	 * @param secondAlarmType
	 * @param alarmInfo
	 */
	private AlarmDataInfoBean builtAlarmData(Date occurTime, String secondAlarmType, String orderIndex, String thirdAlarmType, String alarmInfo) {
		// aoJian
		String zyAoJianNum = aoJian.getZyAoJianNum();
		BarnBean barn = ServiceManager.getBarnServiceImpl().getById(aoJian.getBarnId());
		String displayAlarmInfo = barn.getBarnIndex() + "仓" + aoJian.getAoJianIndex() + "廒";
		String alarmInfoType = "粮情告警";
		List<User> userList = ServiceManager.getUserService().findByContent(aoJian.getZyAoJianNum());
		String[] userInfo = getUserIds(userList);
		AlarmDataInfoBean bean = new AlarmDataInfoBean();
		bean.setAlarmInfo(alarmInfo);
		bean.setAlarmInfoType(alarmInfoType);
		bean.setThirdAlarmType(thirdAlarmType);
		bean.setOrderIndex(orderIndex);
		bean.setAlarmTime(occurTime);
		bean.setAoJianDataId(aoJianData.getId());
		bean.setDisplayAlarmInfo(displayAlarmInfo);
		if (StringUtils.isEmpty(userInfo[1])) {
			bean.setDisplayNames("无库管员");
			bean.setUserId("");
		} else {
			bean.setDisplayNames(userInfo[1]);
		}
		if (StringUtils.isEmpty(userInfo[0])) {
		} else {
			bean.setUserId(userInfo[0]);
		}
		bean.setSecondAlarmType(secondAlarmType);
		bean.setZyAoJianNum(zyAoJianNum);
		bean.setStatus("0");
		return bean;
	}

	private String[] getUserIds(List<User> list) {
		String ids = "";
		String dispalyNames = "";
		for (int i = 0; i < list.size(); i++) {
			ids = ids + list.get(i).getId() + ",";
			dispalyNames = dispalyNames + list.get(i).getDisplayName() + ",";
		}
		if (ids.length() > 0) {
			ids = ids.substring(0, ids.length() - 1);
		}
		if (dispalyNames.length() > 0) {
			dispalyNames = dispalyNames.substring(0, dispalyNames.length() - 1);
		}
		String[] result = new String[2];
		result[0] = ids;
		result[1] = dispalyNames;
		return result;
	}

	/**
	 * 计算极差
	 * 
	 * @param map
	 * @return
	 */
	private Map<String, Double> getJCMap(Map<String, Map<String, Double>> map) {
		Map<String, Double> result = new HashMap<String, Double>();
		Iterator<String> it = map.keySet().iterator();
		List<Double> avgTemList = new ArrayList<Double>();
		List<Double> avgHumList = new ArrayList<Double>();
		List<Double> avgWetList = new ArrayList<Double>();
		while (it.hasNext()) {
			String key = it.next();
			Map<String, Double> valueMap = map.get(key);
			Double tem = valueMap.get("temperature");
			Double hum = valueMap.get("humidity");
			Double wet = valueMap.get("wet");
			avgTemList.add(tem);
			avgHumList.add(hum);
			avgWetList.add(wet);
		}
		avgTemList = MathUtil.sort(avgTemList, MathUtil.ASC);
		avgHumList = MathUtil.sort(avgHumList, MathUtil.ASC);
		avgWetList = MathUtil.sort(avgWetList, MathUtil.ASC);
		if (avgTemList.size() <= 0 || avgHumList.size() <= 0 || avgWetList.size() <= 0) {
			return result;
		}
		result.put("temperature", avgTemList.get(avgTemList.size() - 1) - avgTemList.get(0));
		result.put("humidity", avgTemList.get(avgHumList.size() - 1) - avgHumList.get(0));
		result.put("wet", avgTemList.get(avgWetList.size() - 1) - avgWetList.get(0));
		return result;
	}

	/**
	 * 计算出平均值
	 * 
	 * @param map
	 * @return
	 */
	private Map<String, Map<String, Double>> getAvgMap(Map<String, Map<String, List<Double>>> map) {
		Map<String, Map<String, Double>> result = new HashMap<String, Map<String, Double>>();
		Iterator<String> it = map.keySet().iterator();
		double minValue = 0.00;
		while (it.hasNext()) {
			String key = it.next();
			Map<String, List<Double>> valueMap = map.get(key);
			List<Double> temList = valueMap.get("temperature");
			List<Double> humList = valueMap.get("humidity");
			List<Double> wetList = valueMap.get("wet");
			Map<String, Double> newAvgMap = new HashMap<String, Double>();
			newAvgMap.put("temperature", MathUtil.getAgeValue(temList));
			newAvgMap.put("humidity", MathUtil.getAgeValue(humList));
			newAvgMap.put("wet", MathUtil.getAgeValue(wetList));
			result.put(key, newAvgMap);
		}
		return result;
	}

	/**
	 * 计算极差
	 * 
	 * @param map
	 * @return
	 */
	private void calcJcMap(List<AlarmDataInfoBean> alarmList, Map<String, Map<String, List<Double>>> map, AlarmBean temAlarm, AlarmBean humAlarm, AlarmBean wetAlarm, Date date) {
		Iterator<String> it = map.keySet().iterator();
		while (it.hasNext()) {
			String key = it.next();// 一个面的数据
			Map<String, List<Double>> valueMap = map.get(key);
			List<Double> temList = valueMap.get("temperature");
			List<Double> humList = valueMap.get("humidity");
			List<Double> wetList = valueMap.get("wet");
			double tem = MathUtil.getRangeData(temList);
			double hum = MathUtil.getRangeData(humList);
			double wet = MathUtil.getRangeData(wetList);
			tem = MathUtil.getFormatData(tem, 2);
			hum = MathUtil.getFormatData(hum, 2);
			wet = MathUtil.getFormatData(wet, 2);
			// 水平
			if (key.contains("%,%,")) {
				if (null!=temAlarm&&tem > temAlarm.getHorAttri()) {
					alarmList.add(builtAlarmData(date, "温度告警", key, "jmjc", getDispalyPos(key) + "截面温度极差(" + tem + ")偏高(+" + MathUtil.getFormatData(Math.abs(tem - temAlarm.getHorAttri()), 2) + "℃)"));
				}
				if (null!=humAlarm&&hum > humAlarm.getHorAttri() * 100) {
					alarmList.add(builtAlarmData(date, "湿度告警", key, "jmjc", getDispalyPos(key) + "截面湿度极差(" + hum + ")偏高(+" + MathUtil.getFormatData(Math.abs(hum - humAlarm.getHorAttri() * 100), 2) + "%)"));
				}
				if (null!=wetAlarm&&wet > wetAlarm.getHorAttri() * 100) {
					alarmList.add(builtAlarmData(date, "水份告警", key, "jmjc", getDispalyPos(key) + "截面水份极差(" + wet + ")偏高(+" + MathUtil.getFormatData(Math.abs(wet - wetAlarm.getHorAttri() * 100), 2) + "%)"));
				}
			} else {// 垂直
				if (null!=temAlarm&&tem > temAlarm.getVerAttri()) {
					alarmList.add(builtAlarmData(date, "温度告警", key, "jmjc", getDispalyPos(key) + "截面温度极差(" + tem + ")偏高(+" + MathUtil.getFormatData(Math.abs(tem - temAlarm.getHorAttri()), 2) + "℃)"));
				}
				if (null!=humAlarm&&hum > humAlarm.getVerAttri() * 100) {
					alarmList.add(builtAlarmData(date, "湿度告警", key, "jmjc", getDispalyPos(key) + "截面湿度极差(" + hum + ")偏高(+" + MathUtil.getFormatData(Math.abs(hum - humAlarm.getHorAttri() * 100), 2) + "%)"));
				}
				if (null!=wetAlarm&&wet > wetAlarm.getVerAttri() * 100) {
					alarmList.add(builtAlarmData(date, "水份告警", key, "jmjc", getDispalyPos(key) + "截面水份极差(" + wet + ")偏高(+" + MathUtil.getFormatData(Math.abs(wet - wetAlarm.getVerAttri() * 100), 2) + "%)"));
				}
			}
		}
	}
	/**
	 * 计算梯度差
	 * 
	 * @param map
	 * @param temAlarm
	 * @param humAlarm
	 * @param wetAlarm
	 * @param date
	 */
	private void calcTdMap(List<AlarmDataInfoBean> alarmDataList, Map<String, Map<String, Double>> map, AlarmBean temAlarm, AlarmBean humAlarm, AlarmBean wetAlarm, Date date) {
		Iterator<String> it = map.keySet().iterator();
		while (it.hasNext()) {
			String pos = it.next();
			Map<String, Double> dataMap = map.get(pos);
			String nextPos = getNextLayer(pos);
			if (map.containsKey(nextPos)) {
				Map<String, Double> nextMap = map.get(nextPos);
				if (pos.contains("%,%,")) {// 层截面
					if (null!=temAlarm&&dataMap.get("temperature") - nextMap.get("temperature") > temAlarm.getHortGradAttri()) {
						alarmDataList.add(builtAlarmData(date, "温度告警",  pos,"jmtd", getDispalyPos(pos) + "与" + getDispalyPos(nextPos) + "截面间温度梯度差偏高(+" + MathUtil.getFormatData(dataMap.get("temperature") - nextMap.get("temperature"), 2) + "℃)"));
					}
					if (null!=humAlarm&&dataMap.get("humidity") - nextMap.get("humidity") > humAlarm.getHortGradAttri() * 100) {
						alarmDataList.add(builtAlarmData(date, "湿度告警",  pos,"jmtd", getDispalyPos(pos) + "与" + getDispalyPos(nextPos) + "截面间湿度梯度差偏高(+" + MathUtil.getFormatData(dataMap.get("humidity") - nextMap.get("humidity"), 2) + "%)"));
					}
					if (null!=wetAlarm&&dataMap.get("wet") - nextMap.get("wet") > wetAlarm.getHortGradAttri() * 100) {
						alarmDataList.add(builtAlarmData(date, "水份告警",  pos,"jmtd", getDispalyPos(pos) + "与" + getDispalyPos(nextPos) + "截面间水份梯度差偏高(+" + MathUtil.getFormatData(dataMap.get("wet") - nextMap.get("wet"), 2) + "%)"));
					}
				} else {// 列截面
					if (null!=temAlarm&&dataMap.get("temperature") - nextMap.get("temperature") > temAlarm.getVerGradAttri()) {
						alarmDataList.add(builtAlarmData(date, "温度告警",  pos,"jmtd", getDispalyPos(pos) + "与" + getDispalyPos(nextPos) + "截面间温度梯度差偏高(+" + MathUtil.getFormatData(dataMap.get("temperature") - nextMap.get("temperature"), 2) + "℃)"));
					}
					if (null!=humAlarm&&dataMap.get("humidity") - nextMap.get("humidity") > humAlarm.getVerGradAttri() * 100) {
						alarmDataList.add(builtAlarmData(date, "湿度告警",  pos,"jmtd", getDispalyPos(pos) + "与" + getDispalyPos(nextPos) + "截面间湿度梯度差偏高(+" + MathUtil.getFormatData(dataMap.get("humidity") - nextMap.get("humidity"), 2) + "%)"));
					}
					if (null!=wetAlarm&&dataMap.get("wet") - nextMap.get("wet") > wetAlarm.getVerGradAttri() * 100) {
						alarmDataList.add(builtAlarmData(date, "水份告警",  pos,"jmtd", getDispalyPos(pos) + "与" + getDispalyPos(nextPos) + "截面间水份梯度差偏高(+" + MathUtil.getFormatData(dataMap.get("wet") - nextMap.get("wet"), 2) + "%)"));
					}
				}
			}
		}
	}

	/**
	 * 获取下一层
	 */
	private String getNextLayer(String pos) {
		String[] arr = pos.split(",");
		if (pos.contains("%,%,")) {
			return "%,%," + (Integer.parseInt(arr[2]) + 1);
		} else if (pos.contains(",%,%")) {
			return (Integer.parseInt(arr[0]) + 1) + "%,%";
		} else {
			return "%," + (Integer.parseInt(arr[1]) + 1) + ",%";
		}
	}

	/**
	 * 获取告警信息
	 * 
	 * @param dataBean
	 * @return
	 */
	private Map<String, AlarmBean> getAlarms(AoJianDataBean dataBean) {
		AoJianGrainInfoBean grainBean = ServiceManager.getAoJianGrainInfoServiceImpl().getById(dataBean.getZyAoJianGrainNum());
		Map<String, AlarmBean> alarmMap = ControllerUtils.getAlarmDataInfo(grainBean);
		return alarmMap;
	}

	private Map<String, List<Double>> insertData(Map<String, List<Double>> map, SensorDataBean sensorDataBean) {
		if ("1".equals(sensorDataBean.getNoData())) {
			if(sensorDataBean.getTemperature()-WebConstConfig.errorData!=0){
				map.get("temperature").add(sensorDataBean.getTemperature());
			}
			if(sensorDataBean.getHumidity()-WebConstConfig.errorData!=0){
				map.get("humidity").add(sensorDataBean.getHumidity());
			}
			if(sensorDataBean.getWet()-WebConstConfig.errorData !=0){
				map.get("wet").add(sensorDataBean.getWet());
			}
			if(sensorDataBean.getDewPoint()-WebConstConfig.errorData !=0){
				map.get("dewPoint").add(sensorDataBean.getDewPoint());
			}
			return map;
		}
		return map;
	}

	/**
	 * 0,0,0, 0,0,1, 0,0,2
	 */
	private Map<String, Map<String, List<Double>>> getResultMap(SensorArrangementBean arrangementBean) {
		Map<String, Map<String, List<Double>>> resultMap = new HashMap<String, Map<String, List<Double>>>();
		for (int i = 0; i < arrangementBean.getLayerCount(); i++) {
			String layerStr = "%,%," + i;
			resultMap.put(layerStr, getSubMap());
		}
		for (int j = 0; j < arrangementBean.getRowCount(); j++) {
			String rowStr = j + ",%,%";
			resultMap.put(rowStr, getSubMap());
		}
		for (int i = 0; i < arrangementBean.getColumnCount(); i++) {
			String columnStr = "%," + i + ",%";
			resultMap.put(columnStr, getSubMap());
		}
		return resultMap;
	}

	private Map<String, List<Double>> getSubMap() {
		Map<String, List<Double>> map = new HashMap<String, List<Double>>();
		map.put("temperature", new ArrayList<Double>());
		map.put("humidity", new ArrayList<Double>());
		map.put("wet", new ArrayList<Double>());
		map.put("dewPoint", new ArrayList<Double>());
		return map;
	}

	/**
	 * 通过位置判断是否是所需的点
	 * 
	 * @param viewPos
	 * @param sensorPos
	 * @return
	 */
	private boolean isMatchPos(String viewPos, String sensorPos) {
		boolean isMatch = false;
		String[] viewPosArr = viewPos.split(",");
		String[] sensorPosArr = sensorPos.split(",");
		for (int i = 0; i < viewPosArr.length; i++) {
			if (viewPosArr[i].equals(sensorPosArr[i])) {
				isMatch = true;
				break;
			}
		}
		return isMatch;
	}
}
