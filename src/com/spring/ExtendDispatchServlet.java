package com.spring;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.ModelAndView;

import com.hibernate.sernsorInfo.domain.OperateRecordBean;
import com.hibernate.userInfo.damain.User;

public class ExtendDispatchServlet extends DispatcherServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2637665035452336907L;

	
	
	public void render(ModelAndView mv, HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			super.render(mv, request, response);
		} catch (ServletException e) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
		}
	}

}
