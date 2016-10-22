package com.spring.controller;

import java.net.URL;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.common.dataSource.ExFileOperater;
import com.common.utils.CalendarUtil;
import com.common.utils.FileUtils;
import com.common.utils.StringUtils;

@Controller
public class CommonController {
	/**
	 * 首页
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/testConnection.action")
	@ResponseBody
	public Map<String,String> testConnection(
			HttpServletRequest request, HttpServletResponse response,
			ModelMap model) {
		try {
			Map<String,String> map = new HashMap<String, String>();
			HttpSession s = request.getSession();
			String cacheTime = "";
			if(null != s){
				cacheTime = (String)s.getAttribute("cacheTime");
				if(StringUtils.isEmpty(cacheTime)){
					cacheTime = "0.1";
				}
			}else{
				cacheTime = "0.1";
			}
			String recentTimeStr = "";
			if(!ExFileOperater.isWrite){
				URL path = Thread.currentThread().getContextClassLoader().getResource("");
				String pathStr = path.getPath();
				String[] pathStrArr = pathStr.split("WEB-INF");
				
				String timeWriteInPath =  pathStrArr[0]+ "data/sys/"  + "RecentNewDataTime.txt";
				recentTimeStr = new FileUtils().read(timeWriteInPath);
			}
			
			if(StringUtils.isEmpty(recentTimeStr)){
				Date curDate = new Date();
				recentTimeStr = CalendarUtil.formatStr(curDate, CalendarUtil.DATE_FORMAT_MODE4);
			}
			Date date = CalendarUtil.formatDate(recentTimeStr, CalendarUtil.DATE_FORMAT_MODE4);
			long timeDifference = new Date().getTime()-date.getTime();
			double cacheTimeLong=Double.parseDouble(cacheTime)*3600*1000;
			if(timeDifference-cacheTimeLong>60000){
				map.put("hasNewDataTime", (int)((timeDifference-cacheTimeLong)/1000/60)/60+"小时"+ (int)((timeDifference-cacheTimeLong)/1000/60)%60+"分钟");
				map.put("hasNewData", "false");
			}
			else{
				map.put("hasNewData", "true");
			}
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
