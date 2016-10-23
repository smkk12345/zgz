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

	
	@RequestMapping({"/agreenment.action"})
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

			model.addAttribute("CURENT_TAB", "PGQQ");
			model.addAttribute("CURENT_TAB_2", "rhjc");
			model.addAttribute("CURENT_TAB_3", "rhjc");

			return new ModelAndView(PageConst.PGQQ_rhjc, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}
	
	@RequestMapping({ "/agreenment/agreenment_add_Modal.action" })
	public ModelAndView lqModal(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {

			// 模板路径 basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());
			return new ModelAndView(PageConst.PGQQ_rhjc_add_Modal, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;

		}
	}
	
	
	@RequestMapping({ "/agreenment/saveAgreenment.action" })
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
