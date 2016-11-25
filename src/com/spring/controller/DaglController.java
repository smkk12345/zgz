package com.spring.controller;

import java.io.InputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.common.consts.Contanst;
import com.common.consts.PageConst;
import com.common.consts.WebConstConfig;
import com.common.fileupload.UploadEnums;
import com.common.fileupload.UploadFileUtils;
import com.common.utils.StringUtils;
import com.hibernate.houseinfo.domain.Agreement;
import com.hibernate.houseinfo.domain.DisplayBean;
import com.hibernate.houseinfo.domain.FileManageBean;
import com.hibernate.houseinfo.domain.HouseBasic;
import com.hibernate.userInfo.damain.RoleBean;
import com.spring.ServiceManager;

@Controller
@RequestMapping({"/dagl"})
public class DaglController {

	@RequestMapping({"/list.action"})
	public ModelAndView fhfa_s(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			
			int intPageSize = Contanst.PAGE_SIZE;
			String pageNo = request.getParameter("pageNo");
			if(StringUtils.isEmpty(pageNo)){
				pageNo = "1";
			}
			
			int intPageNum = Integer.parseInt(pageNo);
			String sql = getHfxySxhSql(request,model);
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

			model.addAttribute("CURENT_TAB", "DAGL");
			model.addAttribute("CURENT_TAB_2", "dagl");
			model.addAttribute("CURENT_TAB_3", "dagl");

			return new ModelAndView(PageConst.DAGL_dagl, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}
	
	private String getHfxySxhSql(HttpServletRequest request,ModelMap model) {
		// TODO Auto-generated method stub
		StringBuffer sb = new StringBuffer();
		String names = request.getParameter("names");
		String  mobile = request.getParameter("mobile");
		String idcard = request.getParameter("idcard");
		String atype = request.getParameter("atype");
		String location = request.getParameter("location");
		atype = StringUtils.isBlank(atype)?"-1":atype;
		String qianyue = request.getParameter("qianyue");
		qianyue = StringUtils.isBlank(qianyue)?"-1":qianyue;
		
		if(!StringUtils.isBlank(names)){
			sb.append(" and a.names like '%").append(names).append("%'");
			model.addAttribute("names", names);
		}
		if(!StringUtils.isBlank(location)){
			sb.append(" and a.location like '%").append(location).append("%'");
			model.addAttribute("location", names);
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
		model.addAttribute("atype", atype);
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
	
	/**
	 * 查看
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping({"/dagl_c.action"})
	public ModelAndView dagl_c(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			
			int intPageSize = Contanst.PAGE_SIZE;
			String pageNo = request.getParameter("pageNo");
			if(StringUtils.isEmpty(pageNo)){
				pageNo = "1";
			}
			
			int intPageNum = Integer.parseInt(pageNo);
			String sql = getHfxySxhSql(request,model);
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

			model.addAttribute("CURENT_TAB", "DAGL");
			model.addAttribute("CURENT_TAB_2", "dagl_c");
			model.addAttribute("CURENT_TAB_3", "dagl_c");

			return new ModelAndView(PageConst.DAGL_dagl_c, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}
	
	/**
	 * 模态框
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping({ "/dagl_model.action" })
	public ModelAndView dagl_model(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			String housebasicid = request.getParameter("housebasicid");
			List<FileManageBean> list = ServiceManager.getFileManageService().findListByBaseId(housebasicid);
			model.addAttribute("list", list);
			// 模板路径 basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());
			return new ModelAndView(PageConst.DAGL_dagl_model, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;

		}
	}

	@RequestMapping({ "/save.action" })
	public ModelAndView save(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		try {
			InputStream in=request.getInputStream();
			String path = request.getRealPath("/upload");

			UploadEnums enum1 = UploadFileUtils.upload4Stream(new Date().getTime()+"", path, in);
			
			String housebasicid = request.getParameter("housebasicid");
			List<FileManageBean> list = ServiceManager.getFileManageService().findListByBaseId(housebasicid);
			model.addAttribute("list", list);
			// 模板路径 basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH",
					WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
					WebConstConfig.getBase_Template_Default_Path());
			return new ModelAndView(PageConst.DAGL_dagl_model, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;

		}
	}
	
}
