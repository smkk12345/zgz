package com.common.utils;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.LinkedList;
import java.util.Vector;

public class test extends FatherTest{
	
	public Object obj = new Object();
	
	public test(){
		System.out.println("create");
	};
	public static void main(String[] args){
		//		new test();----验证继承体系中方法执行顺序
//		MyThread mt = new MyThread("aa");
	}
	
	{System.out.println("aa");}
	
	static{System.out.println("static--bb");}
	
	
	class MyThread extends Thread{
		String curStr = "";
		public MyThread(String str){
			curStr = str;
		}
		
		public void run(){
			synchronized (obj) {
				System.out.println(curStr);
			}
		}
	}
	
	
	
}

	    class FatherTest{
		public FatherTest(){
			System.out.println("createFather");
		}
		
		{System.out.println("father--aa");}
		
		static{System.out.println("static---father--bb");}
	}
	    
	    
	