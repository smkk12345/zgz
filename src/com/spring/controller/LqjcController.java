package com.spring.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.common.adapter.Adapter;
import com.common.consts.ErrorCodeConst;
import com.common.consts.PageConst;
import com.common.consts.WebConstConfig;
import com.common.pointTem.CoordinatorExchangeTemInterface;
import com.common.utils.CalendarUtil;
import com.common.utils.FileUtils;
import com.common.utils.MathUtil;
import com.common.utils.RequestUtil;
import com.common.utils.StringUtils;
import com.hibernate.barnInfo.domain.AoJianBean;
import com.hibernate.barnInfo.domain.AoJianGrainInfoBean;
import com.hibernate.barnInfo.domain.BarnBean;
import com.hibernate.baseSettingInfo.domain.AlarmBean;
import com.hibernate.baseSettingInfo.domain.BaseSettingBean;
import com.hibernate.baseSettingInfo.domain.GrainTypeBean;
import com.hibernate.sernsorInfo.domain.AoJianDataBean;
import com.hibernate.sernsorInfo.domain.SensorArrangementBean;
import com.hibernate.sernsorInfo.domain.SensorDataBean;
import com.hibernate.userInfo.damain.User;
import com.spring.ServiceManager;

@Controller
public class LqjcController {
	/**
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping({ "/lqjc/ssjc.action", "/lqjc.action" })
	public ModelAndView indexPage(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		try {
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "LQJC");
			model.addAttribute("CURENT_TAB_2", "SSJC");
			model.addAttribute("CURENT_TAB_3", "SSJC");
			/**
			 * 如果页面传递时间， 则查询传递时间的数据，如果没有传递时间，则获取最有一天的数据 通过grainId
			 */
			HttpSession s = request.getSession(false);
			AoJianBean bean;
			if (null == s) {
				System.out.println("session失效");
				model.addAttribute("errorCode", ErrorCodeConst.noLogin);
				return new ModelAndView(PageConst.LOGIN, model);
			}
			String aoJianId = RequestUtil.getRequestParameter(request, "aoJianId");
			if (!StringUtils.isEmpty(aoJianId)) {
				bean = ServiceManager.getAoJianServiceImpl().getById(aoJianId);
				BarnBean barnBean = ServiceManager.getBarnServiceImpl().getById(bean.getBarnId());
				AoJianGrainInfoBean grainBean = bean.getAoJianGrainInfoBean();
				String disName = barnBean.getBarnIndex() + "仓(" + bean.getAoJianIndex() + "廒)";
				// 获取阈值信息
				if (null != bean && !"0".equals(bean.getGrainStatus()) && null != grainBean) {
					Map<String, AlarmBean> map = ControllerUtils.getAlarmDataInfo(grainBean);
					s.setAttribute("alarms", map);
					AoJianDataBean aoJianDataBean = ServiceManager.getAoJianBlockService().getRecentAoJianDataBeanByGrainId(bean.getAoJianGrainInfoBean().getId());
					if (null != aoJianDataBean) {
						s.setAttribute("lqIdbean", aoJianDataBean);
					} else {
						s.setAttribute("lqIdbean", null);
					}
				}
				s.setAttribute("disSelectName", disName);
				s.removeAttribute("aoJian");
				s.setAttribute("aoJian", bean);
				User user = (User) s.getAttribute("user");
				user.setCurAoJianId(bean.getZyAoJianNum());
				try {
					ServiceManager.getUserService().update(user);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				bean = (AoJianBean) s.getAttribute("aoJian");
			}

			// 获取粮情记录对象
			AoJianDataBean aoJianDataBean = null;
			if (null == bean || "0".equals(bean.getGrainStatus()) || null == bean.getAoJianGrainInfoBean()) {
				return new ModelAndView(PageConst.LQJC_SSJC, model);
			} else {
				if (s.getAttribute("lqIdbean") != null) {
					aoJianDataBean = (AoJianDataBean) s.getAttribute("lqIdbean");

				} else {
					aoJianDataBean = ServiceManager.getAoJianBlockService().getRecentAoJianDataBeanByGrainId(bean.getAoJianGrainInfoBean().getId());
					s.setAttribute("lqIdbean", aoJianDataBean);
				}
				if (null == aoJianDataBean) {
					model.addAttribute("hasdata", "no");
					return new ModelAndView(PageConst.LQJC_SSJC, model);
				} else {
					model.addAttribute("hasdata", "yes");
				}
			}

			SensorArrangementBean arrangementBean = ServiceManager.getSensorArrangementServiceImpl().getById(bean.getSensorArrangementbeanId());
			// 布置信息 行 列 排 已经廒间信息
			model.addAttribute("arrangementBean", arrangementBean);
			model.addAttribute("aoJianBean", bean);

			BarnBean barnBean = getCurbarnBean(request);
			String fangxiang = null;
			if (barnBean.getAngle() > -45 && barnBean.getAngle() < 45) {// 仓房布置方向
				fangxiang = "NorthSouth";
			} else {
				fangxiang = "EastWest";
			}

			List list = getAoJianDataByAoJianId(aoJianDataBean, arrangementBean, fangxiang);
			JSONArray jsonArr = JSONArray.fromObject(list);
			// json大表核心数据区域
			model.addAttribute("aoJianDataBean", aoJianDataBean);
			model.addAttribute("lqData", jsonArr);
			model.addAttribute("temAvg", aoJianDataBean.getJwz());// 粮堆平均温度
			// 粮情信息
			model.addAttribute("lqID", aoJianDataBean.getId());
			model.addAttribute("ZyGrainID", aoJianDataBean.getZyAoJianGrainNum());
			model.addAttribute("lqtime", CalendarUtil.formatStr(aoJianDataBean.getStartDate(), CalendarUtil.DATE_FORMAT_MODE4));
			model.addAttribute("fangxiang", fangxiang);
			model.addAttribute("angle", barnBean.getAngle());

			String grainType = bean.getAoJianGrainInfoBean().getGrainType();
			GrainTypeBean grainTypeBean = null;
			try {
				grainTypeBean = ServiceManager.getGrainTypeServiceImpl().getById(grainType);
			} catch (Exception e) {
				e.printStackTrace();
			}
			model.addAttribute("grainTypeBean", grainTypeBean);

			// basePath

			return new ModelAndView(PageConst.LQJC_SSJC, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}

	@RequestMapping(value = "/lqjc/selectAoJian.action", method = RequestMethod.POST)
	@ResponseBody
	public Map selectAoJian(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		HttpSession s = request.getSession(false);
		AoJianBean bean;
		String aoJianId = RequestUtil.getRequestParameter(request, "aoJianId");
		bean = ServiceManager.getAoJianServiceImpl().getById(aoJianId);
		if (!StringUtils.isEmpty(aoJianId)) {
			s.removeAttribute("aoJian");
			s.removeAttribute("lqIdbean");
			s.setAttribute("aoJian", bean);
			BarnBean barnBean = ServiceManager.getBarnServiceImpl().getById(bean.getBarnId());
			String disName = barnBean.getBarnIndex() + "仓(" + bean.getAoJianIndex() + "廒)";
			s.setAttribute("disSelectName", disName);
			ControllerUtils.updateAlarmInSession(bean, s);
		}
		Map map = new HashMap<String, String>();
		return map;
	}

	@RequestMapping(value = "/lqjc/selectLq.action", method = RequestMethod.POST)
	@ResponseBody
	public Map selectLq(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		HttpSession s = request.getSession(false);
		AoJianDataBean bean;
		String lqId = RequestUtil.getRequestParameter(request, "lqId");
		bean = ServiceManager.getAoJianBlockService().getById(lqId);

		if (!StringUtils.isEmpty(lqId)) {
			s.removeAttribute("lqIdbean");
			s.setAttribute("lqIdbean", bean);
		}
		Map map = new HashMap<String, String>();
		return map;
	}

	private AoJianBean getCurAoJianBean(HttpServletRequest request) {
		AoJianBean aoJian = (AoJianBean) request.getSession(false).getAttribute("aoJian");
		return aoJian;
	}

	// 详细数据大表
	@RequestMapping({ "/lqjc/ssjc_1.action" })
	public ModelAndView ssjc_1Page(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		try {
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "LQJC");
			model.addAttribute("CURENT_TAB_2", "SSJC");
			model.addAttribute("CURENT_TAB_3", "SSJC_1");
			/**
			 * 如果页面传递时间， 则查询传递时间的数据，如果没有传递时间，则获取最新一天的数据 通过grainId
			 */
			HttpSession s = request.getSession(false);
			String dataStr = RequestUtil.getRequestParameter(request, "dateStr");
			AoJianBean bean = getCurAoJianBean(request);

			// 获取粮情记录对象
			AoJianDataBean aoJianDataBean;
			if (null == bean || "0".equals(bean.getGrainStatus()) || null == bean.getAoJianGrainInfoBean()) {
				return new ModelAndView(PageConst.LQJC_SSJC_1, model);
			} else {
				Date curDate = null;
				if (StringUtils.isEmpty(dataStr)) {
					if (s.getAttribute("lqIdbean") != null) {
						aoJianDataBean = (AoJianDataBean) s.getAttribute("lqIdbean");
					} else {
						aoJianDataBean = ServiceManager.getAoJianBlockService().getRecentAoJianDataBeanByGrainId(bean.getAoJianGrainInfoBean().getId());
						s.setAttribute("lqIdbean", aoJianDataBean);
					}
					if (null == aoJianDataBean) {
						model.addAttribute("hasdata", "no");
						return new ModelAndView(PageConst.LQJC_SSJC, model);
					} else {
						model.addAttribute("hasdata", "yes");
					}

				} else {
					curDate = CalendarUtil.formatDate(dataStr, CalendarUtil.DATE_FORMAT_MODE4);
					aoJianDataBean = ServiceManager.getAoJianBlockService().getByGrainIdAndDate(bean.getAoJianGrainInfoBean().getId(), curDate);
				}

			}
			
			String sensorArrangementBeanId = bean.getSensorArrangementbeanId();
			
			SensorArrangementBean sensorArrangementBean = ServiceManager.getSensorArrangementServiceImpl().getById(sensorArrangementBeanId);
			
			String pointDirectionStr = sensorArrangementBean.getPointDirection();
			model.addAttribute("pointDirectionStr", pointDirectionStr);		
			model.addAttribute("aoJianDataBean", aoJianDataBean);
			JSONObject baseJson = getBaseDataInfo(aoJianDataBean, bean);
			BarnBean barnBean = ServiceManager.getBarnServiceImpl().getById(bean.getBarnId());
			model.addAttribute("barnIndex", barnBean.getBarnIndex());
			model.addAttribute("CommenData", baseJson);

			SensorArrangementBean arrangementBean = ServiceManager.getSensorArrangementServiceImpl().getById(bean.getSensorArrangementbeanId());
			// 布置信息 行 列 排 已经廒间信息
			model.addAttribute("arrangementBean", arrangementBean);
			model.addAttribute("aoJianBean", bean);

			String fangxiang = null;
			if (barnBean.getAngle() > -45 && barnBean.getAngle() < 45) {// 仓房布置方向
				fangxiang = "NorthSouth";
			} else {
				fangxiang = "EastWest";
			}
			
			
			// 【数据格式一】按三维2015.8
			// List list = getAoJianDataByAoJianId(aoJianDataBean, arrangementBean, fangxiang);
			// JSONArray jsonArr = JSONArray.fromObject(list);
			// model.addAttribute("lqData", jsonArr);

			// 【数据格式二】按测点（用户常用）2015.11.21
			getAoJianDataByAoJianId_2(model, aoJianDataBean);

			// json大表核心数据区域
			model.addAttribute("lqID", aoJianDataBean.getId());
			model.addAttribute("ZyGrainID", aoJianDataBean.getZyAoJianGrainNum());
			model.addAttribute("lqtime", CalendarUtil.formatStr(aoJianDataBean.getStartDate(), CalendarUtil.DATE_FORMAT_MODE4));
			model = getStatInfo(aoJianDataBean, arrangementBean, model);
			List<User> userList = ServiceManager.getUserService().findByContent(bean.getZyAoJianNum());
			User kgy = null;
			User lqy = null;
			for (int i = 0; i < userList.size(); i++) {
				User user = userList.get(i);
				if (user.getRightLevel().equals("3")) {
					kgy = user;
				}
			}
			//粮情员
			List<User> lqyList = ServiceManager.getUserService().getListByRoleId("4");
			String lqyDisplayName = "";
			for (int i = 0; i < lqyList.size(); i++) {
				if(i<lqyList.size()-1){
					lqyDisplayName = lqyDisplayName + lqyList.get(i).getDisplayName()+",";
				}
				else{
					lqyDisplayName = lqyDisplayName + lqyList.get(i).getDisplayName();
				}
			}
			
			model.addAttribute("kgy", kgy);
			model.addAttribute("lqy", lqyDisplayName);
			// basePath
			addFdData(model, bean, aoJianDataBean);
			return new ModelAndView(PageConst.LQJC_SSJC_1, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}

	private void addFdData(ModelMap m, AoJianBean aoJian, AoJianDataBean aoJianDataBean) {
		String fd1 = aoJian.getFd1();
		String fd1TemData = aoJianDataBean.getFd1Tem();
		String[] fd1TemDataArr = null;
		if (!StringUtils.isEmpty(fd1TemData)) {
			fd1TemDataArr = fd1TemData.split(",");
		}
		String fd1HumData = aoJianDataBean.getFd1Hum();
		String[] fd1HumDataArr = null;
		if (!StringUtils.isEmpty(fd1HumData)) {
			fd1HumDataArr = fd1HumData.split(",");
		}
		StringBuffer sbFd1 = new StringBuffer();
		sbFd1 = getFdDisplayStr(fd1, fd1TemDataArr, fd1HumDataArr);
		m.addAttribute("fd1DisplayStr", sbFd1.toString());

		String fd2 = aoJian.getFd2();
		String fd2TemData = aoJianDataBean.getFd2Tem();
		String[] fd2TemDataArr = null;
		if (!StringUtils.isEmpty(fd2TemData)) {
			fd2TemDataArr = fd2TemData.split(",");
		}
		String fd2HumData = aoJianDataBean.getFd2Hum();
		String[] fd2HumDataArr = null;
		if (!StringUtils.isEmpty(fd2HumData)) {
			fd2HumDataArr = fd2HumData.split(",");
		}
		StringBuffer sbFd2 = new StringBuffer();
		sbFd2 = getFdDisplayStr(fd2, fd2TemDataArr, fd2HumDataArr);
		m.addAttribute("fd2DisplayStr", sbFd2.toString());
	}

	private StringBuffer getFdDisplayStr(String fd1, String[] fd1TemDataArr, String[] fd1HumDataArr) {
		StringBuffer sbFd1 = new StringBuffer();
		if (!StringUtils.isEmpty(fd1)) {
			String[] fd1Arr = fd1.split(",");
			for (int i = 0; i < fd1Arr.length; i++) {
				sbFd1.append("测点").append(fd1Arr[i]);
				sbFd1.append(":（");
				sbFd1.append("温度:");
				if (null != fd1TemDataArr && fd1TemDataArr.length == fd1Arr.length) {
					if (!StringUtils.isEmpty(fd1TemDataArr[i])) {
						if(Double.parseDouble(fd1TemDataArr[i])>= WebConstConfig.errorData){
							sbFd1.append("无");
						}else{
							sbFd1.append(fd1TemDataArr[i]);
							sbFd1.append("℃");
						}
					} else {
						sbFd1.append("无");
					}
				} else {
					sbFd1.append("无");
				}
				sbFd1.append(",");

				sbFd1.append("湿度:");
				if (null != fd1HumDataArr && fd1HumDataArr.length == fd1Arr.length) {
					if (!StringUtils.isEmpty(fd1HumDataArr[i])) {
						if(Double.parseDouble(fd1HumDataArr[i])>= WebConstConfig.errorData){
							sbFd1.append("无");
						}else{
							sbFd1.append(fd1HumDataArr[i]);
							sbFd1.append("%");
						}
					} else {
						sbFd1.append("无");
					}
				} else {
					sbFd1.append("无");
				}
				if (i < fd1Arr.length) {
					sbFd1.append("）; ");
				}
			}
		}
		return sbFd1;
	}

	private JSONObject getBaseDataInfo(AoJianDataBean aoJianData, AoJianBean bean) {
		String dateStr = CalendarUtil.formatStr(aoJianData.getStartDate(), CalendarUtil.DATE_FORMAT_MODE4);
		StringBuffer sb = new StringBuffer();
		BaseSettingBean setBean = ServiceManager.getBaseSettingServiceImpl().findValueByKey("粮库名称");
		GrainTypeBean grainBean = ServiceManager.getGrainTypeServiceImpl().getById(bean.getAoJianGrainInfoBean().getGrainType());
		sb.append("{");
		sb.append("\"time_jc\":");
		sb.append("\"" + dateStr + "\",");
		sb.append("\"cr\":");
		sb.append("\"" + bean.getAoJianGrainInfoBean().getCapacity() + "\",");
		sb.append("\"lspz\":");
		sb.append("\"" + grainBean.getGrainType() + "\",");
		sb.append("\"time_rc\":");
		sb.append("\"" + bean.getAoJianGrainInfoBean().getInputTime() + "\",");
		sb.append("\"grade\":");
		sb.append("\"" + bean.getAoJianGrainInfoBean().getLevel() + "\",");
		sb.append("\"time_sh\":");
		sb.append("\"" + bean.getAoJianGrainInfoBean().getHarvestTime() + "\",");
		sb.append("\"moisture\":");
		sb.append("\"" + bean.getAoJianGrainInfoBean().getStorageMoisture() + "\",");
		sb.append("\"bgdw\":");
		BaseSettingBean baseSettingBean = ServiceManager.getBaseSettingServiceImpl().findValueByKey("lkmc");
		sb.append("\"" + baseSettingBean.getValue() + "\",");
		sb.append("\"lkmc\":");
		sb.append("\"" + baseSettingBean.getValue() + "\",");
		sb.append("\"cx\":");
		sb.append("\"平房仓\",");
		
		sb.append("\"cw\":");
		if((aoJianData.getAoJianTem()-WebConstConfig.errorData>=0)||(aoJianData.getAoJianTem()-200>0)||(aoJianData.getAoJianTem()+100<0)){
			sb.append("\"无\",");
		}else{
			sb.append("\"" + aoJianData.getAoJianTem() + "\",");
		}
		sb.append("\"cs\":");
		if((aoJianData.getAoJianhumidity()-WebConstConfig.errorData>=0)||(aoJianData.getAoJianhumidity()-150>0)||(aoJianData.getAoJianhumidity()+150<0)){
			sb.append("\"无\",");
		}else{
			sb.append("\"" + aoJianData.getAoJianhumidity() + "\",");
		}
		sb.append("\"qw\":");
		if((aoJianData.getOuterTem()-WebConstConfig.errorData>=0)||(aoJianData.getOuterTem()-200>0)||(aoJianData.getOuterTem()+100<0)){
			sb.append("\"无\",");
		}else{
			sb.append("\"" + aoJianData.getOuterTem() + "\",");
		}
		sb.append("\"qs\":");
		if((aoJianData.getOuterHumidity()-WebConstConfig.errorData>=0)||(aoJianData.getOuterHumidity()-150>0)||(aoJianData.getOuterHumidity()+150<0)){
			sb.append("\"无\",");
		}else{
			sb.append("\"" + aoJianData.getOuterHumidity() + "\",");
		}
		sb.append("}");
		JSONObject jsonResult = JSONObject.fromObject(sb.toString());
		return jsonResult;
	}

	/**
	 * 传递日期 获取该日期下的数据，没有日期获取最近一条数据 做两件事情 ，表格组装数据+求平均值
	 * 
	 * @param aoJianGrainZyNum
	 * @param curDate
	 * @return
	 */
	private List getAoJianDataByAoJianId(AoJianDataBean aoJianDataBean, SensorArrangementBean arrangementBean, String fangxiang) {
		List list = new ArrayList();
		try {
			// 获取所有数据 开始组装 一层一层的来

			for (int i = 0; i < arrangementBean.getLayerCount(); i++) {
				List jsonList = new ArrayList();
				for (int j = 0; j < arrangementBean.getRowCount(); j++) {
					List<SensorDataBean> list1 = new ArrayList<SensorDataBean>();
					if (fangxiang == "EastWest") {
						list1 = ServiceManager.getAoJianBlockService().getSensorDataList(aoJianDataBean, j + ",%," + i, "orderIndex");
					} else {
						list1 = ServiceManager.getAoJianBlockService().getSensorDataList(aoJianDataBean, (arrangementBean.getRowCount() - j - 1) + ",%," + i, "orderIndex");
					}

					List subJsonList = new ArrayList();
					if (list1 != null && list1.size() > 0) {
						for (int k = 0; k < list1.size(); k++) {
							SensorDataBean bean = list1.get(k);
							StringBuffer sb = new StringBuffer();
							if ("1".equals(bean.getNoData())) {
								sb.append("{");
								sb.append("wd:");
								if(bean.getTemperature()>=WebConstConfig.errorData){
									sb.append("\"无\"");
								}else{
									sb.append("" + bean.getTemperature() + "");
								}
								sb.append(",");
								sb.append("sd:");
								if(bean.getHumidity()>=WebConstConfig.errorData){
									sb.append("\"无\"");
								}else{
									sb.append("" + bean.getHumidity() + "");
								}
								sb.append(",");
								sb.append("sf:");
								if(bean.getWet()>=WebConstConfig.errorData){
									sb.append("\"无\"");
								}else{
									sb.append("" + bean.getWet() + "");
								}
								sb.append(",");
								sb.append("ld:");
								if(bean.getDewPoint()>=WebConstConfig.errorData){
									sb.append("\"无\"");
								}else{
									sb.append("" + bean.getDewPoint() + "");
								}
								sb.append(",");
								sb.append("xyz:");
								sb.append("'" + bean.getSensorIndex() + "'");
								sb.append("}");
							} else {
								sb.append("{");
								sb.append("wd:");
								sb.append("\"\"");
								sb.append(",");
								sb.append("sd:");
								sb.append("\"\"");
								sb.append(",");
								sb.append("sf:");
								sb.append("\"\"");
								sb.append(",");
								sb.append("ld:");
								sb.append("\"\"");
								sb.append(",");
								sb.append("xyz:");
								sb.append("'" + bean.getSensorIndex() + "'");
								sb.append("}");
							}
							subJsonList.add(sb.toString());
						}
						jsonList.add(subJsonList);
					} else {
						continue;
					}
				}
				if (jsonList != null && jsonList.size() > 0) {
					list.add(jsonList);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 传递日期 获取该日期下的数据，没有日期获取最近一条数据 做两件事情 ，表格组装数据+求平均值
	 * 
	 * @param aoJianGrainZyNum
	 * @param curDate
	 * @return
	 */
	private List getAoJianDataByAoJianIdSsjc1(AoJianDataBean aoJianDataBean, SensorArrangementBean arrangementBean, String layerDir) {
		List list = new ArrayList();
		try {
			// 获取所有数据 开始组装 一层一层的来
			for (int i = 0; i < arrangementBean.getRowCount(); i++) {
				List jsonList = new ArrayList();
				for (int j = 0; j < arrangementBean.getLayerCount(); j++) {
					List<SensorDataBean> list1 = new ArrayList<SensorDataBean>();
					if (layerDir.equals("downToUp")) {
						list1 = ServiceManager.getAoJianBlockService().getSensorDataList(aoJianDataBean, i + ",%," + j, "orderIndex");
					} else {
						list1 = ServiceManager.getAoJianBlockService().getSensorDataList(aoJianDataBean, i + ",%," + (arrangementBean.getRowCount() - 1 - j), "orderIndex");
					}
					List subJsonList = new ArrayList();
					if (list1 != null && list1.size() > 0) {
						for (int k = 0; k < list1.size(); k++) {
							SensorDataBean bean = list1.get(k);
							StringBuffer sb = new StringBuffer();
							if ("1".equals(bean.getNoData())) {
								sb.append("{");
								sb.append("wd:");
								if(bean.getTemperature()>=WebConstConfig.errorData){
									sb.append("无");
								}else{
									sb.append("" + bean.getTemperature() + "");	
								}
								sb.append(",");
								sb.append("sd:");
								if(bean.getHumidity()>=WebConstConfig.errorData){
									sb.append("无");
								}else{
									sb.append("" + bean.getHumidity() + "");
								}
								sb.append(",");
								sb.append("sf:");
								if(bean.getWet()>=WebConstConfig.errorData){
									sb.append("无");
								}else{
									sb.append("" + bean.getWet() + "");
								}
								sb.append("}");
							} else {
								sb.append("{");
								sb.append("wd:");
								sb.append("\"\"");
								sb.append(",");
								sb.append("sd:");
								sb.append("\"\"");
								sb.append(",");
								sb.append("sf:");
								sb.append("\"\"");
								sb.append("}");
							}
							subJsonList.add(sb.toString());
						}
						jsonList.add(subJsonList);
					} else {
						continue;
					}
				}
				if (jsonList != null && jsonList.size() > 0) {
					list.add(jsonList);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 获取统计数据,层数据处理,默认 从小到大排序
	 */
	private ModelMap getStatInfo(AoJianDataBean aoJianDataBean, SensorArrangementBean arrangementBean, ModelMap model) {
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		double maxTem0 = -9999;
		double minTem0 = 9999;
		double ageTem0 = 0.0;
		List<Double> maxTemList = new ArrayList<Double>();
		List<Double> minTemList = new ArrayList<Double>();
		List<Double> ageTemList = new ArrayList<Double>();
		double maxHum0 = -9999;
		double minHum0 = 9999;
		double ageHum0 = 0.0;
		List<Double> maxHumList = new ArrayList<Double>();
		List<Double> minHumList = new ArrayList<Double>();
		List<Double> ageHumList = new ArrayList<Double>();
		double maxWet0 = -9999;
		double minWet0 = 9999;
		double ageWet0 = 0.0;
		List<Double> maxWetList = new ArrayList<Double>();
		List<Double> minWetList = new ArrayList<Double>();
		List<Double> ageWetList = new ArrayList<Double>();
		double maxDewPoint0 = -9999;
		double minDewPoint0 = 9999;
		double ageDewPoint0 = 0.0;
		List<Double> maxDewPointList = new ArrayList<Double>();
		List<Double> minDewPointList = new ArrayList<Double>();
		List<Double> ageDewPointList = new ArrayList<Double>();

		double sumDewPointAll = 0.0;
		int ageNumAll = 0;
		List temList = new ArrayList();
		for (int i = 0; i < arrangementBean.getLayerCount(); i++) {
			HashMap<String, String> map = new HashMap<String, String>();
			double maxTem = -99999;
			double minTem = 99999;
			double ageTem = 0.0;
			double sumTem = 0.0;

			double maxHum = -99999;
			double minHum = 99999;
			double ageHum = 0.0;
			double sumHum = 0.0;

			double maxWet = -99999;
			double minWet = 99999;
			double ageWet = 0.0;
			double sumWet = 0.0;

			double maxDewPoint = -9999;
			double minDewPoint = 9999;
			double ageDewPoint = 0.0;
			double sumDewPoint = 0.0;

			int ageNum = 0;
			List<SensorDataBean> list1 = ServiceManager.getAoJianBlockService().getSensorDataList(aoJianDataBean, "%,%," + i, "temperature");
			for (int j = 0; j < list1.size(); j++) {
				if ("1".equals(list1.get(j).getNoData())) {
					if(list1.get(j).getTemperature()>=WebConstConfig.errorData||list1.get(j).getHumidity()>=WebConstConfig.errorData){
						continue;
					}
					if (list1.get(j).getTemperature() < minTem) {
						minTem = list1.get(j).getTemperature();
					}
					if (list1.get(j).getTemperature() > maxTem) {
						maxTem = list1.get(j).getTemperature();
					}
					sumTem = sumTem + list1.get(j).getTemperature();

					if (list1.get(j).getHumidity() < minHum) {
						minHum = list1.get(j).getHumidity();
					}
					if (list1.get(j).getHumidity() > maxHum) {
						maxHum = list1.get(j).getHumidity();
					}
					sumHum = sumHum + list1.get(j).getHumidity();

					if (list1.get(j).getWet() < minWet) {
						minWet = list1.get(j).getWet();
					}
					if (list1.get(j).getWet() > maxWet) {
						maxWet = list1.get(j).getWet();
					}
					sumWet = sumWet + list1.get(j).getWet();

					if (list1.get(j).getDewPoint() < minDewPoint) {
						minDewPoint = list1.get(j).getDewPoint();
					}
					if (list1.get(j).getDewPoint() > maxDewPoint) {
						maxDewPoint = list1.get(j).getDewPoint();
					}
					sumDewPoint = sumDewPoint + list1.get(j).getDewPoint();

					ageNum = ageNum + 1;
					ageNumAll = ageNumAll + 1;
				}
			}

			ageTem = MathUtil.getFormatData(sumTem / ageNum, 1);
			ageHum = MathUtil.getFormatData(sumHum / ageNum, 1);
			ageWet = MathUtil.getFormatData(sumWet / ageNum, 1);
			ageDewPoint = MathUtil.getFormatData(sumDewPoint / ageNum, 1);

			sumDewPointAll = sumDewPointAll + sumDewPoint;

			// Integer in = new Integer(i);
			map.put("layer", i + 1 + "层");

			map.put("maxTem", maxTem + "");
			map.put("minTem", minTem + "");
			map.put("ageTem", ageTem + "");
			maxTemList.add(maxTem);
			minTemList.add(minTem);
			ageTemList.add(ageTem);

			map.put("maxHum", maxHum + "");
			map.put("minHum", minHum + "");
			map.put("ageHum", ageHum + "");
			maxHumList.add(maxHum);
			minHumList.add(minHum);
			ageHumList.add(ageHum);

			map.put("maxWet", maxWet + "");
			map.put("minWet", minWet + "");
			map.put("ageWet", ageWet + "");
			maxWetList.add(maxWet);
			minWetList.add(minWet);
			ageWetList.add(ageWet);

			map.put("maxDewPoint", maxDewPoint + "");
			map.put("minDewPoint", minDewPoint + "");
			map.put("ageDewPoint", ageDewPoint + "");
			maxDewPointList.add(maxDewPoint);
			minDewPointList.add(minDewPoint);
			ageDewPointList.add(ageDewPoint);

			temList.add(map);
		}
		model.addAttribute("layerData", temList);

		maxTem0 = MathUtil.getMaxValue(maxTemList);
		minTem0 = MathUtil.getMinValue(minTemList);
		ageTem0 = aoJianDataBean.getJwz();
		maxHum0 = MathUtil.getMaxValue(maxHumList);
		minHum0 = MathUtil.getMinValue(minHumList);
		ageHum0 = aoJianDataBean.getJsz();
		maxWet0 = MathUtil.getMaxValue(maxWetList);
		minWet0 = MathUtil.getMinValue(minWetList);
		ageWet0 = aoJianDataBean.getJsf();
		maxDewPoint0 = MathUtil.getMaxValue(maxDewPointList);
		minDewPoint0 = MathUtil.getMinValue(minDewPointList);
		ageDewPoint0 = MathUtil.getFormatData(sumDewPointAll / ageNumAll, 1);// 整仓露点平均值
		HashMap<String, String> sumMap = new HashMap<String, String>();
		// sumMap.put("layerList", "整仓");
		sumMap.put("maxTem", maxTem0 + "");
		sumMap.put("minTem", minTem0 + "");
		sumMap.put("ageTem", ageTem0 + "");
		sumMap.put("maxHum", maxHum0 + "");
		sumMap.put("minHum", minHum0 + "");
		sumMap.put("ageHum", ageHum0 + "");
		sumMap.put("maxWet", maxWet0 + "");
		sumMap.put("minWet", minWet0 + "");
		sumMap.put("ageWet", ageWet0 + "");
		sumMap.put("maxDewPoint", maxDewPoint0 + "");
		sumMap.put("minDewPoint", minDewPoint0 + "");
		sumMap.put("ageDewPoint", ageDewPoint0 + "");
		model.addAttribute("整仓", sumMap);
		return model;
	}

	/**
	 * 粮堆均温曲线 通过时间区间，廒间ID获取数据曲线
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping({ "/lqjc/ssjc_2.action" })
	public ModelAndView ssjc_2Page(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		try {
			// ģ��·�� basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "LQJC");
			model.addAttribute("CURENT_TAB_2", "SSJC");
			model.addAttribute("CURENT_TAB_3", "SSJC_2");

			AoJianBean bean = getCurAoJianBean(request);
			if (null == bean || "0".equals(bean.getGrainStatus())) {

			} else {
				model = initDefaultData(model, bean, "wd");
			}
			// model.addAttribute("user",request.getSession().getAttribute("user"));
			return new ModelAndView(PageConst.LQJC_SSJC_2, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}

	/**
	 * 组装数据
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	private ModelMap initDefaultData(ModelMap model, AoJianBean bean, String type) {

		AoJianDataBean recentAoJianDataBean = ServiceManager.getAoJianBlockService().getRecentAoJianDataBeanByGrainId(bean.getAoJianGrainInfoBean().getId());

		if (null == recentAoJianDataBean || "0".equals(bean.getGrainStatus()) || null == bean.getAoJianGrainInfoBean()) {
			model.addAttribute("hasdata", "no");
			return model;

		} else {
			model.addAttribute("hasdata", "no");

			Date endDate = recentAoJianDataBean.getStartDate();
			Date startDate = CalendarUtil.getNextDate(endDate, -8, 5); // 最近一次粮情前7天的数据

			Map<String, String> commenDate = new HashMap<String, String>();
			String startDateStr = CalendarUtil.formatStr(startDate, CalendarUtil.DATE_FORMAT_MODE4);
			String endDateStr = CalendarUtil.formatStr(endDate, CalendarUtil.DATE_FORMAT_MODE4);
			commenDate.put("RecentDate", endDateStr);
			commenDate.put("startDate", startDateStr);
			model.addAttribute("CommenDate", commenDate);// 时间区间确定
			List<AoJianDataBean> aoJianList = ServiceManager.getAoJianBlockService().getAoJianDataList(bean.getAoJianGrainInfoBean().getId(), startDateStr, endDateStr);
			//List<AoJianDataBean> aoJianList = ServiceManager.getAoJianBlockService().getChartAoJianDataList(bean.getAoJianGrainInfoBean().getId(), startDateStr, endDateStr);
			Map<String, Object> dataMap = getAssemblyDataInfo(aoJianList, type);
			model.addAttribute("grainId", bean.getAoJianGrainInfoBean().getId());
			model.addAttribute("chartXAxis", dataMap.get("chartXAxis"));
			model.addAttribute("chartSeries", dataMap.get("chartSeries"));
			SensorArrangementBean arrangementBean = ServiceManager.getSensorArrangementServiceImpl().getById(bean.getSensorArrangementbeanId());
			// 布置信息 行 列 排 已经廒间信息
			model.addAttribute("arrangementBean", arrangementBean);
			return model;
		}

	}

	/**
	 * 获取曲线拼装数据 type wd sd sf 温度 湿度 水分
	 * ------------------如果曲线是10000  怎么办
	 * @param aoJianList
	 * @return
	 */
	private Map<String, Object> getAssemblyDataInfo(List<AoJianDataBean> aoJianList, String type) {
		Map<String, Object> result = new HashMap<String, Object>();
		String timerStr = "";
		List ldList = new ArrayList();// 粮堆数据
		List cList = new ArrayList();// 仓数据
		List wList = new ArrayList();// 外温。。数据
		String name1 = "";
		String name2 = "";
		String name3 = "";
		for (int i = 0; i < aoJianList.size(); i++) {
			AoJianDataBean bean = (AoJianDataBean)aoJianList.get(i);
			Date date = bean.getStartDate();
			String dateStr = CalendarUtil.formatStr(date, CalendarUtil.DATE_FORMAT_MODE4);
			dateStr = dateStr.substring(5, dateStr.length());
			if (type.equals("wd")) {
				if((bean.getAoJianTem()-WebConstConfig.errorData!=0)&&(bean.getOuterTem()-WebConstConfig.errorData!=0)){
					ldList.add(bean.getJwz());
					cList.add(bean.getAoJianTem());
					wList.add(bean.getOuterTem());
					name1 = "粮堆均温";
					name2 = "仓温";
					name3 = "外温";
					timerStr = timerStr + dateStr + ",";
				}
			} else if (type.equals("sd")) {
			   if((bean.getAoJianhumidity()-WebConstConfig.errorData!=0)&&(bean.getOuterHumidity()-WebConstConfig.errorData!=0)){
				ldList.add(bean.getJsz());
				cList.add(bean.getAoJianhumidity());
				wList.add(bean.getOuterHumidity());
				name1 = "粮堆均湿";
				name2 = "仓湿";
				name3 = "外湿";
				timerStr = timerStr + dateStr + ",";
				}
			} else if (type.equals("sf")) {
				ldList.add(bean.getJsf());
				name1 = "粮堆均水分";
				timerStr = timerStr + dateStr + ",";
			} else {
				//
			}
		}
		StringBuffer sb = new StringBuffer();
		sb.append("[{\"name\":\"" + name1 + "\",\"data\":");
		sb.append(ldList.toString());
		if (!type.equals("sf")) {
			sb.append("},");
			sb.append("{\"name\":\"" + name2 + "\",\"data\":");
			sb.append(cList.toString());
			sb.append("},");
			sb.append("{\"name\":\"" + name3 + "\",\"data\":");
			sb.append(wList.toString());
		}
		sb.append("}]");
		result.put("chartXAxis", timerStr.substring(0, timerStr.length() - 1));
		result.put("chartSeries", sb.toString());
		return result;
	}

	/**
	 * 列表获取数据层
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/lqjc/getChartData.action", method = RequestMethod.POST)
	@ResponseBody
	public Map getChartData(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		Map resultMap = new HashMap();
		String oType = RequestUtil.getRequestParameter(request, "oType");
		String ids = RequestUtil.getRequestParameter(request, "ids");
		String startDateStr = RequestUtil.getRequestParameter(request, "startDateStr");
		String endDateStr = RequestUtil.getRequestParameter(request, "endDateStr");
		String grainId = RequestUtil.getRequestParameter(request, "grainId");
		if (StringUtils.isEmpty(startDateStr)) {
			startDateStr = getAWeekDateStr(endDateStr);
		}
		
		List<AoJianDataBean> aoJianDataList = ServiceManager.getAoJianBlockService().getAoJianDataList(grainId, startDateStr, endDateStr);

		Map<String, Map<String, List>> map = new HashMap<String, Map<String, List>>();
		String[] idsArr = ids.split("#");
		for (int i = 0; i < idsArr.length; i++) {
			if (idsArr[i].length() > 2) {
				map.put(idsArr[i], new HashMap<String, List>());
			}
		}
		List ldList = new ArrayList();// 粮堆数据
		List cList = new ArrayList();// 仓数据
		List wList = new ArrayList();// 外温。。数据
		String name1 = "";
		String name2 = "";
		String name3 = "";
		String timerStr = "";
		for (int i = 0; i < aoJianDataList.size(); i++) {
			// 可以拼出x轴和仓数据
			AoJianDataBean dataBean = aoJianDataList.get(i);
			Date date = dataBean.getStartDate();
			String dateStr = CalendarUtil.formatStr(date, CalendarUtil.DATE_FORMAT_MODE4);
			dateStr = dateStr.substring(5, dateStr.length());
			
			if (oType.equals("wd")) {
				if((dataBean.getAoJianTem()-WebConstConfig.errorData!=0)&&(dataBean.getOuterTem()-WebConstConfig.errorData!=0)){
					ldList.add(dataBean.getJwz());
					cList.add(dataBean.getAoJianTem());
					wList.add(dataBean.getOuterTem());
					name1 = "粮堆均温";
					name2 = "仓温";
					name3 = "外温";
					timerStr = timerStr + dateStr + ",";
				}
			} else if (oType.equals("sd")) {
			   if((dataBean.getAoJianhumidity()-WebConstConfig.errorData!=0)&&(dataBean.getOuterHumidity()-WebConstConfig.errorData!=0)){
				ldList.add(dataBean.getJsz());
				cList.add(dataBean.getAoJianhumidity());
				wList.add(dataBean.getOuterHumidity());
				name1 = "粮堆均湿";
				name2 = "仓湿";
				name3 = "外湿";
				timerStr = timerStr + dateStr + ",";
				}
			} else if (oType.equals("sf")) {
				ldList.add(dataBean.getJsf());
				name1 = "粮堆均水分";
				timerStr = timerStr + dateStr + ",";
			} else {
				//
			}
			
//			if (oType.equals("wd")) {
//				ldList.add(dataBean.getJwz());
//				cList.add(dataBean.getAoJianTem());
//				wList.add(dataBean.getOuterTem());
//				name1 = "粮堆均温";
//				name2 = "仓温";
//				name3 = "外温";
//			} else if (oType.equals("sd")) {
//				ldList.add(dataBean.getJsz());
//				cList.add(dataBean.getAoJianhumidity());
//				wList.add(dataBean.getOuterHumidity());
//				name1 = "粮堆均湿";
//				name2 = "仓湿";
//				name3 = "外湿";
//			} else if (oType.equals("sf")) {
//				ldList.add(dataBean.getJsf());
//				name1 = "粮堆均水分";
//			} else {
//				//
//			}
			// 传感器层数据,数据准备
			List<SensorDataBean> sensorList = ServiceManager.getAoJianBlockService().getSensorDataList(dataBean, "", "orderIndex");
			Iterator it = sensorList.iterator();
			while (it.hasNext()) {
				SensorDataBean sensorDataBean = (SensorDataBean) it.next();
				String pos = sensorDataBean.getSensorIndex();
				Iterator itPos = map.keySet().iterator();
				while (itPos.hasNext()) {
					String curPos = (String) itPos.next();
					Map<String, List> curMap = map.get(curPos);
					if (isMatchPos(curPos, pos)) {
						if (curMap.size() > 0 && curMap.containsKey(dataBean.getId())) {
							if ("1".equals(sensorDataBean.getNoData())) {
								if (oType.equals("wd")&&sensorDataBean.getTemperature()<WebConstConfig.errorData) {
									curMap.get(dataBean.getId()).add(sensorDataBean.getTemperature());
								} else if (oType.equals("sd")&&sensorDataBean.getHumidity()<WebConstConfig.errorData) {
									curMap.get(dataBean.getId()).add(sensorDataBean.getHumidity());
								} else if (oType.equals("sf")&&sensorDataBean.getWet()<WebConstConfig.errorData) {
									curMap.get(dataBean.getId()).add(sensorDataBean.getWet());
								}
							}
						} else {
							List<Double> cubList = new ArrayList<Double>();
							if (oType.equals("wd")&&sensorDataBean.getTemperature()<WebConstConfig.errorData) {
								cubList.add(sensorDataBean.getTemperature());
							} else if (oType.equals("sd")&&sensorDataBean.getHumidity()<WebConstConfig.errorData) {
								cubList.add(sensorDataBean.getHumidity());
							} else if (oType.equals("sf")&&sensorDataBean.getWet()<WebConstConfig.errorData) {
								cubList.add(sensorDataBean.getWet());
							}
							curMap.put(dataBean.getId(), cubList);
						}
					}
				}
			}
		}
		// 计算平均值，通过操作类型判断数据信息,将来直接取就好
		Iterator itCalc = map.keySet().iterator();
		StringBuffer subSb = new StringBuffer();
		while (itCalc.hasNext()) {
			String disPos = (String) itCalc.next();
			String dispalyName = getDisplayName(disPos);
			List<Double> resultList = new ArrayList<Double>();
			Map<String, List> dataMap = map.get(disPos);
			for (int i = 0; i < aoJianDataList.size(); i++) {
				List<Double> dataList = dataMap.get(aoJianDataList.get(i).getId());
				if (null == dataList) {
					System.out.println("aaa");
				} else {
					if (dataList.size() > 0) {
						dataList.remove(0);
					}
					resultList.add(MathUtil.getAgeValue(dataList));
				}
			}

			subSb.append("{\"name\":\"" + dispalyName + "\",\"data\":");
			subSb.append(resultList.toString());
			subSb.append("},");
		}
		// 结果字符串
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		if (ids.contains("B1")) {
			sb.append("{\"name\":\"" + name1 + "\",\"data\":");
			sb.append(ldList.toString());
			sb.append("},");
		}
		if (ids.contains("B2")) {
			sb.append("{\"name\":\"" + name2 + "\",\"data\":");
			sb.append(cList.toString());
			sb.append("},");
		}
		if (ids.contains("B3")) {
			sb.append("{\"name\":\"" + name3 + "\",\"data\":");
			sb.append(wList.toString());
			sb.append("},");
		}
		if (subSb.length() < 1) {
			if (sb.length() > 1) {
				sb.delete(sb.length() - 1, sb.length());
			}
		}
		if (subSb.length() > 0) {
			sb.append(subSb.substring(0, subSb.length() - 1));
		}
		sb.append("]");
		// x轴信息
		if (!StringUtils.isEmpty(timerStr)) {
			resultMap.put("chartXAxis", timerStr.substring(0, timerStr.length() - 1));
			resultMap.put("chartSeries", sb.toString());
		} else {
			resultMap.put("chartXAxis", null);
			resultMap.put("chartSeries", null);
		}
		System.out.println("resultMap=" + resultMap);
		return resultMap;
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/lqjc/getPointChartData.action", method = RequestMethod.POST)
	@ResponseBody
	public void getPointChartData(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Map resultMap = new HashMap();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String oType = RequestUtil.getRequestParameter(request, "oType");
		String point = RequestUtil.getRequestParameter(request, "ids");
		String startDateStr = RequestUtil.getRequestParameter(request, "startDateStr");
		String endDateStr = RequestUtil.getRequestParameter(request, "endDateStr");
		String grainId = RequestUtil.getRequestParameter(request, "grainId");
		if (StringUtils.isEmpty(startDateStr)) {
			startDateStr = getXdayDateStr(endDateStr, -14);
		}

		List<AoJianDataBean> aoJianDataList = ServiceManager.getAoJianBlockService().getAoJianDataList(grainId, startDateStr, endDateStr);

		ArrayList<String> aojianIds = new ArrayList<String>();
		String timerStr = "";
		for (int i = 0; i < aoJianDataList.size(); i++) {
			// 拼aojianIds数组
			aojianIds.add(aoJianDataList.get(i).getId());
		}
		List<SensorDataBean> sensorDataList = ServiceManager.getAoJianBlockService().getPointSensorDataByAojianIds(aojianIds, point);

		List<Double> PointList = new ArrayList<Double>();// 点数据集合----点的数据怎么处理
		String errorDataIdsStr = "";
		if (sensorDataList.size() > 0) {
			for (int k = 0; k < sensorDataList.size(); k++) {
				if (oType.equals("wd")) {
					if(sensorDataList.get(k).getTemperature()>=WebConstConfig.errorData){
						errorDataIdsStr = errorDataIdsStr + sensorDataList.get(k).getAoJianDataId()+"#";
					}else{
						PointList.add(sensorDataList.get(k).getTemperature());
					}
				} else if (oType.equals("sd")) {
					if(sensorDataList.get(k).getHumidity()>=WebConstConfig.errorData){
						errorDataIdsStr = errorDataIdsStr + sensorDataList.get(k).getAoJianDataId()+"#";
					}else{
						PointList.add(sensorDataList.get(k).getHumidity());
					}
				} else if (oType.equals("sf")) {
					if(sensorDataList.get(k).getWet()>=WebConstConfig.errorData){
						errorDataIdsStr = errorDataIdsStr + sensorDataList.get(k).getAoJianDataId()+"#";
					}else{
						PointList.add(sensorDataList.get(k).getWet());
					}
				} else if (oType.equals("ld")) {
					if(sensorDataList.get(k).getDewPoint()>=WebConstConfig.errorData){
						errorDataIdsStr = errorDataIdsStr + sensorDataList.get(k).getAoJianDataId()+"#";
					}else{
						PointList.add(sensorDataList.get(k).getDewPoint());
					}
				} else {

				}
			}
		}
		for (int i = 0; i < aoJianDataList.size(); i++) {
			// 拼aojianIds数组
			if(!errorDataIdsStr.contains(aoJianDataList.get(i).getId())){
				Date date = aoJianDataList.get(i).getStartDate();
				String dateStr = CalendarUtil.formatStr(date, CalendarUtil.DATE_FORMAT_MODE4);
				dateStr = dateStr.substring(5, dateStr.length());
				timerStr = timerStr + dateStr + ",";
			}
		}
		String[] pointArr = point.split(",");
		int ids_x = Integer.parseInt(pointArr[0]) + 1;
		int ids_y = Integer.parseInt(pointArr[1]) + 1;
		int ids_z = Integer.parseInt(pointArr[2]) + 1;
		// 组装数据
		StringBuffer subSb = new StringBuffer();
		String name = "点（层" + ids_z + ",行" + ids_x + ",列" + ids_y + "）";
		subSb.append("{\"name\":\"" + name + "\",\"data\":");
		subSb.append(PointList.toString());
		subSb.append("}");

		// 结果字符串
		StringBuffer sb = new StringBuffer();
		sb.append("[");

		if (subSb.length() > 0) {
			sb.append(subSb.substring(0, subSb.length()));
		}
		sb.append("]");

		// x轴信息
		if (!StringUtils.isEmpty(timerStr)) {
			resultMap.put("chartXAxis", timerStr.substring(0, timerStr.length() - 1));
			resultMap.put("chartSeries", sb.toString());
		} else {
			resultMap.put("chartXAxis", null);
			resultMap.put("chartSeries", null);
		}

		JSONObject data = JSONObject.fromObject(resultMap);
		out.print(data);

	}

	/**
	 * 获取显示数据信息
	 * 
	 * @param disPos
	 * @return
	 */
	private String getDisplayName(String disPos) {
		String dispalyName = "";
		String[] posArr = disPos.split(",");
		if (posArr.length != 3) {
			return dispalyName;
		}
		if (!posArr[0].equals("%")) {
			dispalyName = "行" + (Integer.parseInt(posArr[0]) + 1) + "";
		}
		if (!posArr[1].equals("%")) {
			dispalyName = "列" + (Integer.parseInt(posArr[1]) + 1) + "";
		}
		if (!posArr[2].equals("%")) {
			dispalyName = "层" + (Integer.parseInt(posArr[2]) + 1) + "";
		}
		return dispalyName;
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

	/**
	 * 获取前一周日期字符串
	 * 
	 * @param endDateStr
	 * @return
	 */
	private String getAWeekDateStr(String endDateStr) {
		String result = "";
		try {
			Date date = CalendarUtil.formatDate(endDateStr, CalendarUtil.DATE_FORMAT_MODE4);
			Date startDate = CalendarUtil.getNextDate(date, -8, 5); // 7前一周的数据
			result = CalendarUtil.formatStr(startDate, CalendarUtil.DATE_FORMAT_MODE4);
			result = result.substring(0, 10);
			result = result + " 00:00:00";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 获取x天的 日期字符串 Xday: 负值表示前几天，正值表示后几天
	 * 
	 * @param endDateStr
	 * @return
	 */
	private String getXdayDateStr(String endDateStr, int Xday) {
		String result = "";
		try {
			Date date = CalendarUtil.formatDate(endDateStr, CalendarUtil.DATE_FORMAT_MODE4);
			Date startDate = CalendarUtil.getNextDate(date, Xday, 5); // 7前一周的数据
			result = CalendarUtil.formatStr(startDate, CalendarUtil.DATE_FORMAT_MODE4);
			result = result.substring(0, 10);
			result = result + " 00:00:00";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 温度
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping({ "/lqjc/ssjc_3.action" })
	public ModelAndView ssjc_3Page(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		try {
			// ģ��·�� basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "LQJC");
			model.addAttribute("CURENT_TAB_2", "SSJC");
			model.addAttribute("CURENT_TAB_3", "SSJC_3");
			AoJianBean bean = getCurAoJianBean(request);
			if (null == bean || "0".equals(bean.getGrainStatus())) {

			} else {
				model = initDefaultData(model, bean, "sd");
			}
			// model.addAttribute("user",request.getSession().getAttribute("user"));
			return new ModelAndView(PageConst.LQJC_SSJC_3, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}

	@RequestMapping({ "/lqjc/ssjc_4.action" })
	public ModelAndView ssjc_4Page(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		try {
			AoJianBean bean = getCurAoJianBean(request);
			if (null == bean || "0".equals(bean.getGrainStatus())) {

			} else {
				model = initDefaultData(model, bean, "sf");
			}
			// ģ��·�� basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "LQJC");
			model.addAttribute("CURENT_TAB_2", "SSJC");
			model.addAttribute("CURENT_TAB_3", "SSJC_4");

			// model.addAttribute("user",request.getSession().getAttribute("user"));
			return new ModelAndView(PageConst.LQJC_SSJC_4, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;

		}
	}

	@RequestMapping({ "/lqjc/lqyc.action" })
	public ModelAndView lqycPage(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		try {
			// ģ��·�� basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "LQJC");
			model.addAttribute("CURENT_TAB_2", "LQYC");

			// model.addAttribute("user",request.getSession().getAttribute("user"));
			return new ModelAndView(PageConst.LQJC_LQYC, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;

		}
	}

	@RequestMapping({ "/lqjc/lscx.action" })
	public ModelAndView lscxPage(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		try {
			// ģ��·�� basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "LQJC");
			model.addAttribute("CURENT_TAB_2", "LSCX");

			// model.addAttribute("user",request.getSession().getAttribute("user"));
			return new ModelAndView(PageConst.LQJC_LSCX, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;

		}
	}

	@RequestMapping({ "/lqjc/lsxx.action" })
	public ModelAndView lsxxPage(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		try {
			AoJianBean aoJianBean = (AoJianBean) request.getSession().getAttribute("aoJian");
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());
			model.addAttribute("CURENT_TAB", "LQJC");
			model.addAttribute("CURENT_TAB_2", "LSXX");
			if (null == aoJianBean || "0".equals(aoJianBean.getGrainStatus())) {
				return new ModelAndView(PageConst.LQJC_LSXX, model);
			}

			if (null != aoJianBean) {
				String grainType = aoJianBean.getAoJianGrainInfoBean().getGrainType();
				GrainTypeBean grainTypeBean = null;
				try {
					grainTypeBean = ServiceManager.getGrainTypeServiceImpl().getById(grainType);
				} catch (Exception e) {
					e.printStackTrace();
				}
				model.addAttribute("grainTypeBean", grainTypeBean);
			}
			// model.addAttribute("user",request.getSession().getAttribute("user"));
			return new ModelAndView(PageConst.LQJC_LSXX, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;

		}
	}

	private boolean hasArrangementInfo(BarnBean barn) {
		Set<AoJianBean> aoJianSet = barn.getAoJianSet();
		Iterator<AoJianBean> it = aoJianSet.iterator();
		while (it.hasNext()) {
			AoJianBean aoJian = it.next();
			if (!StringUtils.isEmpty(aoJian.getSensorArrangementbeanId())) {
				return true;
			}
		}
		return false;
	}

	@RequestMapping({ "/lqjc/aojianModal.action" })
	public ModelAndView aojianModal(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		try {
			User user = (User) request.getSession().getAttribute("user");
			if (null == user) {
				// 未锟斤拷陆,锟斤拷锟斤拷
			} else {
				List<BarnBean> allBarnList = ServiceManager.getBarnServiceImpl().getBarnListWithArrangement();
				List<BarnBean> subBarn = new ArrayList<BarnBean>();
				List<String> idList = new ArrayList<String>();
				String aoJianIds = user.getRight_Content();
				if ("all".equals(aoJianIds)) {
					subBarn = ServiceManager.getBarnServiceImpl().findAll();
				} else {
					if(StringUtils.isEmpty(aoJianIds)){
						String[] idArr = aoJianIds.split("#");
						for (int i = 0; i < idArr.length; i++) {
							String id = idArr[i];
							AoJianBean aoJian = ServiceManager.getAoJianServiceImpl().getById(id);
							if (null != aoJian) {
								BarnBean barn = ServiceManager.getBarnServiceImpl().getById(aoJian.getBarnId());
								if (!subBarn.contains(barn) && hasArrangementInfo(barn)) {
									subBarn.add(barn);
									idList.add(barn.getId());
								}
							}
						}
					}
				}
				// 将用户自己管理的仓房放前面，后面添加默认的
				model.addAttribute("barnList", subBarn);
			}
			// 模板路径 basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());
			return new ModelAndView(PageConst.LQJC_aojianModal, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}

	@RequestMapping({ "/lqjc/lqModal.action" })
	public ModelAndView lqModal(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		try {
			String startDateStr = RequestUtil.getRequestParameter(request, "startDateStr");
			String endDateStr = RequestUtil.getRequestParameter(request, "endDateStr");
			HttpSession s = request.getSession(false);
			AoJianBean AoJianBean = (AoJianBean) s.getAttribute("aoJian");
			if (null == AoJianBean || "0".equals(AoJianBean.getGrainStatus())) {
				model.addAttribute("haveGrain", "no");
			} else {
				model.addAttribute("haveGrain", "yes");
				String grainId = null;
				if (!StringUtils.isEmpty(RequestUtil.getRequestParameter(request, "grainId"))) {
					grainId = RequestUtil.getRequestParameter(request, "grainId");
				} else {
					grainId = AoJianBean.getAoJianGrainInfoBean().getId();
				}

				AoJianDataBean aoJianDataBean = ServiceManager.getAoJianBlockService().getRecentAoJianDataBeanByGrainId(grainId);
				if (null == aoJianDataBean) {
					model.addAttribute("haveAoJianData", "no");
				} else {
					model.addAttribute("haveAoJianData", "yes");
					if (StringUtils.isEmpty(endDateStr)) {
						endDateStr = aoJianDataBean.getStartDate().toString();
					}
					if (StringUtils.isEmpty(startDateStr)) {
						startDateStr = getXdayDateStr(endDateStr, -30);
					}

					// 分页设置
					int pageNo = 1;
					int pageSize = 30;
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
						recordCount = ServiceManager.getAoJianBlockService().getTotalNumAoJianData(grainId, startDateStr, endDateStr);

					}

					List<AoJianDataBean> aoJianDataList = ServiceManager.getAoJianBlockService().getOrderedAoJianDataList(grainId, startDateStr, endDateStr, pageNo, pageSize);

					System.out.println("aoJianDataList=" + aoJianDataList.toString());
					System.out.println("pageNo=" + RequestUtil.getRequestNumStr(request, "pageNo"));

					if (aoJianDataList.size() > 0) {
						model.addAttribute("AoJianDataList", aoJianDataList);
					} else {
						
					}

					model.addAttribute("grainId", grainId);
					model.addAttribute("startDateStr", startDateStr);
					model.addAttribute("endDateStr", endDateStr);
					// 分页显示属性
					model.addAttribute("pageNo", pageNo);
					model.addAttribute("pageSize", pageSize);
					model.addAttribute("recordCount", recordCount);
				}
			}
			// 模板路径 basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());
			return new ModelAndView(PageConst.LQJC_lqjcModal_lq, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;

		}
	}

	@RequestMapping({ "/lqjc/ssjc_2_data.action" })
	public String ssjc_2_data(HttpServletRequest requset) {

		String kk = "";
		System.out.println(kk);
		return kk;

	}

	/**
	 * 查看某一个点的温湿度变化曲线 默认21天数据
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping({ "/lqjc/shouPointDetail.action" })
	public ModelAndView shouPointDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		// operateType wd sd sf
		String oType = RequestUtil.getRequestParameter(request, "oType");
		// 点信息
		String ids = RequestUtil.getRequestParameter(request, "point");

		AoJianBean bean = (AoJianBean) request.getSession().getAttribute("aoJian");
		if (null == bean) {
			System.out.println("error");
			return null;
		}
		String grainId = bean.getAoJianGrainInfoBean().getId();
		AoJianDataBean aoJianDataBean = ServiceManager.getAoJianBlockService().getRecentAoJianDataBeanByGrainId(grainId);
		//
		String endDateStr = CalendarUtil.formatStr(aoJianDataBean.getStartDate(), CalendarUtil.DATE_FORMAT_MODE4);
		String startDateStr = getXdayDateStr(endDateStr, -5);
		List<AoJianDataBean> aoJianDataList = ServiceManager.getAoJianBlockService().getAoJianDataList(grainId, startDateStr, endDateStr);

		Map<String, String> commenDate = new HashMap<String, String>();
		commenDate.put("RecentDate", endDateStr);
		commenDate.put("startDate", startDateStr);
		model.addAttribute("CommenDate", commenDate);// 时间区间确定
		model.addAttribute("point", ids);
		model.addAttribute("grainId", grainId);

		ArrayList<String> aojianIds = new ArrayList<String>();
		String timerStr = "";
		for (int i = 0; i < aoJianDataList.size(); i++) {
			// 拼aojianIds数组
			aojianIds.add(aoJianDataList.get(i).getId());
		}

		List<SensorDataBean> sensorDataList = ServiceManager.getAoJianBlockService().getPointSensorDataByAojianIds(aojianIds, ids);
		String errorDataIdsStr = "";
		List<Double> PointList = new ArrayList<Double>();// 点数据集合
		if (sensorDataList.size() > 0) {
			for (int k = 0; k < sensorDataList.size(); k++) {
				if (oType.equals("wd")) {
					if(sensorDataList.get(k).getTemperature()>=WebConstConfig.errorData){
						errorDataIdsStr = errorDataIdsStr + sensorDataList.get(k).getAoJianDataId()+"#";
					}else{
						PointList.add(sensorDataList.get(k).getTemperature());
					}
				} else if (oType.equals("sd")) {
					if(sensorDataList.get(k).getHumidity()>=WebConstConfig.errorData){
						errorDataIdsStr = errorDataIdsStr + sensorDataList.get(k).getAoJianDataId()+"#";
					}else{
						PointList.add(sensorDataList.get(k).getHumidity());
					}
				} else if (oType.equals("sf")) {
					if(sensorDataList.get(k).getWet()>=WebConstConfig.errorData){
						errorDataIdsStr = errorDataIdsStr + sensorDataList.get(k).getAoJianDataId()+"#";
					}else{
						PointList.add(sensorDataList.get(k).getWet());
					}
				} else if (oType.equals("ld")) {
					if(sensorDataList.get(k).getDewPoint()>=WebConstConfig.errorData){
						errorDataIdsStr = errorDataIdsStr + sensorDataList.get(k).getAoJianDataId()+"#";
					}else{
						PointList.add(sensorDataList.get(k).getDewPoint());
					}
				} else {

				}
			}
		}
		for (int i = 0; i < aoJianDataList.size(); i++) {
			// 拼aojianIds数组
			if(!errorDataIdsStr.contains(aoJianDataList.get(i).getId())){
				Date date = aoJianDataList.get(i).getStartDate();
				String dateStr = CalendarUtil.formatStr(date, CalendarUtil.DATE_FORMAT_MODE4);
				dateStr = dateStr.substring(5, dateStr.length());
				timerStr = timerStr + dateStr + ",";
			}
		}
		
		String[] pointArr = ids.split(",");
		int ids_x = Integer.parseInt(pointArr[0]) + 1;
		int ids_y = Integer.parseInt(pointArr[1]) + 1;
		int ids_z = Integer.parseInt(pointArr[2]) + 1;
		// 组装数据
		StringBuffer subSb = new StringBuffer();
		String name = "点（层" + ids_z + ",行" + ids_y + ",列" + ids_x + "）";
		subSb.append("{\"name\":\"" + name + "\",\"data\":");
		subSb.append(PointList.toString());
		subSb.append("}");

		// 结果字符串
		StringBuffer sb = new StringBuffer();
		sb.append("[");

		if (subSb.length() > 0) {
			sb.append(subSb.substring(0, subSb.length()));
		}
		sb.append("]");
		// x轴信息
		model.addAttribute("chartXAxis", timerStr.substring(0, timerStr.length() - 1));
		model.addAttribute("chartSeries", sb.toString());
		model.addAttribute("oType", oType);
		//

		model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
		model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
		model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());
		try {
			return new ModelAndView(PageConst.LQJC_lqjcModal, model);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// 私有方法
	private BarnBean getCurbarnBean(HttpServletRequest request) {
		AoJianBean AoJianBean = getCurAoJianBean(request);
		BarnBean barn = ServiceManager.getBarnServiceImpl().getById(AoJianBean.getBarnId());
		return barn;
	}

	/**
	 * @名称: realTimeMonitoring
	 * @日期：2015-9-29 上午10:58:06
	 * @作者： lxb
	 * @描述: 实时监测
	 * @参数 @param request
	 * @参数 @param response
	 * @参数 @param model
	 * @参数 @return
	 * @返回值 ModelAndView
	 * @异常
	 */
	@RequestMapping({ "/lqjc/realTimeMonitoring.action" })
	@ResponseBody
	public Map realTimeMonitoring(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		Map<String, String> map = new HashMap<String, String>();
		try {
			AoJianBean aoJian = (AoJianBean) request.getSession(false).getAttribute("aoJian");
			if (StringUtils.isEmpty(aoJian.getDataSourceType())) {
				map.put("success", "false");
				return map;
			} else {
				map.put("success", "true");
				// 判断传感器是否连接正常
				URL path = Thread.currentThread().getContextClassLoader().getResource("");
				String pathStr = path.getPath();
				String[] pathStrArr = pathStr.split("WEB-INF");
				String timeWriteInPath = pathStrArr[0] + "data/sys/" + "RecentNewDataTime.txt";
				String timeStr = new FileUtils().read(timeWriteInPath);
				if (StringUtils.isEmpty(timeStr)) {
					Date curDate = new Date();
					timeStr = CalendarUtil.formatStr(curDate, CalendarUtil.DATE_FORMAT_MODE4);
				}
				Date date = CalendarUtil.formatDate(timeStr, CalendarUtil.DATE_FORMAT_MODE4);
				String cacheTime = (String) request.getSession(false).getAttribute("cacheTime");
				long timeDifference = new Date().getTime() - date.getTime();
				double cacheTimeLong = Double.parseDouble(cacheTime) * 3600 * 1000;
				if (timeDifference - cacheTimeLong > 60000) {
					map.put("hasNewDataTime", (int) ((timeDifference - cacheTimeLong) / 1000 / 60) / 60 + "时" + (int) ((timeDifference - cacheTimeLong) / 1000 / 60) % 60 + "分");
					map.put("hasNewData", "false");
				} else {
					map.put("hasNewData", "true");
					// if(aoJian.getDataSourceType().equals("dbdb1")){
					// List<AoJianBean> list = new ArrayList<AoJianBean>();
					// list.add(aoJian);
					// SerialPortDataOperater operater = new SerialPortDataOperater(list);
					// map.put("success", operater.getRunTimeRemoteData(""));
					// }else{
					if (new Adapter().getRunTimeRemoteData(aoJian.getZyAoJianNum(), "")) {
						AoJianDataBean aoJianData = ServiceManager.getAoJianBlockService().getRecentAoJianDataBeanByGrainId(aoJian.getAoJianGrainInfoBean().getId());
						request.getSession(false).removeAttribute("lqIdbean");
						request.getSession(false).setAttribute("lqIdbean", aoJianData);
						AoJianDataBean v = (AoJianDataBean) request.getSession(false).getAttribute("lqIdbean");
						System.out.println(v.getStartDate());
						map.put("successTwo", "true");
					} else {
						map.put("successTwo", "false");
					}
					// }
				}
				return map;
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", "false");
			return map;
		}

	}

	/**
	 * @名称: fdszModel
	 * @日期：2015-11-18 上午11:34:30
	 * @作者： lxb
	 * @描述: 风道数据模态窗口
	 * @参数 @param request
	 * @参数 @param response
	 * @参数 @param model
	 * @参数 @return
	 * @返回值 ModelAndView
	 * @异常
	 */
	@RequestMapping({ "/lqjc/fdszModel.action" })
	public ModelAndView fdszModel(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		try {
			HttpSession s = request.getSession(false);
			AoJianBean bean = (AoJianBean) s.getAttribute("aoJian");
			// 获取粮情记录对象
			AoJianDataBean aoJianDataBean = null;
			if (null == bean || "0".equals(bean.getGrainStatus()) || null == bean.getAoJianGrainInfoBean()) {
				return new ModelAndView(PageConst.LQJC_SSJC, model);
			} else {
				if (s.getAttribute("lqIdbean") != null) {
					aoJianDataBean = (AoJianDataBean) s.getAttribute("lqIdbean");

				} else {
					aoJianDataBean = ServiceManager.getAoJianBlockService().getRecentAoJianDataBeanByGrainId(bean.getAoJianGrainInfoBean().getId());
					s.setAttribute("lqIdbean", aoJianDataBean);
				}
				if (null == aoJianDataBean) {
					model.addAttribute("hasdata", "no");
					return new ModelAndView(PageConst.LQJC_SSJC, model);
				} else {
					model.addAttribute("hasdata", "yes");
				}

			}
			String fd1Tem = aoJianDataBean.getFd1Tem();
			String fd1Hum = aoJianDataBean.getFd1Hum();
			String fd2Tem = aoJianDataBean.getFd2Tem();
			String fd2Hum = aoJianDataBean.getFd2Hum();
			List<String> fd1TemArr = new ArrayList<String>();
			if (!StringUtils.isEmpty(fd1Tem)) {
				fd1TemArr = Arrays.asList(fd1Tem.split(","));
			}
			List<String> fd1HumArr = new ArrayList<String>();
			if (!StringUtils.isEmpty(fd1Hum)) {
				fd1HumArr = Arrays.asList(fd1Hum.split(","));
			}
			List<String> fd2TemArr = new ArrayList<String>();
			if (!StringUtils.isEmpty(fd2Tem)) {
				fd2TemArr = Arrays.asList(fd2Tem.split(","));
			}
			List<String> fd2HumArr = new ArrayList<String>();
			if (!StringUtils.isEmpty(fd2Hum)) {
				fd2HumArr = Arrays.asList(fd2Hum.split(","));
			}

			model.addAttribute("fd1TemArr", fd1TemArr);
			model.addAttribute("fd1HumArr", fd1HumArr);
			model.addAttribute("fd2TemArr", fd2TemArr);
			model.addAttribute("fd2HumArr", fd2HumArr);
			String[] fd1;
			if (!StringUtils.isEmpty(bean.getFd1())) {
				fd1 = bean.getFd1().split(",");
			} else {
				fd1 = null;
			}
			model.addAttribute("fd1", fd1);
			String[] fd2;
			if (!StringUtils.isEmpty(bean.getFd2())) {
				fd2 = bean.getFd2().split(",");
			} else {
				fd2 = null;
			}
			model.addAttribute("fd2", fd2);

			model.addAttribute("aoJianBean", bean);

			BarnBean barnBean = getCurbarnBean(request);
			String fangxiang = null;
			if (barnBean.getAngle() > -45 && barnBean.getAngle() < 45) {// 仓房布置方向
				fangxiang = "NorthSouth";

			} else {
				fangxiang = "EastWest";
			}
			model.addAttribute("fangxiang", fangxiang);
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());
			return new ModelAndView(PageConst.LQJC_fdDataDisplayModel, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}

	/**
	 * @名称: initExportMap
	 * @日期：2015-11-20 上午10:56:13
	 * @作者： lxb
	 * @描述: 【数据列表】数据格式二，按缆号分层显示数据
	 * @参数 @param model
	 * @参数 @param aoJiandata
	 * @参数 @return
	 * @返回值 ModelMap
	 * @异常
	 */
	private ModelMap getAoJianDataByAoJianId_2(ModelMap model, AoJianDataBean aoJiandata) {
		List<String> resultData = new ArrayList<String>();
		List<Integer> cableIndexList = ServiceManager.getAoJianBlockService().getCableIndexListByAoJianDataId(aoJiandata.getId());
		model.addAttribute("maxCableIndex", cableIndexList.get(cableIndexList.size()-1));
		Map<Integer, Map<Integer,SensorDataBean>> temMap = new HashMap<Integer, Map<Integer,SensorDataBean>>();
		temMap = initTemMap(cableIndexList);// 先出结构
		// 准备数据
		List<SensorDataBean> sensorList = ServiceManager.getAoJianBlockService().getSensorDataList(aoJiandata, "", "orderIndex");
		Iterator<SensorDataBean> it = sensorList.iterator();
		while (it.hasNext()) {
			SensorDataBean sensorDataBean = (SensorDataBean) it.next();
			if (!StringUtils.isEmpty(sensorDataBean.getCableIndex())) {
				String cableIndex = sensorDataBean.getCableIndex().trim();
				Map<Integer,SensorDataBean> map = temMap.get(Integer.parseInt(cableIndex));
				if(!map.containsKey(sensorDataBean.getProbeNum())){
					map.put(sensorDataBean.getProbeNum(), sensorDataBean);
				}
			}
		}
		// 数据打包
		Map<String, Map<String, Map<String,String>>> resultDataInit = initResultMapList(resultData, temMap, cableIndexList, aoJiandata);
		model.addAttribute("lqData", resultDataInit);
		System.out.println(resultDataInit);
		return model;
	}

	// private String getExcelStr(List<String> resultData, AoJianDataBean aoJiandata) {
	// StringBuffer sb = new StringBuffer();
	// sb.append("<table border='1'>");
	// // 拼接头---两行 一行标题 一行备注信息
	// sb.append("<tr >");
	// sb.append("<td colspan = 18 align=center >");
	// sb.append("安徽现代粮食物流中心库28粮情报表 ");
	// sb.append("</td>");
	// sb.append("</tr>");
	// sb.append("<tr>");
	// sb.append("<td colspan = 18 align=right>");
	// sb.append("报表时间：");
	// sb.append(aoJiandata.getStartDate());
	// sb.append("</td>");
	// sb.append("</tr>");
	// // ---拼接表头
	// sb.append("<tr >");
	// sb.append("<td rowspan=2>检测时间</td>");
	// sb.append("<td rowspan=2>检测点</td>");
	// sb.append("<td colspan=4>第一层</td>");
	// sb.append("<td colspan=4>第二层</td>");
	// sb.append("<td colspan=4>第三层</td>");
	// sb.append("<td colspan=4>第四层</td>");
	// sb.append("</tr>");
	// sb.append("<tr >");
	// for (int i = 0; i < 4; i++) {
	// sb.append("<td >温度</td>");
	// sb.append("<td >湿度</td>");
	// sb.append("<td >水份</td>");
	// sb.append("<td >露点</td>");
	// }
	// sb.append("</tr>");
	// // 内容区
	// for (int i = 0; i < resultData.size(); i++) {
	// String resultStr = resultData.get(i);
	// String[] resultStrArr = resultStr.split(",");
	// sb.append("<tr >");
	// for (int j = 0; j < resultStrArr.length; j++) {
	// sb.append("<td >" + resultStrArr[j] + "</td>");
	// }
	// sb.append("</tr>");
	// }
	// // 尾部
	// sb.append("</table>");
	// return sb.toString();
	// }

	private void initResultList(List<String> resultData, Map<Integer, List<SensorDataBean>> temMap, List<Integer> cableIndexList, AoJianDataBean aoJiandata) {
		for (int i = 0; i < cableIndexList.size(); i++) {
			Integer cableIndex = cableIndexList.get(i);
			String displayStr = aoJiandata.getStartDate() + "," + cableIndex + ",";
			List<SensorDataBean> dataList = temMap.get(cableIndex);
			for (int j = 0; j < dataList.size(); j++) {
				SensorDataBean data = dataList.get(j);
				displayStr = displayStr + data.getTemperature() + "," + data.getHumidity() + "," + data.getWet() + "," + data.getDewPoint() + ",";
			}
			if (displayStr.length() > 2) {
				displayStr = displayStr.substring(0, displayStr.length() - 1);
			}
			resultData.add(displayStr);
		}
	}

	private Map<String, Map<String, Map<String,String>>> initResultMapList(List<String> resultData, Map<Integer, Map<Integer,SensorDataBean>> temMap, List<Integer> cableIndexList, AoJianDataBean aoJiandata) {
		Map<String,Map<String, Map<String,String>>> result = new HashMap<String, Map<String, Map<String,String>>>();
		for (int i = 0; i < cableIndexList.size(); i++) {
			Integer cableIndex = cableIndexList.get(i);
			Map<String, Map<String,String>> subMap = new HashMap<String, Map<String,String>>();
			result.put("" + cableIndex + "", subMap);
			Map<Integer,SensorDataBean> dataMap = temMap.get(cableIndex);
			Iterator<Integer> it = dataMap.keySet().iterator();
			while (it.hasNext()) {
				Integer integer = (Integer) it.next();
				SensorDataBean data = dataMap.get(integer);
				Map<String, String> map;
				if(subMap.containsKey(integer)){
					map = subMap.get(integer);
				}else{
					map = new HashMap<String, String>();
					subMap.put(integer+"", map);
				}
				if(data.getTemperature()>=WebConstConfig.errorData){
					map.put("wd", "无");
				}else{
					map.put("wd",  + data.getTemperature()+"");
				}
				if(data.getHumidity()>=WebConstConfig.errorData){
					map.put("sd", "无");
				}
				else{
					map.put("sd", data.getHumidity() + "");
				}
				if(data.getWet()>=WebConstConfig.errorData){
					map.put("sf", "无");
				}
				else{
					map.put("sf", data.getWet() + "");
				}
				if(data.getDewPoint()>=WebConstConfig.errorData){
					map.put("ld", "无");
				}
				else{
					map.put("ld", data.getDewPoint() + "");
				}
			}
		}
		JSONObject jo = JSONObject.fromObject(result);
		System.out.println(jo.toString());
		return jo;
	}

	// 组装数据结构
	private Map<Integer, Map<Integer,SensorDataBean>> initTemMap(List<Integer> cableIndexList) {
		Map<Integer, Map<Integer,SensorDataBean>> temMap = new HashMap<Integer, Map<Integer,SensorDataBean>>();
		for (int i = 0; i < cableIndexList.size(); i++) {
			Integer key = cableIndexList.get(i);
			if (temMap.containsKey(key)) {
				continue;
			} else {
				temMap.put(key, new HashMap<Integer, SensorDataBean>());
			}
		}
		return temMap;
	}

	 /**
	 * @名称: ssjc_2Page 
	 * @日期：2015-11-23 下午6:53:30
	 * @作者： lxb
	 * @描述: TODO 
	 * @参数 @param request
	 * @参数 @param response
	 * @参数 @param model
	 * @参数 @return    
	 * @返回值 ModelAndView    
	 * @异常
	  */
	@RequestMapping({ "/lqjc/deleteAoJianDataById.action" })
	@ResponseBody
	public Map deleteAoJianDataById(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		Map map = new HashMap();
		try {
			String aoJianGrainDataId = RequestUtil.getRequestParameter(request, "dataId");
			AoJianDataBean aoJianData = ServiceManager.getAoJianBlockService().getById(aoJianGrainDataId);
			String aoJianGrainId = aoJianData.getZyAoJianGrainNum();
			//删除sensorData
			//删除数据本身
			ServiceManager.getAoJianBlockService().deleteAoJianDataById(aoJianGrainDataId);
			//删除告警信息
			ServiceManager.getAlarmDataInfoServiceImpl().deleteAlarmDataByAoJianDataId(aoJianGrainDataId);
			//删除之后清除session   
			request.getSession().removeAttribute("lqIdbean");
			map.put("success", true);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			map.put("success", false);
			return map;
		}
	}
	/*
	 * 粮情检索
	 */
	@RequestMapping(value = "/lqjc/searchLq.action")
	public ModelAndView searchLq(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		// 分页设置
		String isform = RequestUtil.getRequestParameter(request, "isform");
		int pageNo = 1;
		int pageSize = 60;
		int recordCount;
		if (!StringUtils.isEmpty(RequestUtil.getRequestNumStr(request, "pageNo"))) {
			pageNo = Integer.parseInt(RequestUtil.getRequestNumStr(request, "pageNo"));
		}
		if (!StringUtils.isEmpty(RequestUtil.getRequestNumStr(request, "pageSize"))) {
			pageSize = Integer.parseInt(RequestUtil.getRequestNumStr(request, "pageSize"));
		}

		String doSearch = RequestUtil.getRequestParameter(request, "doSearch");
		if(!StringUtils.isEmpty(doSearch)){
			StringBuffer sb = new StringBuffer();
			String aoJianId = RequestUtil.getRequestParameter(request, "aoJianId");
			AoJianBean aoJian = ServiceManager.getAoJianServiceImpl().getById(aoJianId);
			String startDateStr = RequestUtil.getRequestParameter(request, "startDate");
			String endDateStr = RequestUtil.getRequestParameter(request, "endDate");
			String grainId = "";
			if(!StringUtils.isEmpty(aoJianId)&&null!=aoJian&&null != aoJian.getAoJianGrainInfoBean()){
				grainId = aoJian.getAoJianGrainInfoBean().getId();
			}
			List<AoJianDataBean> aoJianDataList = ServiceManager.getAoJianBlockService().getOrderedAoJianDataList(grainId, startDateStr, endDateStr,pageNo,pageSize);
			model.addAttribute("aoJianDataList", aoJianDataList);
			
			if (!StringUtils.isEmpty(RequestUtil.getRequestNumStr(request, "recordCount"))) {
				recordCount = Integer.parseInt(RequestUtil.getRequestNumStr(request, "recordCount"));
			} else {
				recordCount = ServiceManager.getAoJianBlockService().getTotalNumByParam(grainId, startDateStr, endDateStr);
			}
			model.addAttribute("recordCount", recordCount);
			model.addAttribute("doSearch", doSearch);
			model.addAttribute("startDate", startDateStr);
			model.addAttribute("endDate", endDateStr);
			model.addAttribute("aoJianId", aoJianId);
		}
		
		List<AoJianBean> aoJianList = ServiceManager.getAoJianServiceImpl().findValidateAoJianList();
		model.addAttribute("isform", isform);
		model.addAttribute("aoJianList", aoJianList);
		model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
		model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
		model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());

		model.addAttribute("CURENT_TAB", "LQJC");
		model.addAttribute("CURENT_TAB_2", "BJLQ");

		// 分页显示属性
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("pageSize", pageSize);
	
		return new ModelAndView(PageConst.LQJC_searchLq, model);
	}
	
	
	
	// 详细数据大表
		@RequestMapping({ "/lqjc/editLq.action" })
		public ModelAndView editLq(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
			try {
				model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
				model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
				model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());

				model.addAttribute("CURENT_TAB", "LQJC");
				model.addAttribute("CURENT_TAB_2", "BJLQ");

				String lqId = RequestUtil.getRequestParameter(request, "lqId");
				
				AoJianDataBean aoJianDataBean = ServiceManager.getAoJianBlockService().getById(lqId);
				String aoJianZyGrainNum = aoJianDataBean.getZyAoJianGrainNum();
				AoJianGrainInfoBean grainAoJian = ServiceManager.getAoJianGrainInfoServiceImpl().getById(aoJianZyGrainNum);
				AoJianBean bean = ServiceManager.getAoJianServiceImpl().getById(grainAoJian.getZyAoJianNum());
				model.addAttribute("aoJianDataBean", aoJianDataBean);
				JSONObject baseJson = getBaseDataInfo(aoJianDataBean, bean);
				BarnBean barnBean = ServiceManager.getBarnServiceImpl().getById(bean.getBarnId());
				model.addAttribute("barnIndex", barnBean.getBarnIndex());
				model.addAttribute("CommenData", baseJson);

				
				SensorArrangementBean arrangementBean = ServiceManager.getSensorArrangementServiceImpl().getById(bean.getSensorArrangementbeanId());
				// 布置信息 行 列 排 已经廒间信息
				String pointDirectionStr = arrangementBean.getPointDirection();
				model.addAttribute("pointDirectionStr", pointDirectionStr);	
				model.addAttribute("arrangementBean", arrangementBean);
				model.addAttribute("aoJianBean", bean);

				String fangxiang = null;
				if (barnBean.getAngle() > -45 && barnBean.getAngle() < 45) {// 仓房布置方向
					fangxiang = "NorthSouth";
				} else {
					fangxiang = "EastWest";
				}

				// 【数据格式一】按三维2015.8
				// List list = getAoJianDataByAoJianId(aoJianDataBean, arrangementBean, fangxiang);
				// JSONArray jsonArr = JSONArray.fromObject(list);
				// model.addAttribute("lqData", jsonArr);

				// 【数据格式二】按测点（用户常用）2015.11.21
				getAoJianDataByAoJianId_2(model, aoJianDataBean);

				// json大表核心数据区域
				model.addAttribute("lqID", aoJianDataBean.getId());
				model.addAttribute("ZyGrainID", aoJianDataBean.getZyAoJianGrainNum());
				model.addAttribute("lqtime", CalendarUtil.formatStr(aoJianDataBean.getStartDate(), CalendarUtil.DATE_FORMAT_MODE4));
				model = getStatInfo(aoJianDataBean, arrangementBean, model);
				List<User> userList = ServiceManager.getUserService().findByContent(bean.getZyAoJianNum());
				User kgy = null;
				User lqy = null;
				for (int i = 0; i < userList.size(); i++) {
					User user = userList.get(i);
					if (user.getRightLevel().equals("3")) {
						kgy = user;
					}
					if (user.getRightLevel().equals("4")) {
						lqy = user;
					}
				}
				model.addAttribute("kgy", kgy);
				model.addAttribute("lqy", lqy);
				// basePath
				addFdData(model, bean, aoJianDataBean);
				return new ModelAndView(PageConst.LQJC_eidtLq, model);
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("error", e.getMessage());
				return null;
			}
		}
		/**
		* @名称: updateAoJianData 
		* @日期：2015-11-25 下午7:26:40
		* @作者： lxb
		* @描述: 编辑粮情
		* @参数 @param request
		* @参数 @param response
		* @参数 @param model
		* @参数 @return    
		* @返回值 boolean    
		* @异常
		 */
		@RequestMapping(value = "/lqjc/updateAoJianData.action", method = RequestMethod.POST)
		@ResponseBody
		public boolean updateAoJianData(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
			String aoJianId = RequestUtil.getRequestParameter(request, "aoJianId");
			String aoJianDataId = RequestUtil.getRequestParameter(request, "aoJianDataId");
			AoJianDataBean dataBean = ServiceManager.getAoJianBlockService().getById(aoJianDataId);
			//临时的容器
			List<SensorDataBean> sensorList = ServiceManager.getAoJianBlockService().getSensorDataList(dataBean, "", "orderIndex");
			Map<String,SensorDataBean> temMap = getTemMap(sensorList);
			AoJianBean aoJian = ServiceManager.getAoJianServiceImpl().getById(aoJianId);
			String arrangemengId = aoJian.getSensorArrangementbeanId();
			SensorArrangementBean arrangement = ServiceManager.getSensorArrangementServiceImpl().getById(arrangemengId);
			if(null == arrangement){
				return false;
			}
			CoordinatorExchangeTemInterface coord = ControllerUtils.getArrangementTemPathByArrangement(arrangement);
			Map<Integer, String> coordinateMap = coord.getCoordinateMap(arrangement);
			try {
				for (int i = 1; i < 14; i++) {
					for (int j = 0; j < arrangement.getLayerCount(); j++) {
						String iName = i+"_"+j+"_";
						String tem = RequestUtil.getRequestParameter(request, iName+"wd");
						String hum = RequestUtil.getRequestParameter(request, iName+"sd");
						String wet = RequestUtil.getRequestParameter(request, iName+"sf");
						String dewP = RequestUtil.getRequestParameter(request, iName+"ld");
						String pos = coordinateMap.get(i)+","+j;
						SensorDataBean sensorDataBean = temMap.get(pos);
						try {
							sensorDataBean.setTemperature(Double.parseDouble(tem));
							sensorDataBean.setHumidity(Double.parseDouble(hum));
							sensorDataBean.setWet(Double.parseDouble(wet));
							sensorDataBean.setDewPoint(Double.parseDouble(dewP));
							ServiceManager.getAoJianBlockService().update(sensorDataBean);
						} catch (Exception e) {
							e.printStackTrace();
							continue;
						}
					}
				} 
				dataBean.setIsEdited(true);
				try {
					ServiceManager.getAoJianBlockService().update(dataBean);
				} catch (Exception e) {
					System.out.println("update dataBean error--1");
					return false;
				}
				try {
					Adapter a = new Adapter();
					AoJianGrainInfoBean grainBean = aoJian.getAoJianGrainInfoBean();
					a.setAoJian(aoJian);
					a.setAoJianData(dataBean);
					SensorArrangementBean sensorArrangementBean = ServiceManager.getSensorArrangementServiceImpl().getById(aoJian.getSensorArrangementbeanId());
					a.dataOperate(sensorArrangementBean, dataBean);
				} catch (Exception e) {
					e.printStackTrace();
					return false;
				}
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("error", e.getMessage());
				return false;
			}
		}

		private Map<String, SensorDataBean> getTemMap(List<SensorDataBean> list) {
			Map<String, SensorDataBean> result = new HashMap<String, SensorDataBean>();
			Iterator<SensorDataBean> it = list.iterator();
			while (it.hasNext()) {
				SensorDataBean sensorDataBean = (SensorDataBean) it.next();
				result.put(sensorDataBean.getSensorIndex(), sensorDataBean);
			}
			return result;
		}
}



