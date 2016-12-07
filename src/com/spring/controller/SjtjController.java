package com.spring.controller;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

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
import com.hibernate.timers.utils.DateUtil;
import com.hibernate.userInfo.damain.RoleBean;
import com.spring.ServiceManager;

@Controller
public class SjtjController {
    @RequestMapping({"/sjtj/lists.action"})
    public ModelAndView sjtj_index(HttpServletRequest request,
                                   HttpServletResponse response, ModelMap model) {
        try {
        	String from = request.getParameter("from");
        	if(!StringUtils.isBlank(from)){
        		model.addAttribute("from", from);
        	}
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());

            model.addAttribute("CURENT_TAB", "SJTJ");
            model.addAttribute("CURENT_TAB_2", "index");
            model.addAttribute("CURENT_TAB_3", "index");

            return new ModelAndView(PageConst.SJTJ, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;
        }
    }

    @RequestMapping({"/sjtj/touch.action"})
    public ModelAndView sjtj_touch(HttpServletRequest request,
                                   HttpServletResponse response, ModelMap model) {
        try {
        	String from = request.getParameter("from");
        	if(!StringUtils.isBlank(from)){
        		model.addAttribute("from", from);
        	}
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());

            model.addAttribute("CURENT_TAB", "SJTJ");
            model.addAttribute("CURENT_TAB_2", "touch");
            model.addAttribute("CURENT_TAB_3", "touch");

            return new ModelAndView(PageConst.SJTJ_TOUCH, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;
        }
    }
    
    /**
     * 签约比例
     *
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping({"/sjtj/chart1.action"})
    public ModelAndView chart1(HttpServletRequest request,
                               HttpServletResponse response, ModelMap model) {
        try {
        	String from = request.getParameter("from");
        	if(!StringUtils.isBlank(from)){
        		model.addAttribute("from", from);
        	}
            Integer count = ServiceManager.getHouseBasicServce().getCount(request, "");
            List<DisplayBean> list = ServiceManager.getHouseBasicServce().getDisplayBeanList(" and c.id is not null ", "", 0, 0);
            double result = 0.00;
            if (count > 0 && null != list && list.size() > 0) {
                result = 100 * list.size() / Double.parseDouble(count+"");
            }
            BigDecimal bd = new BigDecimal(result);
            BigDecimal f1 = bd.setScale(2, BigDecimal.ROUND_HALF_UP);
            model.addAttribute("qybl", f1 + "%");
            // 模板路径 basePath
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            model.addAttribute("bean", new HouseBasic());
            model.addAttribute("CURENT_TAB", "SJTJ");
            model.addAttribute("CURENT_TAB_2", "chart1");
            model.addAttribute("CURENT_TAB_3", "chart1");
            return new ModelAndView(PageConst.SJTJ_chart1, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;

        }
    }
    
    @RequestMapping({"/sjtj/chart7.action"})
    public ModelAndView chart7(HttpServletRequest request,
                               HttpServletResponse response, ModelMap model) {
        try {

            // 模板路径 basePath
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            model.addAttribute("bean", new HouseBasic());
            model.addAttribute("CURENT_TAB", "SJTJ");
            model.addAttribute("CURENT_TAB_2", "chart7");
            model.addAttribute("CURENT_TAB_3", "chart7");
            return new ModelAndView(PageConst.SJTJ_chart7, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;

        }
    }

    /**
     * 总签约户数：  5562户
     *     今日交房户数：1250户
     *     累计交房户数：4900户
     *     剩余交房户数：662户
     */

    @RequestMapping({"/sjtj/chart4.action"})
    public ModelAndView chart4(HttpServletRequest request,
                               HttpServletResponse response, ModelMap model) {
        try {
        	String from = request.getParameter("from");
        	if(!StringUtils.isBlank(from)){
        		model.addAttribute("from", from);
        	}
            String pageSize = request.getParameter("pageSize");
            if (StringUtils.isBlank(pageSize)) {
                pageSize = "10";
            }
            List<Integer> list0 = ServiceManager.getHouseBasicServce().getListGroupBySection("0", "");//已经签约
            Integer result = 0;
            for (int i = 0; i < list0.size(); i++) {
                result = result + list0.get(i);
            }
            Integer yjf = ServiceManager.getHouseBasicServce().getSumHasOthers("1", "");
            Integer wjf = ServiceManager.getHouseBasicServce().getSumHasOthers("0", "");
            Integer jrjf = ServiceManager.getHouseBasicServce().getSumHasOthers("1", DateUtil.getDate(new Date()));
            model.addAttribute("zqy", result);
            model.addAttribute("yjf", yjf);
            model.addAttribute("wjf", wjf);
            model.addAttribute("jrjf", jrjf);
            if (yjf + wjf > 0) {
            	double d = (100.00 * yjf) / (yjf + wjf);
                BigDecimal bd = new BigDecimal(d);
                BigDecimal f1 = bd.setScale(2, BigDecimal.ROUND_HALF_UP);
                model.addAttribute("jfbi", f1 + "%");
            } else {
                model.addAttribute("jfbi", 0);
            }
            // 模板路径 basePath
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());

            model.addAttribute("CURENT_TAB", "SJTJ");
            model.addAttribute("CURENT_TAB_2", "chart4");
            model.addAttribute("CURENT_TAB_3", "chart4");
            return new ModelAndView(PageConst.SJTJ_chart4, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;

        }
    }

    /**
     * 签约排号展示
     *
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping({"/sjtj/chart2.action"})
    public ModelAndView chart2(HttpServletRequest request,
                               HttpServletResponse response, ModelMap model) {
        try {
        	String from = request.getParameter("from");
        	if(!StringUtils.isBlank(from)){
        		model.addAttribute("from", from);
        	}
            String pageSize = "7";
            if (StringUtils.isBlank(pageSize)) {
                pageSize = "7";
            }
            List<DisplayBean> list = ServiceManager.getHouseBasicServce().getDisplayBeanList(" and c.id is not null ", " order by c.indexnum desc ", 0, Integer.parseInt(pageSize));
            // 模板路径 basePath
            // 模板路径 basePath
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            model.addAttribute("list", list);
            model.addAttribute("CURENT_TAB", "SJTJ");
            model.addAttribute("CURENT_TAB_2", "chart2");
            model.addAttribute("CURENT_TAB_3", "chart2");
            return new ModelAndView(PageConst.SJTJ_chart2, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;

        }
    }
    
    @RequestMapping({"/sjtj/chart21.action"})
    public ModelAndView chart21(HttpServletRequest request,
                               HttpServletResponse response, ModelMap model) {
        try {
        	String from = request.getParameter("from");
        	if(!StringUtils.isBlank(from)){
        		model.addAttribute("from", from);
        	}
            String pageSize = request.getParameter("pageSize");
            if (StringUtils.isBlank(pageSize)) {
                pageSize = "10";
            }
            List<DisplayBean> list = ServiceManager.getHouseBasicServce().getDisplayBeanList(" and c.id is not null ", " order by c.indexnum desc ", 0, Integer.parseInt(pageSize));
            // 模板路径 basePath
            // 模板路径 basePath
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            model.addAttribute("list", list);
            model.addAttribute("CURENT_TAB", "SJTJ");
            model.addAttribute("CURENT_TAB_2", "chart2");
            model.addAttribute("CURENT_TAB_3", "chart2");
            return new ModelAndView(PageConst.SJTJ_chart21, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;

        }
    }

    /**
     * 各个标段的签约情况
     *
     * @param request
     * @param response
     * @param model
     * @return [{
     * name: '已签约',//[250, 189, 240, 310, 158, 250]
     * data: yqy,
     * }, {
     * name: '未签约',
     * data: [2],
     * }]
     */
    @RequestMapping({"/sjtj/chart3.action"})
    public ModelAndView chart3(HttpServletRequest request,
                               HttpServletResponse response, ModelMap model) {
        try {

        	String from = request.getParameter("from");
        	if(!StringUtils.isBlank(from)){
        		model.addAttribute("from", from);
        	}
            List<Integer> list0 = ServiceManager.getHouseBasicServce().getListGroupBySection("0", "");//已经签约
            List<Integer> list1 = ServiceManager.getHouseBasicServce().getListGroupBySection("1", "");//未签约
            StringBuffer sb = new StringBuffer();
            sb.append("[{\"name\":\"" + "已签约" + "\",\"data\":");
            sb.append(list0.toString());
            sb.append("},");
            sb.append("{\"name\":\"" + "未签约" + "\",\"data\":");
            sb.append(list1.toString());
            sb.append("}]");


            model.addAttribute("chartSeries", sb);
            model.addAttribute("zyqy", getSumList(list0));
            model.addAttribute("zwqy", getSumList(list1));
            // 模板路径 basePath
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            model.addAttribute("bean", new HouseBasic());
            model.addAttribute("CURENT_TAB", "SJTJ");
            model.addAttribute("CURENT_TAB_2", "chart3");
            model.addAttribute("CURENT_TAB_3", "chart3");
            return new ModelAndView(PageConst.SJTJ_chart3, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;

        }
    }
    @RequestMapping({"/sjtj/chart31.action"})
    public ModelAndView chart31(HttpServletRequest request,
                               HttpServletResponse response, ModelMap model) {
        try {
        	String from = request.getParameter("from");
        	if(!StringUtils.isBlank(from)){
        		model.addAttribute("from", from);
        	}
            List<Integer> list0 = ServiceManager.getHouseBasicServce().getListGroupBySection("0", "");//已经签约
            List<Integer> list1 = ServiceManager.getHouseBasicServce().getListGroupBySection("1", "");//未签约
            StringBuffer sb = new StringBuffer();
            sb.append("[{\"name\":\"" + "已签约" + "\",\"data\":");
            sb.append(list0.toString());
            sb.append("},");
            sb.append("{\"name\":\"" + "未签约" + "\",\"data\":");
            sb.append(list1.toString());
            sb.append("}]");


            model.addAttribute("chartSeries", sb);
            model.addAttribute("zyqy", getSumList(list0));
            model.addAttribute("zwqy", getSumList(list1));
            // 模板路径 basePath
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            model.addAttribute("bean", new HouseBasic());
            model.addAttribute("CURENT_TAB", "SJTJ");
            model.addAttribute("CURENT_TAB_2", "chart31");
            model.addAttribute("CURENT_TAB_3", "chart31");
            return new ModelAndView(PageConst.SJTJ_chart31, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;

        }
    }

    private Integer getSumList(List<Integer> list) {
        Integer result = 0;
        for (int i = 0; i < list.size(); i++) {
            result = result + list.get(i);
        }
        return result;
    }

    private Integer getBigSumList(List<BigDecimal> list) {
        Integer result = 0;
        for (int i = 0; i < list.size(); i++) {
            BigDecimal bi = list.get(i);
            if (null != bi) {
                result = result + bi.intValue();
            }
        }
        return result;
    }

    @RequestMapping({"/sjtj/chart5.action"})
    public ModelAndView chart5(HttpServletRequest request,
                               HttpServletResponse response, ModelMap model) {
        try {
        	String from = request.getParameter("from");
        	if(!StringUtils.isBlank(from)){
        		model.addAttribute("from", from);
        	}
            String pageSize = request.getParameter("pageSize");
            if (StringUtils.isBlank(pageSize)) {
                pageSize = "10";
            }
            Integer count = ServiceManager.getHouseBasicServce().getCount(request, "");
            List<DisplayBean> list = ServiceManager.getHouseBasicServce().getDisplayBeanList(" and c.id is not null ", "", 0, 0);
            double result = 0.00;
            if (count > 0 && null != list && list.size() > 0) {
                result = 100 * list.size() / count;
            }
            List<DisplayBean> azList = ServiceManager.getHouseBasicServce().getDisplayBeanList(" and c.id is not null and b.atype = '0' ", "", 0, 0);
            List<DisplayBean> hbList = ServiceManager.getHouseBasicServce().getDisplayBeanList(" and c.id is not null and b.atype = '1' ", "", 0, 0);

            model.addAttribute("yqy", list.size());
            model.addAttribute("wqy", count - list.size());
            model.addAttribute("az", azList.size());
            model.addAttribute("hb", hbList.size());
            // 模板路径 basePath
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            model.addAttribute("list", list);
            model.addAttribute("CURENT_TAB", "SJTJ");
            model.addAttribute("CURENT_TAB_2", "chart5");
            model.addAttribute("CURENT_TAB_3", "chart5");
            return new ModelAndView(PageConst.SJTJ_chart5, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;

        }
    }
    
    @RequestMapping({"/sjtj/chart51.action"})
    public ModelAndView chart51(HttpServletRequest request,
                               HttpServletResponse response, ModelMap model) {
        try {
        	String from = request.getParameter("from");
        	if(!StringUtils.isBlank(from)){
        		model.addAttribute("from", from);
        	}
            String pageSize = request.getParameter("pageSize");
            if (StringUtils.isBlank(pageSize)) {
                pageSize = "10";
            }
            Integer count = ServiceManager.getHouseBasicServce().getCount(request, "");
            List<DisplayBean> list = ServiceManager.getHouseBasicServce().getDisplayBeanList(" and c.id is not null ", "", 0, 0);
            double result = 0.00;
            if (count > 0 && null != list && list.size() > 0) {
                result = 100 * list.size() / count;
            }
            List<DisplayBean> azList = ServiceManager.getHouseBasicServce().getDisplayBeanList(" and c.id is not null and b.atype = '0' ", "", 0, 0);
            List<DisplayBean> hbList = ServiceManager.getHouseBasicServce().getDisplayBeanList(" and c.id is not null and b.atype = '1' ", "", 0, 0);

            model.addAttribute("yqy", list.size());
            model.addAttribute("wqy", count - list.size());
            model.addAttribute("az", azList.size());
            model.addAttribute("hb", hbList.size());
            // 模板路径 basePath
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            model.addAttribute("list", list);
            model.addAttribute("CURENT_TAB", "SJTJ");
            model.addAttribute("CURENT_TAB_2", "chart51");
            model.addAttribute("CURENT_TAB_3", "chart51");
            return new ModelAndView(PageConst.SJTJ_chart51, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;

        }
    }

    @RequestMapping({"/sjtj/chart6.action"})
    public ModelAndView chart6(HttpServletRequest request,
                               HttpServletResponse response, ModelMap model) {
        try {
        	String from = request.getParameter("from");
        	if(!StringUtils.isBlank(from)){
        		model.addAttribute("from", from);
        	}
            String pageSize = request.getParameter("pageSize");
            if (StringUtils.isBlank(pageSize)) {
                pageSize = "10";
            }

            int yjszs = 315;
            int ljs70zs = 315;
            int ljs75zs = 420;
            int ljs80zs = 315;
            int ljs85zs = 525;
            int sjszs = 210;

            int[] zsArr = {315, 315, 420, 315, 525, 210};

            List<BigDecimal> list = ServiceManager.getHouseBasicServce().getSumHouseInfo("", "");
            List<Integer> syList = new ArrayList<Integer>();
            for (int i = 0; i < zsArr.length; i++) {
                BigDecimal bi = list.get(i);
                int cur = 0;
                if (null == bi) {

                } else {
                    cur = bi.intValue();
                }
                syList.add(zsArr[i] - cur);
            }
            model.addAttribute("yx", list.toString());
            model.addAttribute("sy", syList.toString());
            model.addAttribute("syzs", getSumList(syList));
            model.addAttribute("yxzs", getBigSumList(list));
            // 模板路径 basePath
            // 模板路径 basePath
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            model.addAttribute("CURENT_TAB", "SJTJ");
            model.addAttribute("CURENT_TAB_2", "chart6");
            model.addAttribute("CURENT_TAB_3", "chart6");
            return new ModelAndView(PageConst.SJTJ_chart6, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;

        }
    }
    
    @RequestMapping({"/sjtj/chart61.action"})
    public ModelAndView chart61(HttpServletRequest request,
                               HttpServletResponse response, ModelMap model) {
        try {
        	String from = request.getParameter("from");
        	if(!StringUtils.isBlank(from)){
        		model.addAttribute("from", from);
        	}
            String pageSize = request.getParameter("pageSize");
            if (StringUtils.isBlank(pageSize)) {
                pageSize = "10";
            }

            int yjszs = 315;
            int ljs70zs = 315;
            int ljs75zs = 420;
            int ljs80zs = 315;
            int ljs85zs = 525;
            int sjszs = 210;

            int[] zsArr = {315, 315, 420, 315, 525, 210};

            List<BigDecimal> list = ServiceManager.getHouseBasicServce().getSumHouseInfo("", "");
            List<Integer> syList = new ArrayList<Integer>();
            for (int i = 0; i < zsArr.length; i++) {
                BigDecimal bi = list.get(i);
                int cur = 0;
                if (null == bi) {

                } else {
                    cur = bi.intValue();
                }
                syList.add(zsArr[i] - cur);
            }
            model.addAttribute("yx", list.toString());
            model.addAttribute("sy", syList.toString());
            model.addAttribute("syzs", getSumList(syList));
            model.addAttribute("yxzs", getBigSumList(list));
            // 模板路径 basePath
            // 模板路径 basePath
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            model.addAttribute("CURENT_TAB", "SJTJ");
            model.addAttribute("CURENT_TAB_2", "chart61");
            model.addAttribute("CURENT_TAB_3", "chart61");
            return new ModelAndView(PageConst.SJTJ_chart61, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;

        }
    }

    @RequestMapping({"/sjtj/chart100.action"})
    public ModelAndView chart100(HttpServletRequest request,
                                 HttpServletResponse response, ModelMap model) {
        try {
        	String from = request.getParameter("from");
        	if(!StringUtils.isBlank(from)){
        		model.addAttribute("from", from);
        	}
            model.addAttribute("BASE_PATH", WebConstConfig.BASE_PATH);
            model.addAttribute("BASE_ASSETS_PATH",
                    WebConstConfig.getBase_Assets_Path());
            model.addAttribute("BASE_TEMPLATE_DEFAULT_PATH",
                    WebConstConfig.getBase_Template_Default_Path());
            model.addAttribute("CURENT_TAB", "SJTJ");
            model.addAttribute("CURENT_TAB_2", "chart100");
            model.addAttribute("CURENT_TAB_3", "chart100");
            return new ModelAndView(PageConst.SJTJ_chart100, model);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
            return null;

        }
    }
}
