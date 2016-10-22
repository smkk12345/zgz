package com.common.dataSource;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import com.common.serialPortUtil.CallBackFun;
import com.common.serialPortUtil.SerialConnection;
import com.common.serialPortUtil.SerialConnectionException;
import com.common.serialPortUtil.SerialParameters;
import com.common.utils.CRCCheckUtil;
import com.common.utils.MathUtil;
import com.common.utils.StringUtils;
import com.hibernate.barnInfo.domain.AoJianBean;
import com.hibernate.baseSettingInfo.domain.BaseSettingBean;
import com.hibernate.sernsorInfo.domain.AoJianDataBean;
import com.hibernate.sernsorInfo.domain.SensorArrangementBean;
import com.hibernate.sernsorInfo.domain.SensorDataBean;
import com.spring.ServiceManager;
public class SerialPortDataOperater implements CallBackFun {
	/**
	 * 串口数据操作类 --获取分机地址-- --读取指定长度的数据-- --将寄存器的进行写0操作-- --其他-- --lxb--
	 */
	/*-------------------------------------------------------------------*/
	
	public SerialPortDataOperater(List<AoJianBean> list){
		this.aoJianList= list;
	}
	/**
	 * @名称: main
	 * @日期：2015-10-21 下午1:42:12
	 * @作者： lxb
	 * @描述: TODO
	 * @参数 @param args
	 * @返回值 void
	 * @异常
	 */
	public static void main(String[] args) {
		SerialPortDataOperater spdo = new SerialPortDataOperater(null);
		int[] b = new int[6];
		b[0] = (int) spdo.serviceArrress;
		b[1] = (int) spdo.cmd_read;
		b[2] = (int)0xf1;
		b[3] = (int)0x05;
		b[4] = 0x00;
		b[5] = (int)0x01;
		spdo.getExtensionsAddress(b);
	}
	
	// 请求寄存器的地址
	private boolean isCachAddressRequest = true;
	// 主机地址
	private int serviceArrress = 64;
	// 读命令
	private int cmd_read = 03;
	// 写命令
	private int cmd_write = 10;
	//每次读取的寄存器个数---52路温湿度  104个寄存器数据---一次还读不了 104个寄存器 先读100个 再读4个
	private int count =104;
	
	private SerialConnection portConnection = null;
	
	private List<AoJianBean> aoJianList = new ArrayList<AoJianBean>();
	
	private AoJianBean curAoJian = null;
	public void setAoJianList(List<AoJianBean> aoJianList) {
		this.aoJianList = aoJianList;
	}

	/**
	 * 按照于总发的图片整理的结构
	 */
	private Map<Integer, String> indexRowMap = new HashMap<Integer, String>() {
		{
			put(1, "0,4");
			put(2, "2,4");
			put(3, "4,4");
			
			put(4, "1,3");
			put(5, "3,3");
			
			put(6, "0,2");
			put(7, "2,2");
			put(8, "4,2");

			put(9, "1,1");
			put(10, "3,1");

			put(11, "0,0");
			put(12, "2,0");
			put(13, "4,0");
		}
	};
	//
	public boolean getRunTimeRemoteData(String dateStr) throws SQLException {
		System.out.println("start:" + new Date().getMinutes());
		boolean isOk = true;
		if(aoJianList.size()==0){
			isOk = false;
			return isOk;
		}
		try {
			int[] b = new int[6];
			b[0] = (int) this.serviceArrress;
			b[1] = (int) this.cmd_read;
			b[2] = (int)0xf1;
			b[3] = (int)0x05;
			b[4] = 0x00;
			b[5] = (int)0x01;
			getExtensionsAddress(b);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			isOk = false;
		}
		System.out.println("end:" + new Date().getMinutes());
		return isOk;
	}	
	
	// 获取端口
	public SerialConnection getPortConnection() {
		if (null != portConnection) {
			return portConnection;
		} else {
			SerialParameters curParameters = new SerialParameters();
			Map<String, String> map = getBaseSettingInfo();
			// curParameters.setPortName(map.get("ckh"));
			// curParameters.setBaudRate(map.get("btl"));
			// curParameters.setDatabits(map.get("xyw"));
			// curParameters.setStopbits(map.get("tzw"));
			curParameters.setPortName("COM5");
			curParameters.setBaudRate(9600);
			curParameters.setDatabits(8);
			curParameters.setStopbits(1);
			portConnection = new SerialConnection(curParameters, this);
			try {
				portConnection.openConnection();
			} catch (SerialConnectionException e) {
				e.printStackTrace();
			}
			return portConnection;
		}
	}
	private  Map<String, String> getBaseSettingInfo() {
		Map<String, String> map = new HashMap<String, String>();
		List<BaseSettingBean> list = ServiceManager.getBaseSettingServiceImpl()
				.findAll();
		for (int i = 0; i < list.size(); i++) {
			BaseSettingBean bean = list.get(i);
			map.put(bean.getKey(), bean.getValue());
		}
		return map;
	}
	// 获取分级地址
	public void getExtensionsAddress(int[] originalByteArr) {
		int[] installedByteArr = installCmd(originalByteArr);
		portWrite(installedByteArr);
	}
	// 获取CRC校验码
	private int[] getCrcCheck(int[] b) {
		return CRCCheckUtil.getCRC16(b);
	}
	// 组装命令 ---b是6位的
	private int[] installCmd(int[] b) {
		int arrSize = b.length + 2; // 添加两位校验位
		int[] crc = getCrcCheck(b);
		int[] result = new int[arrSize];
		for (int i = 0; i < b.length; i++) {
			result[i] = b[i];
		}
		result[arrSize - 2] = (int) crc[0];
		result[arrSize - 1] = (int) crc[1];
		return result;
	}
	
	private int[] getReadCmdBySize(int address,int size){
		int[] b = new int[6];
		b[0] = (int) address;
		b[1] = (int) cmd_read;
		b[2] = 00;
		b[3] = 00;
		b[4] = 0x00;
		b[5] = (int)size;
		return installCmd(b);
	}
	
	/**
	 * 回调函数
	 */
	@Override
	public void execute(List<String> dataList) {
		if (dataList.size() < 0) {
			return;
		}
//		String[] resultArr = inputStr.split("#");
		if(dataList.get(1).equals(cmd_write+"")){
			if(null != curAoJian){
				if(aoJianList.contains(curAoJian)){
					aoJianList.remove(curAoJian);
				}
				curAoJian = null;
			}
			if(aoJianList.size()>0){
				try {
					getRunTimeRemoteData("");
					return;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else{//数据请求完成之后  关闭串口
				portConnection.closeConnection();
				return;
			}
		}
		
		if (isCachAddressRequest) {
			if (dataList.size() < 4) {
				return;// 功能码去掉
			}
			// 8位地址码
			int subAddress8 = Integer.parseInt(dataList.get(4), 16);
			if(subAddress8 == 0){
				try {
					getRunTimeRemoteData("");
				} catch (Exception e) {
					e.printStackTrace();
				}
				return;
			}else{
				for (int i = 0; i < aoJianList.size(); i++) {
					AoJianBean aoJian = aoJianList.get(i);
					if((subAddress8+"").equals(aoJian.getFjGrainIndex())){
						curAoJian = aoJian;
						break;
					}
				}
			}
			if(null == curAoJian){
				return;
			}
			//组装命令---count---获取20位
			int[] readCmd = getReadCmdBySize(subAddress8,count);
			int[] readCmd1 = installCmd(readCmd);
			portWrite(readCmd1);
			isCachAddressRequest = false;
		} else {
			// 数据处理
			
			AoJianDataBean aoJianData = new AoJianDataBean();
			aoJianData.setZyAoJianGrainNum(curAoJian.getAoJianGrainInfoBean().getId());
			try {
				ServiceManager.getAoJianBlockService().save(aoJianData);
			} catch (Exception e) {
				e.printStackTrace();
			}
			Map<Integer, SensorDataBean> beforeReadyData = new HashMap<Integer, SensorDataBean>();
			int nindex = 0;
			String tem = "";
			boolean isTem = true;
			System.out.println(dataList.size());
			for (int i = 3; i < dataList.size() - 2; i++) {
				if (i % 2 == 0) {
					SensorDataBean sensorData;
					if (beforeReadyData.containsKey(nindex)) {
						sensorData = beforeReadyData.get(nindex);
					} else {
						sensorData = new SensorDataBean();
						sensorData.setAoJianDataId(aoJianData.getId());
						sensorData.setNoData("1");
						beforeReadyData.put(nindex, sensorData);
					}
					// 温度
					tem = tem + dataList.get(i);
					if (isTem) {
						sensorData.setTemperature(getTem(tem));
						isTem = false;
					} else {
						sensorData.setHumidity(getHum(tem));
						isTem = true;
						nindex++;
					}
					tem = "";
				} else {
					tem = dataList.get(i);
				}
			}
			
			//处理索引和排序号
			calcIndexAndInsert(beforeReadyData,aoJianData.getId());
			//读完之后，对管理机写零
			initRegister();
			//isCachAddressRequest = true;
		}
	}
	/**
	* @名称: calcIndexAndInsert 
	* @日期：2015-10-26 下午8:04:09
	* @作者： lxb
	* @描述: 计算索引和排序号 并插入数据库
	* @参数 @param beforeReadyData
	* @参数 @param dataId    
	* @返回值 void    
	* @异常
	 */
	private void calcIndexAndInsert(Map<Integer, SensorDataBean> beforeReadyData,String dataId){
		String indexStrs = "";
		Iterator<Integer> it = beforeReadyData.keySet().iterator();
		List<SensorDataBean> dataList = new ArrayList<SensorDataBean>();
		while (it.hasNext()) {
			Integer integer = (Integer) it.next();
			SensorDataBean dataBean = beforeReadyData.get(integer);
			if(!dataList.contains(dataList)){
				dataList.add(dataBean);
			}
			int indexKey = 0;
			if(integer == 0){
				indexKey = 1;
			}
			else{
				double a;
				if(integer%4==0){
					a =integer.doubleValue()/4+1; 
				}
				else{
					a =integer.doubleValue()/4; 
				}
				double ceilValue = Math.ceil(a);
				if(ceilValue != 0){ 
					indexKey =(int)Math.floor(ceilValue);
				}else{
					indexKey = 0;
				}
			}
			if(14>indexKey&&indexKey>0){
				String indexStr = indexRowMap.get(indexKey);
				integer = integer +1;//从1开始
				int y = 0;
				if(integer%4!=0){
					y = 4-integer%4;
				}
				else{
					y = 0;
				}
				indexStr = indexStr + ","+y;
				if (!indexStrs.contains(indexStr)) {
					indexStrs = indexStrs + "#" + indexStr;
				}
				dataBean.setSensorIndex(indexStr);
				dataBean.setOrderIndex(getOrderIndex(indexStr));
			}else
			{
				continue;
			}
		}
		SensorArrangementBean sensorArrangement = ServiceManager.getSensorArrangementServiceImpl().getById(curAoJian.getSensorArrangementbeanId());
		insertNullData(dataList,sensorArrangement,indexStrs,dataId);
		try {
			ServiceManager.getAoJianBlockService().batchSave(dataList);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<SensorDataBean> insertNullData(List<SensorDataBean> list, SensorArrangementBean sensorArrangement, String indexStr, String dataBeanId) {
		for (int i = 0; i < sensorArrangement.getRowCount(); i++) {
			for (int j = 0; j < sensorArrangement.getColumnCount(); j++) {
				for (int k = 0; k < sensorArrangement.getLayerCount(); k++) {
					String curIndex = i + "," + j + "," + k;
					if (indexStr.indexOf(curIndex) < 0) {
						SensorDataBean data = new SensorDataBean();
						data.setAoJianDataId(dataBeanId);
						data.setSensorIndex(curIndex);
						data.setNoData("0");
						data.setOrderIndex(getOrderIndex(curIndex));
						list.add(data);
					}
				}
			}
		}
		return list;
	}
	
	public Integer getOrderIndex(String sensorIndex) {
		String[] posArr = sensorIndex.split(",");
		Integer index = (Integer.valueOf(posArr[0]) + 1) * 1000 + (Integer.valueOf(posArr[1]) + 1) * 10 + Integer.valueOf(posArr[2]);
		return index;
	}
	//写零
	public void initRegister(){
		int[] b = new int[8];
		b[0] = 0x40;
		b[1] = 0x10;
		b[2] = 0xf1;
		b[3] = 0x05;
		b[4] = 0x00;
		b[5] = 0x01;
		b[6] = 0x00;
		b[7] = 0x00;
		int[] writeCmd = installCmd(b);
		portWrite(writeCmd);
	}
	
	/**
	 * @名称: getTem
	 * @日期：2015-10-20 下午1:46:12
	 * @作者： lxb
	 * @描述: 计算温度
	 * @参数 @param tem
	 * @参数 @return
	 * @返回值 Double
	 * @异常
	 */
	private Double getTem(String tem) {
		Double result = 0.0;
		tem = tem.replaceAll("^(0+)", "").trim();
		if (StringUtils.isEmpty(tem)) {
			return result;
		}
		String binaryData = Integer.toBinaryString(Integer.parseInt(tem, 16));
		int a = 0;
		if (binaryData.length() < 16
				|| (binaryData.length() == 16 && binaryData.startsWith("0"))) {// 正数
			a = Integer.parseInt(binaryData, 2);
		} else {// 负数 ----取反加1
			a = ~Integer.parseInt(binaryData, 2) + 1;
		}
		result = Double.parseDouble(a + "");
		result = MathUtil.getFormatData(result / 10, 1);
		return result;
	}
	
	private Double getHum(String tem) {
		Double result = 0.0;
		tem = tem.replaceAll("^(0+)", "").trim();
		if (StringUtils.isEmpty(tem)) {
			return result;
		}
		// String binaryData = Integer.toBinaryString(Integer.parseInt(tem,16));
		// int a = 0;
		int a = Integer.parseInt(tem, 16);
		result = Double.parseDouble(a + "");
		result = MathUtil.getFormatData(result / 10, 1);
		return result;
	}
	
	// 校验crc
	
	// 写命令
	private void portWrite(int[] byteArr) {
		if (null != getPortConnection()) {
			new Thread(new WriteThread(byteArr)).start();
		}
	}
	
	// 写线程
	public static Object wLock = new Object();
	class WriteThread implements Runnable {
		public WriteThread(int[] byteArr) {
			this.byteArr = byteArr;
		}
		private int[] byteArr;
		@Override
		public void run() {
			try {
				synchronized (wLock) {
					portConnection.writeData(byteArr);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	//读线程---,看需求确定
}
