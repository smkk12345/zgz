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

import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.xalan.lib.Redirect;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.common.consts.ErrorCodeConst;
import com.common.consts.PageConst;
import com.common.consts.WebConstConfig;
import com.common.utils.CalendarUtil;
import com.common.utils.FileUtils;
import com.common.utils.MathUtil;
import com.common.utils.RequestUtil;
import com.common.utils.StringUtils;
import com.hibernate.baseSettingInfo.domain.AlarmBean;
import com.hibernate.baseSettingInfo.domain.BaseSettingBean;
import com.hibernate.baseSettingInfo.domain.GrainTypeBean;
import com.hibernate.houseinfo.domain.HouseBasic;
import com.hibernate.houseinfo.domain.OtherInfo;
import com.hibernate.houseinfo.domain.VacatePeople;
import com.hibernate.userInfo.damain.RoleBean;
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
	@RequestMapping({ "/pgqq/rhjc.action", "/pgqq.action","/index.action"})
	public ModelAndView indexPage(HttpServletRequest request,
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

	@RequestMapping({ "/pgqq/rhjc_add_Modal.action" })
	public ModelAndView lqModal(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {

			// 模板路径 basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());
			model.addAttribute("bean", new HouseBasic());
			return new ModelAndView(PageConst.PGQQ_rhjc_add_Modal, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;

		}
	}
	
	
	@RequestMapping({ "/edithousebasic.action" })
	public ModelAndView edithousebasic(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			String housebasicid  = request.getParameter("housebasicid");
			RoleBean role = (RoleBean)request.getSession().getAttribute("role");
			HouseBasic houseBasic = ServiceManager.getHouseBasicServce().getHouseBasicById(housebasicid, role.getSection());
			model.addAttribute("bean", houseBasic);
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
	

	@RequestMapping({ "/pgqq/fhfa.action" })
	public ModelAndView fhfaPage(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());

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
	
	@RequestMapping({ "/pgqq/savehousebasic.action" })
	public void savehousebasic(HttpServletRequest request,
			HttpServletResponse response, ModelMap model,HouseBasic housebasic) {
		try {
			HttpSession s = request.getSession();
			RoleBean role = (RoleBean)s.getAttribute("role");
			housebasic.setSection(role.getSection());
			//获取标段信息
			housebasic.setCreateTime(new Date());
			housebasic.setUpdateTime(new Date());
			
			initVacatePeople(request, housebasic);
			
			initOtherInfoList(housebasic,request);
			
			boolean result = ServiceManager.getHouseBasicServce().save(housebasic);
			
			try {
				response.sendRedirect(WebConstConfig.BASE_PATH+"/index.action");
			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return ;
		}
	}
	//被腾退人信息
	private void initVacatePeople(HttpServletRequest request,
			HouseBasic housebasic) {
		String[] householders = request.getParameterValues("householder");
		String[] householdtype = request.getParameterValues("householdtype");
		String[] names = request.getParameterValues("vname");
		String[] idcards = request.getParameterValues("vidcard");
		String[] sexs = request.getParameterValues("vsex");
		String[] registeredrelates = request.getParameterValues("registeredrelate");
		String[] changrelate = request.getParameterValues("changrelate");
		String[] hasmarry = request.getParameterValues("hasmarry");
		String[] vunit = request.getParameterValues("vunit");
		String[] peopletype = request.getParameterValues("peopletype");
		String[] vtype = request.getParameterValues("vtype");
		String[] vid =  request.getParameterValues("vid");
		
		List<VacatePeople> vList = new ArrayList<VacatePeople>();
		List<VacatePeople> nList = new ArrayList<VacatePeople>();
		for (int i = 0; i < names.length; i++) {
			String name = names[i];
			if(StringUtils.isEmpty(name)){
				
				if(null != vid &&!StringUtils.isEmpty(vid[i])){
					//删除
					ServiceManager.getHouseBasicServce().delVacatePeopleById(vid[i]);
				}
				continue;
			}
			VacatePeople v = new VacatePeople();
			if(vid!=null&&vid.length>0){
				if(!StringUtils.isEmpty(vid[i])){
					v.setId(vid[i]);
				}
			}
			v.setName(names[i]);
			v.setHousebasicid("");
			v.setChangrelate(changrelate[i]);
			v.setHouseholder(householders[i]);
			v.setHouseholdtype(householdtype[i]);
			v.setIdcard(idcards[i]);
			v.setSex(sexs[i]);
			v.setRegisteredrelate(registeredrelates[i]);
			v.setHasmarry(hasmarry[i]);
			v.setUnit(vunit[i]);
			v.setPeopletype(peopletype[i]);
			String vtypee = vtype[i];
			v.setVtype(vtypee);
			if(vtypee.equals("0")){
				vList.add(v);
			}else{
				nList.add(v);
			}
		}
		housebasic.setVacatelist(vList);
		housebasic.setList(nList);
	}
	//其他信息   如低保 残疾 大病等
	private boolean initOtherInfoList(HouseBasic houseBasic,HttpServletRequest request){
		try {
			String[] name = request.getParameterValues("oname");
			String[] otype = request.getParameterValues("otype");
			String[] peopleid = request.getParameterValues("peopleid");
			String[] otypenum = request.getParameterValues("otypenum");
			String[] validatedate = request.getParameterValues("validatedate");
			String[] illnessname = request.getParameterValues("illnessname");
			String[] illnessprove = request.getParameterValues("illnessprove");
			String[] oid = request.getParameterValues("oid");
			if(null == name || name.length==0){
				return true;
			}
			//大病
			List<OtherInfo> illList = new ArrayList<OtherInfo>();
			//低保
			List<OtherInfo> basicLivingList = new ArrayList<OtherInfo>();
			//残疾
			List<OtherInfo> deformityList = new ArrayList<OtherInfo>();
			//0 低保  1 残疾  2 大兵
			for (int i = 0; i < name.length; i++) {
				OtherInfo otherInfo = new OtherInfo();
				
				String name1 = name[i];
				if(StringUtils.isEmpty(name1)){
					
					if(null != oid &&!StringUtils.isEmpty(oid[i])){
						//删除
						ServiceManager.getHouseBasicServce().delOther(oid[i]);
					}
					continue;
				}
				
				if(oid!=null&&oid.length>0){
					if(!StringUtils.isEmpty(oid[i])){
						otherInfo.setId(oid[i]);
					}
				}
				otherInfo.setName(name[i]);
				otherInfo.setOtype(otype[i]);
				otherInfo.setPeopleid(peopleid[i]);
				otherInfo.setOtypenum(otypenum[i]);
				otherInfo.setValidatedate(validatedate[i]);
				otherInfo.setIllnessprove(illnessprove[i]);
				
				if(otherInfo.getOtype().equals("0")){
					basicLivingList.add(otherInfo);
				}else if(otherInfo.getOtype().equals("1")){
					deformityList.add(otherInfo);
				}else{
					illList.add(otherInfo);
				}
			}
			houseBasic.setIllList(illList);
			houseBasic.setBasicLivingList(basicLivingList);
			houseBasic.setDeformityList(deformityList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}
	
	@RequestMapping({ "/pgqq/del.action" })
	public ModelMap deletehousebasic(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		
		String id = request.getParameter("housebasicid");
		
		ServiceManager.getHouseBasicServce().delHouseBasicById(id);
//		RoleBean role = (RoleBean)request.getSession().getAttribute("role");
//		List<HouseBasic> list = ServiceManager.getHouseBasicServce().getListBySection(role.getSection(),0,10);
//		model.addAttribute("list", list);
		model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
		model.addAttribute("BASE_ASSETS_PATH",
				WebConstConfig.getBase_Assets_Path());
		model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
				WebConstConfig.getBase_Template_Default_Path());

		model.addAttribute("CURENT_TAB", "PGQQ");
		model.addAttribute("CURENT_TAB_2", "rhjc");
		model.addAttribute("CURENT_TAB_3", "rhjc");
		model.addAttribute("success", true);

		return model;
	}
	
	
	
}
