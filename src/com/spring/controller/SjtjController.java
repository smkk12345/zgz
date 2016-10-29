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

import com.common.consts.Contanst;
import com.common.consts.PageConst;
import com.common.consts.WebConstConfig;
import com.common.utils.StringUtils;
import com.hibernate.houseinfo.domain.Agreement;
import com.hibernate.houseinfo.domain.HouseBasic;
import com.hibernate.userInfo.damain.RoleBean;
import com.spring.ServiceManager;

@Controller
public class SjtjController {

	
	@RequestMapping({"/sjtj.action"})
	public ModelAndView sjtj(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			
			int intPageSize = Contanst.PAGE_SIZE;
			String pageNo = request.getParameter("pageNo");
			if(StringUtils.isEmpty(pageNo)){
				pageNo = "1";
			}
			
			int intPageNum = Integer.parseInt(pageNo);
			RoleBean role = (RoleBean)request.getSession().getAttribute("role");
			List<HouseBasic> list = ServiceManager.getHouseBasicServce().getListBySection(request,model,role.getSection(),(intPageNum-1)*intPageSize,intPageSize);
			Integer count = ServiceManager.getHouseBasicServce().getCount(role.getSection());
			
			model.addAttribute("pageSize", intPageSize);
			model.addAttribute("pageNo", intPageNum);
			model.addAttribute("recordCount", count);
			
			model.addAttribute("list", list);
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "SJTJ");
			model.addAttribute("CURENT_TAB_2", "sjtj");
			model.addAttribute("CURENT_TAB_3", "sjtj");

			return new ModelAndView(PageConst.SJTJ, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}
	
	
}
