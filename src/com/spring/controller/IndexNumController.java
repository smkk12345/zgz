package com.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.common.consts.PageConst;
import com.common.consts.WebConstConfig;
import com.hibernate.houseinfo.domain.IndexNum;
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
	public ModelAndView indexPage(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "PGQQ");
			model.addAttribute("CURENT_TAB_2", "rhjc");
			model.addAttribute("CURENT_TAB_3", "rhjc");
			IndexNum indexNum = ServiceManager.getIndexNumService().getIndexNum("2");
			if(null == indexNum){
				indexNum = ServiceManager.getIndexNumService().getIndexNum("192.168.1.129", "34", "2");
			}
			System.out.println(JSONObject.fromObject(indexNum).toString());
			model.addAttribute("indexNum",indexNum);
			return new ModelAndView(PageConst.PGQQ_rhjc, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}
}
