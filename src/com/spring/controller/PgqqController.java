package com.spring.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.common.adapter.Adapter;
import com.common.consts.ErrorCodeConst;
import com.common.consts.PageConst;
import com.common.consts.WebConstConfig;
import com.common.pointTem.CoordinatorExchangeTemInterface;
import com.common.utils.CalendarUtil;
import com.common.utils.FileUtils;
import com.common.utils.MathUtil;
import com.common.utils.RequestUtil;
import com.common.utils.StringUtils;
import com.hibernate.barnInfo.domain.AoJianBean;
import com.hibernate.barnInfo.domain.AoJianGrainInfoBean;
import com.hibernate.barnInfo.domain.BarnBean;
import com.hibernate.baseSettingInfo.domain.AlarmBean;
import com.hibernate.baseSettingInfo.domain.BaseSettingBean;
import com.hibernate.baseSettingInfo.domain.GrainTypeBean;
import com.hibernate.sernsorInfo.domain.AoJianDataBean;
import com.hibernate.sernsorInfo.domain.SensorArrangementBean;
import com.hibernate.sernsorInfo.domain.SensorDataBean;
import com.hibernate.userInfo.damain.User;
import com.spring.ServiceManager;

@Controller
public class PgqqController {
	/**
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping({ "/pgqq/rhjc.action", "/pgqq.action" })
	public ModelAndView indexPage(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		try {
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());

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

	@RequestMapping({ "/pgqq/rhjc_add_Modal.action" })
	public ModelAndView lqModal(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		try {
			
			// 模板路径 basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());
			return new ModelAndView(PageConst.PGQQ_rhjc_add_Modal, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;

		}
	}
	
	
	
	
	@RequestMapping({ "/pgqq/fhfa.action" })
	public ModelAndView fhfaPage(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		try {
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "PGQQ");
			model.addAttribute("CURENT_TAB_2", "fhfa");
			model.addAttribute("CURENT_TAB_3", "fhfa");
			

			return new ModelAndView(PageConst.PGQQ_fhfa, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}

}



