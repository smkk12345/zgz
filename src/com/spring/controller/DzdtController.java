package com.spring.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.common.consts.Contanst;
import com.common.consts.PageConst;
import com.common.consts.WebConstConfig;
import com.common.utils.StringUtils;
import com.hibernate.houseinfo.domain.DisplayBean;
import com.hibernate.houseinfo.domain.HouseBasic;
import com.hibernate.userInfo.damain.RoleBean;
import com.spring.ServiceManager;

/**
 * 财务结算
 * @author yulei
 */
@Controller
public class DzdtController {

	/**
	 * 未交房
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping({"/dzdt/bd1.action"})
	public ModelAndView bd1(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			
			List<DisplayBean> list = ServiceManager.getHouseBasicServce().getDisplayBeanList(" and a.section = '1' ", "", 0, 0);
			Map<String,String> map = new HashMap<String, String>();
			for (int i = 0; i < list.size(); i++) {
				
				DisplayBean displaybean = list.get(i);
				if(StringUtils.isBlank(displaybean.getSectionindex())){
					continue;
				}
				
//				var map = '${map}';
//				alert(map);
//				$('g').each(function (index,domEle){
//					var text = $(domEle).find("text").first();
//					var value = $(text).html();
//					var nIndex = map[value];
//					if(nIndex == '0'){
//						$(text).parent().css("fill",'red');
//					}else if(nIndex == '1'){
//						$(text).parent().css("fill",'blue');
//					}else if(nIndex == '2'){
//						$(text).parent().css("fill",'0xff22aa');
//					}
//				});
				
				//0 未签约   1签协议的    2交房的  3 已拆除
				if(!StringUtils.isBlank(displaybean.getHasothers())){
					if(displaybean.getHasothers().equals("1")){
						map.put(displaybean.getSectionindex(), "2");
					}else if(!StringUtils.isBlank(displaybean.getIndexNumStr())){
						map.put(displaybean.getSectionindex(), "1");
					}else{
						map.put(displaybean.getSectionindex(), "0");
					}
				}else{
					if(!StringUtils.isBlank(displaybean.getIndexNumStr())){
						map.put(displaybean.getSectionindex(), "1");
					}else{
						map.put(displaybean.getSectionindex(), "0");
					}
				}
			}
			
			model.addAttribute("map", map);
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "DZDT");
			model.addAttribute("CURENT_TAB_2", "bd1");
			model.addAttribute("CURENT_TAB_3", "bd1");

			return new ModelAndView(PageConst.DZDT_bd1, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}

	@RequestMapping({"/dzdt/bd2.action"})
	public ModelAndView bd2(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			
			List<DisplayBean> list = ServiceManager.getHouseBasicServce().getDisplayBeanList(" and a.section = '2' ", "", 0, 0);
			List<Map<String,String>> resultList = new ArrayList<Map<String,String>>();
			for (int i = 0; i < list.size(); i++) {
				
				DisplayBean displaybean = list.get(i);
				if(StringUtils.isBlank(displaybean.getSectionindex())){
					continue;
				}
				Map<String,String> map = new HashMap<String, String>();
				resultList.add(map);
				//0 未签约   1签协议的    2交房的  3 已拆除
				if(!StringUtils.isBlank(displaybean.getHasothers())){
					if(displaybean.getHasothers().equals("1")){
						map.put(displaybean.getSectionindex(), "2");
					}else if(!StringUtils.isBlank(displaybean.getIndexNumStr())){
						map.put(displaybean.getSectionindex(), "1");
					}else{
						map.put(displaybean.getSectionindex(), "0");
					}
				}else{
					if(!StringUtils.isBlank(displaybean.getIndexNumStr())){
						map.put(displaybean.getSectionindex(), "1");
					}else{
						map.put(displaybean.getSectionindex(), "0");
					}
				}
			}
			model.addAttribute("list", resultList);
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "DZDT");
			model.addAttribute("CURENT_TAB_2", "bd2");
			model.addAttribute("CURENT_TAB_3", "bd2");

			return new ModelAndView(PageConst.DZDT_bd2, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}
	
	@RequestMapping({"/dzdt/bd3.action"})
	public ModelAndView bd3(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			
			List<DisplayBean> list = ServiceManager.getHouseBasicServce().getDisplayBeanList(" and a.section = '3' ", "", 0, 0);
			List<Map<String,String>> resultList = new ArrayList<Map<String,String>>();
			for (int i = 0; i < list.size(); i++) {
				
				DisplayBean displaybean = list.get(i);
				if(StringUtils.isBlank(displaybean.getSectionindex())){
					continue;
				}
				Map<String,String> map = new HashMap<String, String>();
				resultList.add(map);
				//0 未签约   1签协议的    2交房的  3 已拆除
				if(!StringUtils.isBlank(displaybean.getHasothers())){
					if(displaybean.getHasothers().equals("1")){
						map.put(displaybean.getSectionindex(), "2");
					}else if(!StringUtils.isBlank(displaybean.getIndexNumStr())){
						map.put(displaybean.getSectionindex(), "1");
					}else{
						map.put(displaybean.getSectionindex(), "0");
					}
				}else{
					if(!StringUtils.isBlank(displaybean.getIndexNumStr())){
						map.put(displaybean.getSectionindex(), "1");
					}else{
						map.put(displaybean.getSectionindex(), "0");
					}
				}
			}
			model.addAttribute("list", resultList);
			
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "DZDT");
			model.addAttribute("CURENT_TAB_2", "bd3");
			model.addAttribute("CURENT_TAB_3", "bd3");

			return new ModelAndView(PageConst.DZDT_bd3, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}
	
	@RequestMapping({"/dzdt/bd4.action"})
	public ModelAndView bd4(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			
			List<DisplayBean> list = ServiceManager.getHouseBasicServce().getDisplayBeanList(" and a.section = '4' ", "", 0, 0);
			List<Map<String,String>> resultList = new ArrayList<Map<String,String>>();
			for (int i = 0; i < list.size(); i++) {
				
				DisplayBean displaybean = list.get(i);
				if(StringUtils.isBlank(displaybean.getSectionindex())){
					continue;
				}
				Map<String,String> map = new HashMap<String, String>();
				resultList.add(map);
				//0 未签约   1签协议的    2交房的  3 已拆除
				if(!StringUtils.isBlank(displaybean.getHasothers())){
					if(displaybean.getHasothers().equals("1")){
						map.put(displaybean.getSectionindex(), "2");
					}else if(!StringUtils.isBlank(displaybean.getIndexNumStr())){
						map.put(displaybean.getSectionindex(), "1");
					}else{
						map.put(displaybean.getSectionindex(), "0");
					}
				}else{
					if(!StringUtils.isBlank(displaybean.getIndexNumStr())){
						map.put(displaybean.getSectionindex(), "1");
					}else{
						map.put(displaybean.getSectionindex(), "0");
					}
				}
			}
			model.addAttribute("list", resultList);
			
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "DZDT");
			model.addAttribute("CURENT_TAB_2", "bd4");
			model.addAttribute("CURENT_TAB_3", "bd4");

			return new ModelAndView(PageConst.DZDT_bd4, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}
	@RequestMapping({"/dzdt/bd5.action"})
	public ModelAndView bd5(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			
			List<DisplayBean> list = ServiceManager.getHouseBasicServce().getDisplayBeanList(" and a.section = '5' ", "", 0, 0);
			
			List<Map<String,String>> resultList = new ArrayList<Map<String,String>>();
			for (int i = 0; i < list.size(); i++) {
				
				DisplayBean displaybean = list.get(i);
				if(StringUtils.isBlank(displaybean.getSectionindex())){
					continue;
				}
				Map<String,String> map = new HashMap<String, String>();
				resultList.add(map);
				//0 未签约   1签协议的    2交房的  3 已拆除
				if(!StringUtils.isBlank(displaybean.getHasothers())){
					if(displaybean.getHasothers().equals("1")){
						map.put(displaybean.getSectionindex(), "2");
					}else if(!StringUtils.isBlank(displaybean.getIndexNumStr())){
						map.put(displaybean.getSectionindex(), "1");
					}else{
						map.put(displaybean.getSectionindex(), "0");
					}
				}else{
					if(!StringUtils.isBlank(displaybean.getIndexNumStr())){
						map.put(displaybean.getSectionindex(), "1");
					}else{
						map.put(displaybean.getSectionindex(), "0");
					}
				}
			}
			model.addAttribute("list", resultList);
			
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "DZDT");
			model.addAttribute("CURENT_TAB_2", "bd5");
			model.addAttribute("CURENT_TAB_3", "bd5");

			return new ModelAndView(PageConst.DZDT_bd5, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}
	@RequestMapping({"/dzdt/bd6.action"})
	public ModelAndView bd6(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			
			List<DisplayBean> list = ServiceManager.getHouseBasicServce().getDisplayBeanList(" and a.section = '6' ", "", 0, 0);
			
			List<Map<String,String>> resultList = new ArrayList<Map<String,String>>();
			for (int i = 0; i < list.size(); i++) {
				
				DisplayBean displaybean = list.get(i);
				if(StringUtils.isBlank(displaybean.getSectionindex())){
					continue;
				}
				Map<String,String> map = new HashMap<String, String>();
				resultList.add(map);
				//0 未签约   1签协议的    2交房的  3 已拆除
				if(!StringUtils.isBlank(displaybean.getHasothers())){
					if(displaybean.getHasothers().equals("1")){
						map.put(displaybean.getSectionindex(), "2");
					}else if(!StringUtils.isBlank(displaybean.getIndexNumStr())){
						map.put(displaybean.getSectionindex(), "1");
					}else{
						map.put(displaybean.getSectionindex(), "0");
					}
				}else{
					if(!StringUtils.isBlank(displaybean.getIndexNumStr())){
						map.put(displaybean.getSectionindex(), "1");
					}else{
						map.put(displaybean.getSectionindex(), "0");
					}
				}
			}
			model.addAttribute("list", resultList);
			
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "DZDT");
			model.addAttribute("CURENT_TAB_2", "bd6");
			model.addAttribute("CURENT_TAB_3", "bd6");

			return new ModelAndView(PageConst.DZDT_bd6, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}
	@RequestMapping({"/dzdt/bd7.action"})
	public ModelAndView bd7(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			
			List<DisplayBean> list = ServiceManager.getHouseBasicServce().getDisplayBeanList(" and a.section = '7' ", "", 0, 0);
			
			List<Map<String,String>> resultList = new ArrayList<Map<String,String>>();
			for (int i = 0; i < list.size(); i++) {
				
				DisplayBean displaybean = list.get(i);
				if(StringUtils.isBlank(displaybean.getSectionindex())){
					continue;
				}
				Map<String,String> map = new HashMap<String, String>();
				resultList.add(map);
				//0 未签约   1签协议的    2交房的  3 已拆除
				if(!StringUtils.isBlank(displaybean.getHasothers())){
					if(displaybean.getHasothers().equals("1")){
						map.put(displaybean.getSectionindex(), "2");
					}else if(!StringUtils.isBlank(displaybean.getIndexNumStr())){
						map.put(displaybean.getSectionindex(), "1");
					}else{
						map.put(displaybean.getSectionindex(), "0");
					}
				}else{
					if(!StringUtils.isBlank(displaybean.getIndexNumStr())){
						map.put(displaybean.getSectionindex(), "1");
					}else{
						map.put(displaybean.getSectionindex(), "0");
					}
				}
			}
			model.addAttribute("list", resultList);
			
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "DZDT");
			model.addAttribute("CURENT_TAB_2", "bd7");
			model.addAttribute("CURENT_TAB_3", "bd7");

			return new ModelAndView(PageConst.DZDT_bd7, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}
	
}
