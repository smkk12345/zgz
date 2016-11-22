package com.spring.controller;

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
@RequestMapping({"/cwjs"})
public class CwjsController {

	/**
	 * 未交房
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping({"/cwjs.action"})
	public ModelAndView cwjs(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			int intPageSize = Contanst.PAGE_SIZE;
			String pageNo = request.getParameter("pageNo");
			if(StringUtils.isEmpty(pageNo)){
				pageNo = "1";
			}
			
			int intPageNum = Integer.parseInt(pageNo);
			RoleBean role = (RoleBean)request.getSession().getAttribute("role");
			String sql = getFhfaSxhSql(role.getSection(),request,model);
			
			List<DisplayBean> list = ServiceManager.getHouseBasicServce().getDisplayBeanList(sql, "", (intPageNum - 1) * intPageSize, intPageSize);
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

			model.addAttribute("CURENT_TAB", "CWJS");
			model.addAttribute("CURENT_TAB_2", "CWJS_01");
			model.addAttribute("CURENT_TAB_3", "CWJS_01");

			return new ModelAndView(PageConst.CWJS_01, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}
	
	
	private String getFhfaSxhSql(String section,HttpServletRequest request,ModelMap model) {
		// TODO Auto-generated method stub
		StringBuffer sb = new StringBuffer();
		sb.append(" and a.section in (").append(section).append(")");
		String names = request.getParameter("names");
		String  mobile = request.getParameter("mobile");
		String idcard = request.getParameter("idcard");
		String indexnum = request.getParameter("indexnum");
		String atype = request.getParameter("atype");
		String location = request.getParameter("location");
		atype = StringUtils.isBlank(atype)?"-1":atype;
		if(!StringUtils.isBlank(names)){
			sb.append(" and a.names like '%").append(names).append("%'");
			model.addAttribute("names", names);
		}
		if(!StringUtils.isBlank(location)){
			sb.append(" and a.location like '%").append(location).append("%'");
			model.addAttribute("location", location);
		}
		if(!StringUtils.isBlank(mobile)){
			sb.append(" and a.mobile ='").append(mobile).append("'");
			model.addAttribute("mobile", mobile);
		}
		if(!StringUtils.isBlank(idcard)){
			sb.append(" and a.idcard ='").append(idcard).append("'");
			model.addAttribute("idcard", idcard);
		}
		if(!StringUtils.isBlank(indexnum)){
			sb.append(" and c.indexnum =").append(indexnum);
			model.addAttribute("indexnum", indexnum);
		}
		if(!atype.equals("-1")){
			sb.append(" AND b.atype ='").append(atype).append("'");
		}
		model.addAttribute("atype", atype);
		return sb.toString();
	}
	

	@RequestMapping({"/cwjs_01_print_model.action"})
	public ModelAndView cwjs_01_print_model(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			
			String housebasicid = request.getParameter("housebasicid");
			DisplayBean bean = ServiceManager.getHouseBasicServce().getDisplayBean(housebasicid);
			model.addAttribute("bean", bean);
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "CWJS");
			model.addAttribute("CURENT_TAB_2", "CWJS_01");
			model.addAttribute("CURENT_TAB_3", "CWJS_01");

			return new ModelAndView(PageConst.CWJS_01_PRINT_MODEL, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}
	
}
