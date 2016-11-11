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

	
}
