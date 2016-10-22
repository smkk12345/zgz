package com.common.utils;

import java.io.File;
import java.util.Iterator;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

public class XmlEditUtil {


	public static String editXml(String userName){
		String rights = "";
		try {  
			String path = Thread.currentThread().getContextClassLoader()  
					.getResource("section.xml").getPath();  
			File f = new File(path);  
			SAXReader reader = new SAXReader();  
			Document doc = reader.read(f);  
			Element root = doc.getRootElement();  
			Element foo;  
			Iterator i = root.elementIterator("user");  
			while (i.hasNext()) {  
				foo = (Element) i.next(); 

				String name = foo.elementText("userName");  
				if(name.equals(userName)){
					rights = foo.elementText("rights"); 
					return rights;
				}
				//				tempArea.setValue(foo.elementText("DISPLAY"));  
				//				result.add(tempArea);  
			}  
			if(StringUtils.isEmpty(rights)){
//				Element elements = new Element("user");   
//				//为cdr设置属性名和属性值Element
//				elements.setAttribute("name", "" + j);   
//				//在cdr标签内部添加新的元素，即cdr的下一级标签，标签属性名为username,值为ss
//				elements.addContent(new Element("username").setText("ss")); 
//				elements.addContent(new Element("password").setText("dd"));  
//				//将已经设置好值的elements赋给root
//				root.addContent(elements);  
			}

		} catch (Exception e) {  
			System.out.println("=============================> 读取所有地区的文件错误");  
			e.printStackTrace();  
		}  
		return rights;
	}
}
