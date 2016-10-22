package com.common.pointTem;

import java.util.Map;
import com.hibernate.sernsorInfo.domain.SensorArrangementBean;

public interface CoordinatorExchangeTemInterface {
	public  Map<Integer, String> getCoordinateMap(SensorArrangementBean sensorArrangementBean);
}
