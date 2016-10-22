package com.spring.interceptor;

public class RightHelper {

	/**
	 * �жϵ�ǰλ�õ�Ȩ�ޱ���  ���Ϊ0���ʾ��Ȩ�ޣ�
	 * @param akey  Ȩ��λ  index
	 * @param aString  Ȩ�ޱ���   ��   01111000011��
	 * @return
	 */
	public static boolean hasRight(int akey,String aString){
		if(aString==null || "".equals(aString)){
			return false;
		}
		char value = aString.charAt(akey);
		if(value == '1'||value == '2'){
			return true;
		}
		return false;

	}


}
