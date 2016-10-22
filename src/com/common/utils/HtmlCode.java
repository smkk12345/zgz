package com.common.utils;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class HtmlCode {
	public static String getContent(String urlString) throws Exception {
		// 生成一个URL对象
		URL url = new URL(urlString);
		// 打开URL
		HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
		// 得到输入流，即获得了网页的内容
		BufferedReader reader = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		String line;
		// 读取输入流的数据，并显示
		StringBuffer sb = new StringBuffer("");
		while ((line = reader.readLine()) != null) {
			System.out.println(line);
			sb.append(line);
		}
		return sb.toString();
	}
}
