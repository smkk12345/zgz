package com.hibernate.utils;

import java.util.List;

public class Pager<T> {
	
	private int size;
	private int offerset;
	private long totolNumber;
	private List<T> datas;
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getOfferset() {
		return offerset;
	}
	public void setOfferset(int offerset) {
		this.offerset = offerset;
	}
	public long getTotolNumber() {
		return totolNumber;
	}
	public void setTotolNumber(long totolNumber) {
		this.totolNumber = totolNumber;
	}
	public List<T> getDatas() {
		return datas;
	}
	public void setDatas(List<T> datas) {
		this.datas = datas;
	}
	
	

}
