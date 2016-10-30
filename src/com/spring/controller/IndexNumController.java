package com.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

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
import com.hibernate.houseinfo.domain.IndexNum;
import com.hibernate.userInfo.damain.RoleBean;
import com.hibernate.userInfo.damain.User;
import com.spring.ServiceManager;

@Controller
public class IndexNumController {
	/**
	 * @param request
	 * @param response
	 * @param model   
	 * @return
	 */
	@RequestMapping({ "/indexnum/get.action" })
	public void indexPage(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		try {
			String housebsicid = request.getParameter("housebasicid");
			String agreenmentid = request.getParameter("agreenmentid");
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "AGREENMENT");
			model.addAttribute("CURENT_TAB_2", "sxh");
			model.addAttribute("CURENT_TAB_3", "sxh");
			String ip = request.getServerName();
			User user = (User)request.getSession().getAttribute("user");
			IndexNum indexNum = ServiceManager.getIndexNumService().getIndexNum(housebsicid);
			if (null == indexNum) {
				Agreement agreenment = ServiceManager.getAgreenmentService().getById(agreenmentid);
				indexNum = ServiceManager.getIndexNumService().getIndexNum(ip, user.getId(), housebsicid,agreenment.getAtype());
				//更新协议的
				if(agreenment.getAtype().equals("0")){
					agreenment.setProtocolnumber("AZ-"+indexNum.getIndexnum());
				}else{
					agreenment.setProtocolnumber("BC-"+indexNum.getIndexnum());
				}
				ServiceManager.getAgreenmentService().update(agreenment);
			}
			System.out.println(JSONObject.fromObject(indexNum).toString());
			model.addAttribute("indexNum", indexNum);
			
			try {
				response.sendRedirect(WebConstConfig.BASE_PATH+"/pgzq/sxh.action");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return ;
		}
	}

	@RequestMapping({ "/pgzq/sxh.action" })
	public ModelAndView sxh(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		int intPageSize = Contanst.PAGE_SIZE;
		String pageNo = request.getParameter("pageNo");
		if (StringUtils.isEmpty(pageNo)) {
			pageNo = "1";
		}

		int intPageNum = Integer.parseInt(pageNo);
		RoleBean role = (RoleBean) request.getSession().getAttribute("role");
		List<HouseBasic> list = ServiceManager.getHouseBasicServce().getListBySection(request,model,role.getSection(),
				(intPageNum - 1) * intPageSize, intPageSize);
		Integer count = ServiceManager.getHouseBasicServce().getCount(role.getSection());

		model.addAttribute("pageSize", intPageSize);
		model.addAttribute("pageNo", intPageNum);
		model.addAttribute("recordCount", count);

		model.addAttribute("list", list);
		model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
		model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
		model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());

		model.addAttribute("CURENT_TAB", "AGREENMENT");
		model.addAttribute("CURENT_TAB_2", "sxh");
		model.addAttribute("CURENT_TAB_3", "sxh");

		return new ModelAndView(PageConst.PGZQ_sxh, model);
	}
	
}
