package com.spring.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.common.consts.PageConst;
import com.common.consts.WebConstConfig;
import com.hibernate.houseinfo.domain.Agreement;
import com.hibernate.houseinfo.domain.HouseBasic;
import com.hibernate.userInfo.damain.RoleBean;
import com.spring.ServiceManager;

@Controller
public class AgreenmentController {

	
	@RequestMapping({"/agreenment.action","/fgxy.action"})
	public ModelAndView agreenment(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			
			RoleBean role = (RoleBean)request.getSession().getAttribute("role");
			List<HouseBasic> list = ServiceManager.getHouseBasicServce().getListBySection(role.getSection(),0,10);
			model.addAttribute("list", list);
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "AGREENMENT");
			model.addAttribute("CURENT_TAB_2", "fgxy");
			model.addAttribute("CURENT_TAB_3", "fgxy");

			return new ModelAndView(PageConst.PGQQ_fgxy, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}

	@RequestMapping({"/bcxy.action"})
	public ModelAndView bcxy(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			
			RoleBean role = (RoleBean)request.getSession().getAttribute("role");
			List<HouseBasic> list = ServiceManager.getHouseBasicServce().getListBySection(role.getSection(),0,10);
			model.addAttribute("list", list);
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "AGREENMENT");
			model.addAttribute("CURENT_TAB_2", "bcxy");
			model.addAttribute("CURENT_TAB_3", "bcxy");

			return new ModelAndView(PageConst.PGQQ_bcxy, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}
	
	@RequestMapping({ "/bcxy_add_Modal.action" })
	public ModelAndView lqModal(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			
			String housebasicid = request.getParameter("housebasicid");
			RoleBean role = (RoleBean)request.getSession().getAttribute("role");
			HouseBasic housebasic = ServiceManager.getHouseBasicServce().getHouseBasicById(housebasicid, role.getSection());
			model.addAttribute("housebasic", housebasic);
			// 模板路径 basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());
			return new ModelAndView(PageConst.PGQQ_bcxy_add_Modal, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;

		}
	}
	
	
	@RequestMapping({ "/saveAgreenment.action" })
	public ModelAndView savehousebasic(HttpServletRequest request,
			HttpServletResponse response, ModelMap model,Agreement agreenment,String housebasicid) {
		try {
			HttpSession s = request.getSession();
			RoleBean role = (RoleBean)s.getAttribute("role");
			//获取标段信息
			agreenment.setCreateTime(new Date());
			agreenment.setUpdateTime(new Date());
			
			ServiceManager.getAgreenmentService().save(agreenment);
			
			return new ModelAndView(PageConst.PGQQ_rhjc, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}
	
}
