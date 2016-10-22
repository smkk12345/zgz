package com.common.utils;

import sun.org.mozilla.javascript.internal.UintMap;

public class CRCCheckUtil {

	
	/**
	 * CRC16校验
	 */
	public static int[] getCRC16(int[] data){
		//全部置1
		int crc1 = 0xFFFF;  
		if(data.length<=0){
			crc1 = 0;
		}else{
			for (int i = 0; i < data.length; i++) {
				crc1 = crc1^data[i];
				for (int j = 0; j <= 7; j++) {
					if((crc1&1)!=0){
						crc1=(crc1>>1)^0xA001;
					}
					else{
						crc1=crc1>>1;
					}
				}
			}
		}
		int low8 = crc1 & 0x00ff;
		int hight8 = (crc1 & 0xff00)>>8;
		String lowStr = Integer.toHexString(low8);
		String hightStr = Integer.toHexString(hight8);
		int[] result = {low8,hight8};
		return result;
	}
	 public static void main(String[] args) {
		 CRCCheckUtil crcUtil = new CRCCheckUtil();
		 //40 03 F1 05 00 01
		 int[] b = new int[] {0x40, 0x03,  0xf1, 0x05, 0x00, 0x01};
					
		 int[] data ={0x05,0x03,0x00,0x00,0x00,0x68}; //050300000002
		 int[] crcResult = crcUtil.getCRC16(data);
		 System.out.println(crcResult[0]+","+crcResult[1]);
	 }
	 
	 
}
