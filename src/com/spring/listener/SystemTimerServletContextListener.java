package com.spring.listener;

import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
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
//		TimerTaskUtil.loadTimerTasks();
//		timer.schedule(new CloudTimerTask(),0,1000);
//		initWriteInTxttimer();
//		arg0.getServletContext().log("------------------定时任务开始启动--------------------");
//		
//		clearDataTimer.schedule(new ClearRemoteDataTimerTask(),0,1000*60);//启动之后--1分钟执行一次
	}
	
	private void initWriteInTxttimer(){
	}
}



