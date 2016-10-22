package com.spring.listener;

import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import com.common.dataSource.ExFileOperater;
import com.common.dataSource.ExRemoteDBOperater;
import com.common.utils.CalendarUtil;
import com.common.utils.StringUtils;
import com.hibernate.baseSettingInfo.domain.BaseSettingBean;
import com.hibernate.timers.timerTask.CloudTimerTask;
import com.hibernate.timers.utils.TimerTaskUtil;
import com.spring.ServiceManager;

public class SystemTimerServletContextListener implements ServletContextListener {

	public static Timer  timer = new Timer();
	
	public static Timer  writeInTxttimer = new Timer();
	
	public static Timer  clearDataTimer = new Timer();
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		if(null != timer){
			timer.cancel();
		}
		if(null != writeInTxttimer){
			writeInTxttimer.cancel();
		}
		if(null != clearDataTimer){
			clearDataTimer.cancel();
		}
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		TimerTaskUtil.loadTimerTasks();
		timer.schedule(new CloudTimerTask(),0,1000);
		initWriteInTxttimer();
		arg0.getServletContext().log("------------------定时任务开始启动--------------------");
		
		clearDataTimer.schedule(new ClearRemoteDataTimerTask(),0,1000*60);//启动之后--1分钟执行一次
	}
	
	private void initWriteInTxttimer(){
		writeInTxttimer.schedule(new WriteInTxttimerTask(),0,1000*60);//启动之后--1分钟执行一次
	}
}


class ClearRemoteDataTimerTask extends TimerTask{
	
	@Override
	public void run() {
		try {
			clearRemoteData();//清除远程数据
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private void clearRemoteData(){
		ExRemoteDBOperater eo = new ExRemoteDBOperater();
		String recentDateStr = eo.getRecentDateStr();
		String dateStr = "";
		if(!StringUtils.isEmpty(recentDateStr)){
			try {
				dateStr = CalendarUtil.formatStr(recentDateStr, CalendarUtil.DATE_FORMAT_MODE4, CalendarUtil.DATE_FORMAT_MODE1);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else{
			return;
		}
		String todayStr = CalendarUtil.formatStr(new Date(), CalendarUtil.DATE_FORMAT_MODE1);
		if(dateStr.equals(todayStr)){//今天有数据，就清理
			String qlsj = "01:15";//默认晚上一点15分
			String blsj = "10"; //默认10天
			BaseSettingBean bsBean = ServiceManager.getBaseSettingServiceImpl().findValueByKey("blsj");
			if(null != bsBean&&!StringUtils.isEmpty(bsBean.getValue())){
				blsj = bsBean.getValue();
			}
			BaseSettingBean qlBean = ServiceManager.getBaseSettingServiceImpl().findValueByKey("qlsj");
			if(null != qlBean&&!StringUtils.isEmpty(qlBean.getValue())){
				qlsj = qlBean.getValue();
			}
			String curDateStr = CalendarUtil.formatStr(new Date(), CalendarUtil.DATE_FORMAT_MODE2);
			if(curDateStr.contains(qlsj)){//时间到了，向前推十天
				Date startDate = CalendarUtil.getNextDate(new Date(), -Integer.parseInt(blsj), 5); // 7前3周的数据
				String endDateStr = CalendarUtil.formatStr(startDate, CalendarUtil.DATE_FORMAT_MODE4);
				eo.clearRemoteData(endDateStr);
			}
		}else{
			return;
		}
	}
}


class WriteInTxttimerTask extends TimerTask{
	@Override
	public void run() {
		try {
			writeFile();//写文件
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	 
	private void writeFile(){
		ExFileOperater eo = new ExFileOperater();
		eo.writeRecentDateIntoFile();
	}
}
