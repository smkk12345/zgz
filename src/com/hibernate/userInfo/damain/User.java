package com.hibernate.userInfo.damain;

import com.hibernate.base.BaseBean;
/**
 * UserInfo entity. @author MyEclipse Persistence Tools
 */

public class User extends BaseBean implements java.io.Serializable {

	// Fields    
	private String id;
	private String userName;
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	private String displayName;
	private String passWord;
	private String tel;
	private String right_Content;//廒间编号  id1,id2,id3
	private String dispalyContent;//显示的内容 为了方便处理  
	public String getDispalyContent() {
		return dispalyContent;
	}

	public void setDispalyContent(String dispalyContent) {
		this.dispalyContent = dispalyContent;
	}

	private String rightLevel;//权限类别Id
	private String area;   //所在地域
	private String memo;
	private String email;
	private String theme; //主题风格
	private String builtInUser;//内置用户  0为非内置 1为内置
	private String fastLoginIn;
	
	private String fastCutUrls;
	public String getFastCutUrls() {
		return fastCutUrls;
	}

	public void setFastCutUrls(String fastCutUrls) {
		this.fastCutUrls = fastCutUrls;
	}

	public String getBuiltInUser() {
		return builtInUser;
	}

	public void setBuiltInUser(String builtInUser) {
		this.builtInUser = builtInUser;
	}

	//当前的廒间Id
	private String curAoJianId;
	public String getCurAoJianId() {
		return curAoJianId;
	}

	public void setCurAoJianId(String curAoJianId) {
		this.curAoJianId = curAoJianId;
	}

	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getRightLevel() {
		return rightLevel;
	}

	public void setRightLevel(String rightLevel) {
		this.rightLevel = rightLevel;
	}



	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRight_Content() {
		return right_Content;
	}

	public void setRight_Content(String right_Content) {
		this.right_Content = right_Content;
	}



	//     private Set<BarnBean> authorityBeanSet;

	// Constructors

	/** default constructor */
	public User() {
	}


	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDisplayName() {
		return this.displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public String getPassWord() {
		return this.passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}


	public String getMemo() {
		return this.memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getFastLoginIn() {
		return fastLoginIn;
	}

	public void setFastLoginIn(String fastLoginIn) {
		this.fastLoginIn = fastLoginIn;
	}

}