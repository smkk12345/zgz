package com.spring.controller;

import java.util.Date;
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
import com.hibernate.timers.utils.DateUtil;
import com.hibernate.userInfo.damain.RoleBean;
import com.spring.ServiceManager;

/**
 * 数据台账统计
 * @author yulei
 */
@Controller
public class SjfxController {

	/**
	 * 各标段签约情况
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping({"/sjfx/gbdqytj.action"})
	public ModelAndView gbdqytj(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			

			model.addAttribute("list", null);
			model.addAttribute("sectionMap", Contanst.sectionMap);
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "SJFX");
			model.addAttribute("CURENT_TAB_2", "gbdqytj");
			model.addAttribute("CURENT_TAB_3", "gbdqytj");

			return new ModelAndView(PageConst.SJFX_gbdqytj, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}

	/**
	 * 已交房
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping({"/sjfx/gbdjftj.action"})
	public ModelAndView jfdj_1(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			
			int intPageSize = Contanst.PAGE_SIZE;
			String pageNo = request.getParameter("pageNo");
			if(StringUtils.isEmpty(pageNo)){
				pageNo = "1";
			}
			
			int intPageNum = Integer.parseInt(pageNo);
			RoleBean role = (RoleBean)request.getSession().getAttribute("role");
			String sql = getJfdjSql(role.getSection(),request,"1",model);
			List<DisplayBean> list = ServiceManager.getHouseBasicServce()
					.getDisplayBeanList(sql,"", (intPageNum - 1) * intPageSize, intPageSize);
			
			Integer count = ServiceManager.getHouseBasicServce().getDisPlayCount(sql);
			
			model.addAttribute("pageSize", intPageSize);
			model.addAttribute("pageNo", intPageNum);
			model.addAttribute("recordCount", count);
			
			model.addAttribute("list", list);
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "SJFX");
			model.addAttribute("CURENT_TAB_2", "gbdjftj");
			model.addAttribute("CURENT_TAB_3", "gbdjftj");

			return new ModelAndView(PageConst.SJFX_gbdjftj, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}
	
	private String getJfdjSql(String section,HttpServletRequest request,String type,ModelMap model) {
		// TODO Auto-generated method stub
		StringBuffer sb = new StringBuffer();
		sb.append(" and a.section in ("+section+")");
		String names = request.getParameter("names");
		String mobile = request.getParameter("mobile");
		String idcard = request.getParameter("idcard");
		if(!StringUtils.isBlank(names)){
			sb.append(" and a.names like '%").append(names).append("%'");
			model.addAttribute("names", names);
		}
		if(!StringUtils.isBlank(mobile)){
			sb.append(" and a.mobile ='").append(mobile).append("'");
			model.addAttribute("mobile", mobile);
		}
		if(!StringUtils.isBlank(idcard)){
			sb.append(" and a.idcard ='").append(idcard).append("'");
			model.addAttribute("idcard", idcard);
		}
		return sb.toString();
	}

	
	@RequestMapping({"/sjfx/bcxytz.action"})
	public ModelAndView bcxytz(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			
			int intPageSize = Contanst.PAGE_SIZE;
			String pageNo = request.getParameter("pageNo");
			if(StringUtils.isEmpty(pageNo)){
				pageNo = "1";
			}
			
			int intPageNum = Integer.parseInt(pageNo);
			RoleBean role = (RoleBean)request.getSession().getAttribute("role");
			String sql = getJfdjSql(role.getSection(),request,"1",model);
			List<DisplayBean> list = ServiceManager.getHouseBasicServce()
					.getDisplayBeanList(sql,"", (intPageNum - 1) * intPageSize, intPageSize);
			
			Integer count = ServiceManager.getHouseBasicServce().getDisPlayCount(sql);
			
			model.addAttribute("pageSize", intPageSize);
			model.addAttribute("pageNo", intPageNum);
			model.addAttribute("recordCount", count);
			
			model.addAttribute("list", list);
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "SJFX");
			model.addAttribute("CURENT_TAB_2", "bcxytz");
			model.addAttribute("CURENT_TAB_3", "bcxytz");

			return new ModelAndView(PageConst.SJFX_bcxytz, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}
	
	@RequestMapping({"/sjfx/qysxhtz.action"})
	public ModelAndView qysxhtz(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			
			int intPageSize = Contanst.PAGE_SIZE;
			String pageNo = request.getParameter("pageNo");
			if(StringUtils.isEmpty(pageNo)){
				pageNo = "1";
			}
			
			int intPageNum = Integer.parseInt(pageNo);
			RoleBean role = (RoleBean)request.getSession().getAttribute("role");
			String sql = getqysxhtzSql(request,"1",model);
			List<DisplayBean> list = ServiceManager.getHouseBasicServce()
					.getDisplayBeanList(sql,"", (intPageNum - 1) * intPageSize, intPageSize);
			Integer count = ServiceManager.getHouseBasicServce().getDisPlayCount(sql);
			
			model.addAttribute("pageSize", intPageSize);
			model.addAttribute("pageNo", intPageNum);
			model.addAttribute("recordCount", count);
			
			model.addAttribute("list", list);
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "SJFX");
			model.addAttribute("CURENT_TAB_2", "qysxhtz");
			model.addAttribute("CURENT_TAB_3", "qysxhtz");

			return new ModelAndView(PageConst.SJFX_qysxhtz, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}

	private String getqysxhtzSql( HttpServletRequest request,
			String string, ModelMap model) {
		// TODO Auto-generated method stub
		StringBuffer sb = new StringBuffer();
		String section = request.getParameter("section");
		
		String names = request.getParameter("names");
		String idcard = request.getParameter("idcard");
		String mobile = request.getParameter("mobile");
		if(!StringUtils.isBlank(section)){
			sb.append(" and a.section in (" + section + ")");
			model.addAttribute("section", section);
		}
		if (!StringUtils.isBlank(names)) {
			sb.append(" and a.names like '%").append(names).append("%'");
			model.addAttribute("names", names);
		}
		if (!StringUtils.isBlank(idcard)) {
			sb.append(" and a.idcard ='").append(idcard).append("'");
			model.addAttribute("idcard", idcard);
		}
		if(!StringUtils.isBlank(mobile)){
			sb.append(" and a.mobile ='").append(mobile).append("'");
			model.addAttribute("mobile", mobile);
		}
		sb.append(" and c.id is not null ");
		return sb.toString();
	}
	
}
