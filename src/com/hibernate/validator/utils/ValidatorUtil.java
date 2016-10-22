package com.hibernate.validator.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ValidatorUtil {
	/**
	 * 
	 * @param pw
	 * @return
	 */
	public static boolean checkPassWord(String pw) {
		///^(?=.*[0-9].*)(?=.*[a-zA-Z].*).{8,}$/\
		if(pw.length()<8){
			return false;
		}
		int count = 0;
		Pattern pattern1 = Pattern.compile("^.*[0-9]+.*$");
		Matcher matcher1 = pattern1.matcher(pw);
		System.out.print(pw + ":");
		if (matcher1.matches()) {
			count++;
		}
		Pattern pattern2 = Pattern.compile("^.*[a-z]+.*$");
		Matcher matcher2 = pattern2.matcher(pw);
		if (matcher2.matches()) {
			count++;
		}
		Pattern pattern3 = Pattern.compile("^.*[A-Z]+.*$");
		Matcher matcher3 = pattern3.matcher(pw);
		if (matcher3.matches()) {
			count++;
		}
		Pattern pattern4 = Pattern.compile("^.*[@#\\.\\*\\+\\?\\$\\^\\-%����,;'\"������\\\\]+.*$");
		Matcher matcher4 = pattern4.matcher(pw);
		if (matcher4.matches()) {
			count++;
		}
		System.out.print("     " + count + "     ");
		if(count>=2){
			return true;
		}
		return false;
	}

}
