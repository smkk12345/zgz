package com.formula.data;
import java.io.IOException;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import com.common.utils.MathUtil;
import com.hibernate.baseSettingInfo.domain.GrainTypeBean;
/**
 * 计算水份露点的公式
 * 
 * @author lxb
 */
public class Calc {
	/**
	 * @名称: getWet
	 * @日期：2015-11-12 下午2:33:54
	 * @作者： lxb
	 * @描述: 获取水份
	 * @参数 @return
	 * @返回值 Double
	 * @异常
	 */
	public Double getWet(GrainTypeBean grainBean,Double hum,Double tem) {
		Double result = 0.00;
		String grainType = getGrainTypeByGrainInfo(grainBean);
		Double a = getPointValueFromXml(grainType,"a","xf");
		Double b = getPointValueFromXml(grainType,"b","xf");
		Double c = getPointValueFromXml(grainType,"c","xf");
		result = Math.round (hum - (a * tem) - c)/b; 
		result = MathUtil.getFormatData(result, 1);
		return result;
	}
	/**
	 * @名称: getDewPoint
	 * @日期：2015-11-12 下午2:34:10
	 * @作者： lxb
	 * @描述: 获取露点
	 * @参数 @return
	 * @返回值 Double
	 * @异常
	 */
	public Double getDewPoint(GrainTypeBean grainBean,Double hum,Double tem) {
		try {
			hum = hum/100;
			Double result = 0.00;
			result = (233*Math.log((hum*Math.exp((17*tem)/(233+tem)))))/(17-Math.log((hum*Math.exp((17*tem)/(233+tem))))); 
			result = MathUtil.getFormatData(result, 1);		
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return 0.00;
		}finally{
		}
	}
	/**
	 * @名称: getPointValueBySth
	 * @日期：2015-11-12 下午2:37:14
	 * @作者： lxb
	 * @描述: 获取点的值，
	 * @参数 @return ---粮食类型 ---二级类型a,b,c ---吸附还是解析    先用吸附
	 * @返回值 Double
	 * @异常
	 */
	public Double getPointValueFromXml(String grainType, String secendType,String thirdType) {
		Double result = 0.00;
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		try {
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document doc = db.parse(this.getClass().getResource("/").getPath()+"com/formula/data/ratio.xml");
			NodeList grainTypeList = doc.getElementsByTagName(grainType);
			for (int i = 0; i < grainTypeList.getLength(); i++) {
				Node typeNode = grainTypeList.item(i);
				for (Node node = typeNode.getFirstChild(); node != null; node = node.getNextSibling()) {
					if (node.getNodeType() == Node.ELEMENT_NODE && node.getNodeName().equals(secendType)) {
						result = Double.parseDouble(node.getAttributes().getNamedItem(thirdType).getNodeValue());
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	private String getGrainTypeByGrainInfo(GrainTypeBean grainBean){
		String grainType = "";
		String grainBeanType = grainBean.getGrainType().trim();
		if("小麦".equals(grainBeanType)){
			grainType = "wheat";
		}else if("粳稻".equals(grainBeanType)){
			grainType = "paddy";
		}else if("玉米".equals(grainBeanType)){
			grainType = "corn";
		}else if("大豆".equals(grainBeanType)){
			grainType = "soybean";
		}else if("早籼稻".equals(grainBeanType)){
			grainType = "paddy";
		}else if("晚籼稻".equals(grainBeanType)){
			grainType = "paddy";
		}
		else{
			grainType = "wheat";
		}
		return grainType;
	}
	
	public static void main(String[] args) {
		try {
			new Calc().getPointValueFromXml("wheat","a","jx");
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println(true);
		}
	}
	
}
