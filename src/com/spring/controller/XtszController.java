package com.spring.controller;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.common.consts.Contanst;
import com.common.consts.PageConst;
import com.common.consts.WebConstConfig;
import com.common.utils.CalendarUtil;
import com.common.utils.CommonUtils;
import com.common.utils.GenerateSequenceUtil;
import com.common.utils.RequestUtil;
import com.common.utils.StringUtils;
import com.ftlTemplates.FreeMarkerUtil;
import com.hibernate.baseSettingInfo.domain.AlarmBean;
import com.hibernate.baseSettingInfo.domain.BaseSettingBean;
import com.hibernate.baseSettingInfo.domain.GrainTypeBean;
import com.hibernate.timers.domain.TimerTaskBean;
import com.hibernate.userInfo.damain.RoleBean;
import com.hibernate.userInfo.damain.User;
import com.spring.ServiceManager;
@Controller
public class XtszController {
    private static Logger logger = Logger.getLogger(Logger.class);
    /**
     * 浠撴埧璁剧疆
     * 
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping({ "/xtsz/jbsz.action"})
    public ModelAndView barnSetting(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        try {
            User user = (User) request.getSession().getAttribute("user");
            if (null != user) {
                model.addAttribute("theme", user.getTheme());
            }
            model.addAttribute("sensorList", null);
            model.addAttribute("grainList", null);
            // 妯℃澘璺¯寰 basePath
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            // model.addAttribute("user",request.getSession().getAttribute("user"));
            model.addAttribute("CURENT_TAB", "XTSZ");
            model.addAttribute("CURENT_TAB_2", "JBSZ");
            return new ModelAndView(PageConst.XTSZ_JBSZ, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;
        }
    }
    
    
   @RequestMapping({ "/xtsz/xtsd.action"})
   public ModelAndView xtsd(HttpServletRequest request,
           HttpServletResponse response, ModelMap model) {
       try {
    	   RoleBean role = (RoleBean) request.getSession().getAttribute("role");
           if (null == role) {
        	   return null;
           }
			String authority = role.getRoleAuthority();
//			if(authority.substring(15, 16).equals("2")){
//				Contanst.TEM_STOP = true;
//			}
           // 妯℃澘璺¯寰 basePath
           model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
           model.addAttribute("BASE_ASSETS_PATH",
                   WebConstConfig.getBase_Assets_Path());
           model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                   WebConstConfig.getBase_Template_Default_Path());
           // model.addAttribute("user",request.getSession().getAttribute("user"));
           model.addAttribute("CURENT_TAB", "XTSZ");
           model.addAttribute("CURENT_TAB_2", "XTSD");
           
           model.addAttribute("tem_stop", Contanst.TEM_STOP);
           return new ModelAndView(PageConst.XTSZ_XTSD, model);
       } catch (Exception e) {
           e.printStackTrace();
           model.addAttribute("error", e.getMessage());
           return null;
       }
   }
   
   @RequestMapping({ "/xtsz/sdcz.action"})
   @ResponseBody
   public String sdcz(HttpServletRequest request,
           HttpServletResponse response, ModelMap model) {
       try {
    	   String sd = request.getParameter("sd");
    	   if(sd.equals("0")){
    		   Contanst.TEM_STOP = false;
    	   }else{
    		   Contanst.TEM_STOP = true;
    	   }
           model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
           model.addAttribute("BASE_ASSETS_PATH",
                   WebConstConfig.getBase_Assets_Path());
           model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                   WebConstConfig.getBase_Template_Default_Path());
           // model.addAttribute("user",request.getSession().getAttribute("user"));
           model.addAttribute("CURENT_TAB", "XTSZ");
           model.addAttribute("CURENT_TAB_2", "XTSD");
           
           model.addAttribute("tem_stop", Contanst.TEM_STOP);
           return "success";
       } catch (Exception e) {
           e.printStackTrace();
           model.addAttribute("error", e.getMessage());
           return null;
       }
   }
 
}
