package com.common.dataSource;

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
import com.common.utils.MathUtil;
import com.hibernate.barnInfo.domain.AoJianBean;
import com.hibernate.sernsorInfo.domain.AoJianDataBean;
import com.hibernate.sernsorInfo.domain.SensorArrangementBean;
import com.hibernate.sernsorInfo.domain.SensorDataBean;
import com.spring.ServiceManager;

public class RemoteDBOperater {

	// private static String url = "jdbc:sqlserver://61.136.153.135:1420;databaseName="; // 3146
	// 1420
	private static String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static String passwrod = "Zykj88382980";
	private static String userName = "zykjlqt";

	// private static String dbName = "MY70GL5035";

	public static Connection getConnection(String dbName) {
		Connection conn = null;
		try {
			String url = "jdbc:sqlserver://61.136.153.135:1420;databaseName=" + dbName;
			Class.forName(driver);
			conn = DriverManager.getConnection(url, userName, passwrod);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	private void insertData() {
		String sql = "insert into dbo.linshi";
	}

	private Map<Integer, String> indexRowMap = new HashMap<Integer, String>() {
		{
			put(1, "0,0");
			put(2, "0,2");
			put(3, "0,4");

			put(4, "1,1");
			put(5, "1,3");

			put(6, "2,0");
			put(7, "2,2");
			put(8, "2,4");

			put(9, "3,1");
			put(10, "3,3");

			put(11, "4,0");
			put(12, "4,2");
			put(13, "4,4");
		}
	};
	private Map<Integer, String> indexColumnMap = new HashMap<Integer, String>() {
		{
			put(1, "0,0");
			put(2, "2,0");
			put(3, "4,0");

			put(4, "1,1");
			put(5, "3,1");

			put(6, "0,2");
			put(7, "2,2");
			put(8, "4,2");

			put(9, "1,3");
			put(10, "3,3");

			put(11, "0,4");
			put(12, "2,4");
			put(13, "4,4");
		}
	};

	/**
	 * 1~13是数据点,14点是仓外 15~17 仓内,空间仓尺寸：长：30 宽：18 90度 高 ：4.7
	 */
	public boolean importRemoteData(AoJianBean aoJian) throws Exception {
		List<SensorDataBean> list = new ArrayList<SensorDataBean>();
		try {
			Connection conn = RemoteDBOperater.getConnection(aoJian.getDbName());
			if (null == conn) {
				return false;
			} else {
				Statement state = conn.createStatement();
				String sensorArrangementId = aoJian.getSensorArrangementbeanId();
				SensorArrangementBean sensorArrangementBean = ServiceManager.getSensorArrangementServiceImpl().getById(sensorArrangementId);
				if (null == sensorArrangementBean) {
					System.out.println("sensorArrangement Error");
				}
				AoJianDataBean aoJianData = new AoJianDataBean();
				aoJianData.setZyAoJianGrainNum(aoJian.getAoJianGrainInfoBean().getId());
				aoJianData.setStartDate(new Date());
				List<Double> perTemList = new ArrayList<Double>();
				List<Double> perHumList = new ArrayList<Double>();
				List<Double> outerTemList = new ArrayList<Double>();
				List<Double> outerHumList = new ArrayList<Double>();

				// 14点
				for (int i = 14; i < 18; i++) {
					String sql0 = "select top 1 * from dbo.linshi where [其他]='" + i + "' order by [日期] desc";
					try {
						ResultSet rs0 = null;
						rs0 = state.executeQuery(sql0);
						while (rs0.next()) {
							if (i == 14) {
								if (rs0.getDouble(3) != 0.00) {
									outerTemList.add(rs0.getDouble(3));
								}
								if (rs0.getDouble(7) != 0.00) {
									outerTemList.add(rs0.getDouble(7));
								}
								if (rs0.getDouble(15) != 0.00) {
									outerTemList.add(rs0.getDouble(15));
								}

								if (rs0.getDouble(4) != 0.00) {
									outerHumList.add(rs0.getDouble(4));
								}
								if (rs0.getDouble(8) != 0.00) {
									outerHumList.add(rs0.getDouble(8));
								}
								if (rs0.getDouble(16) != 0.00) {
									outerHumList.add(rs0.getDouble(16));
								}
							} else if (i == 15) {
								if (rs0.getDouble(3) != 0.00) {
									perTemList.add(rs0.getDouble(3));
								}
								if (rs0.getDouble(11) != 0.00) {
									perTemList.add(rs0.getDouble(11));
								}

								if (rs0.getDouble(4) != 0.00) {
									perHumList.add(rs0.getDouble(4));
								}
								if (rs0.getDouble(12) != 0.00) {
									perHumList.add(rs0.getDouble(12));
								}
							} else if (i == 16) {
								if (rs0.getDouble(7) != 0.00) {
									perTemList.add(rs0.getDouble(7));
								}

								if (rs0.getDouble(8) != 0.00) {
									perHumList.add(rs0.getDouble(8));
								}
							} else if (i == 17) {
								if (rs0.getDouble(3) != 0.00) {
									perTemList.add(rs0.getDouble(3));
								}

								if (rs0.getDouble(4) != 0.00) {
									perHumList.add(rs0.getDouble(4));
								}
							}
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				aoJianData.setOuterTem(MathUtil.getAgeValue(outerTemList));
				aoJianData.setOuterHumidity(MathUtil.getAgeValue(outerHumList));
				aoJianData.setAoJianTem(MathUtil.getAgeValue(perTemList));
				aoJianData.setAoJianhumidity(MathUtil.getAgeValue(perHumList));
				try {
					ServiceManager.getAoJianBlockService().save(aoJianData);
				} catch (Exception e) {
					e.printStackTrace();
				}
				String sql = "";
				ResultSet rs = null;
				String indexStrs = "";
				for (int i = 1; i < 14; i++) {
					sql = "select top 2 * from dbo.linshi where [其他]='" + i + "' order by [日期] desc";
					rs = state.executeQuery(sql);
					boolean isFuzhi[] = new boolean[16];
					SensorDataBean data1 = new SensorDataBean();
					SensorDataBean data2 = new SensorDataBean();
					SensorDataBean data3 = new SensorDataBean();
					SensorDataBean data4 = new SensorDataBean();
					while (rs.next()) {
						// 数据Id
						data1.setAoJianDataId(aoJianData.getId());
						data2.setAoJianDataId(aoJianData.getId());
						data3.setAoJianDataId(aoJianData.getId());
						data4.setAoJianDataId(aoJianData.getId());
						// 温度
						if (rs.getDouble(3) != 0 && !isFuzhi[0]) {
							data1.setTemperature(rs.getDouble(3));
							isFuzhi[0] = true;
						}
						if (rs.getDouble(7) != 0 && !isFuzhi[1]) {
							data2.setTemperature(rs.getDouble(7));
							isFuzhi[1] = true;
						}
						if (rs.getDouble(11) != 0 && !isFuzhi[2]) {
							data3.setTemperature(rs.getDouble(11));
							isFuzhi[2] = true;
						}
						if (rs.getDouble(15) != 0 && !isFuzhi[3]) {
							data4.setTemperature(rs.getDouble(15));
							isFuzhi[3] = true;
						}
						// 湿度
						if (rs.getDouble(4) != 0 && !isFuzhi[4]) {
							data1.setHumidity(rs.getDouble(4));
							isFuzhi[4] = true;
						}
						if (rs.getDouble(8) != 0 && !isFuzhi[5]) {
							data2.setHumidity(rs.getDouble(8));
							isFuzhi[5] = true;
						}
						if (rs.getDouble(12) != 0 && !isFuzhi[6]) {
							data3.setHumidity(rs.getDouble(12));
							isFuzhi[6] = true;
						}
						if (rs.getDouble(16) != 0 && !isFuzhi[7]) {
							data4.setHumidity(rs.getDouble(16));
							isFuzhi[7] = true;
						}

						// 水分
						if (rs.getDouble(5) != 0 && !isFuzhi[8]) {
							data1.setWet(rs.getDouble(5));
							isFuzhi[8] = true;
						}
						if (rs.getDouble(9) != 0 && !isFuzhi[9]) {
							data2.setWet(rs.getDouble(9));
							isFuzhi[9] = true;
						}
						if (rs.getDouble(13) != 0 && !isFuzhi[10]) {
							data3.setWet(rs.getDouble(13));
							isFuzhi[10] = true;
						}
						if (rs.getDouble(17) != 0 && !isFuzhi[11]) {
							data4.setWet(rs.getDouble(17));
							isFuzhi[11] = true;
						}

						// 露点
						if (rs.getDouble(6) != 0 && !isFuzhi[12]) {
							data1.setDewPoint(rs.getDouble(6));
							isFuzhi[12] = true;
						}
						if (rs.getDouble(10) != 0 && !isFuzhi[13]) {
							data2.setDewPoint(rs.getDouble(10));
							isFuzhi[13] = true;
						}
						if (rs.getDouble(14) != 0 && !isFuzhi[14]) {
							data3.setDewPoint(rs.getDouble(14));
							isFuzhi[14] = true;
						}
						if (rs.getDouble(18) != 0 && !isFuzhi[15]) {
							data4.setDewPoint(rs.getDouble(18));
							isFuzhi[15] = true;
						}

						// 位置索引生成
						if (sensorArrangementBean.getCableDirection().equals("按行排序")) {
							String curIndexStr = indexRowMap.get(i);
							data4.setSensorIndex(curIndexStr + ",0");
							data3.setSensorIndex(curIndexStr + ",1");
							data2.setSensorIndex(curIndexStr + ",2");
							data1.setSensorIndex(curIndexStr + ",3");
						} else {
							String curIndexStr = indexColumnMap.get(i);
							data4.setSensorIndex(curIndexStr + ",0");
							data3.setSensorIndex(curIndexStr + ",1");
							data2.setSensorIndex(curIndexStr + ",2");
							data1.setSensorIndex(curIndexStr + ",3");
						}

						if (!indexStrs.contains(data1.getSensorIndex())) {
							indexStrs = indexStrs + "#" + data1.getSensorIndex();
						}
						if (!indexStrs.contains(data2.getSensorIndex())) {
							indexStrs = indexStrs + "#" + data2.getSensorIndex();
						}
						if (!indexStrs.contains(data3.getSensorIndex())) {
							indexStrs = indexStrs + "#" + data3.getSensorIndex();
						}
						if (!indexStrs.contains(data4.getSensorIndex())) {
							indexStrs = indexStrs + "#" + data4.getSensorIndex();
						}

						data1.setOrderIndex(getOrderIndex(data1.getSensorIndex()));
						data2.setOrderIndex(getOrderIndex(data2.getSensorIndex()));
						data3.setOrderIndex(getOrderIndex(data3.getSensorIndex()));
						data4.setOrderIndex(getOrderIndex(data4.getSensorIndex()));
						data1.setNoData("1");
						data2.setNoData("1");
						data3.setNoData("1");
						data4.setNoData("1");
					}
					list.add(data1);
					list.add(data2);
					list.add(data3);
					list.add(data4);
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
					list = insertNullData(list, sensorArrangementBean, indexStrs, aoJianData.getId());
					ServiceManager.getAoJianBlockService().batchSave(list);
				} catch (Exception e) {
					e.printStackTrace();
				}
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public List<SensorDataBean> insertNullData(List<SensorDataBean> list, SensorArrangementBean sensorArrangement, String indexStr, String dataBeanId) {
		for (int i = 0; i < sensorArrangement.getRowCount(); i++) {
			for (int j = 0; j < sensorArrangement.getColumnCount(); j++) {
				for (int k = 0; k < sensorArrangement.getLayerCount(); k++) {
					String curIndex = i + "," + j + "," + k;
					if (indexStr.indexOf(curIndex) < 0) {
						SensorDataBean data = new SensorDataBean();
						data.setAoJianDataId(dataBeanId);
						data.setSensorIndex(curIndex);
						data.setNoData("0");
						data.setOrderIndex(getOrderIndex(curIndex));
						list.add(data);
					}
				}
			}
		}
		return list;
	}

	public Integer getOrderIndex(String sensorIndex) {
		String[] posArr = sensorIndex.split(",");
		Integer index = (Integer.valueOf(posArr[0]) + 1) * 1000 + (Integer.valueOf(posArr[1]) + 1) * 10 + Integer.valueOf(posArr[2]);
		return index;
	}

	public static void main(String[] arge0) {
		// List<User> userList = new RemoteDBOperateUtils().getAllUser();
		// for (int i = 0; i < userList.size(); i++) {
		// System.out.println(userList.get(i).getUserName()+"   " +
		// userList.get(i).getDisplayName());
		// }
	}
}
