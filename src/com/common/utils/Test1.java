package com.common.utils;

public class Test1  implements Runnable {
		
	private int n;
	private static volatile  String printStr = "";
	private Object obj = new Object();
	
	private static boolean isSy = true;
	public Test1(int i){
		n = i;
	}
	
	public static void main(String[] args) {
		for (int i = 0; i < 10; i++) {
			new Thread(new Test1(i)).start();
		}
	}
	
	public void run(){
		synchronized(obj){
			if(isSy){
				System.out.println(n);
				isSy = false;
			}
		}
	}
	
	
}
