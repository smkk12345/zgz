package com.spring.filter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.filter.OncePerRequestFilter;

import com.common.consts.Contanst;
import com.common.consts.WebConstConfig;
import com.common.utils.RequestUtil;
import com.common.utils.StringUtils;

import com.hibernate.userInfo.damain.RoleBean;
import com.hibernate.userInfo.damain.User;
import com.spring.ServiceManager;
import com.spring.controller.IndexController;

public class SessionFilter extends OncePerRequestFilter {
	
	public SessionFilter(){
		initOperateMap();
	}
	private  Map<String,String> operateMap = null;

	public void initOperateMap(){
		operateMap = new HashMap<String, String>(){{
			put("validate.action", "登陆,用户登录");
			
			put("/xtsz/saveBaseSettingInfo.action", "系统设置,修改基本信息");
			put("/xtsz/saveBarnInfo.action", "系统设置,添加/修改仓房信息");
			put("/xtsz/delBarnList.action", "系统设置,删除仓房");
			put("/xtsz/saveSensorInfo.action", "系统设置,修改传感器信息");
			put("/xtsz/sensorDel.action", "系统设置,删除传感器信息");
			put("/xtsz/saveAlarmInfo.action", "系统设置,修改告警阈值信息");
			put("/xtsz/reSetAlarmInfo.action", "系统设置,重置告警阈值信息");
			put("/xtsz/alarmDel.action", "系统设置,删除自定义告警阈值信息");
			put("/xtsz/saveAoJianInfo.action", "系统设置,修改廒间信息");
			put("/xtsz/exportGrainInfo.action", "系统设置,出仓操作");
			put("/xtsz/delBarnList.action", "系统设置,删除仓房");
			put("/xtsz/updateStoreType.action", "系统设置,修改厫间储粮模式");
			put("/xtsz/saveArrangementInfo.action", "系统设置,修改检测设备布置信息");
			put("/xtsz/delSensorArrangement.action", "系统设置,删除检测设备布置信息");
			put("/xtsz/saveTheme.action", "系统设置,修改主题色调");
			put("/xtsz/updateAoJianArrangement.action", "系统设置,修改廒间检测设备布置信息");
			put("/xtsz/saveGrain.action", "系统设置,维护粮食类别");
			put("/xtsz/delGrain.action", "系统设置,删除粮食类别");
			put("/xtsz/saveSensorInfo.action", "系统设置,新增/修改检测设备传感器");
			put("/xtsz/sensorDel.action", "系统设置,删除检测设备传感器信息");
			put("/xtsz/updateTimerAoJianInfo.action", "系统设置,修改定时检测适用范围");
			put("/xtsz/saveTimerTask.action", "系统设置,修改定时任务");
			put("/xtsz/delTimerTask.action", "系统设置,删除定时任务");
			put("/xtsz/changeStatus.action", "系统设置,修改定时器状态");
			put("/user/saveUserInfo.action","系统设置,编辑用户信息");
			put("/user/updateUserInfo.action","系统设置,编辑用户管辖仓房");
			put("/user/userDel.action","系统设置,删除用户信息");
			put("/user/saveRoleInfo.action","系统设置,编辑用户组信息");
			put("/user/roleDel.action","系统设置,删除用户组信息");
			put("/user/updatePersonDetail.action","系统设置,修改个人信息");
			
			put("/lqjc/updateAoJianData.action","粮情检测,编辑粮情");
			put("/lqjc/deleteAoJianDataById.action","粮情检测,删除粮情");
			put("/lqjc/ytfx_1_1.action","粮情检测,批量生成云图");
			put("/lqjc/ytAllPro.action","粮情检测,生成云图");
			put("/lqjc/realTimeMonitoring.action","粮情检测,实时检测");
			
		}};	
	}
	
	@Override
	protected void doFilterInternal(HttpServletRequest request,
			HttpServletResponse response, FilterChain arg2)
					throws ServletException, IOException {
		
		
		
		// 不过滤的uri，首页不过滤 
		String[] notFilter = new String[] { "login.action",
				"testConnection.action", "validate.action","index.action","chart"
				 };
		
		request.getSession().setAttribute("hasVentilate", WebConstConfig.hasVentilate);
		String url = request.getRequestURI();
		
		// 请求的uri   
		if(!url.contains(".action")){
			arg2.doFilter(request, response); 
			return;
		}
		boolean doFilter = true;  
		for (String s : notFilter) {  
			if (url.indexOf(s) != -1) {  
				// 如果uri中包含不过滤的uri，则不进行过滤   
				doFilter = false;  
				break;  
			}  
		}  
		if (doFilter) { 
			RoleBean role = null;
			try {
				role = (RoleBean)request.getSession().getAttribute("role");
			} catch (Exception e) {
				// TODO: handle exception
			}
			if(Contanst.TEM_STOP){
				if(null != role){
					String authority = role.getRoleAuthority();
					if(authority.substring(38, 39).equals("2")){
//						arg2.doFilter(request, response); 
					}else{
						temStop(response,request);
						return ;
					}
				}
			}
			// 执行过滤   
			// 从session中获取登录者实体   
			User obj = (User)request.getSession().getAttribute("user");  
			if (null == obj) {
				Cookie userNameCookie = RequestUtil.getCookieByName(request, "userName");
				Cookie passwordCookie = RequestUtil.getCookieByName(request, "userPwd");
				if(null!=userNameCookie&&null!=passwordCookie&&!StringUtils.isEmpty(userNameCookie.getValue())&&!StringUtils.isEmpty(passwordCookie.getValue())){
					if(new IndexController().doLogin(userNameCookie.getValue(), passwordCookie.getValue(), request,true)){
						obj=(User)request.getSession().getAttribute("user"); 
						if("5".equals(obj.getRightLevel())){
						}else {
							syncOperateInfo(obj,url,request);
						}
						arg2.doFilter(request, response);
						return;
					}else{
						webExpireInfor(response, request);
					}
				}
				else{
					webExpireInfor(response, request); 
				}
			} else {  
				if("5".equals(obj.getRightLevel())){
				}else {
					syncOperateInfo(obj,url,request);
				}
				// 如果session中存在登录者实体，则继续   
				arg2.doFilter(request, response);  
			}  
		} else {  
			// 如果不执行过滤，则继续   
			arg2.doFilter(request, response);  
		}  
	}
	private void webExpireInfor(HttpServletResponse response,HttpServletRequest request) throws IOException {
		// 如果session中不存在登录者实体，则弹出框提示重新登录   
		// 设置request和response的字符集，防止乱码   
		response.setCharacterEncoding("utf-8");  
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();  
		String loginPage = RequestUtil.getBasePath(request)+"login.action";  
		StringBuilder builder = new StringBuilder();  
		builder.append("<script charset=\"utf-8\" type=\"text/javascript\">");  
		builder.append("alert('网页过期，请重新登录！');");  
		builder.append("window.top.location.href='");  
		builder.append(loginPage);  
		builder.append("';");  
		builder.append("</script>");  
		try {
			out.print(builder.toString());  
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			out.close();
		}
	}
	private void temStop(HttpServletResponse response,HttpServletRequest request) throws IOException {
		// 如果session中不存在登录者实体，则弹出框提示重新登录   
		// 设置request和response的字符集，防止乱码   
		response.setCharacterEncoding("utf-8");  
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();  
		String loginPage = RequestUtil.getBasePath(request)+"index.action";  
		StringBuilder builder = new StringBuilder();  
		builder.append("<script charset=\"utf-8\" type=\"text/javascript\">");  
		builder.append("window.top.location.href='");  
		builder.append(loginPage);  
		builder.append("';");  
		builder.append("</script>");  
		try {
			out.print(builder.toString());  
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			out.close();
		}
		
	}
	/**
	 * 记录用户的操作信息
	 * @param user
	 * @param url
	 */
	public void syncOperateInfo(User user,String url,HttpServletRequest request){
		
//		Iterator<String> it = operateMap.keySet().iterator();
//		Date curDate = new Date();
//		OperateRecordBean bean = new OperateRecordBean();
//		bean.setOperateTime(curDate);
//		bean.setOperateUserId(user.getId());
//		while (it.hasNext()) {
//			String key = (String) it.next();
//			if(url.contains(key)){
//				String valueStr = operateMap.get(key);
//				String[] valueArr = valueStr.split(",");
//				bean.setOperateType(valueArr[0]);
//				bean.setOperateInfo(valueArr[1]+fillOperateInfo(url,user,request));
//				try {
//					ServiceManager.getOperateRecordServiceImpl().save(bean);
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//				break;
//			}
//		}
	}
	
	/**
	 * 组装操作信息
	 * @return
	 */
	private String fillOperateInfo(String url,User user,HttpServletRequest request){
		String operateStr = "";
//		if(url.contains("/xtsz/saveBarnInfo.action")){
//			String barnIndex = RequestUtil.getRequestParameter(request, "barnIndex");
//			operateStr = "("+barnIndex+"仓)";
//			return operateStr;
//		}else if(url.contains("xtsz/delBarnList.action")){
//		 	String barnId = RequestUtil.getRequestParameter(request, "beanId");
//	 		BarnBean barn = ServiceManager.getBarnServiceImpl().getById(barnId);
//	 		operateStr = operateStr + barn.getBarnIndex()+"仓";
//		 	operateStr = "("+operateStr+")";
//		 	return operateStr;
//		}
//		else if(url.contains("xtsz/saveSensorInfo.action")){
//			String sensorName = RequestUtil.getRequestParameter(request, "name");
//			operateStr = "("+sensorName+")";
//			return operateStr;
//		}else if(url.contains("xtsz/sensorDel.action")){
//			String sensorId = RequestUtil.getRequestParameter(request, "curDataId");
//			SensorBean bean = ServiceManager.getSensorServiceImpl().getById(sensorId);
//			operateStr = "("+bean.getSensorName()+")";
//			return operateStr;
//		}else if(url.contains("/user/saveUserInfo.action")){
//			String name = RequestUtil.getRequestParameter(request, "displayName");
//			operateStr = "("+name+")";
//			return operateStr;
//		}else if(url.contains("/user/userDel.action")){
//			String userId = RequestUtil.getRequestParameter(request, "curDataId");
//			User u = ServiceManager.getUserService().getById(userId);
//			operateStr = "("+u.getDisplayName()+")";
//			return operateStr;
//		}else if(url.contains("/user/saveRoleInfo.action")){
//			String name = RequestUtil.getRequestParameter(request, "roleName");
//			operateStr = "("+name+")";
//			return operateStr;
//		}else if(url.contains("/lqjc/updateAoJianData.action")){
//			String aoJianDataId = RequestUtil.getRequestParameter(request, "aoJianDataId");
//			AoJianDataBean aojiandatabean =ServiceManager.getAoJianBlockService().getById(aoJianDataId);
//			AoJianBean aoJian = (AoJianBean) request.getSession(false).getAttribute("aoJian");
//			operateStr = "("+ServiceManager.getBarnServiceImpl().getById(aoJian.getBarnId()).getBarnIndex()+"/"+aoJian.getAoJianIndex()+"仓,"+(aojiandatabean.getStartDate()).toString().substring(0,19)+")";
//			return operateStr;
//		}else if(url.contains("/lqjc/deleteAoJianDataById.action")){
//			String dataId = RequestUtil.getRequestParameter(request, "dataId");
//			AoJianDataBean aojiandatabean =ServiceManager.getAoJianBlockService().getById(dataId);
//			AoJianBean aoJian = (AoJianBean) request.getSession(false).getAttribute("aoJian");
//			operateStr = "("+ServiceManager.getBarnServiceImpl().getById(aoJian.getBarnId()).getBarnIndex()+"/"+aoJian.getAoJianIndex()+"仓,"+(aojiandatabean.getStartDate()).toString().substring(0,19)+")";
//			return operateStr;
//		}else if(url.contains("/xtsz/exportGrainInfo.action")){
//			String aoJianId = RequestUtil.getRequestParameter(request, "aoJianId");
//			AoJianBean aoJian=ServiceManager.getAoJianServiceImpl().getById(aoJianId);
//			operateStr = "("+ServiceManager.getBarnServiceImpl().getById(aoJian.getBarnId()).getBarnIndex()+"/"+aoJian.getAoJianIndex()+"仓)";
//			return operateStr;
//		}

		return operateStr;
	}
}
