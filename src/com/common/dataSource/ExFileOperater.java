package com.common.dataSource;

import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.common.utils.FileUtils;
import com.common.utils.OverTimeXmlUtils;
import com.common.utils.StringUtils;
import com.hibernate.barnInfo.domain.AoJianBean;
import com.hibernate.baseSettingInfo.domain.BaseSettingBean;
import com.spring.ServiceManager;

public class ExFileOperater {
	
	public static boolean isWrite = false;
	
	public String getRecentDateStr(String tableName) {
		String dbName;
		BaseSettingBean baseSettingSjk = ServiceManager.getBaseSettingServiceImpl().findValueByKey("sjk");
		if (null == baseSettingSjk || StringUtils.isEmpty(baseSettingSjk.getValue())) {
			dbName = "";
		} else {
			dbName = baseSettingSjk.getValue();
		}
		String result = "";
		
		Connection conn = new ExRemoteDBOperater().getConnection("");
		if(null == conn){
			return result;
		}
		Statement state = null;
		try {
			state = conn.createStatement();
			String sql1 = "";
			if(!StringUtils.isEmpty(tableName)){
				sql1 = "select  * from " +dbName+"."+ ExRemoteDBOperater.recentTimeTableName + " where tableName='"+tableName +"' order by recentTime desc limit 1";
			}
			else{
				sql1 = "select  * from " +dbName+"."+ ExRemoteDBOperater.recentTimeTableName + " order by recentTime desc limit 1";
			}
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
	
	//现在要做的是   通过廒间 获取表名  然后根据表名、廒间id处理下面逻辑
	private void updateTime(){
		URL path = Thread.currentThread().getContextClassLoader().getResource("");
		String pathStr = path.getPath();
		String[] pathStrArr = pathStr.split("WEB-INF");
		String timeWriteInPath = pathStrArr[0] + "data/sys/" + "RecentNewDataTime.xml";
		List<AoJianBean> aoJians = ServiceManager.getAoJianServiceImpl().findAll();
		String dbName;
		BaseSettingBean baseSettingSjk = ServiceManager.getBaseSettingServiceImpl().findValueByKey("sjk");
		if (null == baseSettingSjk || StringUtils.isEmpty(baseSettingSjk.getValue())) {
			dbName = "";
		} else {
			dbName = baseSettingSjk.getValue();
		}
		Connection conn = new ExRemoteDBOperater().getConnection("");
		if(null == conn){
			return ;
		}
		Statement state = null;
		try {
			state = conn.createStatement();
			//更新最近一次的采集时间，不与廒间挂钩
			String recentTimeStr = "";
			String sql = "select  * from " +dbName+"."+ ExRemoteDBOperater.recentTimeTableName + " order by recentTime desc limit 1";
			try {
				ResultSet rs0 = null;
				rs0 = state.executeQuery(sql);
				while (rs0.next()) {
					recentTimeStr = rs0.getString("recentTime");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			if(!StringUtils.isEmpty(recentTimeStr)){
				OverTimeXmlUtils.updateNodeValue(timeWriteInPath, "common", recentTimeStr);
			}
			//廒间粮情更新时间
			for (int i = 0; i < aoJians.size(); i++) {
				String result = "";
				AoJianBean aoJian = aoJians.get(i);
				String sql1 = "";
				if(!StringUtils.isEmpty(aoJian.getDbName())){
					sql1 = "select  * from " +dbName+"."+ ExRemoteDBOperater.recentTimeTableName + " where tableName='"+aoJian.getDbName() +"' order by recentTime desc limit 1";
				}
				else{
					sql1 = "select  * from " +dbName+"."+ ExRemoteDBOperater.recentTimeTableName + " order by recentTime desc limit 1";
				}
				try {
					ResultSet rs0 = null;
					rs0 = state.executeQuery(sql1);
					while (rs0.next()) {
						result = rs0.getString("recentTime");
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				if(!StringUtils.isEmpty(result)){
					OverTimeXmlUtils.updateNodeValue(timeWriteInPath, aoJian.getZyAoJianNum(), result);
				}
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
		
	}
	
	


	public void writeRecentDateIntoFile() {
		isWrite = true;
		updateTime();
//		String dateStr = getRecentDateStr("");
//		if(!StringUtils.isEmpty(dateStr)){
//			writeNewDataTime(dateStr);
//		}
		isWrite = false;
	}

	private void writeNewDataTime(String dateStr) {
		URL path = Thread.currentThread().getContextClassLoader().getResource("");
		String pathStr = path.getPath();
		String[] pathStrArr = pathStr.split("WEB-INF");

		String timeWriteInPath = pathStrArr[0] + "data/sys/" + "RecentNewDataTime.xml";
		new FileUtils().write(timeWriteInPath, dateStr);
//		String timeWriteInPath = pathStrArr[0] + "data/sys/" + "RecentNewDataTime.xml";
//		OverTimeXmlUtils.updateNodeValue(timeWriteInPath, nodeName, newValue)
	}
}
