package com.spring.controller;

import java.util.ArrayList;
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
import org.springframework.web.util.WebUtils;

import com.common.consts.ErrorCodeConst;
import com.common.consts.PageConst;
import com.common.consts.WebConstConfig;
import com.common.utils.CalendarUtil;
import com.common.utils.MathUtil;
import com.common.utils.RequestUtil;
import com.common.utils.StringUtils;

import com.hibernate.barnInfo.domain.AoJianBean;
import com.hibernate.barnInfo.domain.BarnBean;
import com.hibernate.baseSettingInfo.domain.BaseSettingBean;
import com.hibernate.sernsorInfo.domain.AoJianDataBean;
import com.hibernate.sernsorInfo.domain.SensorArrangementBean;
import com.hibernate.sernsorInfo.domain.SensorDataBean;
import com.hibernate.ventilate.domain.BaseDevice;
import com.spring.ServiceManager;
import com.ventilate.factory.VentilateManager;
import com.ventilate.factory.iVentilate.Ventilate;

@Controller
public class ZntfController {
	/**
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping({ "/zntf/tfms.action"})
	public ModelAndView indexPage(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		try {
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "ZNTF");
			model.addAttribute("CURENT_TAB_2", "TFMS");
			model.addAttribute("CURENT_TAB_3", "");

			return new ModelAndView(PageConst.ZNTF_TFMS, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}

	@RequestMapping({ "/zntf/zntf.action"})
	public ModelAndView zntf(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		try {
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());
			AoJianBean aoJian = (AoJianBean)request.getSession().getAttribute("aoJian");
			model = getVentDeviceListByAoJianId(aoJian.getZyAoJianNum(),model);
			Map<String,Ventilate> ventMap =  VentilateManager.getVentilatesByAoJianId(aoJian.getZyAoJianNum());
			Ventilate v = ventMap.get(WebConstConfig.jwtf);
			model.addAttribute("ventBean", v);
			model.addAttribute("CURENT_TAB", "ZNTF");
			model.addAttribute("CURENT_TAB_2", "ZNTF");
			model.addAttribute("CURENT_TAB_3", "ZNTF");
			
			return new ModelAndView(PageConst.ZNTF_ZNTF, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}
	
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
	        model.addAttribute("bean",aoJian);
	        model.addAttribute("baseDevices", deviceList);
	        
	        model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
	        model.addAttribute("BASE_ASSETS_PATH",
	                WebConstConfig.getBase_Assets_Path());
	        model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
	                WebConstConfig.getBase_Template_Default_Path());
	        return model;
	    }
	
	@RequestMapping({ "/zntf/tfjcbgsj.action"})
	public ModelAndView tfjcbgsj(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		try {
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "ZNTF");
			model.addAttribute("CURENT_TAB_2", "TFJC");
			model.addAttribute("CURENT_TAB_3", "BGSJ");
			
			return new ModelAndView(PageConst.ZNTF_TFJCBGSJ, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}
	
	@RequestMapping({ "/zntf/tfjcytzs.action"})
	public ModelAndView tfjcytzs(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		try {
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "ZNTF");
			model.addAttribute("CURENT_TAB_2", "TFJC");
			model.addAttribute("CURENT_TAB_3", "YTZS");

			return new ModelAndView(PageConst.ZNTF_TFJCYTZS, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}
	
	@RequestMapping({ "/zntf/sdkz.action"})
	public ModelAndView sdkz(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		try {
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "ZNTF");
			model.addAttribute("CURENT_TAB_2", "SDKZ");
			model.addAttribute("CURENT_TAB_3", "");

			return new ModelAndView(PageConst.ZNTF_SDKZ, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}
}
