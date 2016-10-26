package com.spring.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import memcache.MemcacheUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.common.consts.PageConst;
import com.common.consts.WebConstConfig;
import com.common.utils.CommonUtils;
import com.common.utils.RequestUtil;
import com.common.utils.StringUtils;
import com.hibernate.base.Md5;
import com.hibernate.baseSettingInfo.domain.AlarmBean;
import com.hibernate.baseSettingInfo.domain.BaseSettingBean;
import com.hibernate.baseSettingInfo.domain.GrainTypeBean;
import com.hibernate.userInfo.damain.RoleBean;
import com.hibernate.userInfo.damain.User;
import com.spring.ServiceManager;
import com.spring.filter.SessionFilter;
import com.sun.corba.se.spi.activation.ServerManager;
import com.whalin.MemCached.MemCachedClient;

@Controller
public class IndexController {
	/**
	 * ie
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/ie.action")
	public ModelAndView ie(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		try {
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			return new ModelAndView(PageConst.ZY_IE, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}
	/**
	 * 锟斤拷页
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/login.action")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		try {
			// 模锟斤拷路锟斤拷 basepath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("CURENT_TAB", "INDEX");
			return new ModelAndView(PageConst.LOGIN, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}

	/**
	 * 锟斤拷页
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/validate.action", method = RequestMethod.POST)
	public void validateUser(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws IOException {
		String userName = RequestUtil.getRequestParameter(request, "username");
		String userPwd = RequestUtil.getRequestParameter(request, "password");
		String rePass = RequestUtil.getRequestParameter(request, "rePass");
		try {
			boolean isLogin = doLogin(userName, userPwd, request, false);
			response.setCharacterEncoding("utf-8");
			if (isLogin) {
				if ("yes".equals(rePass)) {
					RequestUtil.addCookie(response, "userName", userName, 5256000 * 60 * 1000);
					RequestUtil.addCookie(response, "userPwd", Md5.getMD5(userPwd.getBytes()), 5256000 * 60 * 1000);
				} else {
					rePass = "no";
					RequestUtil.addCookie(response, "userName", null, 0);
					RequestUtil.addCookie(response, "userPwd", null, 0);
					insertOperateRecord(request);
				}
				User user = (User) request.getSession(false).getAttribute("user");
				user.setFastLoginIn(rePass);

				ServiceManager.getUserService().update(user);
				RoleBean role = (RoleBean) request.getSession(false).getAttribute("role");
				String r = role.getRoleAuthority();
				if((r.charAt(0)+"").equals("2")){
					if((r.charAt(1)+"").equals("2")){
						response.getWriter().write("true"+WebConstConfig.BASE_PATH+"index.action");
					}else{
						response.getWriter().write("true"+WebConstConfig.BASE_PATH+"pgqq/fhfa.action");
					}
				}else if((r.charAt(3)+"").equals("2")){
					if((r.charAt(4)+"").equals("2")){
						response.getWriter().write("true"+WebConstConfig.BASE_PATH+"xy.action");
					}else{
						response.getWriter().write("true"+WebConstConfig.BASE_PATH+"sxh.action");
					}
				}else{
					response.getWriter().write("true"+WebConstConfig.BASE_PATH+"xtsz/jbsz.action");
				}
//				response.getWriter().write("true");
			} else {
				response.getWriter().write("false");
			}
			response.getWriter().flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 插入登陆操作记录
	 */
	private void insertOperateRecord(HttpServletRequest request) {
		SessionFilter filter = new SessionFilter();
		User user = (User) request.getSession().getAttribute("user");
		filter.syncOperateInfo(user, "/validate.action", request);
	}

	public boolean doLogin(String userName, String userPwd, HttpServletRequest request, boolean isCookLoginIn) {

		boolean isLogin = false;
		if (userName != null && userPwd != null) {
			if (!isCookLoginIn) {
				userPwd = Md5.getMD5(userPwd.getBytes());
			}
			List<User> userList = ServiceManager.getUserService().getByName(userName);
			User user = null;
			if (userList != null && userList.size() > 0) {
				user = userList.get(0);
			}
			if (user != null) {
				if (true) {// 登录成功userPwd.equals(user.getPassWord())
					
					isLogin = true;

					RoleBean role = ServiceManager.getRoleServiceImpl().getById(user.getRightLevel());
					if (role == null) {
						System.out.println("Error");
					}
					HttpSession s = request.getSession();
					s.setAttribute("user", user);
					s.setAttribute("role", role);
					//cacheTime
//					BaseSettingBean baseSettingBean = ServiceManager.getBaseSettingServiceImpl().findValueByKey("cacheTime");
//					if(null==baseSettingBean||StringUtils.isEmpty(baseSettingBean.getValue())){
//						s.setAttribute("cacheTime", "0.1");
//					}else{
//						s.setAttribute("cacheTime", baseSettingBean.getValue());
//					}
					
				}else{
					isLogin = false;
				}
			}
		}
		return isLogin;
	}

	private String getCurProvinces() {
		BaseSettingBean bean = ServiceManager.getBaseSettingServiceImpl().findValueByKey("szsf");
		return bean.getValue();
	}



	

	@RequestMapping({ "/index1.action" })
	public ModelAndView indexPage(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		try {
			User user = (User) request.getSession().getAttribute("user");
			if (null == user) {
				// 未锟斤拷陆,锟斤拷锟斤拷
			} else {
				
				List<String> idList = new ArrayList<String>();
				String aoJianIds = user.getRight_Content();
				if ("all".equals(aoJianIds)) {
					 //barnList = ServiceManager.getBarnServiceImpl().findAll();
				} else if(!StringUtils.isEmpty(aoJianIds)) {
					String[] idArr = aoJianIds.split("#");
					for (int i = 0; i < idArr.length; i++) {
						String id = idArr[i];
						
					}
				}else{
					
				}
				// 将用户自己管理的仓房放前面，后面添加默认的

			}
			List<User> lqyList = ServiceManager.getUserService().getListByRoleId("4");
			String lqyDisplayName = "";
			for (int i = 0; i < lqyList.size(); i++) {
				if(i<lqyList.size()-1){
					lqyDisplayName = lqyDisplayName + lqyList.get(i).getDisplayName()+",";
				}
				else{
					lqyDisplayName = lqyDisplayName + lqyList.get(i).getDisplayName();
				}
			}
			model.addAttribute("lqyDisplayName", lqyDisplayName);
			List<User> userList = ServiceManager.getUserService().getListByRoleId("3");
			model.addAttribute("userList", userList);
			// 模锟斤拷路锟斤拷 basePath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH", WebConstConfig.getBase_Template_Default_Path());
			model.addAttribute("CURENT_TAB", "INDEX");
			
			Map<String,Map<String,String>> map = getIndexOperateFastCut();
			model.addAttribute("operateFastCut", map);
			return new ModelAndView(PageConst.INDEX, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}

	
	private Map<String,Map<String,String>> getIndexOperateFastCut(){
		Map<String,Map<String,String>> map = new HashMap<String,Map<String,String>>(){{
			put("粮情检测", new HashMap<String, String>(){{put("查看粮情", "lqjc/ssjc.action");put("云图分析", "lqjc/ytfx.action");put("粮食信息", "lqjc/lsxx.action");}});
			put("信息管理", new HashMap<String, String>(){{put("告警查询", "lqjc/ssjc.action");put("操作查询", "lqjc/ytfx.action");}});
			put("系统设置", new HashMap<String, String>(){{put("基本设置", "lqjc/ssjc.action");put("仓房设置", "lqjc/ytfx.action");put("粮情配置", "lqjc/lsxx.action");}});
		}};
		return map;
	}
	
	@RequestMapping(value = "/validatePassWord.action", method = RequestMethod.POST)
	@ResponseBody
	public boolean validatePassWord(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws IOException {
		String passWord = RequestUtil.getRequestParameter(request, "passWord");
		User user = (User) request.getSession(false).getAttribute("user");
		List<User> userbeanlist = ServiceManager.getUserService().getByName(user.getUserName());
		String newPasWord = Md5.getMD5(passWord.getBytes());
		if (userbeanlist.get(0).getPassWord().equals(newPasWord)) {
			return true;
		} else {
			return false;
		}
	}
	
	@RequestMapping(value = "/validateUserName.action", method = RequestMethod.POST)
	@ResponseBody
	public boolean validateUserName(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws IOException {
		String UserName = RequestUtil.getRequestParameter(request, "UserName");
		List<User> user = ServiceManager.getUserService().getByName(UserName);
		
		if (null!=user && user.size()>0) {
			return false;
		} else {
			return true;
		}
	}

	/**
	 * 页锟斤拷通锟斤拷ajax锟斤拷取锟矫伙拷锟斤拷息
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/getUserInfo.action")
	@ResponseBody
	public Map getUserInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		Map<String, Object> map = new HashMap<String, Object>();
		User user;
		if (request.getSession().getAttribute("user") != null) {
			user = (User) request.getSession().getAttribute("user");
		} else {
			user = new User();
		}
		map.put("user", user);
		return map;
	}

	/**
	 * 閫�嚭
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/quit.action")
	public ModelAndView quit(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		HttpSession s = request.getSession(false);
		try {
			s.invalidate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
		model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
		model.addAttribute("CURENT_TAB", "INDEX");
		return new ModelAndView(PageConst.LOGIN, model);
	}
	/**
	* @名称: login 
	* @日期：2015-10-15 上午11:38:56
	* @作者： lxb
	* @描述: 用户快捷操作 
	* @参数 @param request
	* @参数 @param response
	* @参数 @param model
	* @参数 @return    
	* @返回值 ModelAndView    
	* @异常
	 */
	@RequestMapping(value = "/fastCut.action")
	public ModelAndView fastCut(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		try {
			// 模锟斤拷路锟斤拷 basepath
			model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
			model.addAttribute("BASE_ASSETS_PATH", WebConstConfig.getBase_Assets_Path());
			model.addAttribute("CURENT_TAB", "INDEX");
			return new ModelAndView(PageConst.fastCut, model);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
	}
}
