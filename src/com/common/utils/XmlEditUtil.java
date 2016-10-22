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
//				//Ϊcdr����������������ֵElement
//				elements.setAttribute("name", "" + j);   
//				//��cdr��ǩ�ڲ�����µ�Ԫ�أ���cdr����һ����ǩ����ǩ������Ϊusername,ֵΪss
//				elements.addContent(new Element("username").setText("ss")); 
//				elements.addContent(new Element("password").setText("dd"));  
//				//���Ѿ����ú�ֵ��elements����root
//				root.addContent(elements);  
			}

		} catch (Exception e) {  
			System.out.println("=============================> ��ȡ���е������ļ�����");  
			e.printStackTrace();  
		}  
		return rights;
	}
}
