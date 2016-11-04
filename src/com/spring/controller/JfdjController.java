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
 * 交房
 * @author yulei
 */
@Controller
public class JfdjController {

	/**
	 * 未交房
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping({"/jfdj_0.action"})
	public ModelAndView jfdj_0(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			
			int intPageSize = Contanst.PAGE_SIZE;
			String pageNo = request.getParameter("pageNo");
			if(StringUtils.isEmpty(pageNo)){
				pageNo = "1";
			}
			
			int intPageNum = Integer.parseInt(pageNo);
			RoleBean role = (RoleBean)request.getSession().getAttribute("role");
			String sql = getJfdjSql(role.getSection(),request,"'0' or hasothers is null ",model);
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

			model.addAttribute("CURENT_TAB", "JFDJ");
			model.addAttribute("CURENT_TAB_2", "jfdj");
			model.addAttribute("CURENT_TAB_3", "jfdj_0");

			return new ModelAndView(PageConst.JFDJ_DJ_0, model);
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
	@RequestMapping({"/jfdj_1.action"})
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

			model.addAttribute("CURENT_TAB", "JFDJ");
			model.addAttribute("CURENT_TAB_2", "jfdj");
			model.addAttribute("CURENT_TAB_3", "jfdj_1");

			return new ModelAndView(PageConst.JFDJ_DJ_1, model);
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
		sb.append(" and (a.hasothers = ").append(type).append(")");
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

	@RequestMapping({"/confirmOthers.action"})
	public Map<String,String> confirmOthers(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		Map<String,String> map = new HashMap<String, String>();
		try {
			String housebasicid = request.getParameter("housebasicid");
			ServiceManager.getHouseBasicServce().confirmOthers(housebasicid);
			map.put("success", "true");
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			map.put("success", "false");
			return map;
		}
	}
	
}
