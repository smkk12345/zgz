package com.common.utils;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang.StringUtils;
import com.hibernate.userInfo.damain.User;
public class RequestUtil {

	
	/**
	 * 锟斤拷锟接︼拷锟铰凤拷锟�锟斤拷锟斤拷锟侥柯�
	 * @param request
	 * @return
	 */
	public static String getBasePath(HttpServletRequest request){
		String path = request.getContextPath();
		return request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	}
	
	/**
	 * 锟斤拷锟接︼拷梅锟斤拷锟斤拷锟斤拷锟斤拷锟�
	 * @param request
	 * @return
	 */
	public static String getServerName(HttpServletRequest request){
		
		return request.getServerName();
	}
	/**
	 * 锟斤拷锟絩equest 锟斤拷锟斤拷
	 * @param request
	 * @param key
	 * @return
	 */
	public static String getRequestParameter(HttpServletRequest request,String key){
		try {
			String param = request.getParameter(key);
			if("".equals(param)){
				return "";
			}else if(null==param){
				return "";
			}else{
				return param.trim();
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	/**
	 * 锟斤拷锟絩equest 锟斤拷锟斤拷
	 * @param request
	 * @param key
	 * @return
	 */
	public static String getRequestNumStr(HttpServletRequest request,String key){
		try {
			String param = request.getParameter(key);
			if("".equals(param) || null==param){
				return "";
			}else{
				if (param.indexOf(",") > -1) {
					param=param.replace(",", "");

				}
				return param;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	/**
	 * 锟斤拷锟絩equest url 锟斤拷锟斤拷
	 * @param request
	 * @param key
	 * @return
	 */
	public static String getHeaderReferParameter(HttpServletRequest request,String pa){
		try {
			String refer=request.getHeader("referer");
			if(StringUtils.isBlank(refer))
				return null;
			String parameter=ProcessRequestUrl.URLRequest(refer).get(pa);
			return parameter;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 锟斤拷玫锟角帮拷锟铰硷拷没锟�
	 * @param request
	 * @return
	 */
	public static User getCurrentUser(HttpServletRequest request){
		Object attr = request.getSession().getAttribute("user");
		if(attr != null && attr instanceof User ){
			return (User)attr;
		}else{
			return null;
		}
	}
	/**
	* @鍚嶇О: getCookieByName 
	* @鏃ユ湡锛�015-10-1 涓嬪崍5:21:44
	* @浣滆�锛�lxb
	* @鎻忚堪: 鑾峰彇cookie
	* @鍙傛暟 @param request
	* @鍙傛暟 @param name
	* @鍙傛暟 @return    
	* @杩斿洖鍊�Cookie    
	* @寮傚父
	 */
	public static Cookie getCookieByName(HttpServletRequest request,String name){
	    Map<String,Cookie> cookieMap = ReadCookieMap(request);
	    if(cookieMap.containsKey(name)){
	        Cookie cookie = (Cookie)cookieMap.get(name);
	        return cookie;
	    }else{
	        return null;
	    }   
	}
	
	/**
	 * 灏哻ookie灏佽鍒癕ap閲岄潰
	 * @param request
	 * @return
	 */
	private static Map<String,Cookie> ReadCookieMap(HttpServletRequest request){  
	    Map<String,Cookie> cookieMap = new HashMap<String,Cookie>();
	    Cookie[] cookies = request.getCookies();
	    if(null!=cookies){
	        for(Cookie cookie : cookies){
	            cookieMap.put(cookie.getName(), cookie);
	        }
	    }
	    return cookieMap;
	}
	
	/**
	聽* 璁剧疆cookie
	聽* @param response
	聽* @param name聽 cookie鍚嶅瓧
	聽* @param value cookie鍊�
	聽* @param maxAge cookie鐢熷懡鍛ㄦ湡聽 浠ョ涓哄崟浣�
	聽*/
	public static void addCookie(HttpServletResponse response,String name,String value,int maxAge){
		Cookie cookie = new Cookie(name,value);
		cookie.setPath("/");
		if(maxAge>0){
			cookie.setMaxAge(maxAge);
		}
		response.addCookie(cookie);
	}
}
