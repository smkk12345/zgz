package com.common.utils;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.math.BigInteger;
import java.util.Date;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
public class OverTimeXmlUtils {
	/**
	 * @名称: main
	 * @日期：2016-3-18 上午10:06:19
	 * @作者： lxb
	 * @描述: 过期时间读写xml专用工具类-----提供两个方向的---读---写
	 * @参数 @param args
	 * @返回值 void
	 * @异常
	 */
	public static void main(String[] args) {
		String path = "D:\\work\\www\\lqt\\WebRoot\\data\\sys\\RecentNewDataTime.xml";
		System.out.println(getPointValueFromXml(path, "123"));
	}
	
	public static String getPointValueFromXml(String path, String nodeName) {
		String result = "";
		boolean isExist = false;
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		try {
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document doc = db.parse(path);
			NodeList nList = doc.getElementsByTagName("aoJian");
			for (int i = 0; i < nList.getLength(); i++) {
				Node typeNode = (Node) nList.item(i);
				NamedNodeMap nameMap = typeNode.getAttributes();
				Node idNode = nameMap.getNamedItem("id");
				if (idNode.getNodeValue().equals(nodeName)) {
					result = typeNode.getTextContent();
					isExist = true;
					break;
				}
			}
			if (!isExist) {
				insertNodeByNodeName(nodeName, doc, path);
				save(doc, path);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	/**
	 * @名称: updateNodeValue
	 * @日期：2016-3-18 下午2:26:43
	 * @作者： lxb
	 * @描述: 更新节点时间
	 * @返回值 void
	 * @异常
	 */
	public static boolean updateNodeValue(String path, String nodeName,
			String newValue) {
		boolean success = true;
		boolean isExist = false;
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		try {
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document doc = db.parse(path);
			NodeList nList = doc.getElementsByTagName("aoJian");
			for (int i = 0; i < nList.getLength(); i++) {
				Node typeNode = (Node) nList.item(i);
				NamedNodeMap nameMap = typeNode.getAttributes();
				Node idNode = nameMap.getNamedItem("id");
				if (idNode.getNodeValue().equals(nodeName)) {
					typeNode.setTextContent(newValue);
					isExist = true;
					break;
				}
			}
			if (!isExist) {
				insertNodeByNodeName(nodeName, doc, path);
			}
			save(doc, path);
		} catch (Exception e) {
			e.printStackTrace();
			success = false;
		}
		return success;
	}
	private static void insertNodeByNodeName(String nodeName, Document doc,
			String path) {
		try {
			Element e = doc.getDocumentElement();
			Element newElement = doc.createElement("aoJian");
			String curDateStr = CalendarUtil.formatStr(new Date(),
					CalendarUtil.DATE_FORMAT_MODE4);
			newElement.setTextContent(curDateStr);
			newElement.setAttribute("id", nodeName);
			e.appendChild(newElement);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private static void save(Document doc, String path) {
		// TODO Auto-generated method stub
		try {
			FileOutputStream fos = new FileOutputStream(path);
			OutputStreamWriter outwriter = new OutputStreamWriter(fos);
			
			callWriteXmlFile(doc, outwriter, "utf-8");
			outwriter.close();
			fos.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private static void callWriteXmlFile(Document doc,
			OutputStreamWriter outwriter, String encoding) {
		try {
			Source source = new DOMSource(doc);
			Result result = new StreamResult(outwriter);
			Transformer xformer = TransformerFactory.newInstance()
					.newTransformer();
			xformer.setOutputProperty(OutputKeys.ENCODING, encoding);
			xformer.transform(source, result);
		} catch (TransformerConfigurationException e) {
			e.printStackTrace();
		} catch (TransformerException e) {
			e.printStackTrace();
		}
	}
}
