package com.hibernate.ventilate.domain;

import java.io.Serializable;

/**
 * 通风口
 * @author lxb
 *
 */
public class VentDeviceBean extends BaseDevice implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4040140525507012951L;
	//面位置
	private String facePos;
	//垂直位置
	private String verPos;
	//j具体位置信息
	private String pos;

	public String getFacePos() {
		return facePos;
	}
	public void setFacePos(String facePos) {
		this.facePos = facePos;
	}
	public String getVerPos() {
		return verPos;
	}
	public void setVerPos(String verPos) {
		this.verPos = verPos;
	}
	public String getPos() {
		return pos;
	}
	public void setPos(String pos) {
		this.pos = pos;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
