package com.spring.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.common.consts.PageConst;
import com.common.consts.WebConstConfig;
import com.common.utils.RequestUtil;
import com.common.utils.StringUtils;
import com.ftlTemplates.FreeMarkerUtil;
import com.hibernate.base.Md5;
import com.hibernate.userInfo.damain.RoleBean;
import com.hibernate.userInfo.damain.User;
import com.spring.ServiceManager;
import com.spring.interceptor.RoleAuthorityUtil;
import com.sun.corba.se.impl.activation.ServerMain;
import com.sun.corba.se.spi.activation.ServerManager;

@Controller
public class UserInfoController {
	/**
	 * 
	 * @param user
	 * @param br
	 * @param requset
	 * @param model
	 */
	//@RightAnnotation(operateRightTypes = OperateRightType.,resultType = ResultType.page)
	@RequestMapping(value="/{location}/add.action")  
	public void add(final @ModelAttribute("user") User user, HttpServletRequest requset,ModelMap model){ 
		Map map = validator(user, model);
		if(!map.isEmpty()){
			model.addAttribute("registerErrorInfo", map);
			return;
		}
		try {
			ServiceManager.getUserService().save(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}  

	
	@RequestMapping({"/user/yhgl.action","/xtsz.action" })
	public ModelAndView userManager(
			HttpServletRequest request, HttpServletResponse response,
			ModelMap model) {
		try {
			List<User> list = ServiceManager.getUserService().findAll();
			List<RoleBean> roleList = ServiceManager.getRoleServiceImpl().findAll();
			model.addAttribute("roleList",roleList);
			model.addAttribute("userList",list);
			//模板路径   basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());
			//			model.addAttribute("user",request.getSession().getAttribute("user"));
			model.addAttribute("CURENT_TAB","XTSZ");
			model.addAttribute("CURENT_TAB_2","YHGL");
			return new ModelAndView(PageConst.XTSZ_YHGL,model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;

		}
	}	
	
	private Map validator(User user, Map map){
		Map errorMap = new HashMap<String, String>();
		if(StringUtils.isEmpty(user.getDisplayName())){
			errorMap.put("displayName", "显示名不能为空");
		}
		if(StringUtils.isEmpty(user.getEmail())){
			errorMap.put("email", "邮箱不能为空");
		}
		if(StringUtils.isEmpty(user.getUserName())){
			errorMap.put("userName", "用户名不能为空");
		}
		if(StringUtils.isEmpty(user.getPassWord())){
			errorMap.put("passWord", "密码不能为空");
		}
		if(StringUtils.isEmpty(user.getTel())){
			errorMap.put("tel", "联系电话不能空");
		}
		return errorMap;
	}
	
	private void noAuthority(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("utf-8");  
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();  
		} catch (Exception e) {
		}
		String loginPage = RequestUtil.getBasePath(request)+"login.action";  
		StringBuilder builder = new StringBuilder();  
		builder.append("<script charset=\"utf-8\" type=\"text/javascript\">");  
		builder.append("alert('您没有操作权限，请重新登录！');");  
		builder.append("window.top.location.href='");  
		builder.append(loginPage);  
		builder.append("';");  
		builder.append("</script>");  
		if(null!=out){
			try {
				out.print(builder.toString());  
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				out.close();
			}
		}
	}
	/**
	 * 传感器列表操作窗口
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping({"/user/yhglModal.action"})
	public ModelAndView jbszModalCgq(
			HttpServletRequest request, HttpServletResponse response,
			ModelMap model) {
		try {
			
			RoleBean role = (RoleBean)request.getSession(false).getAttribute("role");
			User bean;
			String userId = RequestUtil.getRequestParameter(request, "userId");
			if(StringUtils.isEmpty(userId)){
				bean = new User();
			}
			else{
				bean = ServiceManager.getUserService().getById(userId);
			}
			//角色列表
			List<RoleBean> roleList = ServiceManager.getRoleServiceImpl().findAll();
			model.addAttribute("roleList", roleList);
			//模板路径   basePath
			model.addAttribute("bean", bean);
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());
			return new ModelAndView(PageConst.XTSZ_yhglModal,model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;

		}
	}
	
	/**
	 * 保存用户信息
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/user/saveUserInfo.action", method = RequestMethod.POST)
	public void saveUserInfo(
			HttpServletRequest request, HttpServletResponse response,ModelMap model) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			RoleBean role1 = (RoleBean)request.getSession(false).getAttribute("role");
			String userId = RequestUtil.getRequestParameter(request, "userId");
			User bean;
			if(StringUtils.isEmpty(userId)){
				bean = new User();
			}
			else{
				bean = ServiceManager.getUserService().getById(userId);
			}
			String passWord = RequestUtil.getRequestParameter(request, "passWord");
			if(!StringUtils.isEmpty(passWord)){
				passWord = Md5.getMD5(passWord.getBytes());
				bean.setPassWord(passWord);
			}
			String userName = RequestUtil.getRequestParameter(request, "userName");
			if(!StringUtils.isEmpty(userName)){
				bean.setUserName(userName);
			}
			String displayName = RequestUtil.getRequestParameter(request, "displayName");
			if(!StringUtils.isEmpty(displayName)){
				bean.setDisplayName(displayName);
			}
			String tel = RequestUtil.getRequestParameter(request, "tel");
			if(!StringUtils.isEmpty(tel)){
				bean.setTel(tel);
			}
			String roleId = RequestUtil.getRequestParameter(request, "roleId");
			if(!StringUtils.isEmpty(roleId)){
				bean.setRightLevel(roleId);
			}
			if("1".equals(roleId) || "2".equals(roleId)||"5".equals(roleId)||"4".equals(roleId)){
				bean.setRight_Content("all");
			}else{
				
			}
			
			String email = RequestUtil.getRequestParameter(request, "email");
			if(!StringUtils.isEmpty(email)){
				bean.setEmail(email);
			}
			String memo = RequestUtil.getRequestParameter(request, "memo");
				bean.setMemo(memo);
			bean.setBuiltInUser("0");
			try {
				if(StringUtils.isEmpty(bean.getId())){
					bean.setCreateTime(new Date());
					bean = ServiceManager.getUserService().save(bean);
					map.put("add", true);
				}
				else{
					ServiceManager.getUserService().update(bean);
					map.put("add", false);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			RoleBean role = ServiceManager.getRoleServiceImpl().getById(bean.getRightLevel());
			map.put("role", role);
			map.put("bean", bean);
			map.put("url",WebConstConfig.BASE_PATH + "user/userDel.action");  
			map.put("editUrl",WebConstConfig.BASE_PATH + "user/yhglModal.action"+"?userId="+bean.getId()+"");
//			return map;
			returnUserTemplate(request,model,response);
		} catch (Exception e) {
			e.printStackTrace();
//			return map;
		}
	}
	/*
	 * 返回模板
	 */
	private void returnUserTemplate(HttpServletRequest request,ModelMap model,HttpServletResponse response){
		try {
			RoleBean role = (RoleBean)request.getSession().getAttribute("role");
			model.addAttribute("role", role);
			List<User> list = ServiceManager.getUserService().findAll();
			List<RoleBean> roleList = ServiceManager.getRoleServiceImpl().findAll();
			model.addAttribute("roleList",roleList);
			model.addAttribute("userList",list);
			//模板路径   basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());
			FreeMarkerUtil.printWriterFile("yhglTem.ftl", "templates", model,response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 保存用户信息
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/user/updateUserInfo.action", method = RequestMethod.POST)
	public void updateUserInfo(
			HttpServletRequest request, HttpServletResponse response,ModelMap model) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			RoleBean role1 = (RoleBean)request.getSession(false).getAttribute("role");
			String userId = RequestUtil.getRequestParameter(request, "userId");
			User bean = ServiceManager.getUserService().getById(userId);
			String aoJianIds = RequestUtil.getRequestParameter(request, "ids");
			String content = RequestUtil.getRequestParameter(request, "content");
			
			if(!StringUtils.isEmpty(aoJianIds)){
				String curAoJianId = bean.getCurAoJianId();
				if(!StringUtils.isEmpty(curAoJianId)){
					if(!aoJianIds.contains(curAoJianId)){
						bean.setCurAoJianId("");
					}
				}
			}
			else{
				bean.setCurAoJianId("");
			}
			
			if(null!=aoJianIds){
				bean.setRight_Content(aoJianIds);
			}
			
			bean.setDispalyContent(content);
			
			ServiceManager.getUserService().update(bean);
			try {
				ServiceManager.getUserService().update(bean);
			} catch (Exception e) {
				e.printStackTrace();
			}
			returnUserTemplate(request,model,response);
		} catch (Exception e) {
			e.printStackTrace();
			return ;
		}
	}
	/**
	 * 删除用户操作
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/user/userDel.action", method = RequestMethod.POST)
	@ResponseBody
	public Map userDel(
			HttpServletRequest request, HttpServletResponse response,ModelMap model) {
		Map<String, Object> map = new HashMap<String, Object>();
		RoleBean role1 = (RoleBean)request.getSession(false).getAttribute("role");
		String userId = RequestUtil.getRequestParameter(request, "curDataId");
		try {
			ServiceManager.getUserService().delete(userId);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);
		}
		map.put("success", true);
		return map;
	}
	
	/**
	 * 用户廒间分配窗体
	 * @param request
	 * @param response  弹出廒间选择窗体之后需要有权限的廒间处于选中状态
	 * @param model
	 * @return
	 */
	@RequestMapping({"/user/aoJianSelectedModal.action"})
	public ModelAndView aoJianSelectedModal(
			HttpServletRequest request, HttpServletResponse response,
			ModelMap model) {
		try {
			RoleBean role1 = (RoleBean)request.getSession(false).getAttribute("role");
			User bean;
			String userId = RequestUtil.getRequestParameter(request, "userId");
			bean = ServiceManager.getUserService().getById(userId);
			//根据用户信息获取仓房列表,  后续添加用户权限过滤
			String ids = "";
			List<User> lqUserList = ServiceManager.getUserService().getListByRoleId("3");
			for (int i = 0; i < lqUserList.size(); i++) {
				User user = lqUserList.get(i);
				if(null!=user.getRight_Content()){
					ids = ids +user.getRight_Content();
				}
			}
			model.addAttribute("ids", ids);
			
			model.addAttribute("bean", bean);
			model.addAttribute("type","userPage");
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());
			return new ModelAndView(PageConst.XTSZ_aoJianSelectedModal1,model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;

		}
	}
	/**
	 * 用户组/角色管理页面
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	
	@RequestMapping({"/user/role.action"})
	public ModelAndView role(
			HttpServletRequest request, HttpServletResponse response,
			ModelMap model) {
		try {
			List<RoleBean> list = ServiceManager.getRoleServiceImpl().findAll();
			model.addAttribute("roleList",list);
			//模板路径   basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());
			//			model.addAttribute("user",request.getSession().getAttribute("user"));
			model.addAttribute("CURENT_TAB","XTSZ");
			model.addAttribute("CURENT_TAB_2","YHGL");
			return new ModelAndView(PageConst.XTSZ_ROLE,model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;

		}
	}
	/**
	 * 用户组添加窗体
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping({"/user/roleModal.action"})
	public ModelAndView roleModal(
			HttpServletRequest request, HttpServletResponse response,
			ModelMap model) {
		try {
			RoleBean role1 = (RoleBean)request.getSession(false).getAttribute("role");
			RoleBean bean;
			String roleId = RequestUtil.getRequestParameter(request, "roleId");
			if(StringUtils.isEmpty(roleId)){
				bean = new RoleBean();
			}
			else{
				bean = ServiceManager.getRoleServiceImpl().getById(roleId);
			}
			//角色列表
			List<RoleBean> roleList = ServiceManager.getRoleServiceImpl().findAll();
			model.addAttribute("roleList", roleList);
			//模板路径   basePath
			model.addAttribute("bean", bean);
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());
			return new ModelAndView(PageConst.XTSZ_roleModal,model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;

		}
	}
	/**
	 * 保存用户组信息
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/user/saveRoleInfo.action", method = RequestMethod.POST)
	@ResponseBody
	public Map saveRoleInfo(
			HttpServletRequest request, HttpServletResponse response,ModelMap model) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			RoleBean role1 = (RoleBean)request.getSession(false).getAttribute("role");
			String roleId = RequestUtil.getRequestParameter(request, "roleId");
			RoleBean bean;
			if(StringUtils.isEmpty(roleId)){
				bean = new RoleBean();
			}
			else{
				bean = ServiceManager.getRoleServiceImpl().getById(roleId);
			}
			
			String roleName = RequestUtil.getRequestParameter(request, "roleName");
			String remarks = RequestUtil.getRequestParameter(request, "remarks");
			String roleAuthority = RequestUtil.getRequestParameter(request, "roleAuthority");
			List<String> sList = new ArrayList<String>();
			for (int i = 1; i < 7; i++) {
				String field = "section"+i;
				String sectionValue = RequestUtil.getRequestParameter(request, field);
				if(!StringUtils.isEmpty(sectionValue)){
					sList.add(sectionValue);
				}			
			}
			if(sList.size()>0){
				Object[] idsStr = sList.toArray();
				String section = org.apache.commons.lang.StringUtils.join(idsStr,",");
				bean.setSection(section);
			}
			
			if(!StringUtils.isEmpty(roleName)){
				bean.setRoleName(roleName);
			}
			if(!StringUtils.isEmpty(remarks)){
				bean.setRemarks(remarks);
			}
			if(!StringUtils.isEmpty(roleAuthority)){
				bean.setRoleAuthority(roleAuthority);
			}
			
			try {
				if(StringUtils.isEmpty(bean.getId())){
					bean.setDefaultRole("1");
					bean.setBuiltInRole("0");
					bean.setCreateTime(new Date());
					bean = ServiceManager.getRoleServiceImpl().save(bean);
					map.put("add", true);
				}
				else{
					ServiceManager.getRoleServiceImpl().update(bean);
					map.put("add", false);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			map.put("bean", bean);
			map.put("url",WebConstConfig.BASE_PATH + "user/roleDel.action");  
			map.put("editUrl",WebConstConfig.BASE_PATH + "user/roleModal.action"+"?roleId="+bean.getId()+"");
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return map;
		}
	}
	
	/**
	 * 删除用户组操作
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/user/roleDel.action", method = RequestMethod.POST)
	@ResponseBody
	public Map roleDel(
			HttpServletRequest request, HttpServletResponse response,ModelMap model) {
		Map<String, Object> map = new HashMap<String, Object>();
		RoleBean role1 = (RoleBean)request.getSession(false).getAttribute("role");
		String userId = RequestUtil.getRequestParameter(request, "curDataId");
		try {
			ServiceManager.getRoleServiceImpl().delete(userId);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);
		}
		map.put("success", true);
		return map;
	}
	/**
	 * 权限分配窗口
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping({"/user/roleAuthorityModal.action"})
	public ModelAndView roleAuthorityModal(
			HttpServletRequest request, HttpServletResponse response,
			ModelMap model) {
		try {
			RoleBean role1 = (RoleBean)request.getSession(false).getAttribute("role");
			String roleId = RequestUtil.getRequestParameter(request, "roleId");
			RoleBean bean = ServiceManager.getRoleServiceImpl().getById(roleId);
			model.addAttribute("bean",bean);
			List<RoleBean> list = ServiceManager.getRoleServiceImpl().findAll();
			model.addAttribute("roleList",list);
			//模板路径   basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());
			//			model.addAttribute("user",request.getSession().getAttribute("user"));
			model.addAttribute("CURENT_TAB","YHGL");
			model.addAttribute("CURENT_TAB_2","YHGL");
			return new ModelAndView(PageConst.XTSZ_roleAuthorityModal,model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;

		}
	}
	
	@RequestMapping({"/user/personDetail.action"})
	public ModelAndView personDetail(
			HttpServletRequest request, HttpServletResponse response,
			ModelMap model) {
		try {
			String type = RequestUtil.getRequestParameter(request, "oType");
			model.addAttribute("oType", type);
			User user = (User)request.getSession(false).getAttribute("user");
			List<User> userlist = ServiceManager.getUserService().getByName(user.getUserName());
			model.addAttribute("bean", userlist.get(0));
			//模板路径   basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());
			//			model.addAttribute("user",request.getSession().getAttribute("user"));
			model.addAttribute("CURENT_TAB","XTSZ");
			model.addAttribute("CURENT_TAB_2","GRSZ");
			if(type.equals("detail")){
				model.addAttribute("CURENT_TAB_3","GRSZ");
			}else if(type.equals("password")){
				model.addAttribute("CURENT_TAB_3","MMXG");
			}else{
				model.addAttribute("fastLoginIn",user.getFastLoginIn());
				model.addAttribute("CURENT_TAB_3","KJDL");
			}
			return new ModelAndView(PageConst.XTSZ_personDetail,model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;

		}
	}
	
	@RequestMapping(value="/user/updatePersonDetail.action", method = RequestMethod.POST)
	public void updatePersonDetail(
			HttpServletRequest request, HttpServletResponse response,ModelMap model) {
		try {
			User bean = (User)request.getSession().getAttribute("user");
			String passWord = RequestUtil.getRequestParameter(request, "passWord");
			if(!StringUtils.isEmpty(passWord)){
				passWord = Md5.getMD5(passWord.getBytes());
				bean.setPassWord(passWord);
			}
			String userName = RequestUtil.getRequestParameter(request, "userName");
			if(!StringUtils.isEmpty(userName)){
				bean.setUserName(userName);
			}
			String displayName = RequestUtil.getRequestParameter(request, "displayName");
			if(!StringUtils.isEmpty(displayName)){
				bean.setDisplayName(displayName);
			}
			String tel = RequestUtil.getRequestParameter(request, "tel");
			if(!StringUtils.isEmpty(tel)){
				bean.setTel(tel);
			}
			String roleId = RequestUtil.getRequestParameter(request, "roleId");
			if(!StringUtils.isEmpty(roleId)){
				bean.setRightLevel(roleId);
			}
			String area = RequestUtil.getRequestParameter(request, "area");
			if(!StringUtils.isEmpty(area)){
				bean.setArea(area);
			}
			String email = RequestUtil.getRequestParameter(request, "email");
			if(!StringUtils.isEmpty(email)){
				bean.setEmail(email);
			}
			String memo = RequestUtil.getRequestParameter(request, "memo");
			if(!StringUtils.isEmpty(memo)){
				bean.setMemo(memo);
			}
			
			String fastLoginIn = RequestUtil.getRequestParameter(request, "fastLoginIn");
			if(!StringUtils.isEmpty(fastLoginIn)){
				bean.setFastLoginIn(fastLoginIn);
				
				request.getSession(false).removeAttribute("user");
				request.getSession(false).setAttribute("user", bean);
			}
			
			if("yes".equals(fastLoginIn)){
				User user = (User)request.getSession(false).getAttribute("user");
				RequestUtil.addCookie(response, "userName",user.getUserName(),5256000 * 60 * 1000);
				RequestUtil.addCookie(response, "userPwd",user.getPassWord(),5256000 * 60 * 1000);
			}else{
				RequestUtil.addCookie(response, "userName",null,0);
				RequestUtil.addCookie(response, "userPwd",null,0);
			}
			
			try {
				ServiceManager.getUserService().update(bean);
				//更新到session
				request.getSession(false).removeAttribute("user");
				request.getSession(false).setAttribute("user", bean);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	* @名称: updateUserFastCutInfo 
	* @日期：2015-10-15 下午1:43:38
	* @作者： lxb
	* @描述: 更新用户快捷操作
	* @参数 @param request
	* @参数 @param response
	* @参数 @param model
	* @参数 @return    
	* @返回值 Map    
	* @异常
	 */
	@RequestMapping(value="/user/updateUserFastCutInfo.action", method = RequestMethod.POST)
	@ResponseBody
	public Map updateUserFastCutInfo(
			HttpServletRequest request, HttpServletResponse response,ModelMap model) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			User user = (User)request.getSession(false).getAttribute("user");
			if(null == user){
				System.out.println("no user");
				return null;
			}
			String fastCutUrls = RequestUtil.getRequestParameter(request, "fastCutUrls");
			user.setFastCutUrls(fastCutUrls);
			try {
				ServiceManager.getUserService().update(user);
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				request.getSession(false).removeAttribute("user");
				request.getSession(false).setAttribute("user", user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
}
