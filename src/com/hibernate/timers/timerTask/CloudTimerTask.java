package com.hibernate.timers.timerTask;

import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;
import java.util.TimerTask;

import com.common.utils.CalendarUtil;
import com.common.utils.FileUtils;
import com.common.utils.StringUtils;
import com.hibernate.baseSettingInfo.domain.BaseSettingBean;
import com.hibernate.timers.domain.TimerTaskBean;
import com.hibernate.timers.utils.DateUtil;
import com.hibernate.timers.utils.TimerTaskUtil;
import com.spring.ServiceManager;
import com.sun.corba.se.spi.activation.ServerManager;

public class CloudTimerTask extends TimerTask {
	
	private boolean isRunning = false;
	/**
	 * 定时器run方法，判断定时器是否执行逻辑
	 */
	@Override
	public void run() {
		if(!isRunning){
			isRunning = true;
			execute();
			isRunning = false;
		}
	} 
	/**
	 * 调用定时器
	 */
	private void execute(){
		long now = System.currentTimeMillis();
		long endTime = 0;
		for(int i = 0;i<TimerTaskUtil.timerTasks.size();i++){
			TimerTaskBean task = TimerTaskUtil.timerTasks.get(i);
			if(task.getStopTime() != null){
				endTime = task.getStopTime().getTime() - now;
			}
			if(endTime>=0){
//				if(isStartBefore5Min(task,now)){
//					TimerTaskUtil.callTask(task.getId(),"","before5Min",task.getAoJianIds());
//				}
				if(isStart(task,now)){
					TimerTaskUtil.callTask(task.getId(),"","",task.getAoJianIds());
				}
			}
		}
	}

//	private boolean isRealTime() {
//		URL path = Thread.currentThread().getContextClassLoader().getResource("");
//		String pathStr = path.getPath();
//		String[] pathStrArr = pathStr.split("WEB-INF");
//		String timeWriteInPath = pathStrArr[0] + "data/sys/" + "RecentNewDataTime.xml";
//		String timeStr = new FileUtils().read(timeWriteInPath);
//		if (StringUtils.isEmpty(timeStr)) {
//			Date curDate = new Date();
//			timeStr = CalendarUtil.formatStr(curDate, CalendarUtil.DATE_FORMAT_MODE4);
//		}
//		Date date = new Date();
//		try {
//			date = CalendarUtil.formatDate(timeStr, CalendarUtil.DATE_FORMAT_MODE4);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		String cacheTime = "";
//		BaseSettingBean bsBean = ServiceManager.getBaseSettingServiceImpl().findValueByKey("cacheTime");
//		if(null == bsBean){
//			cacheTime = "0.15";
//		}else{
//			cacheTime = bsBean.getValue();
//		}
//		long timeDifference = new Date().getTime() - date.getTime();
//		double cacheTimeLong = Double.parseDouble(cacheTime) * 3600 * 1000;
//		if (timeDifference - cacheTimeLong > 60000) {
//			return false;
//		}else{
//			return true;
//		}
//	}
	
	public static String getPriMonth(int num){
		String str = "";   
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM");       

		Calendar lastDate = Calendar.getInstance();   
		lastDate.set(Calendar.DATE,1);//设为当前月的1号   
		lastDate.add(Calendar.MONTH,num);//减一个月，变为下月的1号   
		str=sdf.format(lastDate.getTime());   
		return str;     

	}

	/**
	 * 处理定时器单位为月，年
	 * 没做年月的周期性逻辑，后面需要自行添加
	 * 月周期，年，  月末逻辑未添加   不确定是30号还是月末
	 * @param map
	 */
	private boolean isStartByCalendar(TimerTaskBean task, long now){
		Date startDate = task.getStartTime();
		Date sysDate = new Date();
		//		Calendar
		String startDateStr = DateUtil.getStringDateByType("yyyy-MM-dd hh:mm:ss",task.getStartTime());
		String sysDateStr = DateUtil.getStringDateByType("yyyy-MM-dd hh:mm:ss");
		if(task.getUnits().equals("月")){
			int month = task.getStartTime().getMonth();
			month = sysDate.getMonth() - month;
			if((task.getPeriod()>0&&month%task.getPeriod()==0)){

				startDateStr = startDateStr.substring(8);
				sysDateStr = sysDateStr.substring(8);
				if(startDateStr.equals(sysDateStr)){
					return true;
				}
			}
		}
		else if(task.getUnits().equals("年")){
			if(startDateStr.equals(sysDateStr)){
				return true;
			}
		}
		return false;
	}

	/**
	 * 传感器 提前5分钟f105写0操作
	 * @return
	 */
	private boolean isStartBefore5Min(TimerTaskBean task,long now){
		now = now + 5*60*1000;
		long timedistance = (now - task.getStartTime().getTime()) / 1000;
		if(timedistance % getCalcPeriod(task) == 0){
			return true;
		}
		return false;
	}
	
	/**
	 * 是否在运行
	 * @return
	 */
	private boolean isStart(TimerTaskBean task,long now){
		long timedistance = (now - task.getStartTime().getTime()) / 1000;
		if(timedistance % getCalcPeriod(task) == 0){
			return true;
		}
		return false;
	}

	/**
	 * 通过周期和单位计算到秒
	 * @param map
	 */
	private int getCalcPeriod(TimerTaskBean task){
		int result = 0;
		if(task.getUnits().equals("秒")){
			return task.getPeriod();
		}
		if(task.getUnits().equals("分")){
			return task.getPeriod() * 60;
		}
		if(task.getUnits().equals("时")){
			return task.getPeriod() * 60*60;
		}
		if(task.getUnits().equals("日")){
			return task.getPeriod() * 60*60*24;
		}
		if(task.getUnits().equals("周")){
			return task.getPeriod() * 60*60*24*7;
		}
		return result;
	}
}
