package com.spring.controller;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.common.consts.Contanst;
import com.common.consts.PageConst;
import com.common.consts.WebConstConfig;
import com.common.utils.StringUtils;
import com.hibernate.houseinfo.domain.Agreement;
import com.hibernate.houseinfo.domain.DisplayBean;
import com.hibernate.houseinfo.domain.HouseBasic;
import com.hibernate.houseinfo.domain.IndexNum;
import com.hibernate.timers.utils.DateUtil;
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
	@ResponseBody
	public Map<String,String> get(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		Map<String,String> map = new HashMap<String, String>();
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
			Agreement agreenment = ServiceManager.getAgreenmentService().getById(agreenmentid);
			HouseBasic housebasic = ServiceManager.getHouseBasicServce().getHouseBasicById(housebsicid, "1,2,3,4,5,6,7");
			if (null == indexNum) {
				if(!Contanst.houseBasicidSet.contains(housebsicid)){
					Contanst.houseBasicidSet.add(housebsicid);
					indexNum = ServiceManager.getIndexNumService().getIndexNum(ip, user, housebsicid,agreenment.getAtype());
					//更新协议的
					int year = DateUtil.getYear(new Date());
					if(agreenment.getAtype().equals("0")){
						String indexStr = Contanst.AGREENMENT_TYPE_AZ.replace("?", housebasic.getSection().trim());
						indexStr  =indexStr + year+"-"+getIndexNumStr(indexNum.getIndexnum());
						agreenment.setProtocolnumber(indexStr);
					}else{
						String indexStr = Contanst.AGREENMENT_TYPE_HB.replace("?", housebasic.getSection().trim());
						indexStr  =indexStr + year+"-"+getIndexNumStr(indexNum.getIndexnum());
						agreenment.setProtocolnumber(indexStr);
						agreenment.setQfbz(new BigDecimal(0));
						agreenment.setYhzbwxmbc(new BigDecimal(0));
					}
					ServiceManager.getAgreenmentService().update(agreenment);
					housebasic.setIslock("1");
					ServiceManager.getHouseBasicServce().justUpdateHouseBasic(housebasic);
					map.put("protocolumnber", agreenment.getProtocolnumber());
					map.put("displaydate", indexNum.getDisplaydate());
				}else{
					
				}
			}else{
				map.put("protocolumnber", agreenment.getProtocolnumber());
				map.put("displaydate", indexNum.getDisplaydate());
			}
			try {
				map.put("indexnum", indexNum.getIndexnum()+"");
				map.put("indexNum", JSONObject.fromObject(indexNum).toString());
				model.addAttribute("indexNum", indexNum);
			} catch (Exception e) {
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return null;
		}
		return map;
	}

	private String getIndexNumStr(Long indexNum2) {
		// TODO Auto-generated method stub
		if(null != indexNum2){
			DecimalFormat df=new DecimalFormat("000");
			String str2=df.format(indexNum2);
			return str2;
		}else{
			return "";
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
		String sql = getSxhSql(role.getSection(), request, model);
		List<DisplayBean> list = ServiceManager.getHouseBasicServce()
				.getDisplayBeanList(sql,"", (intPageNum - 1) * intPageSize, intPageSize);
		
		Integer count = ServiceManager.getHouseBasicServce().getDisPlayCount(sql);

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

	private String getSxhSql(String section,HttpServletRequest request, ModelMap model) {
		// TODO Auto-generated method stub
		StringBuffer sb = new StringBuffer();
		sb.append(" and  c.id is not null ");
		sb.append(" and a.section in ("+section+")");
		sb.append(" and b.atype = '").append("0").append("'");
		String names = request.getParameter("names");
		String  mobile = request.getParameter("mobile");
		String idcard = request.getParameter("idcard");
		String indexnum = request.getParameter("indexnum");
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
		return sb.toString();
	}
	
}
