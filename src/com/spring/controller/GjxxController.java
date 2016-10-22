package com.spring.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.common.consts.PageConst;
import com.common.consts.WebConstConfig;
import com.common.utils.CalendarUtil;
import com.common.utils.RequestUtil;
import com.common.utils.StringUtils;
import com.hibernate.barnInfo.domain.AoJianBean;
import com.hibernate.sernsorInfo.domain.AlarmDataInfoBean;
import com.hibernate.sernsorInfo.domain.OperateRecordBean;
import com.hibernate.userInfo.damain.RoleBean;
import com.hibernate.userInfo.damain.User;
import com.spring.ServiceManager;

@Controller
public class GjxxController {

	/**
	 * 仓房设置
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping({ "/gjxx/lqgj.action", "/gjxx.action" })
	public ModelAndView lqgj(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		try {
			// 分页设置
			int pageNo = 1;
			int pageSize = 14;
			int recordCount;

			User user = (User) request.getSession().getAttribute("user");
			RoleBean role = (RoleBean) request.getSession().getAttribute("role");
			String userId = "";
			if ("1,2,4,5".contains(role.getId())) {
			} else {
				userId = user.getId();
			}
			if (!StringUtils.isEmpty(RequestUtil.getRequestNumStr(request, "pageNo"))) {
				pageNo = Integer.parseInt(RequestUtil.getRequestNumStr(request, "pageNo"));
			}
			if (!StringUtils.isEmpty(RequestUtil.getRequestNumStr(request, "pageSize"))) {
				pageSize = Integer.parseInt(RequestUtil.getRequestNumStr(request, "pageSize"));
			}
			if (!StringUtils.isEmpty(RequestUtil.getRequestNumStr(request, "recordCount"))) {
				recordCount = Integer.parseInt(RequestUtil.getRequestNumStr(request, "recordCount"));
			} else {
				recordCount = ServiceManager.getAlarmDataInfoServiceImpl().getAlarmNumByStatus("0", userId);
			}

			List<AlarmDataInfoBean> alarmDataInfoList = ServiceManager.getAlarmDataInfoServiceImpl().getAlarmListByStatus("0", pageNo, pageSize, userId);
			model.addAttribute("alarmDataInfoList", alarmDataInfoList);
			// 模板路径 basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "GJXX");
			model.addAttribute("CURENT_TAB_2", "GJCX");
			model.addAttribute("CURENT_TAB_3", "WQRGJ");
			// 分页显示属性
			model.addAttribute("pageNo", pageNo);
			model.addAttribute("pageSize", pageSize);
			model.addAttribute("recordCount", recordCount);
			return new ModelAndView(PageConst.GJXX_LQGJ, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;

		}
	}

	/**
	 * 仓房设置
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping({ "/gjxx/lqgj1.action" })
	public ModelAndView lqgj1(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		try {
			Date endDate = new Date();
			Date startDate = CalendarUtil.getNextDate(endDate, -21, 5); // 7前3周的数据
			// 分页设置
			int pageNo = 1;
			int pageSize = 14;
			int recordCount;
			if (!StringUtils.isEmpty(RequestUtil.getRequestNumStr(request, "pageNo"))) {
				pageNo = Integer.parseInt(RequestUtil.getRequestNumStr(request, "pageNo"));
			}
			if (!StringUtils.isEmpty(RequestUtil.getRequestNumStr(request, "pageSize"))) {
				pageSize = Integer.parseInt(RequestUtil.getRequestNumStr(request, "pageSize"));
			}
			User user = (User) request.getSession().getAttribute("user");
			RoleBean role = (RoleBean) request.getSession().getAttribute("role");
			String userId = "";
			if ("1,2,4,5".contains(role.getId())) {
			} else {
				userId = user.getId();
			}
			
			if (!StringUtils.isEmpty(RequestUtil.getRequestNumStr(request, "recordCount"))) {
				recordCount = Integer.parseInt(RequestUtil.getRequestNumStr(request, "recordCount"));
			} else {
				recordCount = ServiceManager.getAlarmDataInfoServiceImpl().getTotalNumByDate(startDate, endDate, userId);

			}

			List<AlarmDataInfoBean> alarmDataInfoList = ServiceManager.getAlarmDataInfoServiceImpl().getAlarmListByDate(startDate, endDate, pageNo, pageSize, userId);
			model.addAttribute("alarmDataInfoList", alarmDataInfoList);
			// 模板路径 basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "GJXX");
			model.addAttribute("CURENT_TAB_2", "GJCX");
			model.addAttribute("CURENT_TAB_3", "YZGJ");

			// 分页显示属性
			model.addAttribute("pageNo", pageNo);
			model.addAttribute("pageSize", pageSize);
			model.addAttribute("recordCount", recordCount);
			return new ModelAndView(PageConst.GJXX_LQGJ1, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;

		}
	}

	/**
	 * 仓房设置
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping({ "/gjxx/lqgj2.action" })
	public ModelAndView lqgj2(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		try {
			Date endDate = new Date();
			Date startDate = CalendarUtil.getNextDate(endDate, -3, Calendar.MONTH); // 前3月的数据
			// 分页设置
			int pageNo = 1;
			int pageSize = 14;
			int recordCount;
			if (!StringUtils.isEmpty(RequestUtil.getRequestNumStr(request, "pageNo"))) {
				pageNo = Integer.parseInt(RequestUtil.getRequestNumStr(request, "pageNo"));
			}
			if (!StringUtils.isEmpty(RequestUtil.getRequestNumStr(request, "pageSize"))) {
				pageSize = Integer.parseInt(RequestUtil.getRequestNumStr(request, "pageSize"));
			}
			User user = (User) request.getSession().getAttribute("user");
			RoleBean role = (RoleBean) request.getSession().getAttribute("role");
			String userId = "";
			if ("1,2,4,5".contains(role.getId())) {
			} else {
				userId = user.getId();
			}
			if (!StringUtils.isEmpty(RequestUtil.getRequestNumStr(request, "recordCount"))) {
				recordCount = Integer.parseInt(RequestUtil.getRequestNumStr(request, "recordCount"));
			} else {
				recordCount = ServiceManager.getAlarmDataInfoServiceImpl().getTotalNumByDate(startDate, endDate, userId);

			}
			// 获取数据
			List<AlarmDataInfoBean> alarmDataInfoList = ServiceManager.getAlarmDataInfoServiceImpl().getAlarmListByDate(startDate, endDate, pageNo, pageSize, userId);

			model.addAttribute("alarmDataInfoList", alarmDataInfoList);
			// 模板路径 basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "GJXX");
			model.addAttribute("CURENT_TAB_2", "GJCX");
			model.addAttribute("CURENT_TAB_3", "YYGJ");

			// 分页显示属性
			model.addAttribute("pageNo", pageNo);
			model.addAttribute("pageSize", pageSize);
			model.addAttribute("recordCount", recordCount);

			return new ModelAndView(PageConst.GJXX_LQGJ2, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;

		}
	}

	/**
	 * 仓房设置
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping({ "/gjxx/lqgj3.action" })
	public ModelAndView lqgj3(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		try {
			String aoJianId = RequestUtil.getRequestParameter(request, "aoJianId");
			String userId = RequestUtil.getRequestParameter(request, "userId");
			String alarmType = RequestUtil.getRequestParameter(request, "alarmType");
			String startDateStr = RequestUtil.getRequestParameter(request, "startDate");
			String endDateStr = RequestUtil.getRequestParameter(request, "endDate");
			String doSearch = RequestUtil.getRequestParameter(request, "doSearch");
			String status = RequestUtil.getRequestParameter(request, "status");

			if ("do".equals(doSearch)) {
				StringBuffer sb = new StringBuffer();
				if (!StringUtils.isEmpty(aoJianId) && !aoJianId.equals("-1")) {
					sb.append(" a.zyAoJianNum='").append(aoJianId).append("' and ");
				}
				
				if (!StringUtils.isEmpty(userId) && !userId.equals("-1")) {
					sb.append(" a.userId='").append(userId).append("' and ");
				}
				if (!StringUtils.isEmpty(alarmType) && !alarmType.equals("-1") && !alarmType.equals("全部")) {
					sb.append(" a.alarmInfoType='").append(alarmType).append("' and ");
				}
				if (!StringUtils.isEmpty(status) && !status.equals("-1") && !status.equals("全部")) {
					sb.append(" a.status='").append(status).append("' and ");
				}
				if (!StringUtils.isEmpty(endDateStr)) {
					sb.append(" a.alarmTime <'").append(endDateStr).append("' and ");
				}
				if (!StringUtils.isEmpty(startDateStr)) {
					sb.append(" a.alarmTime >'").append(startDateStr).append("' and ");
				}
				

				String hql = "";
				if (sb.length() > 0) {
					hql = sb.substring(0, sb.length() - 4);
				}

				// 分页设置
				int pageNo = 1;
				int pageSize = 12;
				int recordCount;
				if (!StringUtils.isEmpty(RequestUtil.getRequestNumStr(request, "pageNo"))) {
					pageNo = Integer.parseInt(RequestUtil.getRequestNumStr(request, "pageNo"));
				}
				if (!StringUtils.isEmpty(RequestUtil.getRequestNumStr(request, "pageSize"))) {
					pageSize = Integer.parseInt(RequestUtil.getRequestNumStr(request, "pageSize"));
				}
				if (!StringUtils.isEmpty(RequestUtil.getRequestNumStr(request, "recordCount"))) {
					recordCount = Integer.parseInt(RequestUtil.getRequestNumStr(request, "recordCount"));
				} else {
					recordCount = ServiceManager.getAlarmDataInfoServiceImpl().getTotalNumByHql(hql);

				}

				List<AlarmDataInfoBean> alarmDataInfoList = ServiceManager.getAlarmDataInfoServiceImpl().getAlarmListByHql(hql, pageNo, pageSize);
				// 分页显示属性
				model.addAttribute("doSearch", doSearch);
				model.addAttribute("aoJianId", aoJianId);
				model.addAttribute("userId", userId);
				model.addAttribute("alarmType", alarmType);
				model.addAttribute("startDate", startDateStr);
				model.addAttribute("endDate", endDateStr);
				model.addAttribute("status", status);

				model.addAttribute("pageNo", pageNo);
				model.addAttribute("pageSize", pageSize);
				model.addAttribute("recordCount", recordCount);
				// 数据
				model.addAttribute("alarmDataInfoList", alarmDataInfoList);
			}

			// 鳌间列表+
			User user = (User) request.getSession(false).getAttribute("user");
			String aoJianIds = user.getRight_Content();
			List<AoJianBean> aoJianList = new ArrayList<AoJianBean>();
			if (!"all".equals(aoJianIds)) {
				if(!StringUtils.isEmpty(aoJianIds)){
					String[] aoJianIdArr = aoJianIds.split(",");
					for (int i = 0; i < aoJianIdArr.length; i++) {
						AoJianBean bean = ServiceManager.getAoJianServiceImpl().getById(aoJianIdArr[i]);
						aoJianList.add(bean);
					}
				}
			} else {
				aoJianList = ServiceManager.getAoJianServiceImpl().findAll();
			}
			
			model.addAttribute("aoJianList", aoJianList);
			// 库管员 列表
			// 库中库管员Id为3 默认入库 不可手动修改
			List<User> userList = ServiceManager.getUserService().getListByRoleId("3");
			model.addAttribute("userList", userList);
			// 告警类别
			List<String> alarmTypeList = new ArrayList<String>() {
				{
					add("粮情告警");
				}
			};
			// 二级信息
			List<String> secondAlarmTypes = new ArrayList<String>() {
				{
					add("全部");
					add("温度告警");
					add("湿度告警");
					add("水份告警");
				}
			};

			model.addAttribute("secondAlarmTypes", secondAlarmTypes);
			model.addAttribute("alarmTypeList", alarmTypeList);
			// 状态
			List<String> alarmStatusList = new ArrayList<String>() {
				{
					add("全部");
					add("未确认");
					add("已确认");
				}
			};

			model.addAttribute("alarmStatusList", alarmStatusList);
			// 模板路径 basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "GJXX");
			model.addAttribute("CURENT_TAB_2", "GJCX");
			model.addAttribute("CURENT_TAB_3", "ZHCX");

			return new ModelAndView(PageConst.GJXX_LQGJ3, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;

		}
	}

	/**
	 * 操作查询
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @return
	 */
	@RequestMapping({ "/gjxx/czcx.action" })
	public ModelAndView czcx(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		try {
			String operateType = RequestUtil.getRequestParameter(request, "operateType");
			String userId = RequestUtil.getRequestParameter(request, "userId");
			String startDateStr = RequestUtil.getRequestParameter(request, "startDate");
			String endDateStr = RequestUtil.getRequestParameter(request, "endDate");
			String operateInfo = RequestUtil.getRequestParameter(request, "operateInfo");
			String doSearch = RequestUtil.getRequestParameter(request, "doSearch");

			StringBuffer sb = new StringBuffer();
			if (!StringUtils.isEmpty(operateType) && !operateType.equals("-1")) {
				sb.append(" a.operateType='").append(operateType).append("' and ");
			}
			if (!StringUtils.isEmpty(userId) && !userId.equals("-1")) {
				sb.append(" a.operateUserId='").append(userId).append("' and ");
			}
			if (!StringUtils.isEmpty(operateInfo)) {
				sb.append(" a.operateInfo like '%").append(operateInfo).append("%' and ");
			}
			if (!StringUtils.isEmpty(endDateStr)) {
				sb.append(" a.operateTime <'").append(endDateStr).append("' and ");
			}
			if (!StringUtils.isEmpty(startDateStr)) {
				sb.append(" a.operateTime >'").append(startDateStr).append("' and ");
			}
			String hql = "";
			if (sb.length() > 0) {
				hql = sb.substring(0, sb.length() - 4);
			}
			// 分页设置
			int pageNo = 1;
			int pageSize = 13;
			int recordCount;
			int defaultCounts = 100;// 默认页面显示数量
			if (!StringUtils.isEmpty(RequestUtil.getRequestNumStr(request, "pageNo"))) {
				pageNo = Integer.parseInt(RequestUtil.getRequestNumStr(request, "pageNo"));
			}
			if (!StringUtils.isEmpty(RequestUtil.getRequestNumStr(request, "pageSize"))) {
				pageSize = Integer.parseInt(RequestUtil.getRequestNumStr(request, "pageSize"));
			}
			if (!StringUtils.isEmpty(RequestUtil.getRequestNumStr(request, "recordCount"))) {
				recordCount = Integer.parseInt(RequestUtil.getRequestNumStr(request, "recordCount"));
			} else {
				int recordNum = ServiceManager.getOperateRecordServiceImpl().getTotalNumByHql(hql);
				if ("do".equals(doSearch)) {
					recordCount = recordNum;
				} else {
					if (recordNum > defaultCounts) {
						recordCount = defaultCounts;
					} else {
						recordCount = recordNum;
					}
				}
			}
			List<OperateRecordBean> operateRecordList;
			if ("do".equals(doSearch)) {
				operateRecordList = ServiceManager.getOperateRecordServiceImpl().getOperateRecordByHql(hql, pageNo, pageSize);
			} else {
				operateRecordList = ServiceManager.getOperateRecordServiceImpl().getOperateRecordByPageSize(defaultCounts, pageNo, pageSize);
			}

			List<User> userList = ServiceManager.getUserService().findAll();
			model.addAttribute("userList", userList);

			List<String> operateTypeList = ServiceManager.getOperateRecordServiceImpl().getOperateTypeList();
			model.addAttribute("operateTypeList", operateTypeList);
			// 分页显示属性
			model.addAttribute("operateType", operateType);
			model.addAttribute("userId", userId);
			model.addAttribute("startDate", startDateStr);
			model.addAttribute("endDate", endDateStr);
			model.addAttribute("operateInfo", operateInfo);
			model.addAttribute("doSearch", doSearch);

			model.addAttribute("pageNo", pageNo);
			model.addAttribute("pageSize", pageSize);
			model.addAttribute("recordCount", recordCount);
			// 数据
			model.addAttribute("operateRecordList", operateRecordList);
			// 模板路径 basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "GJXX");
			model.addAttribute("CURENT_TAB_2", "CZCX");
			return new ModelAndView(PageConst.GJXX_CZCX, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;

		}
	}

	/**
	 * @名称: changeStatus
	 * @日期：2015-9-26 上午10:36:55
	 * @作者： lxb
	 * @描述: 修改为全部已阅，或者单个已阅操作
	 * @参数 @param request
	 * @参数 @param response
	 * @参数 @param model
	 * @返回值 void
	 * @异常
	 */
	@RequestMapping({ "/gjxx/changeStatus.action" })
	public void changeStatus(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		String operateType = RequestUtil.getRequestParameter(request, "operateType");
		if ("all".equals(operateType)) {
			User user = (User) request.getSession().getAttribute("user");
			ServiceManager.getAlarmDataInfoServiceImpl().changeAllAlarmStatusByUserId(user.getId());
		} else if ("allSearch".equals(operateType)) {
			String aoJianId = RequestUtil.getRequestParameter(request, "aoJianId");
			String userId = RequestUtil.getRequestParameter(request, "userId");
			String alarmType = RequestUtil.getRequestParameter(request, "alarmType");
			String startDateStr = RequestUtil.getRequestParameter(request, "startDate");
			String endDateStr = RequestUtil.getRequestParameter(request, "endDate");
			String status = RequestUtil.getRequestParameter(request, "status");

			StringBuffer sb = new StringBuffer();
			if (!StringUtils.isEmpty(aoJianId) && !aoJianId.equals("-1")) {
				sb.append(" zyAoJianNum='").append(aoJianId).append("' and ");
			}
			if (!StringUtils.isEmpty(userId) && !userId.equals("-1")) {
				sb.append(" userId='").append(userId).append("' and ");
			}
			if (!StringUtils.isEmpty(alarmType) && !alarmType.equals("-1") && !alarmType.equals("全部")) {
				sb.append(" alarmInfoType='").append(alarmType).append("' and ");
			}
			if (!StringUtils.isEmpty(status) && !status.equals("-1") && !status.equals("全部")) {
				sb.append(" status='").append(status).append("' and ");
			}
			if (!StringUtils.isEmpty(endDateStr)) {
				sb.append(" alarmTime <'").append(endDateStr).append("' and ");
			}
			if (!StringUtils.isEmpty(startDateStr)) {
				sb.append(" alarmTime >'").append(startDateStr).append("' and ");
			}

			String hql = "";
			if (sb.length() > 0) {
				hql = sb.substring(0, sb.length() - 4);
			}

			ServiceManager.getAlarmDataInfoServiceImpl().changeAllAlarmStatusByHql(hql);
		} else {
			String alarmDataId = RequestUtil.getRequestParameter(request, "alarmDataId");
			ServiceManager.getAlarmDataInfoServiceImpl().changeAlarmStatusById(alarmDataId);
		}
	}
}
