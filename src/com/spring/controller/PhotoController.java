package com.spring.controller;


import com.hibernate.houseinfo.service.PhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * 档案管理
 * Created by ccj on 2016/12/9.
 */
@Controller
public class PhotoController {
    @Autowired
    private PhotoService photoService;

    @RequestMapping({"/photo/index.action"})
    public String index(HttpServletRequest request, ModelMap modelMap){
        return "/WEB-INF/pages/jsp/photo/index.jsp";
    }

}
