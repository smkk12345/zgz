package com.ftlTemplates;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import freemarker.template.Configuration;
import freemarker.template.ObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class FreeMarkerUtil {
	/**
	 * 获取指定目录下的模板文件
	 * @param name       模板文件的名称
	 * @param pathPrefix 模板文件的目录
	 * public void setClassForTemplateLoading(Class clazz, String pathPrefix);  通过类寻找模板
	 * public void setDirectoryForTemplateLoading(File dir) throws IOException;   通过文件寻找模板 
	 * public void setServletContextForTemplateLoading(Object servletContext, String path);  通过ServletContext寻找模板
	 */
	public static Template getTemplate(String name, String pathPrefix) throws IOException{
		Configuration cfg = new Configuration(); //通过FreeMarker的Configuration对象可以读取ftl文件
		cfg.setClassForTemplateLoading(FreeMarkerUtil.class, pathPrefix); //设置模板文件的目录
		cfg.setDefaultEncoding("UTF-8");       //Set the default charset of the template files
		Template temp = cfg.getTemplate(name); //在模板文件目录中寻找名为"name"的模板文件
		return temp; //此时FreeMarker就会到类路径下的"pathPrefix"文件夹中寻找名为"name"的模板文件
	}
	
	/**
	 * 根据模板文件输出内容到控制台
	 * @param name       模板文件的名称
	 * @param pathPrefix 模板文件的目录
	 * @param rootMap    模板的数据模型
	 */
	public void print(String name, String pathPrefix, Map<String,Object> rootMap) throws TemplateException, IOException{
		
		this.getTemplate(name, pathPrefix).process(rootMap, new PrintWriter(System.out));  
	}
	
	/**
	 * 根据模板文件输出内容到指定的文件中
	 * @param name       模板文件的名称
	 * @param pathPrefix 模板文件的目录
	 * @param rootMap    模板的数据模型
	 * @param file       内容的输出文件
	 */
	public static void printFile(String name, String pathPrefix, Map<String,Object> rootMap, File file) throws TemplateException, IOException{
		Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), "UTF-8"));
		FreeMarkerUtil.getTemplate(name, pathPrefix).process(rootMap, out); //将模板文件内容以UTF-8编码输出到相应的流中
		if(null != out){
			out.close();
		}
	}
	
	/**
	 * 根据模板文件输出内容到指定的PrintWriter中
	 * @param name       模板文件的名称
	 * @param pathPrefix 模板文件的目录
	 * @param rootMap    模板的数据模型
	 * @param file       内容的输出文件
	 */
	public static void printWriterFile(String name,String pathPrefix, Map<String,Object> rootMap, HttpServletResponse response) throws TemplateException, IOException{
		response.setCharacterEncoding("utf-8");  
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		try{
			FreeMarkerUtil.getTemplate(name, pathPrefix).process(rootMap, out);
		}catch(TemplateException e){
			e.printStackTrace();
		}
		finally{
            out.flush();  
			out.close();  
		}
	}
}