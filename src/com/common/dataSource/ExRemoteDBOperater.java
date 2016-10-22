package com.common.dataSource;

import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.common.consts.WebConstConfig;
import com.common.utils.CalendarUtil;
import com.common.utils.FileUtils;
import com.common.utils.MathUtil;
import com.common.utils.StringUtils;
import com.formula.data.Calc;
import com.hibernate.barnInfo.domain.AoJianBean;
import com.hibernate.baseSettingInfo.domain.BaseSettingBean;
import com.hibernate.baseSettingInfo.domain.GrainTypeBean;
import com.hibernate.sernsorInfo.domain.AoJianDataBean;
import com.hibernate.sernsorInfo.domain.ArrangementDataBean;
import com.hibernate.sernsorInfo.domain.SensorArrangementBean;
import com.hibernate.sernsorInfo.domain.SensorDataBean;
import com.spring.ServiceManager;

public class ExRemoteDBOperater {

	// private static String url = "jdbc:sqlserver://61.136.153.135:1420;databaseName="; // 3146
	// 1420
//	private static String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
//	private static String passwrod = "Zykj88382980";
//	private static String userName = "zykjlqt";
	private static String driver = "com.mysql.jdbc.Driver";
	private static String passwrod = "88382980";
	private static String userName = "wzzxk";
	public static String dbName;//数据库
	public static String recentTimeTableName = "rencentTime";// 保存”最近一次传感器读取时间”的表
	private static String curTableName;//厫间表名

	private static int jzCount ; // 矫正次数（次）
	private static int jzTime; // 矫正时间长度（小时，负值）
	
	public ExRemoteDBOperater() {
		dbName = getBaseSettingValueByKey("sjk","");
		jzCount = Integer.parseInt(getBaseSettingValueByKey("jzCount","30"));
		jzTime = 0-Integer.parseInt(getBaseSettingValueByKey("jzTime","4"));
	}

	private String getBaseSettingValueByKey(String key, String defaultValue){
		String resultStr = "";
		BaseSettingBean baseSetting = ServiceManager.getBaseSettingServiceImpl().findValueByKey(key);
		if (null == baseSetting || StringUtils.isEmpty(baseSetting.getValue())) {
			resultStr = defaultValue;
		} else {
			resultStr = baseSetting.getValue();
		}
		return resultStr;
	}
	
	
	public Connection getConnection(String tableName) {
		if (!StringUtils.isEmpty(tableName)) {
			curTableName = tableName;
		}
		Connection conn = null;
		try {
//			String url = "jdbc:sqlserver://61.136.153.135:1420;databaseName=" + dbName;
			String url = "jdbc:mysql://zykj0001.mysql.rds.aliyuncs.com:3306/"+dbName;
			Class.forName(driver);
			conn = DriverManager.getConnection(url, userName, passwrod);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			return conn;
		}
	}

	/**
	 * 采集远程粮情数据 3G： 14点仓温 15～17 外温 18～20 风道 ----- 串口：---粮堆 ld ---仓内 cn----风道 fd---大气 dq-----
	 * //(createTime,sensorIndex,temperature,humidity,wet,dewPoint,orderIndex,fjType,cableIndex)
	 */
	public boolean importRemoteData(AoJianBean aoJian) throws Exception {
		List<SensorDataBean> list = new ArrayList<SensorDataBean>();
		try {
			Connection conn = new ExRemoteDBOperater().getConnection(aoJian.getDbName());
			if (null == conn) {
				return false;
			} else {
				System.out.println(aoJian.getZyAoJianNum() + "开始定时一次");
				String grainId = aoJian.getAoJianGrainInfoBean().getGrainType();
				GrainTypeBean grainBean = ServiceManager.getGrainTypeServiceImpl().getById(grainId);
				Statement state = conn.createStatement();
				String sensorArrangementId = aoJian.getSensorArrangementbeanId();
				SensorArrangementBean sensorArrangementBean = ServiceManager.getSensorArrangementServiceImpl().getById(sensorArrangementId);
				if (null == sensorArrangementBean) {
					System.out.println("sensorArrangement Error");
				}
				AoJianDataBean aoJianData = new AoJianDataBean();
				aoJianData.setZyAoJianGrainNum(aoJian.getAoJianGrainInfoBean().getId());
				aoJianData.setStartDate(new Date());

				// 风道1
				String fd1 = aoJian.getFd1();
				if (!StringUtils.isEmpty(fd1)) {
					String[] fdCableIndex = fd1.split(",");
					String fd1TemStr = "";
					String fd1HumStr = "";
					String fdfjsz = aoJian.getFdfjsz();
					for (int i = 0; i < fdCableIndex.length; i++) {
						String sqlFd1 = ""; 
						// if("single".equals(fdfjsz)||StringUtils.isEmpty(fdfjsz)){
						sqlFd1 = "select  * from " + curTableName + " where fjType ='fd' and sensorNum='" + fdCableIndex[i] + "' and fjNum = '" 
						+ aoJian.getFjGrainIndex() + "' and createTime > '" +getRecentOneHour()+ "' order by createTime desc limit " + jzCount;
						// }else{
						// sqlFd1 =
						// "select top 1 * from "+curTableName+" where fjType ='fd' and sensorNum='"+fdCableIndex[i]+"'  order by createTime desc";
						// }
						try {
							ResultSet rs0 = null;
							rs0 = state.executeQuery(sqlFd1);
							boolean isFuzhi[] = new boolean[2];
							while (rs0.next()) {
								if(isFuzhi[0]&&isFuzhi[1]){
									break;
								}
								if ( rs0.getDouble("temperature")-WebConstConfig.errorData != 0&&!isFuzhi[0]) {
									fd1TemStr = fd1TemStr + rs0.getDouble("temperature")+"" ;
									isFuzhi[0] = true;
//									fd1TemStr = fd1TemStr + rs0.getDouble("temperature") + ",";
								}
								if ( rs0.getDouble("humidity")-WebConstConfig.errorData != 0&&!isFuzhi[1]) {
									fd1HumStr = fd1HumStr + rs0.getDouble("humidity")+"" ;
									isFuzhi[1] = true;
								} 
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
					if (!StringUtils.isEmpty(fd1TemStr)) {
						aoJianData.setFd1Tem(fd1TemStr);
					}
					if (!StringUtils.isEmpty(fd1HumStr)) {
						aoJianData.setFd1Hum(fd1HumStr);
					}
				}
				// 风道2
				String fd2 = aoJian.getFd2();
				if (!StringUtils.isEmpty(fd2)) {
					String[] fdCableIndex2 = fd2.split(",");
					String fd2TemStr = "";
					String fd2HumStr = "";
					String fdfjsz = aoJian.getFdfjsz();
					for (int i = 0; i < fdCableIndex2.length; i++) {
						String sqlFd1 = "";
						// if("single".equals(fdfjsz)||StringUtils.isEmpty(fdfjsz)){
						sqlFd1 = "select  * from " + curTableName + " where fjType ='fd' and sensorNum='" + fdCableIndex2[i] + "' and fjNum = '" 
						+ aoJian.getFjGrainIndex() + "' and createTime > '" +getRecentOneHour()+ "'  order by createTime desc limit " + jzCount;
						// }else{
						// sqlFd1 =
						// "select top 1 * from "+curTableName+" where fjType ='fd' and sensorNum='"+fdCableIndex2[i]+"'  order by createTime desc";
						// }
						try {
							ResultSet rs0 = null;
							rs0 = state.executeQuery(sqlFd1);
							boolean isFuzhi[] = new boolean[2];
							while (rs0.next()) {
								if(isFuzhi[0]&&isFuzhi[1]){
									break;
								}
								if ( rs0.getDouble("temperature")-WebConstConfig.errorData != 0&&!isFuzhi[0]) {
									fd2TemStr = fd2TemStr + rs0.getDouble("temperature")+"" ;
									isFuzhi[0] = true;
								}
								if ( rs0.getDouble("humidity")-WebConstConfig.errorData != 0&&!isFuzhi[1]) {
									fd2HumStr = fd2HumStr + rs0.getDouble("humidity")+"" ;
									isFuzhi[1] = true;
								} 
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
					if (!StringUtils.isEmpty(fd2TemStr)) {
						aoJianData.setFd2Tem(fd2TemStr);
					}
					if (!StringUtils.isEmpty(fd2HumStr)) {
						aoJianData.setFd2Hum(fd2HumStr);
					}
				}
				// 大气
				List<Double> outerTemList = new ArrayList<Double>();
				List<Double> outerHumList = new ArrayList<Double>();
				BaseSettingBean baseSettingBean = ServiceManager.getBaseSettingServiceImpl().findValueByKey("dqtdh");
				String dqtdh = baseSettingBean.getValue();
				if(!StringUtils.isEmpty(dqtdh)){
					String[] dqtdhArr = dqtdh.split(",");
					for (int i = 0; i < dqtdhArr.length; i++) {
						String sql0 = "select  * from " + curTableName + " where fjType ='dq' and sensorNum='" + dqtdhArr[i] + "' and createTime > '" +getRecentOneHour()+ "'  order by createTime desc limit " + jzCount;
						try {
							ResultSet rs0 = null;
							rs0 = state.executeQuery(sql0);
							boolean isFuzhi[] = new boolean[2];
							while (rs0.next()) {
								if(isFuzhi[0]&&isFuzhi[1]){
									break;
								}
								if (rs0.getDouble("temperature")-WebConstConfig.errorData != 0&&!isFuzhi[0]) {
									outerTemList.add(rs0.getDouble("temperature"));
									isFuzhi[0] = true;
									
								}
								if (rs0.getDouble("humidity")-WebConstConfig.errorData != 0&&!isFuzhi[1]) {
									outerHumList.add(rs0.getDouble("humidity"));
									isFuzhi[1] = true;
								}
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
					} 
				}
				aoJianData.setOuterTem(MathUtil.getAgeValue(outerTemList));
				aoJianData.setOuterHumidity(MathUtil.getAgeValue(outerHumList));

				// 仓温仓湿
				List<Double> perTemList = new ArrayList<Double>();
				List<Double> perHumList = new ArrayList<Double>();
				String barnTemHumNumStr = aoJian.getBarnTemHumNumStr();
				if(!StringUtils.isEmpty(barnTemHumNumStr)){
					String[] barnTemHumNumStrArr = barnTemHumNumStr.split(",");
					for (int i = 0; i < barnTemHumNumStrArr.length; i++) {
						String sql1 = "select  * from " + curTableName + " where fjType ='cn' and sensorNum='" + barnTemHumNumStrArr[i].trim() + "' and createTime > '" +getRecentOneHour()+ "' order by createTime desc limit " + jzCount;
						try {
							ResultSet rs0 = null;
							boolean isFuzhi[] = new boolean[2];
							rs0 = state.executeQuery(sql1);
							while (rs0.next()) {
								if(isFuzhi[0]&&isFuzhi[1]){
									break;
								}
								if (rs0.getDouble("temperature")-WebConstConfig.errorData != 0&&!isFuzhi[0]) {
									perTemList.add(rs0.getDouble("temperature"));
									isFuzhi[0] = true;
								}
								if (rs0.getDouble("humidity")-WebConstConfig.errorData != 0&&!isFuzhi[1]) {
									perHumList.add(rs0.getDouble("humidity"));
									isFuzhi[1] = true;
								}
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}
				aoJianData.setAoJianTem(MathUtil.getAgeValue(perTemList));
				aoJianData.setAoJianhumidity(MathUtil.getAgeValue(perHumList));

				// 粮堆
				String sql = "";
				ResultSet rs = null;
				List<ArrangementDataBean> arrangeBeanList = ServiceManager.getSensorArrangementServiceImpl().getbyAoJianIdAndArrangeId(aoJian.getZyAoJianNum(), sensorArrangementBean);
				for (int i = 0; i < arrangeBeanList.size(); i++) {
					ArrangementDataBean aBean = arrangeBeanList.get(i);
					if (aBean.getIsDelete().equals("0")) {
						SensorDataBean data = new SensorDataBean();
						data.setSensorIndex(aBean.getPosition().trim());
						data.setNoData("0");
						data.setOrderIndex(getOrderIndex(aBean.getPosition()));
						list.add(data);
					} else {
						sql = "select  * from " + curTableName + " where fjType ='ld' and sensorNum ='" + aBean.getProbeNum() + "' and createTime > '" +getRecentOneHour()+ "' order by createTime desc limit " + jzCount;
						System.out.println(sql);
						rs = state.executeQuery(sql);
						SensorDataBean data = new SensorDataBean();
						double tem = 10000;
						double hum = 10000;
						String cableIndex="";
						int probeNum = 0;
						boolean isFuzhi[] = new boolean[4];
						while (rs.next()) {
							if(isFuzhi[0]&&isFuzhi[1]){
								break;
							}
							if(rs.getDouble("temperature")-WebConstConfig.errorData !=0&&!isFuzhi[0]){
								tem = rs.getDouble("temperature");
								isFuzhi[0] = true;
							}
							if(rs.getDouble("humidity")-WebConstConfig.errorData !=0&&!isFuzhi[1]){
								hum = rs.getDouble("humidity");
								isFuzhi[1] = true;
							}
							cableIndex = rs.getString("cableIndex");
							probeNum = rs.getInt("sensorNum");
						}
						data.setTemperature(tem);
						data.setHumidity(hum);
						data.setCableIndex(aBean.getCableIndex());
						data.setProbeNum(probeNum);
						data.setSensorIndex(aBean.getPosition().trim());
						data.setOrderIndex(getOrderIndex(aBean.getPosition()));
						data.setNoData("1");
						// 计算水分和露点--如果温度  湿度值太高 就不计算了吧
						if((data.getHumidity()-WebConstConfig.errorData!=0)&&(data.getTemperature()-WebConstConfig.errorData!=0)){
							data.setWet(new Calc().getWet(grainBean, data.getHumidity(), data.getTemperature()));
							data.setDewPoint(new Calc().getDewPoint(grainBean, data.getHumidity(), data.getTemperature()));
						}else{
							data.setWet(WebConstConfig.errorData);
							data.setDewPoint(WebConstConfig.errorData);
						}
						list.add(data);
					}
				}

				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						rs = null;
					}
				}
				if (state != null) {
					try {
						state.close();
					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						state = null;
					}
				}
				if (conn != null) {
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						conn = null;
					}
				}
				try {
					System.out.println("插入一条开始----");
					ServiceManager.getAoJianBlockService().save(aoJianData);
					for (int i = 0; i < list.size(); i++) {
						SensorDataBean bean = list.get(i);
						bean.setAoJianDataId(aoJianData.getId());
					}
					ServiceManager.getAoJianBlockService().batchSave(list);
					System.out.println("插入一条结束----");
				} catch (Exception e) {
					e.printStackTrace();
				}
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	
	
	private String getRecentOneHour() {
		// TODO Auto-generated method stub
		Date date = CalendarUtil.getNextDate(new Date(), jzTime, 11);
		return CalendarUtil.formatStr(date, CalendarUtil.DATE_FORMAT_MODE4);
	}



	public Integer getOrderIndex(String sensorIndex) {
		String[] posArr = sensorIndex.split(",");
		Integer index = (Integer.valueOf(posArr[0]) + 1) * 1000 + (Integer.valueOf(posArr[1]) + 1) * 10 + Integer.valueOf(posArr[2]);
		return index;
	}

	public boolean clearRemoteData(String endDateStr){
		Connection conn = getSimpleConnection();
		Statement state = null;
		try {
			state = conn.createStatement();	
			List<AoJianBean> aoJianList = ServiceManager.getAoJianServiceImpl().findAll();
			for (int i = 0; i < aoJianList.size(); i++) {
				AoJianBean aoJian = aoJianList.get(i);
				if(!StringUtils.isEmpty(aoJian.getDbName())){//不管是不是空仓  数据也要清
					if(!StringUtils.isEmpty(aoJian.getSensorArrangementbeanId())){
						try {
							String sql = "delete from " +aoJian.getDbName().trim() + " where createTime < '"+endDateStr+"'";
							state.executeUpdate(sql);
						} catch (Exception e) {
							e.printStackTrace();
							continue;
						}
					}
					else{
						continue;
					}
				}
				else{
					continue;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			if (state != null) {
				try {
					state.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					state = null;
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					conn = null;
				}
			}
		}
		return true;
	}
	
	public String getRecentDateStr(){
		String result = "";
		Connection conn = new ExRemoteDBOperater().getConnection("");
		Statement state = null;
		try {
			state = conn.createStatement();
			String sql1 = "select  * from " + dbName+"." +ExRemoteDBOperater.recentTimeTableName + " order by recentTime desc limit 1";
			try {
				ResultSet rs0 = null;
				rs0 = state.executeQuery(sql1);
				while (rs0.next()) {
					result = rs0.getString("recentTime");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (state != null) {
				try {
					state.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					state = null;
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					conn = null;
				}
			}
		}
		return result;
	}
	
	private Connection getSimpleConnection(){
		BaseSettingBean baseSettingSjk = ServiceManager.getBaseSettingServiceImpl().findValueByKey("sjk");
		if (null == baseSettingSjk || StringUtils.isEmpty(baseSettingSjk.getValue())) {
			dbName = "";
		} else {
			dbName = baseSettingSjk.getValue();
		}
		Connection conn = null;
		try {
			String url = "jdbc:mysql://zykj0001.mysql.rds.aliyuncs.com:3306/"+dbName;
//			String url = "jdbc:sqlserver://61.136.153.135:1420;databaseName=" + dbName;
			Class.forName(driver);
			conn = DriverManager.getConnection(url, userName, passwrod);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
