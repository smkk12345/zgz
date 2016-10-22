package com.hibernate.utils;

public class SystemContext {
	
	private  static ThreadLocal<Integer> pageSize = new ThreadLocal<Integer>();
	private static ThreadLocal<Integer> pageOffset = new ThreadLocal<Integer>();
	private static ThreadLocal<String> order = new ThreadLocal<String>();
	private static ThreadLocal<String> orderS = new ThreadLocal<String>();
	public static Integer getPageSize() {
		return pageSize.get();
	}
	public static void setPageSize(Integer _pageSize) {
		pageSize.set(_pageSize);
	}
	public static Integer getPageOffset() {
		return pageOffset.get();
	}
	public static void setPageOffset(Integer _pageOffset) {
		pageOffset.set(_pageOffset);
		
	}
	public static String getOrder() {
		return order.get();
	}
	public static void setOrder(String _order) {
		order.set(_order);
	}
	public static String getOrderS() {
		return orderS.get();
	}
	public static void setOrderS(String _orderS) {
		orderS.set(_orderS);
	}
	public static void removeOffSet(){
		
		pageOffset.remove();
		
	}
public static void removesize(){
		
	pageSize.remove();
		
	}
public static void removeorders(){
	
	orderS.remove();
}
public static void removeorder(){
	
	order.remove();
}
	

}
