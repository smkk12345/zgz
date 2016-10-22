package com.spring.interceptor;

import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.common.consts.WebConstConfig;
import com.common.utils.RequestUtil;
import com.hibernate.userInfo.damain.User;

public class RequestInitializeInterceptor implements HandlerInterceptor{
	
	private static boolean isOk = false;
	public boolean preHandle(HttpServletRequest request,  
			HttpServletResponse response,Object handler)throws Exception{
		StringBuffer  url=request.getRequestURL();
		
		if(!isOk){
			initConstPath(request);
			isOk = true;
		}
		HandlerMethod handler2=(HandlerMethod) handler;
		RightAnnotation rightAnnotation = handler2.getMethodAnnotation(RightAnnotation.class);

		if(null == rightAnnotation){
			//没有声明权限,放行
			return true;
		}
		HttpSession session = request.getSession(false);
		User user = (User)session.getAttribute("user");
		boolean aflag = false;

		for(OperateRightType at:rightAnnotation.operateRightTypes()){
			if(RightHelper.hasRight(at.getOperateIndex(), user.getRight_Content())==true){
				aflag = true;
				break;
			}
		}

		if(false == aflag){
			//访问的是页面的话，处理
			if (rightAnnotation.resultType() == ResultType.page) {
				//如果是json  也就是页面的阿贾克斯请求
			} else if (rightAnnotation.resultType() == ResultType.json) {
				//“ajax”类型的请求
			}
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=UTF-8");
			OutputStream out = response.getOutputStream();
			PrintWriter pw = new PrintWriter(new OutputStreamWriter(out,"utf-8"));
			pw.println("您没有该操作的访问权限");
			pw.flush();
			pw.close();
			return false;
		}
		return true;
	}
	
	private void initConstPath(HttpServletRequest request){
		WebConstConfig.BASE_PATH = RequestUtil.getBasePath(request);
		WebConstConfig.REAL_BASE_PATH = request.getRealPath("");
	}
	
	public void postHandle(HttpServletRequest request,HttpServletResponse response,  
			Object handler,ModelAndView modelAndView)throws Exception{ 
	}  
	public void afterCompletion(HttpServletRequest request,  
			HttpServletResponse response,Object handler,Exception ex)throws Exception{  
	}  
}

