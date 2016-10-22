package com;

import javax.jws.WebService;
import javax.xml.ws.Endpoint;

@WebService
public class webService {
	/** 
	 * @名称: main 
	 * @日期：2016-1-7 下午3:30:53
	 * @作者： lxb
	 * @描述: TODO 
	 * @参数 @param args    
	 * @返回值 void    
	 * @异常 
	 */
	public static void main(String[] args) {
		Endpoint.publish("http://127.0.0.1:8080/Service/WebService", new webService());
		System.out.println("service success");
	}
	
	public String getValue(String value){
		return "lxb has a "+value;
	}
}
