package com.common.utils;

public class Demo {
    //(1) "A"，"B", "C"  (2) "AA","BB","CC" (3) "ABC"-->"CBA"-->"BAC"
    public static void main(String[] args)throws Exception{
       String str = "ABC";
//       getThread(str);
       String[] arr1 = {"AA","BB","CC"};
       getThread(arr1);
       String[] arr2 = {"ABC","CBA","BAC"};
//       getThread(arr2);
    }
    
    private static void getThread(final String[] strArr) throws InterruptedException{
        Thread thread = new Thread(){
            public void run(){
	            String[] arr = (String[]) strArr;
	            for(int i = 0; i < arr.length; i++){
	                System.out.print(arr[i]+" ");
	            }
	            for (int j = 0; j <1000000000; j++) {
					System.out.println(j);
				}
            }
        };
        thread.start();
        long cureTime = System.currentTimeMillis();
        thread.join(cureTime+100000);
    }
    
    
}