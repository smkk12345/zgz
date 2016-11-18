package com.spring.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.common.consts.Contanst;
import com.common.consts.PageConst;
import com.common.consts.WebConstConfig;
import com.common.utils.StringUtils;
import com.hibernate.houseinfo.domain.Agreement;
import com.hibernate.houseinfo.domain.DisplayBean;
import com.hibernate.houseinfo.domain.HouseBasic;
import com.hibernate.timers.utils.DateStyle;
import com.hibernate.timers.utils.DateUtil;
import com.hibernate.userInfo.damain.RoleBean;
import com.spring.ServiceManager;

@Controller
public class AgreenmentController {

	
	@RequestMapping({"/pgzq/agreenment.action","/pgzq/fhfa.action"})
	public ModelAndView agreenment(HttpServletRequest request,
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
			List<DisplayBean> list = ServiceManager.getHouseBasicServce()
					.getDisplayBeanList(sql,"", (intPageNum - 1) * intPageSize, intPageSize);
			
			Integer count = ServiceManager.getHouseBasicServce().getDisPlayCount(sql);
//			List<HouseBasic> list = ServiceManager.getHouseBasicServce().getListBySection(request,model,role.getSection(),(intPageNum-1)*intPageSize,intPageSize);
//			Integer count = ServiceManager.getHouseBasicServce().getCount(role.getSection());
			
			model.addAttribute("pageSize", intPageSize);
			model.addAttribute("pageNo", intPageNum);
			model.addAttribute("recordCount", count);
			
			model.addAttribute("list", list);
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());

			model.addAttribute("CURENT_TAB", "AGREENMENT");
			model.addAttribute("CURENT_TAB_2", "fhfa");
			model.addAttribute("CURENT_TAB_3", "fhfa");

			return new ModelAndView(PageConst.PGZQ_fhfa, model);
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
		atype = StringUtils.isBlank(atype)?"-1":atype;
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
		if(!StringUtils.isBlank(indexnum)){
			sb.append(" and c.indexnum =").append(indexnum);
			model.addAttribute("indexnum", indexnum);
		}
		if(!atype.equals("-1")){
			sb.append(" AND b.atype ='").append(atype).append("'");
		}
		model.addAttribute("atype", idcard);
		return sb.toString();
	}

	
	@RequestMapping({"/pgzq/fhfa_s.action"})
	public ModelAndView fhfa_s(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			
			int intPageSize = Contanst.PAGE_SIZE;
			String pageNo = request.getParameter("pageNo");
			if(StringUtils.isEmpty(pageNo)){
				pageNo = "1";
			}
			
			int intPageNum = Integer.parseInt(pageNo);
			RoleBean role = (RoleBean)request.getSession().getAttribute("role");
			String sql = getHfxySxhSql(role.getSection(),request,model);
			List<DisplayBean> list = ServiceManager.getHouseBasicServce()
					.getDisplayBeanList(sql, "",(intPageNum - 1) * intPageSize, intPageSize);
			
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

			model.addAttribute("CURENT_TAB", "AGREENMENT");
			model.addAttribute("CURENT_TAB_2", "fhfa_s");
			model.addAttribute("CURENT_TAB_3", "fhfa_s");

			return new ModelAndView(PageConst.PGZQ_fhfa_s, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}
	
	@RequestMapping({"/pgzq/fhxy.action"})
	public ModelAndView fhxy(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			
			int intPageSize = Contanst.PAGE_SIZE;
			String pageNo = request.getParameter("pageNo");
			if(StringUtils.isEmpty(pageNo)){
				pageNo = "1";
			}
			
			int intPageNum = Integer.parseInt(pageNo);
			RoleBean role = (RoleBean)request.getSession().getAttribute("role");
			String sql = getHfxySxhSql(role.getSection(),request,model);
			List<DisplayBean> list = ServiceManager.getHouseBasicServce()
					.getDisplayBeanList(sql, "",(intPageNum - 1) * intPageSize, intPageSize);
			
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

			model.addAttribute("CURENT_TAB", "AGREENMENT");
			model.addAttribute("CURENT_TAB_2", "fhxy");
			model.addAttribute("CURENT_TAB_3", "fhxy");

			return new ModelAndView(PageConst.PGZQ_fhxy, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}
	/**
	 * 查询参数都在这里拼凑
	 * @param section
	 * @return
	 */

	private String getHfxySxhSql(String section,HttpServletRequest request,ModelMap model) {
		// TODO Auto-generated method stub
		StringBuffer sb = new StringBuffer();
		sb.append(" and  b.id IS NOT NULL and a.section in (").append(section).append(")");
		String names = request.getParameter("names");
		String  mobile = request.getParameter("mobile");
		String idcard = request.getParameter("idcard");
		String indexnum = request.getParameter("indexnum");
		String atype = request.getParameter("atype");
		atype = StringUtils.isBlank(atype)?"-1":atype;
		String qianyue = request.getParameter("qianyue");
		qianyue = StringUtils.isBlank(qianyue)?"-1":qianyue;
		
		if(!StringUtils.isBlank(names)){
			sb.append(" and a.names like '%").append(names).append("%'");
			model.addAttribute("names", names);
		}
		if(!StringUtils.isBlank(mobile)){

			sb.append(" AND a.mobile ='").append(mobile).append("'");
			model.addAttribute("mobile", mobile);
		}
		if(!StringUtils.isBlank(idcard)){
			sb.append("  AND a.idcard ='").append(idcard).append("'");
			model.addAttribute("idcard", idcard);
		}
		if(!atype.equals("-1")){
			sb.append(" AND b.atype ='").append(atype).append("'");
		}
		model.addAttribute("atype", idcard);
		if(!qianyue.equals("-1")){
			if(qianyue.equals("0")){   //已经签约
				sb.append(" and b.protocolnumber<>''");
			}else{
				sb.append(" and b.protocolnumber=''");
			}
		}
		model.addAttribute("qianyue", qianyue);
		
		return sb.toString();
	}


	@RequestMapping({ "/pgzq/fhfa_edit_Modal.action" })
	public ModelAndView xy_add_Modal(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			String agreenmentid = request.getParameter("agreenmentid");
			String housebasicid = request.getParameter("housebasicid");
			RoleBean role = (RoleBean)request.getSession().getAttribute("role");
			HouseBasic housebasic = ServiceManager.getHouseBasicServce().getHouseBasicById(housebasicid, role.getSection());
			model.addAttribute("housebasic", housebasic);
			Agreement agreenment = new Agreement();
			if(!StringUtils.isBlank(agreenmentid)&&!"-1000".equals(agreenmentid)){
				agreenment = ServiceManager.getAgreenmentService().getById(agreenmentid);
			}
			model.addAttribute("bean", agreenment);
			// 模板路径 basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());
			return new ModelAndView(PageConst.PGZQ_fhfa_edit_Modal, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;

		}
	}
	
	@RequestMapping({ "/pgzq/fhfa_check_Modal.action" })
	public ModelAndView fhfa_check_Modal(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			String agreenmentid = request.getParameter("agreenmentid");
			String housebasicid = request.getParameter("housebasicid");
			RoleBean role = (RoleBean)request.getSession().getAttribute("role");
			HouseBasic housebasic = ServiceManager.getHouseBasicServce().getHouseBasicById(housebasicid, role.getSection());
			model.addAttribute("housebasic", housebasic);
			Agreement agreenment = new Agreement();
			if(!StringUtils.isBlank(agreenmentid)&&!"-1000".equals(agreenmentid)){
				agreenment = ServiceManager.getAgreenmentService().getById(agreenmentid);
			}
			model.addAttribute("bean", agreenment);
			// 模板路径 basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());
			return new ModelAndView(PageConst.PGZQ_fhfa_check_Modal, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;

		}
	}
	

	@RequestMapping({ "/pgzq/fhfa_c_Modal.action" })
	public ModelAndView fhfa_c_Modal(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			String agreenmentid = request.getParameter("agreenmentid");
			String housebasicid = request.getParameter("housebasicid");
			RoleBean role = (RoleBean)request.getSession().getAttribute("role");
			HouseBasic housebasic = ServiceManager.getHouseBasicServce().getHouseBasicById(housebasicid, role.getSection());
			model.addAttribute("housebasic", housebasic);
			Agreement agreenment = new Agreement();
			if(!StringUtils.isBlank(agreenmentid)&&!"-1000".equals(agreenmentid)){
				agreenment = ServiceManager.getAgreenmentService().getById(agreenmentid);
			}
			model.addAttribute("bean", agreenment);
			// 模板路径 basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());
			return new ModelAndView(PageConst.PGZQ_fhfa_c_Modal, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;

		}
	}
	
	@RequestMapping({ "/pgzq/fhxy_az_je_print_Modal.action" })
	public ModelAndView fhxy_az_je_print_Modal(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			String agreenmentid = request.getParameter("agreenmentid");
			String housebasicid = request.getParameter("housebasicid");
			RoleBean role = (RoleBean)request.getSession().getAttribute("role");
//			HouseBasic housebasic = ServiceManager.getHouseBasicServce().getHouseBasicById(housebasicid, role.getSection());
//			model.addAttribute("housebasic", housebasic);
//			Agreement agreenment = new Agreement();
//			if(!StringUtils.isBlank(agreenmentid)&&!"-1000".equals(agreenmentid)){
//				agreenment = ServiceManager.getAgreenmentService().getById(agreenmentid);
//			}
			DisplayBean bean = ServiceManager.getHouseBasicServce().getDisplayBean(housebasicid);
			model.addAttribute("bean", bean);
			// 模板路径 basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());
			return new ModelAndView(PageConst.PGZQ_fhxy_az_je_print_Modal, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;

		}
	}
	
	@RequestMapping({ "/pgzq/fhxy_az_xy_print_Modal.action" })
	public ModelAndView fhxy_az_xy_print_Modal(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			String agreenmentid = request.getParameter("agreenmentid");
			String housebasicid = request.getParameter("housebasicid");
			RoleBean role = (RoleBean)request.getSession().getAttribute("role");
			HouseBasic housebasic = ServiceManager.getHouseBasicServce().getHouseBasicById(housebasicid, role.getSection());
			model.addAttribute("housebasic", housebasic);
			Agreement agreenment = new Agreement();
			if(!StringUtils.isBlank(agreenmentid)&&!"-1000".equals(agreenmentid)){
				agreenment = ServiceManager.getAgreenmentService().getById(agreenmentid);
			}
			model.addAttribute("bean", agreenment);
			// 模板路径 basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());
			return new ModelAndView(PageConst.PGZQ_fhxy_az_xy_print_Modal, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;

		}
	}
	
	/**
	 * 完全货币补偿方式
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping({ "/pgzq/fhxy_hb_je_print_Modal.action" })
	public ModelAndView fhxy_az_hb_print_Modal(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			String agreenmentid = request.getParameter("agreenmentid");
			String housebasicid = request.getParameter("housebasicid");
			RoleBean role = (RoleBean)request.getSession().getAttribute("role");
			HouseBasic housebasic = ServiceManager.getHouseBasicServce().getHouseBasicById(housebasicid, role.getSection());
			model.addAttribute("housebasic", housebasic);
			Agreement agreenment = new Agreement();
			if(!StringUtils.isBlank(agreenmentid)&&!"-1000".equals(agreenmentid)){
				agreenment = ServiceManager.getAgreenmentService().getById(agreenmentid);
			}
			model.addAttribute("bean", agreenment);
			// 模板路径 basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());
			return new ModelAndView(PageConst.PGZQ_fhxy_hb_je_print_Modal, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;

		}
	}
	
	@RequestMapping({ "/pgzq/fhxy_hb_xy_print_Modal.action" })
	public ModelAndView fhxy_hb_xy_print_Modal(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			String agreenmentid = request.getParameter("agreenmentid");
			String housebasicid = request.getParameter("housebasicid");
			RoleBean role = (RoleBean)request.getSession().getAttribute("role");
			HouseBasic housebasic = ServiceManager.getHouseBasicServce().getHouseBasicById(housebasicid, role.getSection());
			model.addAttribute("housebasic", housebasic);
			Agreement agreenment = new Agreement();
			if(!StringUtils.isBlank(agreenmentid)&&!"-1000".equals(agreenmentid)){
				agreenment = ServiceManager.getAgreenmentService().getById(agreenmentid);
			}
			model.addAttribute("bean", agreenment);
			// 模板路径 basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());
			return new ModelAndView(PageConst.PGZQ_fhxy_hb_xy_print_Modal, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;

		}
	}
	
	@RequestMapping({ "/pgzq/saveAgreenment.action" })
	public void saveAgreenment(HttpServletRequest request,
			HttpServletResponse response, ModelMap model,Agreement agreenment,String housebasicid) {
		try {
			
			String aid = request.getParameter("aid");
			if(!StringUtils.isBlank(aid)){
				agreenment.setId(aid);
			}
			HttpSession s = request.getSession();
			RoleBean role = (RoleBean)s.getAttribute("role");
			//设置计算后款=总补偿款-购房款
			BigDecimal zjdttzj=agreenment.getZjdttzj();
			BigDecimal azfgfk=agreenment.getAzfgfk();
			if(zjdttzj!=null&&azfgfk!=null){
				agreenment.setJshk(zjdttzj.subtract(azfgfk));	
			}
			//获取标段信息
			agreenment.setCreateTime(new Date());
			agreenment.setUpdateTime(new Date());
			agreenment.setHousebasicid(housebasicid);
//			if(StringUtils.isEmpty(agreenment.getId())){
//				agreenment.setId(null);
//			}
			ServiceManager.getAgreenmentService().save(agreenment);
			
			try {
				response.sendRedirect(WebConstConfig.BASE_PATH+"/pgzq/fhfa.action");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return ;
		}
	}
	
	
	
	@RequestMapping({ "/pgzq/agreenmentPrint.action" })
	public ModelAndView agreenmentPrint(HttpServletRequest request,
			HttpServletResponse response, ModelMap model,String housebasicid) {
		try {
			
			HttpSession s = request.getSession();
			RoleBean role = (RoleBean)s.getAttribute("role");
			HouseBasic houseBasic = ServiceManager.getHouseBasicServce().getHouseBasicById(housebasicid, role.getSection());
			model.addAttribute("houseBasic", houseBasic);
			
			Agreement agreenment = houseBasic.getAgreenment();
			if(agreenment.getAtype().equals("0")){  //款补
				return new ModelAndView(PageConst.PGZQ_kbxy_print, model);
			}else{  //房补
				return new ModelAndView(PageConst.PGZQ_fbxy_print, model);
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}
	
	//打印顺序号
	@RequestMapping({ "/pgzq/fhxy_sxh_print_Modal.action" })
	public ModelAndView fhxy_sxh_print_Modal(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			String housebasicid = request.getParameter("housebasicid");
			RoleBean role = (RoleBean)request.getSession().getAttribute("role");
			DisplayBean bean = ServiceManager.getHouseBasicServce().getDisplayBean(housebasicid);
			model.addAttribute("bean", bean);
			// 模板路径 basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());
			return new ModelAndView(PageConst.PGZQ_sxh_print_Modal, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;

		}
	}
	
	
	@RequestMapping({ "/pgzq/fhxy_hb_xy_sy_print_Modal.action" })
	public ModelAndView fhxy_hb_xy_sy_print_Modal(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			String agreenmentid = request.getParameter("agreenmentid");
			String housebasicid = request.getParameter("housebasicid");
			RoleBean role = (RoleBean)request.getSession().getAttribute("role");
			HouseBasic housebasic = ServiceManager.getHouseBasicServce().getHouseBasicById(housebasicid, role.getSection());
			model.addAttribute("housebasic", housebasic);
			Agreement agreenment = new Agreement();
			if(!StringUtils.isBlank(agreenmentid)&&!"-1000".equals(agreenmentid)){
				agreenment = ServiceManager.getAgreenmentService().getById(agreenmentid);
			}
			model.addAttribute("bean", agreenment);
			// 模板路径 basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());
			return new ModelAndView(PageConst.PGZQ_fhxy_hb_xy_sy_print_Modal, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;

		}
	}
	
	
	@RequestMapping({ "/pgzq/fhxy_xy_sy_print_Modal.action" })
	public ModelAndView fhxy_az_xy_sy_print_Modal(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			String agreenmentid = request.getParameter("agreenmentid");
			String housebasicid = request.getParameter("housebasicid");
			RoleBean role = (RoleBean)request.getSession().getAttribute("role");
			HouseBasic housebasic = ServiceManager.getHouseBasicServce().getHouseBasicById(housebasicid, role.getSection());
			model.addAttribute("housebasic", housebasic);
			Agreement agreenment = new Agreement();
			if(!StringUtils.isBlank(agreenmentid)&&!"-1000".equals(agreenmentid)){
				agreenment = ServiceManager.getAgreenmentService().getById(agreenmentid);
			}
			model.addAttribute("bean", agreenment);
			// 模板路径 basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());
			if(agreenment.getProtocolnumber().contains(Contanst.AGREENMENT_TYPE_AZ)){
				return new ModelAndView(PageConst.PGZQ_fhxy_az_xy_sy_print_Modal, model);
			}else{
				return new ModelAndView(PageConst.PGZQ_fhxy_hb_xy_sy_print_Modal, model);
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;

		}
	}
	
	
	@RequestMapping({"/pgzq/fnsjsh.action"})
	public ModelAndView fnsjsh(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			
			int intPageSize = Contanst.PAGE_SIZE;
			String pageNo = request.getParameter("pageNo");
			if(StringUtils.isEmpty(pageNo)){
				pageNo = "1";
			}
			
			int intPageNum = Integer.parseInt(pageNo);
			RoleBean role = (RoleBean)request.getSession().getAttribute("role");
			String sql = getHfxySxhSql(role.getSection(),request,model);
			List<DisplayBean> list = ServiceManager.getHouseBasicServce()
					.getDisplayBeanList(sql, "",(intPageNum - 1) * intPageSize, intPageSize);
			
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

			model.addAttribute("CURENT_TAB", "AGREENMENT");
			model.addAttribute("CURENT_TAB_2", "fnsjsh");
			model.addAttribute("CURENT_TAB_3", "fnsjsh");

			return new ModelAndView(PageConst.PGZQ_fhfa_s, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}	
	
	@RequestMapping({ "/pgzq/fnsjsh_rdjg_print.action" })
	public ModelAndView fnsjsh_rdjg_print(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			String housebasicid  = request.getParameter("housebasicid");
			String agreenmentid = request.getParameter("agreenmentid");
			RoleBean role = (RoleBean)request.getSession().getAttribute("role");
			HouseBasic houseBasic = ServiceManager.getHouseBasicServce().getHouseBasicById(housebasicid, role.getSection());
			model.addAttribute("bean", houseBasic);
			
			Agreement agreenment = ServiceManager.getAgreenmentService().getById(agreenmentid);
			model.addAttribute("agreenment", agreenment);
			String year = DateUtil.DateToString(new Date(), DateStyle.YYYY_MM_DD);
			String[] arr = year.split("-");
			model.addAttribute("year", arr[0]);
			model.addAttribute("month", arr[1]);
			model.addAttribute("day", arr[2]);
			// 模板路径 basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());
			return new ModelAndView(PageConst.PGZQ_rdjg_print_Modal, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;

		}
	}
	
}
