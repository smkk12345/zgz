package com.hibernate.utils;

import com.hibernate.baseSettingInfo.domain.AlarmBean;

public class ImportAlarmDataIntoDB {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
//	('402881eb4f20bc7b014f20bcf9ad0002','小麦','东北小麦'),
//	('402881eb4f25946c014f259de6810002','籼稻',''),
//	('402881eb4f25946c014f259e1a010003','粳稻',''),
//	('402881eb4f25946c014f259e430e0004','玉米',''),
//	('402881eb4f25946c014f259e775b0005','大豆','');
	
	
	private void inportTemData(){
		AlarmBean bean = new AlarmBean();
		bean.setAlarmPYType("tem");
		bean.setAlarmType("低温");
		bean.setAverageAttri(15.00);
		bean.setCanEdit("canNotEdit");
		bean.setDefauleAvgAttri(15.00);
		bean.setDefaultMaxAttri(25.00);
	}
}
