package com.spring.controller;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.common.consts.PageConst;
import com.common.consts.WebConstConfig;
import com.common.pointTem.CoordinatorExchangeTemInterface;
import com.common.utils.CalendarUtil;
import com.common.utils.CommonUtils;
import com.common.utils.GenerateSequenceUtil;
import com.common.utils.RequestUtil;
import com.common.utils.StringUtils;
import com.ftlTemplates.FreeMarkerUtil;
import com.hibernate.barnInfo.domain.AoJianBean;
import com.hibernate.barnInfo.domain.AoJianGrainInfoBean;
import com.hibernate.barnInfo.domain.BarnBean;
import com.hibernate.baseSettingInfo.domain.AlarmBean;
import com.hibernate.baseSettingInfo.domain.BaseSettingBean;
import com.hibernate.baseSettingInfo.domain.GrainTypeBean;
import com.hibernate.sernsorInfo.domain.AoJianDataBean;
import com.hibernate.sernsorInfo.domain.ArrangementDataBean;
import com.hibernate.sernsorInfo.domain.SensorArrangementBean;
import com.hibernate.sernsorInfo.domain.SensorBean;
import com.hibernate.timers.domain.TimerTaskBean;
import com.hibernate.userInfo.damain.RoleBean;
import com.hibernate.userInfo.damain.User;
import com.hibernate.ventilate.domain.BaseDevice;
import com.hibernate.ventilate.domain.FanDeviceBean;
import com.hibernate.ventilate.domain.VentDeviceBean;
import com.hibernate.ventilate.domain.VentModeBean;
import com.hibernate.ventilate.domain.WindDetectionDeviceBean;
import com.hibernate.ventilate.domain.WindowDeviceBean;
import com.spring.ServiceManager;
@Controller
public class XtszController {
    private static Logger logger = Logger.getLogger(Logger.class);
    /**
     * 浠撴埧璁剧疆
     * 
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping({ "/xtsz/jbsz.action", "/xtsz.action" })
    public ModelAndView barnSetting(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
            List<SensorBean> sensorList = ServiceManager.getSensorServiceImpl()
                    .findAll();
            User user = (User) request.getSession().getAttribute("user");
            if (null != user) {
                model.addAttribute("theme", user.getTheme());
            }
            model.addAttribute("sensorList", sensorList);
            List<GrainTypeBean> grainList = ServiceManager
                    .getGrainTypeServiceImpl().findAll();
            model.addAttribute("grainList", grainList);
            // 妯℃澘璺¯寰 basePath
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            // model.addAttribute("user",request.getSession().getAttribute("user"));
            model.addAttribute("CURENT_TAB", "XTSZ");
            model.addAttribute("CURENT_TAB_2", "JBSZ");
            model = getBaseSettingInfo(model);
            return new ModelAndView(PageConst.XTSZ_JBSZ, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;
        }
    }
    /**
     * 鑾峰彇璁剧疆鐩稿叧淇℃伅
     * 
     * @param model
     * @return
     */
    private ModelMap getBaseSettingInfo(ModelMap model) {
        List<BaseSettingBean> list = ServiceManager.getBaseSettingServiceImpl()
                .findAll();
        for (int i = 0; i < list.size(); i++) {
            BaseSettingBean bean = list.get(i);
            model.put(bean.getKey(), bean.getValue());
        }
        return model;
    }
    /**
     * 涓插彛璁剧疆
     * 
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping({ "/xtsz/cfsz.action" })
    public ModelAndView cksz(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
            User user = (User)request.getSession().getAttribute("user");
            if(null == user){
                System.out.println("no user lgin");
            }
            List<BarnBean> allBarnList = ServiceManager.getBarnServiceImpl().findAll();
			List<BarnBean> subBarn = new ArrayList<BarnBean>();
			List<BarnBean> barnList = new ArrayList<BarnBean>();
			List<String> idList = new ArrayList<String>();
			String aoJianIds = user.getRight_Content();
			if ("all".equals(aoJianIds)) {
				// barnList = ServiceManager.getBarnServiceImpl().findAll();
			} else {
				String[] idArr = aoJianIds.split("#");
				for (int i = 0; i < idArr.length; i++) {
					String id = idArr[i];
					AoJianBean aoJian = ServiceManager.getAoJianServiceImpl().getById(id);
					if (null != aoJian) {
						BarnBean barn = ServiceManager.getBarnServiceImpl().getById(aoJian.getBarnId());
						if (!subBarn.contains(barn)) {
							subBarn.add(barn);
							idList.add(barn.getId());
						}
					}
				}
			}
			// 将用户自己管理的仓房放前面，后面添加默认的
			barnList.addAll(subBarn);
			for (int i = 0; i < allBarnList.size(); i++) {
				BarnBean curBarnBean = allBarnList.get(i);
				if (idList.contains(curBarnBean.getId())) {
					continue;
				} else {
					barnList.add(curBarnBean);
				}
			}
            List<User> userList = ServiceManager.getUserService().getListByRoleId("3");
			model.addAttribute("userList", userList);
            model.addAttribute("barnList", barnList);
            //布置信息
            List<SensorArrangementBean> sensorArrangementBeanList = ServiceManager
                    .getSensorArrangementServiceImpl().getArrangementListByType("1");
            model.addAttribute("sensorArrangementBeanCount",
                    sensorArrangementBeanList.size());
            // 妯℃澘璺¯寰 basePath
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            // model.addAttribute("user",request.getSession().getAttribute("user"));
            model.addAttribute("CURENT_TAB", "XTSZ");
            model.addAttribute("CURENT_TAB_2", "CFSZ");
            return new ModelAndView(PageConst.XTSZ_CFSZ, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;
        }
    }
    /**
     * 浼犳劅鍣ㄥ垪琛ㄦ搷浣滅獥鍙£
     * 
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping({ "/xtsz/jbszModalCgq.action" })
    public ModelAndView jbszModalCgq(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
            SensorBean bean;
            String sensorId = RequestUtil.getRequestParameter(request,
                    "sensorId");
            if (StringUtils.isEmpty(sensorId)) {
                bean = new SensorBean();
            } else {
                bean = ServiceManager.getSensorServiceImpl().getById(sensorId);
            }
            // 妯℃澘璺¯寰 basePath
            model.addAttribute("sensorTypes", new ArrayList<String>() {
                {
                    add("温度");
                    add("温湿度一体化");
                }
            });
            model.addAttribute("sensorBean", bean);
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            return new ModelAndView(PageConst.XTSZ_jbszModalCgq, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;
        }
    }
    /**
     * 浼犳劅鍣ㄦ柊寤烘垨鑰呯紪杈
     * 
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "/xtsz/saveSensorInfo.action", method = RequestMethod.POST)
    @ResponseBody
    public Map saveSensorInfo(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            String sensorId = RequestUtil.getRequestParameter(request,
                    "sensorId");
            SensorBean bean;
            if (StringUtils.isEmpty(sensorId)) {
                bean = new SensorBean();
            } else {
                bean = ServiceManager.getSensorServiceImpl().getById(sensorId);
            }
            String name = RequestUtil.getRequestParameter(request, "name");
            if (!StringUtils.isEmpty(name)) {
                bean.setSensorName(name);
            }
            String sensorType = RequestUtil.getRequestParameter(request,
                    "sensorType");
            if (!StringUtils.isEmpty(sensorType)) {
                bean.setSensorType(sensorType);
            }
            String sensorNum = RequestUtil.getRequestParameter(request,
                    "sensorNum");
            if (!StringUtils.isEmpty(sensorNum)) {
                bean.setSerialNum(sensorNum);
            }
            String sensorFactory = RequestUtil.getRequestParameter(request,
                    "sensorFactory");
            if (!StringUtils.isEmpty(sensorFactory)) {
                bean.setSensorFactory(sensorFactory);
            }
            try {
                if (StringUtils.isEmpty(bean.getId())) {
                	bean.setCreateTime(new Date());
                    bean = ServiceManager.getSensorServiceImpl().save(bean);
                    map.put("add", true);
                } else {
                    ServiceManager.getSensorServiceImpl().update(bean);
                    map.put("add", false);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            map.put("newSensor", bean);
            map.put("url", WebConstConfig.BASE_PATH + "xtsz/sensorDel.action");
            map.put("editUrl", WebConstConfig.BASE_PATH
                    + "xtsz/jbszModalCgq.action" + "?sensorId=" + bean.getId()
                    + "");
            // map.put("sensorList",
            // ServiceManager.getSensorServiceImpl().findAll());
            return map;
        } catch (Exception e) {
            e.printStackTrace();
            return map;
        }
    }
    /**
     * 鍙傛暟璁剧疆
     * 
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping({ "/xtsz/cssz.action" })
    public ModelAndView cssz(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
            List<AlarmBean> temAlarmList = new ArrayList<AlarmBean>();
            List<AlarmBean> wetAlarmList = new ArrayList<AlarmBean>();
            List<GrainTypeBean> grainList = new ArrayList<GrainTypeBean>();
            try {
                temAlarmList = ServiceManager.getAlarmServiceImpl()
                        .findListByType("常温");
                grainList = ServiceManager.getGrainTypeServiceImpl().findAll();
                for (int i = 0; i < grainList.size(); i++) {
					AlarmBean wetBean = CommonUtils.getWetAlarm(grainList.get(i));
					if(null != wetBean){
						wetAlarmList.add(wetBean);
					}
				}
            } catch (Exception e) {
                e.printStackTrace();
            }
            model.addAttribute("temAlarmList", temAlarmList);
            model.addAttribute("wetAlarmList", wetAlarmList);
            model.addAttribute("grainList", grainList);
            // 妯℃澘璺¯寰 basePath
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            // model.addAttribute("user",request.getSession().getAttribute("user"));
            model.addAttribute("CURENT_TAB", "XTSZ");
            model.addAttribute("CURENT_TAB_2", "LQPZ");
            model.addAttribute("CURENT_TAB_3", "CSSZ");
            return new ModelAndView(PageConst.XTSZ_CSSZ, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;
        }
    }
    private String getCurProvinces() {
        BaseSettingBean bean = ServiceManager.getBaseSettingServiceImpl()
                .findValueByKey("szsf");
        if(null!=bean){
        	return bean.getValue();
        }
        else{
        	return "";
        }
    }
    
    @RequestMapping({ "/xtsz/csszModalGjfz.action" })
    public ModelAndView csszModalGjfz(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
            AlarmBean bean;
            String alarmType = RequestUtil.getRequestParameter(request,
                    "alarmType");
            String alarmId = RequestUtil
                    .getRequestParameter(request, "alarmId");
            if (StringUtils.isEmpty(alarmId)) {
                bean = new AlarmBean();
                bean.setAlarmType(alarmType);
            } else {
                bean = ServiceManager.getAlarmServiceImpl().getById(alarmId);
            }
            model.addAttribute("bean", bean);
            // 妯℃澘璺¯寰 basePath
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            return new ModelAndView(PageConst.XTSZ_csszModalGjfz, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;
        }
    }
    /**
     * 浼犳劅鍣ㄥ垹闄ゆ搷浣
     * 
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "/xtsz/sensorDel.action", method = RequestMethod.POST)
    @ResponseBody
    public Map sensorDel(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        Map<String, Object> map = new HashMap<String, Object>();
        String sensorId = RequestUtil.getRequestParameter(request, "curDataId");
        SensorBean sensor = ServiceManager.getSensorServiceImpl().getById(sensorId);
        try {
        	 List<SensorArrangementBean> sensorArrangementList = ServiceManager.getSensorArrangementServiceImpl().getSensorArrangementBySensor(sensor);
             
        	 if(sensorArrangementList.size()>0){
                 map.put("success", false);
             }
             else{
            	 ServiceManager.getSensorServiceImpl().delete(sensorId);
                 map.put("success", true);
             }
           
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
        }
        return map;
    }
    /**
     * 鍛婅­﹂槇鍊兼柊寤烘垨鑰呯紪杈
     * 
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "/xtsz/saveAlarmInfo.action", method = RequestMethod.POST)
    @ResponseBody
    public Map saveAlarmInfo(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
            String id = RequestUtil.getRequestParameter(request, "id");
            AlarmBean bean = ServiceManager.getAlarmServiceImpl().getById(id);
            String averageAttri = RequestUtil.getRequestParameter(request,
                    "averageAttri");
            if (!StringUtils.isEmpty(averageAttri)) {
                averageAttri = averageAttri.replaceAll(",", "").trim();
                bean.setAverageAttri(Double.parseDouble(averageAttri));
            }
            String maxAttri = RequestUtil.getRequestParameter(request,
                    "maxAttri");
            if (!StringUtils.isEmpty(maxAttri)) {
                maxAttri = maxAttri.replaceAll(",", "").trim();
                bean.setMaxAttri(Double.parseDouble(maxAttri));
            }
            try {
                ServiceManager.getAlarmServiceImpl().update(bean);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return new HashMap();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new HashMap();
    }
    @RequestMapping(value = "/xtsz/reSetAlarmInfo.action", method = RequestMethod.POST)
    @ResponseBody
    public Map reSetAlarmInfo(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
            String id = RequestUtil.getRequestParameter(request, "id");
            AlarmBean bean = ServiceManager.getAlarmServiceImpl().getById(id);
            bean.setAverageAttri(bean.getDefauleAvgAttri());
            bean.setMaxAttri(bean.getDefaultMaxAttri());
            try {
                ServiceManager.getAlarmServiceImpl().update(bean);
            } catch (Exception e) {
                e.printStackTrace();
            }
            Map map = new HashMap();
            map.put("averageAttri", bean.getAverageAttri());
            map.put("maxAttri", bean.getMaxAttri());
            return map;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    /**
     * 鍛婅­﹀垹闄ゆ搷浣
     * 
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "/xtsz/alarmDel.action", method = RequestMethod.POST)
    @ResponseBody
    public Map alarmDel(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        Map<String, Object> map = new HashMap<String, Object>();
        String alarmId = RequestUtil.getRequestParameter(request, "curDataId");
        try {
            ServiceManager.getAlarmServiceImpl().delete(alarmId);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
        }
        map.put("success", true);
        return map;
    }
    /**
     * 鏂板¢炰粨鎴跨獥浣
     * 
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping({ "/xtsz/barnModal.action" })
    public ModelAndView barnModal(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
            BarnBean bean;
            String barnId = RequestUtil.getRequestParameter(request, "barnId");
            String isAdd = "false";
            if (StringUtils.isEmpty(barnId)) {
                bean = new BarnBean();
                isAdd = "true";
            } else {
                bean = ServiceManager.getBarnServiceImpl().getById(barnId);
                isAdd = "false";
            }

            List<GrainTypeBean> grainList = ServiceManager
                    .getGrainTypeServiceImpl().findAll();
            model.addAttribute("grainList", grainList);
            // 妯℃澘璺¯寰 basePath
            model.addAttribute("isAdd", isAdd);
            model.addAttribute("bean", bean);
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            return new ModelAndView(PageConst.XTSZ_barnModal, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;
        }
    }
    /**
    * @名称: editAoJianModal 
    * @日期：2015-9-16 上午11:53:47
    * @作者： lxb
    * @描述: 保存 下一步 
    * @参数 @param request
    * @参数 @param response
    * @参数 @param model
    * @参数 @return    
    * @返回值 ModelAndView    
    * @异常
     */
    @RequestMapping({ "/xtsz/editAoJianModal.action" })
    public ModelAndView editAoJianModal(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
            BarnBean bean;
            String barnId = RequestUtil.getRequestParameter(request, "barnId");
            String isAdd = "false";
            if (StringUtils.isEmpty(barnId)) {
                bean = new BarnBean();
                isAdd = "true";
            } else {
                bean = ServiceManager.getBarnServiceImpl().getById(barnId);
                isAdd = "false";
            }
           
			String fangxiang = null;
			if (bean.getAngle() > -45 && bean.getAngle() < 45) {// 仓房布置方向
				fangxiang = "NorthSouth";
			} else {
				fangxiang = "EastWest";
			}
			 model.addAttribute("fangxiang", fangxiang);
			List<User> lqUserList = ServiceManager.getUserService().getListByRoleId("3");
			model.addAttribute("lqUserList", lqUserList);
			
            List<SensorArrangementBean> sensorArrangementBeanList = ServiceManager
                    .getSensorArrangementServiceImpl().getArrangementListByType("1");
            model.addAttribute("sensorArrangementBeanList",
                    sensorArrangementBeanList);
            List<GrainTypeBean> grainList = ServiceManager
                    .getGrainTypeServiceImpl().findAll();
            model.addAttribute("grainList", grainList);
            // 妯℃澘璺¯寰 basePath
            model.addAttribute("isAdd", isAdd);
            model.addAttribute("bean", bean);
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            return new ModelAndView(PageConst.XTSZ_editAoJianModal, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;
        }
    }
    /**
     * 浠撴埧鏂板¢炰繚瀛
     * 
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "/xtsz/saveBarnInfo.action", method = RequestMethod.POST)
    @ResponseBody
    public Map saveBarnInfo(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            String barnId = RequestUtil.getRequestParameter(request, "barnId");
            BarnBean bean;
            String aoJianCount = RequestUtil.getRequestParameter(request,
                    "aoJianCount");
            if (StringUtils.isEmpty(barnId)) {
                bean = new BarnBean();
                bean.setCreateTime(new Date());
                bean.setAoJianSet(getAoJianInfo(aoJianCount));
            } else {
                bean = ServiceManager.getBarnServiceImpl().getById(barnId);
            }
            bean.setAoJianCount(aoJianCount);
            String barnIndex = RequestUtil.getRequestParameter(request,
                    "barnIndex");
            if (!StringUtils.isEmpty(barnIndex)) {
                bean.setBarnIndex(barnIndex);
            }
            String width = RequestUtil.getRequestParameter(request, "width");
            if (!StringUtils.isEmpty(width)) {
                width = width.replaceAll(",", "").trim();
                bean.setWidth(Double.parseDouble(width));
            }
            String xPos = RequestUtil.getRequestParameter(request, "xPos");
            if (!StringUtils.isEmpty(xPos)) {
            	xPos = xPos.replaceAll(",", "").trim();
                bean.setxPos(Double.parseDouble(xPos));
            }
            String yPos = RequestUtil.getRequestParameter(request, "yPos");
            if (!StringUtils.isEmpty(yPos)) {
            	yPos = yPos.replaceAll(",", "").trim();
                bean.setyPos(Double.parseDouble(yPos));
            }
            String length = RequestUtil.getRequestParameter(request, "length");
            if (!StringUtils.isEmpty(length)) {
                length = length.replaceAll(",", "").trim();
                bean.setLength(Double.parseDouble(length));
            }
            String height = RequestUtil.getRequestParameter(request, "height");
            if (!StringUtils.isEmpty(height)) {
                height = height.replaceAll(",", "").trim();
                bean.setHeight(Double.parseDouble(height));
            }
            String capacity = RequestUtil.getRequestParameter(request,
                    "capacity");
            if (!StringUtils.isEmpty(capacity)) {
                capacity = capacity.replaceAll(",", "").trim();
                bean.setCapacity(Double.parseDouble(capacity));
            }
            String angle = RequestUtil.getRequestParameter(request, "angle");
            if (!StringUtils.isEmpty(angle)) {
                angle = angle.replaceAll(",", "").trim();
                bean.setAngle(Double.parseDouble(angle));
            }
            bean.setIsDel("0");
            try {
                if (StringUtils.isEmpty(bean.getId())) {
                    bean = ServiceManager.getBarnServiceImpl().save(bean);
                    map.put("add", true);
                } else {
                    ServiceManager.getBarnServiceImpl().update(bean);
                    map.put("add", false);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            List<GrainTypeBean> grainList = ServiceManager
                    .getGrainTypeServiceImpl().findAll();
            map.put("grainList", grainList);
            map.put("bean", bean);
            map.put("url", WebConstConfig.BASE_PATH + "xtsz/barnDel.action");
            map.put("editUrl", WebConstConfig.BASE_PATH
                    + "xtsz/barnModal.action" + "?barnId=" + bean.getId() + "");
            map.put("BASE_PATH", WebConstConfig.BASE_PATH);
            return map;
//			try {
//				FreeMarkerUtil.printWriterFile("editAoJian.ftl", "templates",
//						map, response);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }
    private Set<AoJianBean> getAoJianInfo(String aoJianCount) {
        Set<AoJianBean> set = new HashSet<AoJianBean>();
        int count = Integer.parseInt(aoJianCount);
        for (int i = 0; i < count; i++) {
            AoJianBean bean = new AoJianBean();
            bean.setZyAoJianNum(GenerateSequenceUtil.generateSequenceNo());
            AoJianGrainInfoBean grainBean = new AoJianGrainInfoBean();
            grainBean.setZyAoJianNum(bean.getZyAoJianNum());
            try {
                ServiceManager.getAoJianGrainInfoServiceImpl().save(grainBean);
            } catch (Exception e) {
                System.out.println("aoJianGrain Error");
            }
            bean.setAoJianGrainInfoBean(grainBean);
            bean.setGrainStatus("0");
            set.add(bean);
        }
        return set;
    }
    /**
     * 鍛婅­﹀垹闄や粨鎴¿
     * 
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "/xtsz/delBarnList.action", method = RequestMethod.POST)
    @ResponseBody
    public Map delBarnList(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        Map<String, Object> map = new HashMap<String, Object>();
        String barnId = RequestUtil.getRequestParameter(request, "beanId");
        Set<AoJianBean> aoJianSet = ServiceManager.getBarnServiceImpl().getById(barnId).getAoJianSet();
        boolean hasData = false;
        Iterator<AoJianBean> it = aoJianSet.iterator();
        while (it.hasNext()) {
        	AoJianBean aoJIan = (AoJianBean) it.next();
        	AoJianDataBean aoJianData = ServiceManager.getAoJianBlockService().getRecentAoJianDataBeanByGrainId(aoJIan.getAoJianGrainInfoBean().getId());
			if(null!=aoJianData){
				hasData = true;
				break;
			}
		}
        try {
        	if(hasData){  //有数据  假删
        		ServiceManager.getBarnServiceImpl().fakeDelateBarnById(barnId);
        	}else{
        		ServiceManager.getBarnServiceImpl().delete(barnId);
        	}
        } catch (Exception e) {
            e.printStackTrace();
        }
        map.put("success", true);
        return map;
    }
    /**
     * 淇濆瓨鍘«闂翠俊鎭¯
     * 
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "/xtsz/saveAoJianInfo.action", method = RequestMethod.POST)
    @ResponseBody
    public Map saveAoJianInfo(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            String aoJianId = RequestUtil.getRequestParameter(request,
                    "aoJianId");
            AoJianBean aoJianBean = ServiceManager.getAoJianServiceImpl()
                    .getById(aoJianId);
            if (aoJianBean == null) {
                System.out.println("aoJianBean Error");
            }
            String aoJianIndex = RequestUtil.getRequestParameter(request,
                    "aoJianIndex");
            if (!StringUtils.isEmpty(aoJianIndex)) {
                aoJianBean.setAoJianIndex(aoJianIndex);
            }
            AoJianGrainInfoBean bean = aoJianBean.getAoJianGrainInfoBean();
            if(null==bean){
                bean = new AoJianGrainInfoBean();
            }
            String grainType = RequestUtil.getRequestParameter(request,
                    "grainType");
            if (!StringUtils.isEmpty(grainType)) {
                bean.setGrainType(grainType);
            }
            String grainOrigin = RequestUtil.getRequestParameter(request,
                    "grainOrigin");
            if (!StringUtils.isEmpty(grainOrigin)) {
                bean.setGrainOrigin(grainOrigin);
            }
            String harvestTimeStr = RequestUtil.getRequestParameter(request,
                    "harvestTime");
            if (!StringUtils.isEmpty(harvestTimeStr)) {
                bean.setHarvestTime(CalendarUtil.formatDate(harvestTimeStr,
                        CalendarUtil.DATE_FORMAT_MODE1));
            }
            String level = RequestUtil.getRequestParameter(request, "level");
            if (!StringUtils.isEmpty(level)) {
                bean.setLevel(level);
            }
            String storageMoisture = RequestUtil.getRequestParameter(request,
                    "storageMoisture");
            if (!StringUtils.isEmpty(storageMoisture)) {
                bean.setStorageMoisture(storageMoisture);
            }
            String impurity = RequestUtil.getRequestParameter(request,
                    "impurity");
            if (!StringUtils.isEmpty(impurity)) {
                bean.setImpurity(impurity);
            }
            String unsoundGrain = RequestUtil.getRequestParameter(request,
                    "unsoundGrain");
            if (!StringUtils.isEmpty(unsoundGrain)) {
                bean.setUnsoundGrain(unsoundGrain);
            }
            String capacity = RequestUtil.getRequestParameter(request,
                    "capacity");
            if (!StringUtils.isEmpty(capacity)) {
                capacity = capacity.replaceAll(",", "").trim();
                bean.setCapacity(Double.valueOf(capacity));
                aoJianBean.setCapacity(Double.valueOf(capacity));
            }
            String inputTimeStr = RequestUtil.getRequestParameter(request,
                    "inputTime");
            if (!StringUtils.isEmpty(inputTimeStr)) {
                bean.setInputTime(CalendarUtil.formatDate(inputTimeStr,
                        CalendarUtil.DATE_FORMAT_MODE1));
            }
            String unitWeight = RequestUtil.getRequestParameter(request,
                    "unitWeight");
            if (!StringUtils.isEmpty(unitWeight)) {
                unitWeight = unitWeight.replaceAll(",", "").trim();
                bean.setUnitWeight(Double.valueOf(unitWeight));
            }
            String remarks = RequestUtil
                    .getRequestParameter(request, "remarks");
            if (!StringUtils.isEmpty(remarks)) {
                bean.setRemarks(remarks);
            }
            String storeType = RequestUtil.getRequestParameter(request,
                    "storeType");
            if(!StringUtils.isEmpty(storeType)){
            	bean.setStoreType(storeType);
            }
           
            String fdfjsz = RequestUtil.getRequestParameter(request,"fdfjsz");
            if(!"-1".equals(fdfjsz)){
            	aoJianBean.setFdfjsz(fdfjsz);
            }
            
            if("union".equals(fdfjsz)){
            	 String fd1 = RequestUtil.getRequestParameter(request,"fd1");
                 aoJianBean.setFd1(fd1);
                 String fd2 = RequestUtil.getRequestParameter(request,"fd2");
                 aoJianBean.setFd2(fd2);
            }
            else if("single".equals(fdfjsz)){
	           	 String fd1 = RequestUtil.getRequestParameter(request,"fd1");
	             aoJianBean.setFd1(fd1);
	             String fd2 = RequestUtil.getRequestParameter(request,"fd2");
	             aoJianBean.setFd2(fd2);
	             String fjGrainIndex = RequestUtil.getRequestParameter(request,
	                     "fjGrainIndex");
	             if (!StringUtils.isEmpty(capacity)) {
	                 aoJianBean.setFjGrainIndex(fjGrainIndex);
	             }
            }
            
            if(StringUtils.isEmpty(fdfjsz)){
	           	 String fd1 = RequestUtil.getRequestParameter(request,"fd1");
	             aoJianBean.setFd1(fd1);
	             String fd2 = RequestUtil.getRequestParameter(request,"fd2");
	             aoJianBean.setFd2(fd2);
	             String fjGrainIndex = RequestUtil.getRequestParameter(request,
	                     "fjGrainIndex");
	             if (!StringUtils.isEmpty(capacity)) {
	                 aoJianBean.setFjGrainIndex(fjGrainIndex);
	             }
            }
            String barnTemHumNumStr = RequestUtil.getRequestParameter(request, "barnTemHumNumStr");
            aoJianBean.setBarnTemHumNumStr(barnTemHumNumStr);

            bean.setCurGrainInfo("1");
            String length = RequestUtil.getRequestParameter(request, "length");
            if (!StringUtils.isEmpty(length)) {
                length = length.replaceAll(",", "").trim();
             
                aoJianBean.setLength(Double.valueOf(length));
            }
            String width = RequestUtil.getRequestParameter(request, "width");
            if (!StringUtils.isEmpty(width)) {
                width = width.replaceAll(",", "").trim();
              
                aoJianBean.setWidth(Double.valueOf(width));
            }
            String height = RequestUtil.getRequestParameter(request, "height");
            if (!StringUtils.isEmpty(height)) {
                height = height.replaceAll(",", "").trim();
               
                aoJianBean.setHeight(Double.valueOf(height));
            }
            
            aoJianBean.setGrainStatus("1");
            
            String  sensorArrangementbeanId = RequestUtil.getRequestParameter(request,
                    "sensorArrangementbeanId");
            if(!StringUtils.isEmpty(sensorArrangementbeanId)){
            	aoJianBean.setSensorArrangementbeanId(sensorArrangementbeanId);
            }
            String dbname = RequestUtil.getRequestParameter(request,
                    "dbname");
            if(!StringUtils.isEmpty(dbname)){
            	aoJianBean.setDbName(dbname);
            }
            String dataSourceType = RequestUtil.getRequestParameter(request,"dataSourceType");
            if(!StringUtils.isEmpty(dataSourceType)){
            	aoJianBean.setDataSourceType(dataSourceType);
            }
            try {
                if(null==aoJianBean.getAoJianGrainInfoBean()){
                    ServiceManager.getAoJianGrainInfoServiceImpl().save(bean);
                }
                else{
                    ServiceManager.getAoJianGrainInfoServiceImpl().update(bean);
                }
                aoJianBean.setAoJianGrainInfoBean(bean);
                ServiceManager.getAoJianServiceImpl().update(aoJianBean);
                updateSession(request);
            } catch (Exception e) {
                e.printStackTrace();
            }
            map.put("bean", aoJianBean);
            return map;
        } catch (Exception e) {
            e.printStackTrace();
            return map;
        }
    }
    
    /**
     * 鏍规嵁id鑾峰彇barnBean
     * 
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "/xtsz/getBarnById.action", method = RequestMethod.POST)
    public void getBarnById(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        Map<String, Object> map = new HashMap<String, Object>();
        String beanId = RequestUtil.getRequestParameter(request, "beanId");
        BarnBean bean = new BarnBean();
        try {
            if (!StringUtils.isEmpty(beanId)) {
                bean = ServiceManager.getBarnServiceImpl().getById(beanId);
            }
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
        }
        map.put("bean", bean);
        map.put("success", true);
        List<SensorArrangementBean> sensorArrangementBeanList = ServiceManager
                .getSensorArrangementServiceImpl().getArrangementListByType("1");
        model.addAttribute("sensorArrangementBeanList",
                sensorArrangementBeanList);
        List<GrainTypeBean> grainList = ServiceManager
                .getGrainTypeServiceImpl().findAll();
        map.put("grainList", grainList);
        map.put("url", WebConstConfig.BASE_PATH + "xtsz/barnDel.action");
        map.put("editUrl", WebConstConfig.BASE_PATH + "xtsz/barnModal.action"
                + "?barnId=" + bean.getId() + "");
        map.put("BASE_PATH", WebConstConfig.BASE_PATH);
        System.out.println("仓房height：" + bean.getHeight());
        try {
            FreeMarkerUtil.printWriterFile("editAoJian.ftl", "templates", map,
                    response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
     * 浠撴埧璁剧疆
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping({ "/xtsz/jcsbbz.action" })
    public ModelAndView jcsbbz(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
            List<SensorArrangementBean> sensorArrangementBeanList = ServiceManager
                    .getSensorArrangementServiceImpl().getArrangementListByType("1");
            model.addAttribute("sensorArrangementBeanList",
                    sensorArrangementBeanList);
            // 妯℃澘璺¯寰 basePath
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            // model.addAttribute("user",request.getSession().getAttribute("user"));
            model.addAttribute("CURENT_TAB", "XTSZ");
            model.addAttribute("CURENT_TAB_2", "LQPZ");
            model.addAttribute("CURENT_TAB_3", "JCSBBZ");
            return new ModelAndView(PageConst.XTSZ_jcsbbz, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;
        }
    }
    @RequestMapping({ "/xtsz/jcsblb.action" })
    public ModelAndView jcsblb(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
            List<SensorBean> sensorList = ServiceManager.getSensorServiceImpl()
                    .findAll();
            model.addAttribute("sensorList", sensorList);
            // 妯℃澘璺¯寰 basePath
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            // model.addAttribute("user",request.getSession().getAttribute("user"));
            model.addAttribute("CURENT_TAB", "XTSZ");
            model.addAttribute("CURENT_TAB_2", "LQPZ");
            model.addAttribute("CURENT_TAB_3", "JCSBLB");
            return new ModelAndView(PageConst.XTSZ_jcsblb, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;
        }
    }
    /**
     * 妫€娴嬭®惧¤囧竷缃®璁剧疆妯℃€佺獥浣
     * 
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping({ "/xtsz/sensorArrangementModal.action" })
    public ModelAndView sensorArrangementModal(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
            SensorArrangementBean bean;
            String sensorArranmementId = RequestUtil.getRequestParameter(
                    request, "sensorArrangementId");
            if (StringUtils.isEmpty(sensorArranmementId)) {
                bean = new SensorArrangementBean();
            } else {
                bean = ServiceManager.getSensorArrangementServiceImpl()
                        .getById(sensorArranmementId);
            }
            model.addAttribute("bean", bean);
            List<SensorBean> sensorList = ServiceManager.getSensorServiceImpl()
                    .findAll();
            model.addAttribute("sensorBeanList", sensorList);
            // 妯℃澘璺¯寰 basePath
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            model.addAttribute("CURENT_TAB", "XTSZ");
            model.addAttribute("CURENT_TAB_2", "CFSZ");
            return new ModelAndView(PageConst.XTSZ_sensorArrangementModal,
                    model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;
        }
    }
    /**
     * 淇濆瓨妫€娴嬭®惧¤囧竷缃®淇℃伅
     * 
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "/xtsz/saveArrangementInfo.action", method = RequestMethod.POST)
    @ResponseBody
    public Map saveArrangementInfo(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            String sensorArrangementId = RequestUtil.getRequestParameter(
                    request, "sensorArrangementId");
            SensorArrangementBean bean;
            if (StringUtils.isEmpty(sensorArrangementId)) {
                bean = new SensorArrangementBean();
                bean.setCreateTime(new Date());
            } else {
                bean = ServiceManager.getSensorArrangementServiceImpl()
                        .getById(sensorArrangementId);
            }
            String sensorId = RequestUtil.getRequestParameter(request,
                    "sensorId");
            SensorBean sensor = ServiceManager.getSensorServiceImpl().getById(
                    sensorId);
            bean.setSensor(sensor);
            String arrangementName = RequestUtil.getRequestParameter(request,
                    "arrangementName");
            if (!StringUtils.isEmpty(arrangementName)) {
                bean.setArrangementName(arrangementName);
            }
            String positionInfo = RequestUtil.getRequestParameter(request,
                    "positionInfo");
            if (!StringUtils.isEmpty(positionInfo)) {
                bean.setPositionInfo(positionInfo);
            }
            try {
                if (StringUtils.isEmpty(bean.getId())) {
                	bean.setCreateTime(new Date());
                    bean = ServiceManager.getSensorArrangementServiceImpl()
                            .save(bean);
                    map.put("add", true);
                } else {
                    ServiceManager.getSensorArrangementServiceImpl().update(
                            bean);
                    map.put("add", false);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            map.put("bean", bean);
            return map;
        } catch (Exception e) {
            e.printStackTrace();
            return map;
        }
    }
    /**
     * 鍒犻櫎甯冪疆淇℃伅
     * 
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "/xtsz/delSensorArrangement.action", method = RequestMethod.POST)
    @ResponseBody
    public Map delSensorArrangement(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        Map<String, Object> map = new HashMap<String, Object>();
        String sensorArrangementId = RequestUtil.getRequestParameter(request,
                "sensorArrangementId");
        try {
            List<AoJianBean> aoJianList = ServiceManager.getAoJianServiceImpl().getAoJianByArrangementId(sensorArrangementId);
            if(aoJianList.size()>0){
                map.put("success", false);
            }
            else{
                SensorArrangementBean bean =  ServiceManager.getSensorArrangementServiceImpl().getById(sensorArrangementId);
                ServiceManager.getSensorArrangementServiceImpl().deleteArrangementDataByArrangement(bean);
                ServiceManager.getSensorArrangementServiceImpl().delete(sensorArrangementId);
                map.put("success", true);
            }
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
        }
        return map;
    }
    /**
     * 妫€娴嬭®惧¤囧竷缃®璁剧疆妯℃€佺獥浣
     * 
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping({ "/xtsz/jcsbbzModal0.action" })
    public ModelAndView jcsbbzModal0(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
            SensorArrangementBean bean = new SensorArrangementBean();
            String sensorArranmementId = RequestUtil.getRequestParameter(
                    request, "sensorArrangementId");
            if(!StringUtils.isEmpty(sensorArranmementId)){
                bean = ServiceManager
                        .getSensorArrangementServiceImpl().getById(
                                sensorArranmementId);
            }
            List<SensorArrangementBean> list = ServiceManager.getSensorArrangementServiceImpl().getArrangementListByType("0");
            model.addAttribute("defaultArrangementList", list);
            model.addAttribute("bean", bean);
            // 妯℃澘璺¯寰 basePath
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            model.addAttribute("CURENT_TAB", "XTSZ");
            model.addAttribute("CURENT_TAB_2", "CFSZ");
            return new ModelAndView(PageConst.XTSZ_jcsbbzModal0, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;
        }
    }
    //
    @RequestMapping({ "/xtsz/saveStep0.action" })
    public void saveStep0(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        String sensorArranmementId = RequestUtil.getRequestParameter(request, "sensorArrangementId");
        SensorArrangementBean curBean = null;
        if(!StringUtils.isEmpty(sensorArranmementId)){
            curBean = ServiceManager.getSensorArrangementServiceImpl().getById(sensorArranmementId);
        }
        String arrangeId = RequestUtil.getRequestParameter(request, "arrangeId");
        SensorArrangementBean sensorArrangementBean = ServiceManager.getSensorArrangementServiceImpl().getById(arrangeId);
        
        if(null == curBean ){
            curBean = sensorArrangementBean.clone(curBean);
            curBean.setDefaultType("1");
            try {
                ServiceManager.getSensorArrangementServiceImpl().save(curBean);
                response.getWriter().write(curBean.getId());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        else{
            if(null == curBean.getSensor()||!curBean.getSensor().getSensorType().equals(sensorArrangementBean.getSensor().getSensorType())){
                ServiceManager.getSensorArrangementServiceImpl().delete(curBean.getId());
                curBean = sensorArrangementBean.clone(curBean);
                curBean.setDefaultType("1");
                try {
                    ServiceManager.getSensorArrangementServiceImpl().save(curBean);
                    response.getWriter().write(curBean.getId());
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            else{
                try {
                    ServiceManager.getSensorArrangementServiceImpl().update(curBean);
                    response.getWriter().write(curBean.getId());
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
    /**
    * @名称: jcsbbzModal1 
    * @日期：2015-9-22 上午10:42:40
    * @作者： lxb
    * @描述: 第二步
    * @参数 @param request
    * @参数 @param response
    * @参数 @param model
    * @参数 @return    
    * @返回值 ModelAndView    
    * @异常
     */
    @RequestMapping({ "/xtsz/jcsbbzModal1.action" })
    public ModelAndView jcsbbzModal1(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
            String sensorArranmementId = RequestUtil.getRequestParameter(
                    request, "sensorArrangementId");
            String arrangeId = RequestUtil.getRequestParameter(
                    request, "arrangeId");
            SensorArrangementBean bean = new SensorArrangementBean();
            if(!StringUtils.isEmpty(sensorArranmementId)){
                 bean = ServiceManager
                        .getSensorArrangementServiceImpl().getById(
                                sensorArranmementId);
            }
            else{
                if(!StringUtils.isEmpty(arrangeId)){
                    SensorArrangementBean bean0 = ServiceManager
                            .getSensorArrangementServiceImpl().getById(
                                    arrangeId);
                    bean = bean0.clone(bean);
                }
            }
            model.addAttribute("bean", bean);
            List<SensorBean> sensorBeanList;
//            if(bean.getTemplateId().equals("1")){
//                sensorBeanList =  ServiceManager.getSensorServiceImpl().getSensorListByType("温湿度一体化");
//            }
//            else{
                sensorBeanList =  ServiceManager.getSensorServiceImpl().findAll();
//            }
            model.addAttribute("sensorBeanList",sensorBeanList);
            // 妯℃澘璺¯寰 basePath
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            model.addAttribute("CURENT_TAB", "XTSZ");
            model.addAttribute("CURENT_TAB_2", "CFSZ");
            return new ModelAndView(PageConst.XTSZ_jcsbbzModal1, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;
        }
    }
    //保存详细信息
    @RequestMapping({ "/xtsz/saveStep1.action" })
    public void saveStep1(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        String sensorArranmementId = RequestUtil.getRequestParameter(request, "sensorArrangementId");
        
        SensorArrangementBean sensorArrangementBean = new SensorArrangementBean();
        if(!StringUtils.isEmpty(sensorArranmementId)){
            sensorArrangementBean = ServiceManager.getSensorArrangementServiceImpl().getById(sensorArranmementId);
        }
        String templateId = RequestUtil.getRequestParameter(request, "templateId");
        if(!StringUtils.isEmpty(templateId)){
            sensorArrangementBean.setTemplateId(templateId);
            SensorArrangementBean tem = ServiceManager.getSensorArrangementServiceImpl().getById(templateId);
            sensorArrangementBean = tem.clone(sensorArrangementBean);
        }
        String distanceGrainHeight = RequestUtil.getRequestParameter(request, "distanceGrainHeight");
        if(!StringUtils.isEmpty(distanceGrainHeight)){
            BigDecimal b = new BigDecimal(distanceGrainHeight);
            sensorArrangementBean.setDistanceGrainHeight(b);
        }
        String distanceGroundHeight = RequestUtil.getRequestParameter(request, "distanceGroundHeight");
        if(!StringUtils.isEmpty(distanceGroundHeight)){
            BigDecimal b1 = new BigDecimal(distanceGroundHeight);
            sensorArrangementBean.setDistanceGroundHeight(b1);
        }
        String wallDistance = RequestUtil.getRequestParameter(request, "wallDistance");
        if(!StringUtils.isEmpty(wallDistance)){
            sensorArrangementBean.setWallDistance(new BigDecimal(wallDistance));
        }
        String layerCount = RequestUtil.getRequestParameter(request, "layerCount");
        if(!StringUtils.isEmpty(layerCount)){
            sensorArrangementBean.setLayerCount(Integer.parseInt(layerCount));
        }
        String rowCount = RequestUtil.getRequestParameter(request, "rowCount");
        if(!StringUtils.isEmpty(rowCount)){
            sensorArrangementBean.setRowCount(Integer.parseInt(rowCount));
        }
        String columnCount = RequestUtil.getRequestParameter(request, "columnCount");
        if(!StringUtils.isEmpty(columnCount)){
            sensorArrangementBean.setColumnCount(Integer.parseInt(columnCount));
        }
        String arrangementName = RequestUtil.getRequestParameter(request, "arrangementName");
        if(!StringUtils.isEmpty(arrangementName)){
            sensorArrangementBean.setArrangementName(arrangementName);
        }
        String positionInfo = RequestUtil.getRequestParameter(request, "positionInfo");
        if(!StringUtils.isEmpty(positionInfo)){
            sensorArrangementBean.setPositionInfo(positionInfo);
        }
        String sensorId = RequestUtil.getRequestParameter(request, "sensorId");
        if(!StringUtils.isEmpty(sensorId)){
            SensorBean sensor = ServiceManager.getSensorServiceImpl().getById(sensorId);
            sensorArrangementBean.setSensor(sensor);
        }
        String cableDirection = RequestUtil.getRequestParameter(request, "cableDirection");
        if(!StringUtils.isEmpty(cableDirection)){
            sensorArrangementBean.setCableDirection(cableDirection);
        }
        String pointDirection = RequestUtil.getRequestParameter(request, "pointDirection");
        if(!StringUtils.isEmpty(pointDirection)){
            sensorArrangementBean.setPointDirection(pointDirection);
        }
        
        String startCablePos = RequestUtil.getRequestParameter(request, "startCablePos");
        if(!StringUtils.isEmpty(startCablePos)){
            sensorArrangementBean.setStartCablePos(startCablePos);
        }
        sensorArrangementBean.setDefaultType("1");
        try {
            if(!StringUtils.isEmpty(sensorArranmementId)){
                ServiceManager.getSensorArrangementServiceImpl().update(sensorArrangementBean);
            }
            else{
                ServiceManager.getSensorArrangementServiceImpl().save(sensorArrangementBean);
            }
            ServiceManager.getArrangementDataService().clearSensorArrangementInfo(sensorArrangementBean.getId());
            
            List<AoJianBean> aoJianList = ServiceManager.getAoJianServiceImpl().getAoJianByArrangementId(sensorArrangementBean.getId());
            for (int i = 0; i < aoJianList.size(); i++) {
            	 AoJianBean aoJian = aoJianList.get(i);
                 aoJian.setSensorArrangementbeanId(sensorArrangementBean.getId());
                 try {
                 	ServiceManager.getAoJianServiceImpl().update(aoJian);
 				} catch (Exception e) {
 					e.printStackTrace();
 				}
                //13点
                initArrangementData1(aoJian,sensorArrangementBean);
			}
            response.getWriter().write(sensorArrangementBean.getId());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    private void initArrangementData1(AoJianBean aoJian,SensorArrangementBean arrangementBean){
  	  int cableIndex = 1;
        List<ArrangementDataBean> arrangementDataBeanList = new ArrayList<ArrangementDataBean>();
        if(null==aoJian.getLength()||null==aoJian.getWidth()||null==aoJian.getHeight()){
      	  return;
        }
        //水平间隔
        double perHorDistance = (aoJian.getLength()-arrangementBean.getWallDistance().doubleValue()*2)/(arrangementBean.getColumnCount()-1);
        //垂直间隔
        double perVerDistance = (aoJian.getWidth()-arrangementBean.getWallDistance().doubleValue()*2)/(arrangementBean.getRowCount()-1);
        //z向间隔
        double perZDistance = (aoJian.getHeight()-arrangementBean.getDistanceGrainHeight().doubleValue()*arrangementBean.getDistanceGroundHeight().doubleValue())/(arrangementBean.getLayerCount()-1);
        //14布置
        int probeNum = 1;
        String sensorIndexStr = "";
        CoordinatorExchangeTemInterface coord = ControllerUtils.getArrangementTemPathByArrangement(arrangementBean);
        if(null != coord){
          Map<Integer,String> coordinateMap = coord.getCoordinateMap(arrangementBean);
      	  for (int i = 1; i <= arrangementBean.getProCount().intValue(); i++) {
                int j,j2,k;
                String[] coordinateArr = coordinateMap.get(i).split(",");
                j = Integer.parseInt(coordinateArr[0]);
                j2 = Integer.parseInt(coordinateArr[1]);
                
                for (int l = 0; l < arrangementBean.getLayerCount(); l++) {
              	  if("从上往下".equals(arrangementBean.getPointDirection())){
              		  k = l;
              	  }
              	  else{
              		  k = arrangementBean.getLayerCount()-1-l;
              	  }
              	  ArrangementDataBean arrangementDataBean = new ArrangementDataBean();
                    arrangementDataBean.setSensorArrangementBean(arrangementBean);
                    arrangementDataBean.setCableIndex(""+i);
              	  String position = j+","+j2+","+k;
              	  arrangementDataBean.setPosition(position);
              	  arrangementDataBean.setZyAoJianId(aoJian.getZyAoJianNum());
              	  arrangementDataBean.setIsDelete("1");
              	  arrangementDataBean.setProbeNum(probeNum);
              	  probeNum = probeNum +1;
              	  arrangementDataBean.setPosX(j*perHorDistance+arrangementBean.getWallDistance().doubleValue());
              	  arrangementDataBean.setPosY(j2*perVerDistance+arrangementBean.getWallDistance().doubleValue()); 
              	  arrangementDataBean.setPosZ(k*perZDistance + arrangementBean.getDistanceGrainHeight().doubleValue());
              	  arrangementDataBeanList.add(arrangementDataBean);
              	  sensorIndexStr = sensorIndexStr +position+"#";
                }
      	  }
      	  for (int i = 0; i < arrangementBean.getRowCount(); i++) {
				for (int j = 0; j < arrangementBean.getColumnCount(); j++) {
					for (int j2 = 0; j2 < arrangementBean.getLayerCount(); j2++) {
						 String position = i+","+j+","+j2;
						 if(!sensorIndexStr.contains(position)){
							  ArrangementDataBean arrangementDataBean = new ArrangementDataBean();
		                      arrangementDataBean.setSensorArrangementBean(arrangementBean);
		                	  arrangementDataBean.setPosition(position);
		                	  arrangementDataBean.setZyAoJianId(aoJian.getZyAoJianNum());
		                	  arrangementDataBean.setIsDelete("0");
		                	  arrangementDataBeanList.add(arrangementDataBean);
						 }
					}
				}
			}
        }
        else{
      	  //普通的布置呢---怎么办
      	  for (int j = 0; j < arrangementBean.getRowCount(); j++) {
				for (int j2 = 0; j2 < arrangementBean.getColumnCount(); j2++) {
					for (int k = 0; k < arrangementBean.getLayerCount(); k++) {
						 ArrangementDataBean arrangementDataBean = new ArrangementDataBean();
	                      arrangementDataBean.setSensorArrangementBean(arrangementBean);
	                      arrangementDataBean.setCableIndex(getCableIndex(j,j2,k,arrangementBean));
	                	  String position = j+","+j2+","+k;
	                	  arrangementDataBean.setPosition(position);
	                	  arrangementDataBean.setZyAoJianId(aoJian.getZyAoJianNum());
	                	  arrangementDataBean.setIsDelete("1");
	                	  arrangementDataBean.setProbeNum(probeNum);
	                	  probeNum = probeNum +1;
	                	  arrangementDataBean.setPosX(j*perHorDistance+arrangementBean.getWallDistance().doubleValue());
	                	  arrangementDataBean.setPosY(j2*perVerDistance+arrangementBean.getWallDistance().doubleValue()); 
	                	  arrangementDataBean.setPosZ(k*perZDistance + arrangementBean.getDistanceGrainHeight().doubleValue());
	                	  arrangementDataBeanList.add(arrangementDataBean);
					}
				}
			}
        }
        try {
            ServiceManager.getSensorArrangementServiceImpl().batchSaveArrangementBean(arrangementDataBeanList);
        } catch (Exception e) {
            e.printStackTrace();
        }	
  }
    
//    private void initArrangementData(AoJianBean aoJian,SensorArrangementBean arrangementBean){
//    	  int cableIndex = 1;
//          List<ArrangementDataBean> arrangementDataBeanList = new ArrayList<ArrangementDataBean>();
//          if(null==aoJian.getLength()||null==aoJian.getWidth()||null==aoJian.getHeight()){
//        	  return;
//          }
//          //水平间隔
//          double perHorDistance = (aoJian.getLength()-arrangementBean.getWallDistance().doubleValue()*2)/(arrangementBean.getColumnCount()-1);
//          //垂直间隔
//          double perVerDistance = (aoJian.getWidth()-arrangementBean.getWallDistance().doubleValue()*2)/(arrangementBean.getRowCount()-1);
//          //z向间隔
//          double perZDistance = (aoJian.getHeight()-arrangementBean.getDistanceGrainHeight().doubleValue()*arrangementBean.getDistanceGroundHeight().doubleValue())/(arrangementBean.getLayerCount()-1);
//          //13布置
//          int probeNum = 1;
//          String sensorIndexStr = "";
//          if(arrangementBean.getTemplateId().equals("1")){
//        	  Map<Integer,String> coordinateMap = CoordinateExChangeConst.getCoordinateMap(arrangementBean);
//        	  for (int i = 1; i < 14; i++) {
//                  int j,j2,k;
//                  String[] coordinateArr = coordinateMap.get(i).split(",");
//                  j = Integer.parseInt(coordinateArr[0]);
//                  j2 = Integer.parseInt(coordinateArr[1]);
//                  
//                  for (int l = 0; l < arrangementBean.getLayerCount(); l++) {
//                	  if("从上往下".equals(arrangementBean.getPointDirection())){
//                		  k = l;
//                	  }
//                	  else{
//                		  k = arrangementBean.getLayerCount()-1-l;
//                	  }
//                	  ArrangementDataBean arrangementDataBean = new ArrangementDataBean();
//                      arrangementDataBean.setSensorArrangementBean(arrangementBean);
//                      arrangementDataBean.setCableIndex(""+i);
//                	  String position = j+","+j2+","+k;
//                	  arrangementDataBean.setPosition(position);
//                	  arrangementDataBean.setZyAoJianId(aoJian.getZyAoJianNum());
//                	  arrangementDataBean.setIsDelete("1");
//                	  arrangementDataBean.setProbeNum(probeNum);
//                	  probeNum = probeNum +1;
//                	  arrangementDataBean.setPosX(j*perHorDistance+arrangementBean.getWallDistance().doubleValue());
//                	  arrangementDataBean.setPosY(j2*perVerDistance+arrangementBean.getWallDistance().doubleValue()); 
//                	  arrangementDataBean.setPosZ(k*perZDistance + arrangementBean.getDistanceGrainHeight().doubleValue());
//                	  arrangementDataBeanList.add(arrangementDataBean);
//                	  sensorIndexStr = sensorIndexStr +position+"#";
//                  }
//        	  }
//        	  for (int i = 0; i < arrangementBean.getRowCount(); i++) {
//				for (int j = 0; j < arrangementBean.getColumnCount(); j++) {
//					for (int j2 = 0; j2 < arrangementBean.getLayerCount(); j2++) {
//						 String position = i+","+j+","+j2;
//						 if(!sensorIndexStr.contains(position)){
//							  ArrangementDataBean arrangementDataBean = new ArrangementDataBean();
//		                      arrangementDataBean.setSensorArrangementBean(arrangementBean);
//		                	  arrangementDataBean.setPosition(position);
//		                	  arrangementDataBean.setZyAoJianId(aoJian.getZyAoJianNum());
//		                	  arrangementDataBean.setIsDelete("0");
//		                	  arrangementDataBeanList.add(arrangementDataBean);
//						 }
//					}
//				}
//			}
//          }
//          else{
//        	  //普通的布置呢---怎么办
//        	  for (int j = 0; j < arrangementBean.getRowCount(); j++) {
//				for (int j2 = 0; j2 < arrangementBean.getColumnCount(); j2++) {
//					for (int k = 0; k < arrangementBean.getLayerCount(); k++) {
//						 ArrangementDataBean arrangementDataBean = new ArrangementDataBean();
//	                      arrangementDataBean.setSensorArrangementBean(arrangementBean);
//	                      arrangementDataBean.setCableIndex(getCableIndex(j,j2,k,arrangementBean));
//	                	  String position = j+","+j2+","+k;
//	                	  arrangementDataBean.setPosition(position);
//	                	  arrangementDataBean.setZyAoJianId(aoJian.getZyAoJianNum());
//	                	  arrangementDataBean.setIsDelete("1");
//	                	  arrangementDataBean.setProbeNum(probeNum);
//	                	  probeNum = probeNum +1;
//	                	  arrangementDataBean.setPosX(j*perHorDistance+arrangementBean.getWallDistance().doubleValue());
//	                	  arrangementDataBean.setPosY(j2*perVerDistance+arrangementBean.getWallDistance().doubleValue()); 
//	                	  arrangementDataBean.setPosZ(k*perZDistance + arrangementBean.getDistanceGrainHeight().doubleValue());
//	                	  arrangementDataBeanList.add(arrangementDataBean);
//					}
//				}
//			}
//          }
//          try {
//              ServiceManager.getSensorArrangementServiceImpl().batchSaveArrangementBean(arrangementDataBeanList);
//          } catch (Exception e) {
//              e.printStackTrace();
//          }	
//    }
    
    private String getCableIndex(int i,int j,int k,SensorArrangementBean arrangementBean){
    	int intResult = i*arrangementBean.getColumnCount()+j+1;
    	return intResult+"";
    }
    
    /**
    * @名称: jcsbbzModal2 
    * @日期：2015-9-22 上午10:42:58
    * @作者： lxb
    * @描述: 第三步
    * @参数 @param request
    * @参数 @param response
    * @参数 @param model
    * @参数 @return    
    * @返回值 ModelAndView    
    * @异常
     */
    @RequestMapping({ "/xtsz/jcsbbzModal2.action" })
    public ModelAndView jcsbbzModal2(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
            String sensorArranmementId = RequestUtil.getRequestParameter(
                    request, "sensorArrangementId");
            SensorArrangementBean bean = ServiceManager
                    .getSensorArrangementServiceImpl().getById(
                            sensorArranmementId);
            model.addAttribute("bean", bean);
            // 妯℃澘璺¯寰 basePath
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            model.addAttribute("CURENT_TAB", "XTSZ");
            model.addAttribute("CURENT_TAB_2", "CFSZ");
            return new ModelAndView(PageConst.XTSZ_jcsbbzModal2, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;
        }
    }
    /**
     * 甯冪疆鑼冨洿璁剧疆 寤掗棿閫夋嫨
     * 
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping({ "/xtsz/aoJianSelectedModal.action" })
    public ModelAndView aoJianSelectedModal(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
            SensorArrangementBean bean;
            String sensorArrangementId = RequestUtil.getRequestParameter(
                    request, "sensorArrangementId");
            bean = ServiceManager.getSensorArrangementServiceImpl().getById(
                    sensorArrangementId);
            // 鏍规嵁鐢ㄦ埛淇℃伅鑾峰彇浠撴埧鍒楄〃, 鍚庣画娣诲姞鐢ㄦ埛鏉冮檺杩囨护
            List<BarnBean> barnList = ServiceManager.getBarnServiceImpl()
                    .findAll();
            model.addAttribute("barnList", barnList);
            model.addAttribute("bean", bean);
            model.addAttribute("type", "arrangementPage");
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            return new ModelAndView(PageConst.XTSZ_aoJianSelectedModal1, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;
        }
    }
    /**
    * @名称: updateSession 
    * @日期：2015-11-12 下午1:36:58
    * @作者： lxb
    * @描述: 更新到session
    * @参数 @param request
    * @参数 @param aoJian    
    * @返回值 void    
    * @异常
     */
    private void updateSession(HttpServletRequest request){
        //更新到
        AoJianBean sessionAoJian = (AoJianBean)request.getSession().getAttribute("aoJian");
        if(null != sessionAoJian){
	        AoJianBean aoJian = ServiceManager.getAoJianServiceImpl().getById(sessionAoJian.getZyAoJianNum());
	    	request.getSession().removeAttribute("aoJian");
	    	request.getSession().setAttribute("aoJian", aoJian);
        }
    }
    /**
    * @名称: updateAoJianArrangement 
    * @日期：2015-9-23 下午4:45:35
    * @作者： lxb
    * @描述: 修改传感器布置胡厫间范围
    * @参数 @param request
    * @参数 @param response
    * @参数 @param model
    * @参数 @return    
    * @返回值 Map    
    * @异常
     */
    @RequestMapping({ "/xtsz/updateAoJianArrangement.action" })
    @ResponseBody
    public Map updateAoJianArrangement(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        Map<String, Object> map = new HashMap<String, Object>();
        String ids = RequestUtil.getRequestParameter(request, "ids");
        String arrangementId = RequestUtil.getRequestParameter(request,
                "arrangementId");
        String[] idArr = ids.split("#");
        
        SensorArrangementBean arrangementBean = ServiceManager.getSensorArrangementServiceImpl().getById(arrangementId);
        try {
            //清空原有布置信息+ArrangementBean的信息通过aoJianId
        	//清空AoJianBean的布置信息
            ServiceManager.getAoJianServiceImpl().clearSensorArrangementInfo(
                    arrangementId);
            ServiceManager.getArrangementDataService().clearSensorArrangementInfo(arrangementId);
            
            // 另外布置
            for (int i = 0; i < idArr.length; i++) {
                String curId = idArr[i];
                if (StringUtils.isEmpty(curId)) {
                    continue;
                }
                AoJianBean aoJian = ServiceManager.getAoJianServiceImpl()
                        .getById(curId);
                aoJian.setSensorArrangementbeanId(arrangementId);
                try {
                	ServiceManager.getAoJianServiceImpl().update(aoJian);
				} catch (Exception e) {
					e.printStackTrace();
				}
                //13点
                initArrangementData1(aoJian,arrangementBean);
            }
            updateSession(request);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
        }
        map.put("success", true);
        return map;
    }
    
    /**
     * 淇濆瓨鍩烘湰璁剧疆鍜屼覆鍙ｈ®剧疆淇℃伅
     * 
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "/xtsz/saveBaseSettingInfo.action", method = RequestMethod.POST)
    @ResponseBody
    public Map saveBaseSettingInfo(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        Map<String, String> map = new HashMap<String, String>();
        String lkmc = RequestUtil.getRequestParameter(request, "lkmc");
        if (!StringUtils.isEmpty(lkmc)) {
            map.put("lkmc,粮库名称", lkmc);
        }
        map.put("szsf,所在省份", RequestUtil.getRequestParameter(request, "szsf"));
        map.put("szsq,所在市区", RequestUtil.getRequestParameter(request, "szsq"));
        map.put("ckh,传口号", RequestUtil.getRequestParameter(request, "ckh"));
        map.put("btl,波特率", RequestUtil.getRequestParameter(request, "btl"));
        map.put("xyw,校验位", RequestUtil.getRequestParameter(request, "xyw"));
        map.put("sjw,数据位", RequestUtil.getRequestParameter(request, "sjw"));
        map.put("tzw,停止位", RequestUtil.getRequestParameter(request, "tzw"));
        ServiceManager.getBaseSettingServiceImpl().saveBaseSettingInfo(map);
        return map;
    }
    
    @RequestMapping(value = "/xtsz/saveSjk.action", method = RequestMethod.POST)
    @ResponseBody
    public Map saveSjk(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        Map<String, String> map = new HashMap<String, String>();
        String sjk = RequestUtil.getRequestParameter(request, "sjk");
        String cacheTime = RequestUtil.getRequestParameter(request, "cacheTime");
        String dqtdh = RequestUtil.getRequestParameter(request, "dqtdh");
        String blsj = RequestUtil.getRequestParameter(request, "blsj");
        String qlsj = RequestUtil.getRequestParameter(request, "qlsj");
        String jzCount = RequestUtil.getRequestParameter(request, "jzCount");
        String jzTime = RequestUtil.getRequestParameter(request, "jzTime");
        map.put("jzCount,矫正次数", jzCount);
        map.put("jzTime,矫正时间", jzTime);
        map.put("blsj,临时数据库数据保留时间", blsj);
        map.put("qlsj,临时数据库数据清理时间点", qlsj);
        map.put("dqtdh,大气探点号", dqtdh);
        map.put("sjk,粮库数据库名称", sjk);
        map.put("cacheTime,缓存时间", cacheTime);
        HttpSession s = request.getSession();
        s.removeAttribute("cacheDbName");
		s.setAttribute("cacheDbName", sjk);
        s.removeAttribute("cacheTime");
		s.setAttribute("cacheTime", cacheTime);
        ServiceManager.getBaseSettingServiceImpl().saveBaseSettingInfo(map);
        return map;
    }
    
    @RequestMapping(value = "/xtsz/saveAreaDevide.action", method = RequestMethod.POST)
    @ResponseBody
    public Map saveAreaDevide(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        Map<String, String> map = new HashMap<String, String>();
        String qyhf1 = RequestUtil.getRequestParameter(request, "qyhf1");
        String qyhf2 = RequestUtil.getRequestParameter(request, "qyhf2");
        String qyhf3 = RequestUtil.getRequestParameter(request, "qyhf3");
        map.put("qyhf1,区域划分1", qyhf1);
        map.put("qyhf2,区域划分2", qyhf2);
        map.put("qyhf3,区域划分3", qyhf3);
        ServiceManager.getBaseSettingServiceImpl().saveBaseSettingInfo(map);
        return map;
    }
    /**
     * 淇濆瓨鐣岄潰椋庢牸淇℃伅
     * 
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "/xtsz/saveTheme.action", method = RequestMethod.POST)
    @ResponseBody
    public Map saveTheme(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        User user = (User) request.getSession().getAttribute("user");
        try {
            user.setTheme(RequestUtil.getRequestParameter(request, "theme"));
            ServiceManager.getUserService().update(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new HashMap();
    }
    /**
     * 粮食类别维护
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping({ "/xtsz/grainTypeModal.action" })
    public ModelAndView grainTypeModal(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
            String grainTypeId = RequestUtil.getRequestParameter(request,
                    "grainTypeId");
            GrainTypeBean bean;
            if (StringUtils.isEmpty(grainTypeId)) {
                bean = new GrainTypeBean();
            } else {
                bean = ServiceManager.getGrainTypeServiceImpl().getById(
                        grainTypeId);
            }
            model.addAttribute("bean", bean);
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            return new ModelAndView(PageConst.XTSZ_grainTypeModal, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;
        }
    }
    /**
     * 粮食类别维护
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping({ "/xtsz/saveGrain.action" })
    public void saveGrain(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
            Map map = new HashMap();
            String grainTypeId = RequestUtil.getRequestParameter(request,
                    "grainTypeId");
            String grainType = RequestUtil.getRequestParameter(request,
                    "grainType");
            String remarks = RequestUtil
                    .getRequestParameter(request, "remarks");
            GrainTypeBean bean;
            if (StringUtils.isEmpty(grainTypeId)) {
                bean = new GrainTypeBean();
            } else {
                bean = ServiceManager.getGrainTypeServiceImpl().getById(
                        grainTypeId);
            }
            bean.setGrainType(grainType);
            bean.setRemarks(remarks);
            bean.setDefaultGrain("0");
           
            boolean isAdd = false;
            if (StringUtils.isEmpty(grainTypeId)) {
            	bean.setCreateTime(new Date());
                bean = ServiceManager.getGrainTypeServiceImpl().save(bean);
                AlarmBean alarmBean = ServiceManager.getAlarmServiceImpl()
                        .getById("3");// 先取小麦的作为默认数据
                AlarmBean newAlarm = alarmBean.clone();
                newAlarm.setGrainBeanId(bean.getId());
                newAlarm.setCreateDate(new Date());
                ServiceManager.getAlarmServiceImpl().save(newAlarm);
                //再加个湿度---模拟给的小麦--系统中小麦肯定存在
                List<GrainTypeBean> xiaoMaiBeans = ServiceManager.getGrainTypeServiceImpl().getByGraintype("小麦");
                AlarmBean wetAlarm = CommonUtils.getWetAlarm(xiaoMaiBeans.get(0));
                try {
                	AlarmBean alarmWetBean1 = wetAlarm.clone();
                	alarmWetBean1.setGrainBeanId(bean.getId());
                	alarmWetBean1.setCreateDate(new Date());
                	ServiceManager.getAlarmServiceImpl().save(alarmWetBean1);
				} catch (Exception e) {
					e.printStackTrace();
				}
                isAdd = true;
            } else {
                ServiceManager.getGrainTypeServiceImpl().update(bean);
            }
            List<GrainTypeBean> grainList = ServiceManager
                    .getGrainTypeServiceImpl().findAll();
            model.addAttribute("grainList", grainList);
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            try {
                FreeMarkerUtil.printWriterFile("grainType.ftl", "templates", model,response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
        }
    }
    /**
     * 粮食类别维护
     * 
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping({ "/xtsz/delGrain.action" })
    @ResponseBody
    public Map delGrain(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
            // 删除的时候要先删除外键关联信息--告警信息
            Map map = new HashMap();
            String grainTypeId = RequestUtil.getRequestParameter(request,
                    "grainTypeId");
            try {
                ServiceManager.getAlarmServiceImpl().deleteAlarmByGrainId(
                        grainTypeId);
                ServiceManager.getGrainTypeServiceImpl().delete(grainTypeId);
            } catch (Exception e) {
                // TODO: handle exception
                map.put("success", false);
                e.printStackTrace();
            }
            map.put("success", true);
            return map;
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;
        }
    }
    /**
     * 定时任务窗体
     * 
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping({ "/xtsz/dsqszModal.action" })
    public ModelAndView dsqszModal(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
            String taskId = RequestUtil.getRequestParameter(request, "taskId");
            TimerTaskBean bean;
            if (StringUtils.isEmpty(taskId)) {
                bean = new TimerTaskBean();
            } else {
                bean = ServiceManager.getTimerServiceImpl().getById(taskId);
            }
            model.addAttribute("periodUnitList", getPeriodUnitList());
            model.addAttribute("timerTypeList", getTimerTypeList());
            model.addAttribute("bean", bean);
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            return new ModelAndView(PageConst.XTSZ_dspszModal, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;
        }
    }
    private List<String> getPeriodUnitList() {
        return new ArrayList<String>() {
            {
                add("月");
                add("日");
                add("时");
                add("分");
            }
        };
    }
    private List<String> getTimerTypeList() {
        return new ArrayList<String>() {
            {
                add("周期性任务");
                add("一次性任务");
            }
        };
    }
    /**
     * 定时任务模块
     * 
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping({ "/xtsz/dsqsz.action" })
    public ModelAndView dsqsz(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
            String taskId = RequestUtil.getRequestParameter(request, "taskId");
            TimerTaskBean bean;
            List<TimerTaskBean> timerTaskList = ServiceManager
                    .getTimerServiceImpl().findAll();
            model.addAttribute("timerTaskList", timerTaskList);
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            model.addAttribute("CURENT_TAB", "XTSZ");
            model.addAttribute("CURENT_TAB_2", "LQPZ");
            model.addAttribute("CURENT_TAB_3", "DSJCGL");
            return new ModelAndView(PageConst.XTSZ_dspsz, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;
        }
    }
    /**
     * 保存定时任务
     * 
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping({ "/xtsz/saveTimerTask.action" })
    @ResponseBody
    public Map saveTimerTask(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
            Map map = new HashMap();
            String timerTaskId = RequestUtil.getRequestParameter(request,
                    "timerTaskId");
            String taskDesc = RequestUtil.getRequestParameter(request,
                    "taskDesc");
            String taskName = RequestUtil.getRequestParameter(request,
                    "taskName");
            String startTime = RequestUtil.getRequestParameter(request,
                    "startTime");
            String stopTime = RequestUtil.getRequestParameter(request,
                    "stopTime");
            String timerType = RequestUtil.getRequestParameter(request,
                    "timerType");
            String period = RequestUtil.getRequestParameter(request, "period");
            TimerTaskBean bean;
            if (StringUtils.isEmpty(timerTaskId)) {
                bean = new TimerTaskBean();
            } else {
                bean = ServiceManager.getTimerServiceImpl()
                        .getById(timerTaskId);
            }
            // 保持的时候根据类型设置执行的类名和方法
            bean.setClassName("com.common.adapter.Adapter");
            bean.setMethodName("getTestData");
            bean.setType("粮情检测");
            String units = RequestUtil.getRequestParameter(request, "units");
            if (!StringUtils.isEmpty(units)) {
                bean.setUnits(units);
            }
            if (!StringUtils.isEmpty(taskDesc)) {
                bean.setTaskDesc(taskDesc);
            }
            if (!StringUtils.isEmpty(taskName)) {
                bean.setTaskName(taskName);
            }
            if (!StringUtils.isEmpty(startTime)) {
                bean.setStartTime(CalendarUtil.formatDate(startTime
                        + " 00:00:00", CalendarUtil.DATE_FORMAT_MODE4));
            }
            if (!StringUtils.isEmpty(stopTime)) {
                bean.setStopTime(CalendarUtil.formatDate(
                        stopTime + " 00:00:00", CalendarUtil.DATE_FORMAT_MODE4));
            }
            if (!StringUtils.isEmpty(timerType)) {
                bean.setTimerType(timerType);
            }
            if (!StringUtils.isEmpty(period)) {
                bean.setPeriod(Integer.parseInt(period));
            }
            boolean isAdd = false;
            if (StringUtils.isEmpty(timerTaskId)) {
            	bean.setCreateTime(new Date());
                bean = ServiceManager.getTimerServiceImpl().save(bean);
                isAdd = true;
            } else {
                ServiceManager.getTimerServiceImpl().update(bean);
            }
            map.put("add", isAdd);
            map.put("bean", bean);
            map.put("url", WebConstConfig.BASE_PATH
                    + "xtsz/delTimerTask.action?grainTypeId=" + bean.getId());
            map.put("editUrl", WebConstConfig.BASE_PATH
                    + "xtsz/dsqszModal.action" + "?timerTaskId=" + bean.getId()
                    + "");
            return map;
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;
        }
    }
    /**
     * 删除定时任务
     * 
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping({ "/xtsz/delTimerTask.action" })
    @ResponseBody
    public Map delTimerTask(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
            Map map = new HashMap();
            String timerTaskId = RequestUtil.getRequestParameter(request,
                    "timerTaskId");
            try {
                ServiceManager.getTimerServiceImpl().delete(timerTaskId);
            } catch (Exception e) {
                e.printStackTrace();
            }
            map.put("success", true);
            return map;
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;
        }
    }
    /**
     * 启动/停止定时任务
     * 
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping({ "/xtsz/changeStatus.action" })
    @ResponseBody
    public Map changeStatus(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
            Map map = new HashMap();
            String timerTaskId = RequestUtil.getRequestParameter(request,
                    "timerTaskId");
            TimerTaskBean bean = ServiceManager.getTimerServiceImpl().getById(
                    timerTaskId);
            if (bean.getStatus() == 0) {
                bean.setStatus(1);
            } else {
                bean.setStatus(0);
            }
            try {
                ServiceManager.getTimerServiceImpl().update(bean);
            } catch (Exception e) {
                e.printStackTrace();
            }
            map.put("del", false);
            map.put("bean", bean);
            return map;
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;
        }
    }
    /**
    * @Title: tfsb 
    * @author lxb
    * @Description: 通风设备
    * @param @param request
    * @param @param response
    * @param @param model
    * @param @return    
    * @return ModelAndView    
    * @throws
     */
    @RequestMapping({ "/xtsz/tfsb.action" })
    public ModelAndView tfsb(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
            List<BarnBean> barnList = ServiceManager.getBarnServiceImpl().findAll();
            String aoJianId = RequestUtil.getRequestParameter(request, "aoJianId");
            AoJianBean aoJian = ServiceManager.getAoJianServiceImpl().getById(aoJianId);
            List<BaseDevice> deviceList = new ArrayList<BaseDevice>();
            //风机
            List<BaseDevice> fanList= ServiceManager.getFanDeviceServiceImpl().getDeviceListByAoJianId(aoJianId);
            //通风口
            List<BaseDevice> ventList = ServiceManager.getVentDeviceServiceImpl().getDeviceListByAoJianId(aoJianId);
            //窗户
            List<BaseDevice> windowList = ServiceManager.getWindowDeviceServiceImpl().getDeviceListByAoJianId(aoJianId);
            //风力检测
            List<BaseDevice> windDetectionList = ServiceManager.getWindDetectionDeviceServiceImpl().getDeviceListByAoJianId(aoJianId);
            
            deviceList.addAll(ventList);
            deviceList.addAll(fanList);
            deviceList.addAll(windowList);
            deviceList.addAll(windDetectionList);
        
            model.addAttribute("barnList",barnList);
            model.addAttribute("baseDevices", deviceList);
            
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            model.addAttribute("CURENT_TAB", "XTSZ");
            model.addAttribute("CURENT_TAB_2", "ZNTF");
            model.addAttribute("CURENT_TAB_3", "TFSB");
            return new ModelAndView(PageConst.XTSZ_tfsb, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;
        }
    }
    /**
    * @Title:  getDeviceTem
    * @author lxb
    * @Description: 获取通风设备模板 
    * @param @param request
    * @param @param response
    * @param @param model    
    * @return void    
    * @throws
     */
    @RequestMapping(value = "/xtsz/getDeviceTem.action", method = RequestMethod.POST)
    public void getDeviceTem(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        Map<String, Object> map = new HashMap<String, Object>();
        /**
         * 设备类型需要传递过来，根据获取模版
         */
        String deviceType = RequestUtil.getRequestParameter(request, "deviceType");
        
        String deviceId = RequestUtil.getRequestParameter(request, "deviceId");
        FanDeviceBean fanBean = new FanDeviceBean();
        VentDeviceBean ventBean = new VentDeviceBean();
        WindDetectionDeviceBean windBean = new WindDetectionDeviceBean();
        WindowDeviceBean windowBean = new WindowDeviceBean();
        if(!StringUtils.isEmpty(deviceId)){
            if(deviceType.equals("tfk")){
                ventBean = ServiceManager.getVentDeviceServiceImpl().getById(deviceId);
            }else if(deviceType.equals("fj")){
                fanBean = ServiceManager.getFanDeviceServiceImpl().getById(deviceId);
            }else if(deviceType.equals("fljc")){
                windBean = ServiceManager.getWindDetectionDeviceServiceImpl().getById(deviceId);
            }else if(deviceType.equals("ch")){
                windowBean = ServiceManager.getWindowDeviceServiceImpl().getById(deviceId);
            }
        }
        map.put("ventBean", ventBean);
        map.put("fanBean", fanBean);
        map.put("windBean", windBean);
        map.put("windowBean", windowBean);
        map.put("tfTypes", new ArrayList<String>(){{
            add("通风口");
            add("分机");
            add("窗户");
            add("风力检测");
        }});
        map.put("horPos", new ArrayList<String>(){{
            add("正面");
            add("背面");
        }});
        map.put("verPos", new ArrayList<String>(){{
            add("上部");
            add("下部");
        }});
        map.put("windDir",new ArrayList<String>(){{
            add("单向");
            add("双向");
        }});
        map.put("pinlv", new ArrayList<String>(){{
            add("定频");
            add("变频");
        }});
        map.put("BASE_PATH", WebConstConfig.BASE_PATH);
        model.addAttribute("BASE_ASSETS_PATH",
                WebConstConfig.getBase_Assets_Path());
        try {
            FreeMarkerUtil.printWriterFile(deviceType+".ftl", "templates", map,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
    * @Title: tfsbModal 
    * @author lxb
    * @Description: 通风设备 
    * @param @param request
    * @param @param response
    * @param @param model
    * @param @return    
    * @return ModelAndView    
    * @throws
     */
    @RequestMapping({ "/xtsz/tfsbModal.action" })
    public ModelAndView tfsbModal(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
            /**
             * 设备类型需要传递过来，根据获取模版
             */
            String deviceType = RequestUtil.getRequestParameter(request, "deviceType");
            
            String deviceId = RequestUtil.getRequestParameter(request, "deviceId");
            
            FanDeviceBean fanBean = new FanDeviceBean();
            VentDeviceBean ventBean = new VentDeviceBean();
            WindDetectionDeviceBean windBean = new WindDetectionDeviceBean();
            WindowDeviceBean windowBean = new WindowDeviceBean();
            if(!StringUtils.isEmpty(deviceId)){
                if(deviceType.equals("tfk")){
                    ventBean = ServiceManager.getVentDeviceServiceImpl().getById(deviceId);
                }else if(deviceType.equals("fj")){
                    fanBean = ServiceManager.getFanDeviceServiceImpl().getById(deviceId);
                }else if(deviceType.equals("fljc")){
                    windBean = ServiceManager.getWindDetectionDeviceServiceImpl().getById(deviceId);
                }else if(deviceType.equals("ch")){
                    windowBean = ServiceManager.getWindowDeviceServiceImpl().getById(deviceId);
                }
            }
            model.addAttribute("deviceType", deviceType);
            model.addAttribute("ventBean", ventBean);
            model.addAttribute("fanBean", fanBean);
            model.addAttribute("windBean", windBean);
            model.addAttribute("windowBean", windowBean);
            model.addAttribute("tfTypes", new ArrayList<String>(){{
                add("通风口");
                add("分机");
                add("窗户");
                add("风力检测");
            }});
            model.addAttribute("horPos", new ArrayList<String>(){{
                add("正面");
                add("背面");
            }});
            model.addAttribute("verPos", new ArrayList<String>(){{
                add("上部");
                add("下部");
            }});
            model.addAttribute("windDir",new ArrayList<String>(){{
                add("单向");
                add("双向");
            }});
            model.addAttribute("pinlv", new ArrayList<String>(){{
                add("定频");
                add("变频");
            }});
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            return new ModelAndView(PageConst.XTSZ_tfsbModal, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;
        }
    }
    
    
    /**
    * @Title: tfsbModal 
    * @author lxb
    * @Description: 通风口
    * @param @param request
    * @param @param response
    * @param @param model
    * @param @return    
    * @return ModelAndView    
    * @throws
     */
    @RequestMapping({ "/xtsz/tfkModal.action" })
    public ModelAndView tfkModal(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
            String deviceId = RequestUtil.getRequestParameter(request, "deviceId");
            String aoJianId = RequestUtil.getRequestParameter(request, "aoJianId");
            VentDeviceBean bean = new VentDeviceBean();
            if(!StringUtils.isEmpty(deviceId)){
                bean = ServiceManager.getVentDeviceServiceImpl().getById(deviceId);
            }
            model.addAttribute("aoJianId", aoJianId);
            model.addAttribute("bean", bean);
            model.addAttribute("horPos", new ArrayList<String>(){{
                add("正面");
                add("背面");
            }});
            model.addAttribute("verPos", new ArrayList<String>(){{
                add("上部");
                add("下部");
            }});
            model.addAttribute("windDir",new ArrayList<String>(){{
                add("单向");
                add("双向");
            }});
            model.addAttribute("pinlv", new ArrayList<String>(){{
                add("定频");
                add("变频");
            }});
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            return new ModelAndView(PageConst.XTSZ_tfkModal, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;
        }
    }
    
    /**
    * @Title: tfsbModal 
    * @author lxb
    * @Description: 风机
    * @param @param request
    * @param @param response
    * @param @param model
    * @param @return    
    * @return ModelAndView    
    * @throws
     */
    @RequestMapping({ "/xtsz/fjModal.action" })
    public ModelAndView fjModal(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
            String deviceId = RequestUtil.getRequestParameter(request, "deviceId");
            String aoJianId = RequestUtil.getRequestParameter(request, "aoJianId");
            FanDeviceBean bean = new FanDeviceBean();
            if(!StringUtils.isEmpty(deviceId)){
                bean = ServiceManager.getFanDeviceServiceImpl().getById(deviceId);
            }
            model.addAttribute("aoJianId", aoJianId);
            
            List<BaseDevice> ventList = ServiceManager.getVentDeviceServiceImpl().getDeviceListByAoJianId(aoJianId);
            model.addAttribute("ventList",ventList);
            model.addAttribute("bean", bean);
            model.addAttribute("horPos", new ArrayList<String>(){{
                add("正面");
                add("背面");
            }});
            model.addAttribute("verPos", new ArrayList<String>(){{
                add("上部");
                add("下部");
            }});
            model.addAttribute("windDir",new ArrayList<String>(){{
                add("单向");
                add("双向");
            }});
            model.addAttribute("pinlv", new ArrayList<String>(){{
                add("定频");
                add("变频");
            }});
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            return new ModelAndView(PageConst.XTSZ_fjModal, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;
        }
    }
    
    /**
    * @Title: tfsbModal 
    * @author lxb
    * @Description: 通风口
    * @param @param request
    * @param @param response
    * @param @param model
    * @param @return    
    * @return ModelAndView    
    * @throws
     */
    @RequestMapping({ "/xtsz/chModal.action" })
    public ModelAndView chModal(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
            String deviceId = RequestUtil.getRequestParameter(request, "deviceId");
            String aoJianId = RequestUtil.getRequestParameter(request, "aoJianId");
            WindowDeviceBean bean = new WindowDeviceBean();
            if(!StringUtils.isEmpty(deviceId)){
                bean = ServiceManager.getWindowDeviceServiceImpl().getById(deviceId);
            }
            model.addAttribute("aoJianId", aoJianId);
            model.addAttribute("bean", bean);
            model.addAttribute("horPos", new ArrayList<String>(){{
                add("正面");
                add("背面");
            }});
            model.addAttribute("verPos", new ArrayList<String>(){{
                add("上部");
                add("下部");
            }});
            model.addAttribute("windDir",new ArrayList<String>(){{
                add("单向");
                add("双向");
            }});
            model.addAttribute("pinlv", new ArrayList<String>(){{
                add("定频");
                add("变频");
            }});
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            return new ModelAndView(PageConst.XTSZ_chModal, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;
        }
    }
    
    /**
    * @Title: tfsbModal 
    * @author lxb
    * @Description: 通风口
    * @param @param request
    * @param @param response
    * @param @param model
    * @param @return    
    * @return ModelAndView    
    * @throws
     */
    @RequestMapping({ "/xtsz/fljcModal.action" })
    public ModelAndView fljcModal(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
            String deviceId = RequestUtil.getRequestParameter(request, "deviceId");
            String aoJianId = RequestUtil.getRequestParameter(request, "aoJianId");
            WindDetectionDeviceBean bean = new WindDetectionDeviceBean();
            if(!StringUtils.isEmpty(deviceId)){
                bean = ServiceManager.getWindDetectionDeviceServiceImpl().getById(deviceId);
            }
            model.addAttribute("aoJianId", aoJianId);
            model.addAttribute("bean", bean);
            model.addAttribute("horPos", new ArrayList<String>(){{
                add("正面");
                add("背面");
            }});
            model.addAttribute("verPos", new ArrayList<String>(){{
                add("上部");
                add("下部");
            }});
            model.addAttribute("windDir",new ArrayList<String>(){{
                add("单向");
                add("双向");
            }});
            model.addAttribute("pinlv", new ArrayList<String>(){{
                add("定频");
                add("变频");
            }});
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            return new ModelAndView(PageConst.XTSZ_fljcModal, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;
        }
    }
    /**
    * @Title: saveTfk 
    * @author lxb
    * @Description: save--or--update 通风口 
    * @param @param request
    * @param @param response
    * @param @param model
    * @param @return    
    * @return Map    
    * @throws
     */
    @RequestMapping(value = "/xtsz/saveTfk.action", method = RequestMethod.POST)
    public void saveTfk(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            String id = RequestUtil.getRequestParameter(request,
                    "beanId");
            String aoJianId = RequestUtil.getRequestParameter(request,
                    "aoJianId");
            if(StringUtils.isEmpty(aoJianId)){
                System.out.println("aoJianid Error");
            }
            VentDeviceBean bean = new VentDeviceBean();
            if(!StringUtils.isEmpty(id)){
                bean = ServiceManager.getVentDeviceServiceImpl().getById(id);
            }			
            String deviceNo = RequestUtil.getRequestParameter(request, "deviceNo");
            if (!StringUtils.isEmpty(deviceNo)) {
                bean.setDeviceNo(deviceNo);
            }
//			String deviceName = RequestUtil.getRequestParameter(request,
//					"deviceName");
            bean.setDeviceName("通风口");
//			if (!StringUtils.isEmpty(deviceName)) {
//			}
            String factoryName = RequestUtil.getRequestParameter(request,
                    "factoryName");
            if (!StringUtils.isEmpty(factoryName)) {
                bean.setFactoryName(factoryName);
            }
            String factoryNum = RequestUtil.getRequestParameter(request,
                    "factoryNum");
            if (!StringUtils.isEmpty(factoryNum)) {
                bean.setFactoryNum(factoryNum);
            }
            String controllerNum = RequestUtil.getRequestParameter(request,
                    "controllerNum");
            if (!StringUtils.isEmpty(factoryNum)) {
                bean.setControllerNum(controllerNum);
            }
            bean.setAoJianId(aoJianId);
            bean.setCreateTime(new Date());
            
            String facePos = RequestUtil.getRequestParameter(request,
                    "facePos");
            if (!StringUtils.isEmpty(facePos)) {
                bean.setFacePos(facePos);
            }
            String verPos = RequestUtil.getRequestParameter(request,
                    "verPos");
            if (!StringUtils.isEmpty(verPos)) {
                bean.setVerPos(verPos);
            }
            String pos = RequestUtil.getRequestParameter(request,
                    "pos");
            if (!StringUtils.isEmpty(pos)) {
                bean.setPos(pos);
            }
            if(!StringUtils.isEmpty(verPos)&&!StringUtils.isEmpty(facePos)&&!StringUtils.isEmpty(pos)){
                bean.setPosInfo(facePos+"/"+verPos+"  具体位置：" +pos);
            }
            try {
                if (StringUtils.isEmpty(bean.getId())) {
                    bean = ServiceManager.getVentDeviceServiceImpl().save(bean);
                } else {
                    ServiceManager.getVentDeviceServiceImpl().update(bean);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            createTfsbTableTemplate(model,aoJianId,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }	
    
    /**
    * @名称: saveFj 
    * @日期：2015-9-9 下午3:48:47
    * @作者： lxb
    * @描述: 保存或者更新风机
    * @参数 @param request
    * @参数 @param response
    * @参数 @param model
    * @参数 @return    
    * @返回值 Map    
    * @异常
     */
    @RequestMapping(value = "/xtsz/saveFj.action", method = RequestMethod.POST)
    public void saveFj(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            String id = RequestUtil.getRequestParameter(request,
                    "beanId");
            String aoJianId = RequestUtil.getRequestParameter(request,
                    "aoJianId");
            
            if(StringUtils.isEmpty(aoJianId)){
                System.out.println("aoJianid Error");
            }
            
            FanDeviceBean bean = new FanDeviceBean();
            if(!StringUtils.isEmpty(id)){
                bean = ServiceManager.getFanDeviceServiceImpl().getById(id);
            }		
            String deviceNo = RequestUtil.getRequestParameter(request, "deviceNo");
            if (!StringUtils.isEmpty(deviceNo)) {
                bean.setDeviceNo(deviceNo);
            }
            bean.setDeviceName("风机");
//			String deviceName = RequestUtil.getRequestParameter(request,
//					"deviceName");
//			if (!StringUtils.isEmpty(deviceName)) {
//				bean.setDeviceName(deviceName);
//			}
            String factoryName = RequestUtil.getRequestParameter(request,
                    "factoryName");
            if (!StringUtils.isEmpty(factoryName)) {
                bean.setFactoryName(factoryName);
            }
            String factoryNum = RequestUtil.getRequestParameter(request,
                    "factoryNum");
            if (!StringUtils.isEmpty(factoryNum)) {
                bean.setFactoryNum(factoryNum);
            }
            String controllerNum = RequestUtil.getRequestParameter(request,
                    "controllerNum");
            if (!StringUtils.isEmpty(factoryNum)) {
                bean.setControllerNum(controllerNum);
            }
            bean.setAoJianId(aoJianId);
            bean.setCreateTime(new Date());
    
            String deviceFactory = RequestUtil.getRequestParameter(request,
                    "deviceFactory");
            if (!StringUtils.isEmpty(deviceFactory)) {
                bean.setDeviceFactory(deviceFactory);
            }
            String deviceNum = RequestUtil.getRequestParameter(request,
                    "deviceNum");
            if (!StringUtils.isEmpty(deviceNum)) {
                bean.setDeviceNum(deviceNum);
            }
            String windDir = RequestUtil.getRequestParameter(request,
                    "windDir");
            if (!StringUtils.isEmpty(windDir)) {
                bean.setWindDir(windDir);
            }
            String model1 = RequestUtil.getRequestParameter(request,
                    "model");
            if (!StringUtils.isEmpty(model1)) {
                bean.setModel(model1);
            }
            String power = RequestUtil.getRequestParameter(request,
                    "power");
            if (!StringUtils.isEmpty(power)) {
                bean.setPower(power);
            }
            String frequenceyType = RequestUtil.getRequestParameter(request,
                    "frequenceyType");
            if (!StringUtils.isEmpty(frequenceyType)) {
                bean.setFrequenceyType(frequenceyType);
            }
            String ventDeviceId = RequestUtil.getRequestParameter(request,
                    "ventId");
            if (!StringUtils.isEmpty(ventDeviceId)) {
                VentDeviceBean vBean = ServiceManager.getVentDeviceServiceImpl().getById(ventDeviceId);
                bean.setVentDevice(vBean);
                if(!StringUtils.isEmpty(vBean.getFacePos())&&!StringUtils.isEmpty(vBean.getPos())){
                    bean.setPosInfo(vBean.getFacePos()+"/"+vBean.getVerPos()+"  具体位置：" +vBean.getPos());
                }
            }
            try {
                if (StringUtils.isEmpty(bean.getId())) {
                	bean.setIsOpen(false);
                    bean = ServiceManager.getFanDeviceServiceImpl().save(bean);
                    map.put("add", true);
                } else {
                    ServiceManager.getFanDeviceServiceImpl().update(bean);
                    map.put("add", false);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            createTfsbTableTemplate(model,aoJianId,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }		
    /**
    * @名称: saveCh 
    * @日期：2015-9-9 下午3:56:08
    * @作者： lxb
    * @描述: 保存或者更新 窗户
    * @参数 @param request
    * @参数 @param response
    * @参数 @param model
    * @参数 @return    
    * @返回值 Map    
    * @异常
     */
    @RequestMapping(value = "/xtsz/saveCh.action", method = RequestMethod.POST)
    public void saveCh(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            String id = RequestUtil.getRequestParameter(request,
                    "beanId");
            String aoJianId = RequestUtil.getRequestParameter(request,
                    "aoJianId");
            
            if(StringUtils.isEmpty(aoJianId)){
                System.out.println("aoJianid Error");
            }
            
            WindowDeviceBean bean = new WindowDeviceBean();
            if(!StringUtils.isEmpty(id)){
                bean = ServiceManager.getWindowDeviceServiceImpl().getById(id);
            }		
            String deviceNo = RequestUtil.getRequestParameter(request, "deviceNo");
            if (!StringUtils.isEmpty(deviceNo)) {
                bean.setDeviceNo(deviceNo);
            }
            bean.setDeviceName("窗户");
//			String deviceName = RequestUtil.getRequestParameter(request,
//					"deviceName");
//			if (!StringUtils.isEmpty(deviceName)) {
//				bean.setDeviceName(deviceName);
//			}
            String factoryName = RequestUtil.getRequestParameter(request,
                    "factoryName");
            if (!StringUtils.isEmpty(factoryName)) {
                bean.setFactoryName(factoryName);
            }
            String factoryNum = RequestUtil.getRequestParameter(request,
                    "factoryNum");
            if (!StringUtils.isEmpty(factoryNum)) {
                bean.setFactoryNum(factoryNum);
            }
            String controllerNum = RequestUtil.getRequestParameter(request,
                    "controllerNum");
            if (!StringUtils.isEmpty(factoryNum)) {
                bean.setControllerNum(controllerNum);
            }
            bean.setAoJianId(aoJianId);
            bean.setCreateTime(new Date());
            
            String deviceFactory = RequestUtil.getRequestParameter(request,
                    "deviceFactory");
            if (!StringUtils.isEmpty(deviceFactory)) {
                bean.setDeviceFactory(deviceFactory);
            }
            String deviceNum = RequestUtil.getRequestParameter(request,
                    "deviceNum");
            if (!StringUtils.isEmpty(deviceNum)) {
                bean.setDeviceNum(deviceNum);
            }
            String facePos = RequestUtil.getRequestParameter(request,
                    "facePos");
            if (!StringUtils.isEmpty(facePos)) {
                bean.setFacePos(facePos);
            }
            String pos = RequestUtil.getRequestParameter(request,
                    "pos");
            if (!StringUtils.isEmpty(pos)) {
                bean.setPos(pos);
            }
            if(!StringUtils.isEmpty(facePos)&&!StringUtils.isEmpty(pos)){
                bean.setPosInfo(facePos+"  具体位置：" +pos);
            }
            try {
                if (StringUtils.isEmpty(bean.getId())) {
                	bean.setIsOpen(false);
                    bean = ServiceManager.getWindowDeviceServiceImpl().save(bean);
                } else {
                    ServiceManager.getWindowDeviceServiceImpl().update(bean);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            createTfsbTableTemplate(model,aoJianId,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
    * @名称: savefljc
    * @日期：2015-9-9 下午4:00:44
    * @作者： lxb
    * @描述: 风力检测设备的保存或者更新
    * @参数 @param request
    * @参数 @param response
    * @参数 @param model
    * @参数 @return    
    * @返回值 Map    
    * @异常
     */
    @RequestMapping(value = "/xtsz/saveFljc.action", method = RequestMethod.POST)
    public void saveFljc(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            String id = RequestUtil.getRequestParameter(request,
                    "beanId");
            String aoJianId = RequestUtil.getRequestParameter(request,
                    "aoJianId");
            
            if(StringUtils.isEmpty(aoJianId)){
                System.out.println("aoJianid Error");
            }
            
            WindDetectionDeviceBean bean = new WindDetectionDeviceBean();
            if(!StringUtils.isEmpty(id)){
                bean = ServiceManager.getWindDetectionDeviceServiceImpl().getById(id);
            }		
            String deviceNo = RequestUtil.getRequestParameter(request, "deviceNo");
            if (!StringUtils.isEmpty(deviceNo)) {
                bean.setDeviceNo(deviceNo);
            }
            bean.setDeviceName("风力检测");
//			String deviceName = RequestUtil.getRequestParameter(request,
//					"deviceName");
//			if (!StringUtils.isEmpty(deviceName)) {
//			}
            String factoryName = RequestUtil.getRequestParameter(request,
                    "factoryName");
            if (!StringUtils.isEmpty(factoryName)) {
                bean.setFactoryName(factoryName);
            }
            String factoryNum = RequestUtil.getRequestParameter(request,
                    "factoryNum");
            if (!StringUtils.isEmpty(factoryNum)) {
                bean.setFactoryNum(factoryNum);
            }
            String controllerNum = RequestUtil.getRequestParameter(request,
                    "controllerNum");
            if (!StringUtils.isEmpty(factoryNum)) {
                bean.setControllerNum(controllerNum);
            }
            bean.setAoJianId(aoJianId);
            bean.setCreateTime(new Date());

            String deviceFactory = RequestUtil.getRequestParameter(request,
                    "deviceFactory");
            if (!StringUtils.isEmpty(deviceFactory)) {
                bean.setDeviceFactory(deviceFactory);
            }
            String deviceNum = RequestUtil.getRequestParameter(request,
                    "deviceNum");
            if (!StringUtils.isEmpty(deviceNum)) {
                bean.setDeviceNum(deviceNum);
            }
            bean.setPosInfo("无");
            try {
                if (StringUtils.isEmpty(bean.getId())) {
                    bean = ServiceManager.getWindDetectionDeviceServiceImpl().save(bean);
                    map.put("add", true);
                } else {
                    ServiceManager.getWindDetectionDeviceServiceImpl().update(bean);
                    map.put("add", false);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            createTfsbTableTemplate(model,aoJianId,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }	
    /**
    * @名称: deleteDevice 
    * @日期：2015-9-9 下午4:03:08
    * @作者： lxb
    * @描述: 删除通风设备
    * @参数 @param request
    * @参数 @param response
    * @参数 @param model
    * @参数 @return    
    * @返回值 Map    
    * @异常
     */
    @RequestMapping(value = "/xtsz/deleteDevice.action", method = RequestMethod.POST)
    @ResponseBody
    public Map deleteDevice(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        Map<String, Object> map = new HashMap<String, Object>();
        String deviceId = RequestUtil.getRequestParameter(request, "curDataId");
        String deviceType = RequestUtil.getRequestParameter(request, "deviceType");
        try {
            if(deviceType.equals("tfk")){
                //如果是通风口的话  风机怎么办？
                ServiceManager.getVentDeviceServiceImpl().delete(deviceId);
            }else if(deviceType.equals("fj")){
                ServiceManager.getFanDeviceServiceImpl().delete(deviceId);
            }else if(deviceType.equals("ch")){
                ServiceManager.getWindowDeviceServiceImpl().delete(deviceId);
            }else{
                ServiceManager.getWindDetectionDeviceServiceImpl().delete(deviceId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        map.put("success", true);
        return map;
    }
    /**
    * @名称: getAoJianTfsb 
    * @日期：2015-9-10 上午10:34:36
    * @作者： lxb
    * @描述: 获取廒间通风设备
    * @参数 @param request
    * @参数 @param response
    * @参数 @param model
    * @参数 @return    
    * @返回值 ModelAndView    
    * @异常
     */
    @RequestMapping({ "/xtsz/getAoJianTfsb2.action" })
    public void getAoJianTfsb2(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
            String aoJianId = RequestUtil.getRequestParameter(request, "aoJianId");
            //response.sendRedirect( WebConstConfig.BASE_PATH+"xtsz/getAoJianTfsb1.action?aoJianId="+aoJianId);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
        }
    }
    @RequestMapping({ "/xtsz/getAoJianTfsb.action" })
    public ModelAndView getAoJianTfsb(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
            String aoJianId = RequestUtil.getRequestParameter(request, "aoJianId");
            model = getVentDeviceListByAoJianId(aoJianId,model);
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
            		WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
            		WebConstConfig.getBase_Template_Default_Path());
            model.addAttribute("CURENT_TAB", "XTSZ");
            model.addAttribute("CURENT_TAB_2", "ZNTF");
            model.addAttribute("CURENT_TAB_3", "TFSB");
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
        }
        return new ModelAndView(PageConst.XTSZ_perAoJianTfsb, model);
    }
    /**
    * @名称: getVentDeviceListByAoJianId 
    * @日期：2015-9-10 下午2:10:07
    * @作者： lxb
    * @描述: 通过廒间Id获取通风设备布置信息
    * @参数 @param aoJianId
    * @参数 @param model
    * @参数 @return    
    * @返回值 ModelMap    
    * @异常
     */
    private ModelMap getVentDeviceListByAoJianId(String aoJianId,ModelMap model){
        AoJianBean aoJian = ServiceManager.getAoJianServiceImpl().getById(aoJianId);
        List<BaseDevice> deviceList = new ArrayList<BaseDevice>();
        //风机
        List<BaseDevice> fanList= ServiceManager.getFanDeviceServiceImpl().getDeviceListByAoJianId(aoJianId);
        //通风口
        List<BaseDevice> ventList = ServiceManager.getVentDeviceServiceImpl().getDeviceListByAoJianId(aoJianId);
        //窗户
        List<BaseDevice> windowList = ServiceManager.getWindowDeviceServiceImpl().getDeviceListByAoJianId(aoJianId);
        //风力检测
        List<BaseDevice> windDetectionList = ServiceManager.getWindDetectionDeviceServiceImpl().getDeviceListByAoJianId(aoJianId);
        
        deviceList.addAll(ventList);
        deviceList.addAll(fanList);
        deviceList.addAll(windowList);
        deviceList.addAll(windDetectionList);
        model.addAttribute("ventilationModeList", new ArrayList<String>(){{
            add("横向通风");
            add("纵向通风");
        }});
        model.addAttribute("bean",aoJian);
        model.addAttribute("baseDevices", deviceList);
        
        model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
        model.addAttribute("BASE_ASSETS_PATH",
                WebConstConfig.getBase_Assets_Path());
        model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                WebConstConfig.getBase_Template_Default_Path());
        return model;
    }
    /**
    * @名称: createTemplate 
    * @日期：2015-9-10 下午2:15:23
    * @作者： lxb
    * @描述: 生成通风设备表格数据 
    * @参数 @param model
    * @参数 @param aoJianId
    * @参数 @param response    
    * @返回值 void    
    * @异常
     */
    private void createTfsbTableTemplate(ModelMap model,String aoJianId, HttpServletResponse response){
        model = getVentDeviceListByAoJianId(aoJianId,model);
        try {
            FreeMarkerUtil.printWriterFile("sbtfTable.ftl", "templates", model,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
    * @名称: saveAoJianTfsbInfo 
    * @日期：2015-9-10 下午2:46:28
    * @作者： lxb
    * @描述: 保存廒间通风设备信息
    * @参数     
    * @返回值 void    
    * @异常
     */
    @RequestMapping({ "/xtsz/saveAoJianTfsbInfo.action" })
    public void saveAoJianTfsbInfo(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        String aoJianId = RequestUtil.getRequestParameter(request, "aoJianId");
        if(StringUtils.isEmpty(aoJianId)){
            System.out.println("aoJianId is null");
            return;
        }
        AoJianBean aoJian = ServiceManager.getAoJianServiceImpl().getById(aoJianId);
        String ventilationMode = RequestUtil.getRequestParameter(request, "ventilationMode");
        if(!StringUtils.isEmpty(ventilationMode)){
            aoJian.setVentilationMode(ventilationMode);
        }
        String openRatio = RequestUtil.getRequestParameter(request, "openRatio");
        if(!StringUtils.isEmpty("openRatio")){
            aoJian.setOpenRatio(openRatio);
        }
        String wayThan = RequestUtil.getRequestParameter(request, "wayThan");
        if(!StringUtils.isEmpty(wayThan)){
            aoJian.setWayThan(wayThan);
        }
        String ventResistance = RequestUtil.getRequestParameter(request, "ventResistance");
        if(!StringUtils.isEmpty(ventResistance)){
            aoJian.setVentResistance(ventResistance);
        }
        String ventRemark = RequestUtil.getRequestParameter(request, "ventRemark");
        if(!StringUtils.isEmpty(ventRemark)){
            aoJian.setVentRemark(ventRemark);
        }
        try {
            ServiceManager.getAoJianServiceImpl().update(aoJian);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
    * @名称: createTfsbTableTemplate 
    * @日期：2015-9-10 下午7:47:09
    * @作者： lxb
    * @描述: TODO 
    * @参数 @param model
    * @参数 @param aoJianId
    * @参数 @param response    
    * @返回值 void    
    * @异常
     */
    @RequestMapping({ "/xtsz/updateBarnsAfterClose.action" })
    public void updateBarnsAfterClose(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        RoleBean role = (RoleBean)request.getSession().getAttribute("role");
        model.addAttribute("role", role);
        updateBarnList(model,response);
    }
    
    private void updateBarnList(ModelMap model,HttpServletResponse response){
        List<BarnBean> barnList = ServiceManager.getBarnServiceImpl().findAll();
        
        model.addAttribute("barnList", barnList);
        model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
        model.addAttribute("BASE_ASSETS_PATH",
                WebConstConfig.getBase_Assets_Path());
        model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                WebConstConfig.getBase_Template_Default_Path());
        
        try {
            FreeMarkerUtil.printWriterFile("barn.ftl", "templates", model,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
    * @名称: tfMode 
    * @日期：2015-9-11 下午3:15:39
    * @作者： lxb
    * @描述: 通风模式参数设置
    * @参数 @param request
    * @参数 @param response
    * @参数 @param model    
    * @返回值 void    
    * @异常
     */
    @RequestMapping({ "/xtsz/tfMode.action" })
    public ModelAndView tfMode(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        
        VentModeBean temBean = getVentBeanByType("tem");
        model.addAttribute("temBean", temBean);
        
        VentModeBean wetBean = getVentBeanByType("wet");
        model.addAttribute("wetBean", wetBean);
        
        VentModeBean dewBean = getVentBeanByType("dew");
        model.addAttribute("dewBean", dewBean);
        
        VentModeBean headingBean = getVentBeanByType("heading");
        model.addAttribute("headingBean", headingBean);
        
        VentModeBean temperingBean = getVentBeanByType("tempering");
        model.addAttribute("temperingBean", temperingBean);
        
        List<GrainTypeBean> grainList = ServiceManager.getGrainTypeServiceImpl().findAll();
        model.addAttribute("grainList",grainList);
        model.addAttribute("selectBooleanArr",new ArrayList<String>(){{
            add("是");
            add("否");
        }});
        model.addAttribute("CURENT_TAB", "XTSZ");
        model.addAttribute("CURENT_TAB_2", "ZNTF");
        model.addAttribute("CURENT_TAB_3", "TFCS");
        model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
        model.addAttribute("BASE_ASSETS_PATH",
                WebConstConfig.getBase_Assets_Path());
        model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                WebConstConfig.getBase_Template_Default_Path());
        return new ModelAndView(PageConst.XTSZ_tfModel,model);
    }
    
    private VentModeBean getVentBeanByType(String type){
        VentModeBean bean = ServiceManager.getVentModeServiceImpl().getVentModeByType(type);
        if(null==bean){
            bean = new VentModeBean();
            bean.setVentType(type);
            bean.setGlobalPar("0");
            ServiceManager.getVentModeServiceImpl().save(bean);
        }
        return bean;
    }
    /**
    * @名称: saveTfMode 
    * @日期：2015-9-11 下午5:45:57
    * @作者： lxb
    * @描述: 保存通风模型
    * @参数 @param request
    * @参数 @param response
    * @参数 @param model    
    * @返回值 void    
    * @异常
     */
    @RequestMapping({ "/xtsz/saveTfMode.action" })
    public void saveTfMode(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        
        String id = RequestUtil.getRequestParameter(request, "beanId");
        if(StringUtils.isEmpty(id)){
            System.out.println("ventModeid error");
        }
        VentModeBean bean = ServiceManager.getVentModeServiceImpl().getById(id);
        String waterRetention = RequestUtil.getRequestParameter(request, "waterRetention");
        if(!StringUtils.isEmpty(waterRetention)){
            bean.setWaterRetention(waterRetention);
        }
        String waterRetentionFactor = RequestUtil.getRequestParameter(request, "waterRetentionFactor");
        if(!StringUtils.isEmpty("waterRetentionFactor")){
            bean.setWaterRetentionFactor(waterRetentionFactor);
        }
        String targetTem = RequestUtil.getRequestParameter(request, "targetTem");
        if(!StringUtils.isEmpty(targetTem)){
            bean.setTargetTem(Double.parseDouble(targetTem));
        }
        String temDiffer = RequestUtil.getRequestParameter(request, "temDiffer");
        if(!StringUtils.isEmpty(temDiffer)){
            bean.setTemDiffer(Double.parseDouble(temDiffer));
        }
        String airInOutTemDiffer = RequestUtil.getRequestParameter(request, "airInOutTemDiffer");
        if(!StringUtils.isEmpty(airInOutTemDiffer)){
            bean.setAirInOutTemDiffer(Double.parseDouble(airInOutTemDiffer));
        }
        String airInOutWetDiffer = RequestUtil.getRequestParameter(request, "airInOutWetDiffer");
        if(!StringUtils.isEmpty(airInOutTemDiffer)){
            bean.setAirInOutWetDiffer(Double.parseDouble(airInOutWetDiffer));
        }
        String airRelativeHum = RequestUtil.getRequestParameter(request, "airRelativeHum");
        if(!StringUtils.isEmpty("airRelativeHum")){
            bean.setAirRelativeHum(Double.parseDouble(airRelativeHum));
        }
        String windSpeed = RequestUtil.getRequestParameter(request, "windSpeed");
        if(!StringUtils.isEmpty(windSpeed)){
            bean.setWindSpeed(Double.parseDouble(windSpeed));
        }
        String startVentDistinguish = RequestUtil.getRequestParameter(request, "startVentDistinguish");
        if(!StringUtils.isEmpty(startVentDistinguish)){
            bean.setStartVentDistinguish(startVentDistinguish);
        }
        String autoMode = RequestUtil.getRequestParameter(request, "autoMode");
        if(!StringUtils.isEmpty(autoMode)){
            bean.setAutoMode(autoMode);
        }
        try {
            ServiceManager.getVentModeServiceImpl().update(bean);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
    * @名称: updateGrainInfo 
    * @日期：2015-9-11 下午6:34:31
    * @作者： lxb
    * @描述: 保存粮食信息
    * @参数 @param request
    * @参数 @param response
    * @参数 @param model    
    * @返回值 void    
    * @异常
     */
    @RequestMapping({ "/xtsz/updateGrainInfo.action" })
    public void updateGrainInfo(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        String operateType = RequestUtil.getRequestParameter(request, "operateType");
        String tfType = RequestUtil.getRequestParameter(request, "tfType");
        String beanId = RequestUtil.getRequestParameter(request, "beanId");
        GrainTypeBean bean = ServiceManager.getGrainTypeServiceImpl().getById(beanId);
        if(operateType.equals("reset")){
            if(tfType.equals("wet")){
                bean.setSafeWet(bean.getDefaultSafeWet());
            }
            else{
                bean.setTargetWet(bean.getDefaultTargetWet());
            }
        }
        else{
            String value = RequestUtil.getRequestParameter(request, "wetValue");
            if(tfType.equals("wet")){
                if(!StringUtils.isEmpty(value)){
                    Double dvalue = Double.parseDouble(value)/100;
                    bean.setSafeWet(dvalue);
                }
            }
            else{
                if(!StringUtils.isEmpty(value)){
                    Double dvalue = Double.parseDouble(value)/100;
                    bean.setTargetWet(dvalue);
                }
            }
        }
        try {
            ServiceManager.getGrainTypeServiceImpl().update(bean);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
    * @名称: isRepeat 
    * @日期：2015-9-14 下午4:33:14
    * @作者： lxb
    * @描述: 判断厫间号是否重复
    * @参数 @param request
    * @参数 @param response
    * @参数 @param model
    * @参数 @return    
    * @返回值 Map    
    * @异常
     */
    @RequestMapping(value = "/xtsz/isRepeatAoJianIndex.action", method = RequestMethod.POST)
    @ResponseBody
    public Map isRepeat(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        Map<String, Object> map = new HashMap<String, Object>();
        String aoJianIndex = RequestUtil.getRequestParameter(request, "aoJianIndex");
        try {
//			ServiceManager.getAoJianServiceImpl().fi
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
        }
        map.put("success", true);
        return map;
    }
    /**
    * @名称: isRepeatBarnIndex 
    * @日期：2015-9-14 下午4:36:48
    * @作者： lxb
    * @描述: 判断仓房编号是否重复
    * @参数 @param request
    * @参数 @param response
    * @参数 @param model
    * @参数 @return    
    * @返回值 Map    
    * @异常
     */
    @RequestMapping(value="/xtsz/isRepeatBarnIndex.action", method=RequestMethod.POST)
    @ResponseBody
    public Map isRepeatBarnIndex(HttpServletRequest request,HttpServletResponse response,ModelMap model){
        Map<String, Object> map = new HashMap<String, Object>();
        String barnIndex = RequestUtil.getRequestParameter(request, "barnIndex");
        String barnId = RequestUtil.getRequestParameter(request, "barnId");
        try {
            List<BarnBean> list = ServiceManager.getBarnServiceImpl().findListByBarnIndex(barnIndex);
            //移除自己
            if(!StringUtils.isEmpty(barnId)){
                Iterator<BarnBean> it = list.iterator();
                while (it.hasNext()) {
                    BarnBean cur = (BarnBean) it.next();
                    if(cur.getId().equals(barnId)){
                        it.remove();
                    }
                }
            }
            if(list.size()>0){
                map.put("isExist", true);
            }
            else{
                map.put("isExist", false);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }
    
    @RequestMapping(value="/xtsz/refleshSensorArrangement.action", method=RequestMethod.POST)
    public void refleshSensorArrangement(HttpServletRequest request,HttpServletResponse response,ModelMap model){
        List<SensorArrangementBean> items1 = ServiceManager.getSensorArrangementServiceImpl().getArrangementListByType("1");
        RoleBean role = (RoleBean)request.getSession().getAttribute("role");
        
        model.addAttribute("items", items1);
        model.addAttribute("role", role);
        model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
        model.addAttribute("BASE_ASSETS_PATH",
                WebConstConfig.getBase_Assets_Path());
        model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                WebConstConfig.getBase_Template_Default_Path());
        try {
            FreeMarkerUtil.printWriterFile("jcsbbzTem.ftl", "templates", model,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
     * @名称: exportGrainInfo
     * @日期：2015-9-17 上午9:39:29
     * @作者： lxb
     * @描述: 出仓操作--------厫间最近一次粮食信息 清理 粮食信息状态置为0
     * @参数 @param request
     * @参数 @param response
     * @参数 @param model
     * @参数 @return
     * @返回值 ModelAndView
     * @异常
     */
    @RequestMapping({ "/xtsz/exportGrainInfo.action" })
    public void exportGrainInfo(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        String aoJianId = RequestUtil.getRequestParameter(request, "aoJianId");
        String outTimeStr = RequestUtil.getRequestParameter(request, "outTime");
        if(StringUtils.isEmpty(aoJianId)){
            System.out.println("error by aoJianId");
        }
        AoJianBean aoJianBean = ServiceManager.getAoJianServiceImpl().getById(aoJianId);
        model.addAttribute("aoJian", aoJianBean);
        AoJianGrainInfoBean grainBean = aoJianBean.getAoJianGrainInfoBean();
        if(!StringUtils.isEmpty(outTimeStr)){
            try {
                Date outDate = CalendarUtil.formatDate(outTimeStr, CalendarUtil.DATE_FORMAT_MODE1);
                grainBean.setOutTime(outDate);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        grainBean.setCurGrainInfo("0");
        try {
            ServiceManager.getAoJianGrainInfoServiceImpl().update(grainBean);
        } catch (Exception e) {
            e.printStackTrace();
        }
        aoJianBean.setAoJianGrainInfoBean(null);
        aoJianBean.setGrainStatus("0");
        try {
            ServiceManager.getAoJianServiceImpl().update(aoJianBean);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    private AoJianBean getAoJianFromSession(HttpServletRequest request) {
        AoJianBean aoJianBean = (AoJianBean) request.getSession().getAttribute(
                "aoJian");
        if (null == aoJianBean) {
            System.out.println("no select aoJian info");
            return null;
        } else {
            return aoJianBean;
        }
    }
    /*
    * @名称: importGrainInfo
     * @日期：2015-9-17 上午9:41:23
     * @作者： lxb
     * @描述: 入仓操作-----新建一个厫间粮食信息--状态为0 页面得说明 必须录入粮食信息
     * @参数 @param request
     * @参数 @param response
     * @参数 @param model
     * @返回值 void
     * @异常
     */
    @RequestMapping({ "/xtsz/importGrainInfo.action" })
    public void importGrainInfo(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        
        String aoJianId = RequestUtil.getRequestParameter(request, "aoJianId");
        if(StringUtils.isEmpty(aoJianId)){
            System.out.println("error by aoJianId");
        }
        AoJianBean aoJianBean = ServiceManager.getAoJianServiceImpl().getById(aoJianId);
        model.addAttribute("aoJian", aoJianBean);
        AoJianGrainInfoBean aoJianGrainBean = new AoJianGrainInfoBean();
        aoJianGrainBean.setCurGrainInfo("1");
        aoJianGrainBean.setZyAoJianNum(aoJianBean.getZyAoJianNum());
        try {
            ServiceManager.getAoJianGrainInfoServiceImpl()
                    .save(aoJianGrainBean);
        } catch (Exception e) {
            e.printStackTrace();
        }
        aoJianBean.setAoJianGrainInfoBean(aoJianGrainBean);
        aoJianBean.setGrainStatus("1");
        try {
            ServiceManager.getAoJianServiceImpl().update(aoJianBean);
            //returnGrainInfoTem(response,model);
            response.getWriter().write(aoJianGrainBean.getZyAoJianNum());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
    * @名称: singleAoJianModel 
    * @日期：2015-9-26 下午3:20:20
    * @作者： lxb
    * @描述: 单个厫间入库编辑操作
    * @参数 @param request
    * @参数 @param response
    * @参数 @param model
    * @参数 @return    
    * @返回值 ModelAndView    
    * @异常
     */
    @RequestMapping({ "/xtsz/singleAoJianModel.action" })
    public ModelAndView singleAoJianModel(HttpServletRequest request,HttpServletResponse response, ModelMap model) {
        String aoJianId = RequestUtil.getRequestParameter(request, "aoJianId");
        if(StringUtils.isEmpty(aoJianId)){
            System.out.println("error by aoJianId");
        }
		List<User> lqUserList = ServiceManager.getUserService().getListByRoleId("3");
		model.addAttribute("lqUserList", lqUserList);
        AoJianBean aoJianBean = ServiceManager.getAoJianServiceImpl().getById(aoJianId);
        if("0".equals(aoJianBean.getGrainStatus())){
        	AoJianGrainInfoBean aoJianGrainInfoBean = new AoJianGrainInfoBean();
        	aoJianBean.setAoJianGrainInfoBean(aoJianGrainInfoBean);
        }
        BarnBean barn = ServiceManager.getBarnServiceImpl().getById(aoJianBean.getBarnId());
        List<GrainTypeBean> grainList = ServiceManager
                .getGrainTypeServiceImpl().findAll();
        model.addAttribute("grainList", grainList);
        model.addAttribute("aoJianBean", aoJianBean);
        model.addAttribute("barn", barn);
		String fangxiang = null;
		if (barn.getAngle() > -45 && barn.getAngle() < 45) {// 仓房布置方向
			fangxiang = "NorthSouth";
		} else {
			fangxiang = "EastWest";
		}
		 model.addAttribute("fangxiang", fangxiang);
        model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
        List<SensorArrangementBean> sensorArrangementBeanList = ServiceManager
                .getSensorArrangementServiceImpl().getArrangementListByType("1");
        model.addAttribute("sensorArrangementBeanList",
                sensorArrangementBeanList);
        model.addAttribute("BASE_ASSETS_PATH",
                WebConstConfig.getBase_Assets_Path());
        model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                WebConstConfig.getBase_Template_Default_Path());
        
        return new ModelAndView(PageConst.XTSZ_editSingleAoJianModal, model);
    }
    
    /**
    * @名称: exportDateSelectModel 
    * @日期：2015-9-26 下午5:40:20
    * @作者： lxb
    * @描述: 出仓日期选择模态框
    * @参数 @param request
    * @参数 @param response
    * @参数 @param model
    * @参数 @return    
    * @返回值 ModelAndView    
    * @异常
     */
    @RequestMapping({ "/xtsz/exportDateSelectModel.action" })
    public ModelAndView exportDateSelectModel(HttpServletRequest request,HttpServletResponse response, ModelMap model) {
        String aoJianId = RequestUtil.getRequestParameter(request, "aoJianId");
        if(StringUtils.isEmpty(aoJianId)){
            System.out.println("error by aoJianId");
        }
        AoJianBean aoJianBean = ServiceManager.getAoJianServiceImpl().getById(aoJianId);
        model.addAttribute("aoJianBean", aoJianBean);
        model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
        model.addAttribute("BASE_ASSETS_PATH",
                WebConstConfig.getBase_Assets_Path());
        model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                WebConstConfig.getBase_Template_Default_Path());
        
        return new ModelAndView(PageConst.XTSZ_exportSelectDate, model);
    }
    /**
    * @名称: confirmDeleteModel 
    * @日期：2015-10-13 上午10:23:32
    * @作者： lxb
    * @描述: 确认删除输入密码模态框  需要输入url中带删除的id
    * @参数 @param request
    * @参数 @param response
    * @参数 @param model
    * @参数 @return    
    * @返回值 ModelAndView    
    * @异常
     */
    @RequestMapping({ "/xtsz/confirmDeleteModel.action" })
    public ModelAndView confirmDeleteModel(HttpServletRequest request,HttpServletResponse response, ModelMap model) {
        
    	String deleteUrl = RequestUtil.getRequestParameter(request, "deleteUrl");
        model.addAttribute("deleteUrl", deleteUrl);
        model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
        model.addAttribute("BASE_ASSETS_PATH",
                WebConstConfig.getBase_Assets_Path());
        model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                WebConstConfig.getBase_Template_Default_Path());
        
        return new ModelAndView(PageConst.confirmDeleteModel, model);
    }
    
    @RequestMapping({ "/xtsz/confirmOperateModel.action" })
    public ModelAndView confirmOperateModel(HttpServletRequest request,HttpServletResponse response, ModelMap model) {
        
    	String deleteUrl = RequestUtil.getRequestParameter(request, "deleteUrl");
        model.addAttribute("deleteUrl", deleteUrl);
        model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
        model.addAttribute("BASE_ASSETS_PATH",
                WebConstConfig.getBase_Assets_Path());
        model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                WebConstConfig.getBase_Template_Default_Path());
        
        return new ModelAndView(PageConst.confirmOperateModel, model);
    }
    /**
    * @名称: timerAoJianSelectedModal 
    * @日期：2015-10-13 下午7:29:23
    * @作者： lxb
    * @描述: 定时器选择廒间模态窗口
    * @参数 @param request
    * @参数 @param response
    * @参数 @param model
    * @参数 @return    
    * @返回值 ModelAndView    
    * @异常
     */
    @RequestMapping({ "/xtsz/timerAoJianSelectedModal.action" })
    public ModelAndView timerAoJianSelectedModal(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
            String timerId = RequestUtil.getRequestParameter(
                    request, "taskId");
            TimerTaskBean bean = ServiceManager.getTimerServiceImpl().getById(timerId);
            
            List<TimerTaskBean> timerList = ServiceManager.getTimerServiceImpl()
                    .findAll();
            String ids = "";
            for (int i = 0; i < timerList.size(); i++) {
            	TimerTaskBean task = timerList.get(i);
            	ids = ids +"#"+task.getAoJianIds();
			}
            List<BarnBean> barnList = ServiceManager.getBarnServiceImpl()
                    .findAll();
            model.addAttribute("barnList", barnList);
            model.addAttribute("ids", ids);
            model.addAttribute("bean", bean);
            model.addAttribute("type", "timerPage");
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            return new ModelAndView(PageConst.XTSZ_aoJianSelectedModal1, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;
        }
    }
    
    @RequestMapping({ "/xtsz/updateTimerAoJianInfo.action" })
    public void updateTimerAoJianInfo(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
    	
        String timerId = RequestUtil.getRequestParameter(
                request, "taskId");
        String timerIds = RequestUtil.getRequestParameter(
                request, "ids");
        TimerTaskBean bean = ServiceManager.getTimerServiceImpl().getById(timerId);
        bean.setAoJianIds(timerIds);
        try {
			ServiceManager.getTimerServiceImpl().update(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
    /**
    * @名称: updateStoreType 
    * @日期：2015-10-14 下午2:49:22
    * @作者： lxb
    * @描述: 更新aoJian粮食存储状态
    * @参数 @param request
    * @参数 @param response
    * @参数 @param model
    * @参数 @return    
    * @返回值 Map    
    * @异常
     */
    @RequestMapping(value = "/xtsz/updateStoreType.action")
    @ResponseBody
    public Map updateStoreType(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        Map<String, Boolean> map = new HashMap<String, Boolean>();
        try {
            String aoJianIdStr = RequestUtil.getRequestParameter(request,
                    "beanId");
            String aoJianId = aoJianIdStr.split("@")[0];
            String storeType = aoJianIdStr.split("@")[1];;
            if(storeType.equals("1")){
            	storeType = "常温";
            }else if(storeType.equals("2")){
            	storeType = "低温";
            }else{
            	storeType = "准低温";
            }
            AoJianBean aoJianBean = ServiceManager.getAoJianServiceImpl()
                    .getById(aoJianId);
            if (aoJianBean == null) {
                System.out.println("aoJianBean Error");
            }
            if(!StringUtils.isEmpty(storeType)){
            	aoJianBean.getAoJianGrainInfoBean().setStoreType(storeType);
            }
            try {
				ServiceManager.getAoJianGrainInfoServiceImpl().update(aoJianBean.getAoJianGrainInfoBean());
			} catch (Exception e) {
				e.printStackTrace();
			}
            map.put("success",true);
        } catch (Exception e) {
			e.printStackTrace();
		}
        return map;
    }
    
    @RequestMapping({ "/xtsz/tfsbAoJianSelectedModal.action" })
    public ModelAndView tfsbAoJianSelectedModal(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
        	String aoJianId = RequestUtil.getRequestParameter(request, "aoJianId");
        	AoJianBean aoJian = ServiceManager.getAoJianServiceImpl().getById(aoJianId);
            List<BarnBean> barnList = ServiceManager.getBarnServiceImpl()
                    .findAll();
            model.addAttribute("barnList", barnList);
            model.addAttribute("bean", aoJian);
            model.addAttribute("type", "tfsbAoJianSelect");
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            return new ModelAndView(PageConst.XTSZ_aoJianSelectedModal1, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;
        }
    }
}
