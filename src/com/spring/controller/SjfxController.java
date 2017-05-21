package com.spring.controller;

import java.util.ArrayList;
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
import com.hibernate.houseinfo.domain.AgreenmentSectionBean;
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
			//签约情况
			List<AgreenmentSectionBean> list0 = ServiceManager.getHouseBasicServce().getAgSessionBeanList(" and c.id is not null ");
			StringBuffer sb = new StringBuffer();
			sb.append(" and c.id is not null and date_format(c.operatedate,'%Y-%m-%d') = '");
			String dateStr = DateUtil.getDate(new Date());
			sb.append(dateStr).append("'");
			//当天签约情况
			List<AgreenmentSectionBean> list1 = ServiceManager.getHouseBasicServce().getAgSessionBeanList(sb.toString());
			
			//合计
			List<AgreenmentSectionBean> list2 = ServiceManager.getHouseBasicServce().getAgSessionBeanList(" and b.id is not null ");
			List<Map<String,String>> list = initAgReturnList();
			
			Map<String,String> map8  = list.get(list.size()-1);
			for (int i = 0; i < list0.size(); i++) {
				AgreenmentSectionBean ag = list0.get(i);
				int n = Integer.parseInt(ag.getSection());
				Map<String,String> map  = list.get(n-8 );
				if(ag.getQytype().equals("0")){
					map.put("ljaz", ag.getQycount()+"");
					
					map8.put("ljaz", (Integer.parseInt(map8.get("ljaz"))+ag.getQycount())+"");
				}else{
					map.put("ljhb", ag.getQycount()+"");
					map8.put("ljhb", (Integer.parseInt(map8.get("ljhb"))+ag.getQycount())+"");
				}
			}
			
			for (int i = 0; i < list1.size(); i++) {
				AgreenmentSectionBean ag = list1.get(i);
				int n = Integer.parseInt(ag.getSection());
				Map<String,String> map  = list.get(n-8 );
				if(ag.getQytype().equals("0")){
					map.put("dtaz", ag.getQycount()+"");
					map8.put("dtaz", (Integer.parseInt(map8.get("dtaz"))+ag.getQycount())+"");
				}else{
					map.put("dthb", ag.getQycount()+"");
					map8.put("dthb", (Integer.parseInt(map8.get("dthb"))+ag.getQycount())+"");
				}
			}
			for (int i = 0; i < list2.size(); i++) {
				AgreenmentSectionBean ag = list2.get(i);
				int n = Integer.parseInt(ag.getSection());
				Map<String,String> map  = list.get(n-8 );
				if(ag.getQytype().equals("0")){
					map.put("hjaz", ag.getQycount()+"");
					map8.put("hjaz", (Integer.parseInt(map8.get("hjaz"))+ag.getQycount())+"");
				}else{
					map.put("hjhb", ag.getQycount()+"");
					map8.put("hjhb", (Integer.parseInt(map8.get("hjhb"))+ag.getQycount())+"");
				}
			}
			//插入空数据
			//数组组装
			model.addAttribute("list", list);
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
	
	
	@RequestMapping({"/sjfx/gbdttjetj.action"})
	public ModelAndView gbdttjetj(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			//数组组装
			List<Map<String,String>> list0 = ServiceManager.getHouseBasicServce().getBCKZJMapList("0");
			List<Map<String,String>> list1 = ServiceManager.getHouseBasicServce().getBCKZJMapList("1");
//			List<Map<String,String>> list3 = ServiceManager.getHouseBasicServce().getBCKZJMapList("");
			List<Map<String,String>> list = initGbdttjetjReturnList();
			Map<String,String> map8  = list.get(list.size()-1);
			for (int i = 0; i < list0.size(); i++) {
				Map<String,String> map1 = list0.get(i);
				int n = Integer.parseInt(map1.get("section"));
				Map<String,String> map  = list.get(n-8 );
				map.put("az", map1.get("zjdttzj")+"");
				map8.put("az", (Double.parseDouble(map8.get("az"))+Double.parseDouble(map1.get("zjdttzj")))+"");
				
			}
			for (int i = 0; i < list1.size(); i++) {
				Map<String,String> map1 = list1.get(i);
				int n = Integer.parseInt(map1.get("section"));
				Map<String,String> map  = list.get(n-8 );
				map.put("hb", map1.get("zjdttzj")+"");
				map8.put("hb", (Double.parseDouble(map8.get("hb"))+Double.parseDouble(map1.get("zjdttzj")))+"");
				
			}
			for (int i = 0; i < list0.size(); i++) {
				Map<String,String> map1 = list0.get(i);
				int n = Integer.parseInt(map1.get("section"));
				Map<String,String> map  = list.get(n-8 );
				map.put("hj", map1.get("zjdttzj")+"");
				map8.put("hj", (Double.parseDouble(map8.get("hj"))+Double.parseDouble(map1.get("zjdttzj")))+"");
				
			}			
			model.addAttribute("list", list);
			model.addAttribute("sectionMap", Contanst.sectionMap);
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "SJFX");
			model.addAttribute("CURENT_TAB_2", "gbdttjetj");
			model.addAttribute("CURENT_TAB_3", "gbdttjetj");

			return new ModelAndView(PageConst.SJFX_gbdttjetj, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}
	
	private List<Map<String, String>> initGbdttjetjReturnList() {
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		for (int i = 8; i < 11; i++) {
			Map<String,String> map = new HashMap<String, String>();
			map.put("section", i+"");
			map.put("displaysection", Contanst.sectionMap.get(i+""));
			map.put("az", "0");
			map.put("hb", "0");
			map.put("hj", "0");
			list.add(map);
		}
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("section", "11");
		map.put("displaysection", "合计");
		map.put("az", "0");
		map.put("hb", "0");
		map.put("hj", "0");
		list.add(map);
		return list;
	}


	private List<Map<String,String>> initAgReturnList(){
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		for (int i = 8; i < 11; i++) {
			Map<String,String> map = new HashMap<String, String>();
			map.put("section", i+"");
			map.put("displaysection", Contanst.sectionMap.get(i+""));
			map.put("hj", "0");
			map.put("hjhb", "0");
			map.put("hjaz", "0");
			
			map.put("hjdt", "0");
			map.put("dthb", "0");
			map.put("dtaz", "0");
			
			map.put("hjlj", "0");
			map.put("ljhb", "0");
			map.put("ljaz", "0");
			list.add(map);
		}
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("section", "11");
		map.put("displaysection", "合计");
		map.put("hj", "0");
		map.put("hjhb", "0");
		map.put("hjaz", "0");
		
		map.put("hjdt", "0");
		map.put("dthb", "0");
		map.put("dtaz", "0");
		
		map.put("hjlj", "0");
		map.put("ljhb", "0");
		map.put("ljaz", "0");
		list.add(map);
		return list ;
	}
	
	
	/**
	 * 已交房台账
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping({"/sjfx/gbdjftj.action"})
	public ModelAndView jfdj_1(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			//总数
			System.out.println("calcstart1="+new Date().getTime());
			List<AgreenmentSectionBean> list0 = ServiceManager.getHouseBasicServce().getHasOthersBeanList("");
			//已经交房
			System.out.println("calcstart2="+new Date().getTime());
			List<AgreenmentSectionBean> list1 = ServiceManager.getHouseBasicServce().getHasOthersBeanList(" and hasothers = '1' ");
			//今日交房
			System.out.println("calcstart3="+new Date().getTime());
			String dateStr = DateUtil.getDate(new Date());
			List<AgreenmentSectionBean> list2 = ServiceManager.getHouseBasicServce().getHasOthersBeanList(" and hasothers = '1' and  date_format(jfDate,'%Y-%m-%d') = '"+dateStr+"' ");
			
			System.out.println("calcstart4="+new Date().getTime());
			List<Map<String,String>> list = initHasOthersList();
			Map<String,String> map8  = list.get(list.size()-1);
			for (int i = 0; i < list0.size(); i++) {
				AgreenmentSectionBean ag = list0.get(i);
				int n = Integer.parseInt(ag.getSection());
				Map<String,String> map  = list.get(n-1 );
				map.put("hj", ag.getQycount()+"");
				map8.put("hj", (Integer.parseInt(map8.get("hj"))+ag.getQycount())+"");
			}
			for (int i = 0; i < list1.size(); i++) {
				AgreenmentSectionBean ag = list1.get(i);
				int n = Integer.parseInt(ag.getSection());
				Map<String,String> map  = list.get(n-1 );
				map.put("ljjf", ag.getQycount()+"");
				map8.put("ljjf", (Integer.parseInt(map8.get("ljjf"))+ag.getQycount())+"");
			}
			for (int i = 0; i < list2.size(); i++) {
				AgreenmentSectionBean ag = list2.get(i);
				int n = Integer.parseInt(ag.getSection());
				Map<String,String> map  = list.get(n-1 );
				map.put("jrjf", ag.getQycount()+"");
				map8.put("jrjf", (Integer.parseInt(map8.get("jrjf"))+ag.getQycount())+"");
			}
			
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
	
	
	private List<Map<String,String>> initHasOthersList(){
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		for (int i = 1; i < 8; i++) {
			Map<String,String> map = new HashMap<String, String>();
			map.put("section", i+"");
			map.put("displaysection", Contanst.sectionMap.get(i+""));
			map.put("hj", "0");
			map.put("jrjf", "0");
			map.put("ljjf", "0");
			map.put("jfbl", "0");
			list.add(map);
		}
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("section", "8");
		map.put("displaysection", "合计");
		map.put("hj", "0");
		map.put("jrjf", "0");
		map.put("ljjf", "0");
		map.put("jfbl", "0");
		list.add(map);
		return list ;
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
			String sql = getqysxhtzSql(request,"1",model);
			List<DisplayBean> list = ServiceManager.getHouseBasicServce()
					.getDisplayBeanList(sql," order by c.time desc ", (intPageNum - 1) * intPageSize, intPageSize);
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
	
	
	@RequestMapping({"/sjfx/shtz.action"})
	public ModelAndView shtz(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			
//			<td>${ROW.displaysection}</td> 
//			<td>${ROW.hj}</td>
//			<td>${ROW.jrshtj}</td>
//			<td>${ROW.ljshtj}</td>
			//sb.append(" checkresult = 1 and date_format(checkDate,'%Y-%m-%d') = '2016-12-05';");
			//累计审核通过
			List<Map<String,Integer>> list0 =  ServiceManager.getHouseBasicServce().getListByCheckResult(" and checkresult = '1'");
			String dateStr = DateUtil.getDate(new Date());
			List<Map<String,Integer>> list1 =  ServiceManager.getHouseBasicServce().getListByCheckResult(" and checkresult = '1'" +
					" and  date_format(checkDate,'%Y-%m-%d') = '"+dateStr+"' ");
			//合计
			List<Map<String,Integer>> list2 =  ServiceManager.getHouseBasicServce().getListByCheckResult("");
			
			List<Map<String,String>> list = initCheckResultList();
			Map<String,String> map8 = list.get(7);
			//累计审核通过
			for (int i = 0; i < list0.size(); i++) {
				Map<String,Integer> ag = list0.get(i);
				int n = ag.get("displaysection");
				Map<String,String> map  = list.get(n-1 );
				map.put("ljshtj", ag.get("shcount")+"");
				map8.put("ljshtj", (Integer.parseInt(map8.get("ljshtj"))+ag.get("shcount"))+"");
			}
			for (int i = 0; i < list1.size(); i++) {
				Map<String,Integer> ag = list1.get(i);
				int n = ag.get("displaysection");
				Map<String,String> map  = list.get(n-1 );
				map.put("jrshtj", ag.get("shcount")+"");
				map8.put("jrshtj", (Integer.parseInt(map8.get("jrshtj"))+ag.get("shcount"))+"");
			}
			for (int i = 0; i < list2.size(); i++) {
				Map<String,Integer> ag = list2.get(i);
				int n = ag.get("displaysection");
				Map<String,String> map  = list.get(n-1 );
				map.put("hj", ag.get("shcount")+"");
				map8.put("hj", (Integer.parseInt(map8.get("hj"))+ag.get("shcount"))+"");
			}
//			HashMap<String,String> map = new HashMap<String, String>();
//			map.put("displaysection", "");
//			map.put("hj", "");
//			map.put("jrshtj", "");
//			map.put("ljshtj", "");   就类似于列转行
			
			model.addAttribute("list", list);
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "SJFX");
			model.addAttribute("CURENT_TAB_2", "shtz");
			model.addAttribute("CURENT_TAB_3", "shtz");

			return new ModelAndView(PageConst.SJFX_shtz, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}

	private List<Map<String,String>> initCheckResultList(){
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		for (int i = 1; i < 8; i++) {
			Map<String,String> map = new HashMap<String, String>();
			map.put("section", i+"");
			map.put("displaysection", Contanst.sectionMap.get(i+""));
			map.put("hj", "0");
			map.put("jrshtj", "0");
			map.put("ljshtj", "0");
			list.add(map);
		}
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("section", "8");
		map.put("displaysection", "合计");
		map.put("hj", "0");
		map.put("jrshtj", "0");
		map.put("ljshtj", "0");
		list.add(map);
		return list ;
	}
	
	
	@RequestMapping({"/sjfx/export.action"})
	public ModelAndView export(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "SJFX");
			model.addAttribute("CURENT_TAB_2", "export");
			model.addAttribute("CURENT_TAB_3", "export");

			return new ModelAndView(PageConst.SJFX_export, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}
	
	
	/**
	 * 各标段签约情况
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping({"/sjfx/yqykxtj.action"})
	public ModelAndView yqykxtj(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			
			//插入空数据
//			public List<Map<String, String>> getSumKuan() {
//				
//			}
			List<Map<String, String>> list = ServiceManager.getHouseBasicServce().getSumKuan();
			//数组组装
			model.addAttribute("list", list);
			model.addAttribute("sectionMap", Contanst.sectionMap);
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "SJFX");
			model.addAttribute("CURENT_TAB_2", "yqykxtj");
			model.addAttribute("CURENT_TAB_3", "yqykxtj");

			return new ModelAndView(PageConst.SJFX_yqykxtj, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}
	
}
