package com.hibernate.houseinfo.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;


import com.common.utils.StringUtils;
import com.hibernate.base.BaseBean;

/**
 * 长辛店 项目实体
 * @author yulei
 *
 */
public class HouseBasic extends BaseBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	//标段信息
	private String section;
	//组别编号
	private String sectionindex;
	//房屋坐落 
	private String location;
	//联系固话
	private String telephone;
	//手机
	private	String mobile;
	//被腾退人姓名
	private String names;//varchar  改为 nvarchar
	//性别
	private String sex; 
	//年龄
	private String age;
	//备用联系电话
	private String remobile;
	//权属取得方式     0 自有 1 老宅 2买卖 3继承 4其他
	private String ownership;
	//身份证号
	private String idcard;
	//通信地址
	private String address;
	//权属证明   0 农村房建审批 1宅基地翻建审批 2规划许可 3租赁合同 4 其他
	private String ownershipprove;
	//房屋间数   需保留一位小数
	private BigDecimal housecount;
	//本址在册户口本数量
	private Integer localbook;
	//本址在册户籍数量
	private Integer localpeoplecount;
	//非本址在册户口簿数量
	private Integer notlocalbook;
	//非本址在册户籍数量
	private Integer notlocalpeoplecount;
	//安置人口数量
	private Integer people;
	
	//-------------------------面积相关----------------------------
	//宅基地测绘面积   ?保留几位小数
	private BigDecimal zjdarea;
	//房屋测绘面积
	private BigDecimal fwarea;
	//首层建筑面积
	private BigDecimal firstfloorarea;
	//二层以上面积
	private BigDecimal abovetwoarea;
	//地下室面积
	private BigDecimal basement;
	//棚面积
	private BigDecimal shed;
	//------------------------备注------------------------------------
	private String remark;
	//经营用房面积
	private BigDecimal operatearea;
	//工商备案面积
	private BigDecimal businessarea;
	//经营用途
	private String operatecontent;
	//license  执政字号
	private String licensename;
	//与被腾退人关系  0 本人 1 本家庭成员 2租赁 3 其他
	private String relate;
	//执照标明的经营场所
	private String licenselocation;
	//税务登记证
	private String taxlicense; //0 有 1 没有
	//租赁协议
	private String leaselicense;  //0 有 1 没有
	//纳税证明
	private String taxprove; // 0 有  1 没有
	//执照编号
	private String license;
	//l类型  个体工商   1  个人独资
	private String operatetype;
	//是否已经交房
	private String hasothers;// 0 未交房   1 已经交房
	//交房日期 
	private String jfDate;
	//复核状态
	private String checkresult;//0未审查（退回） 1 内部审核通过
	//复核人员
	private String checkname;//
	//复合日期
	private String checkDate;
	//复核备注
	private String checkremark;
	//排序字段
	private Integer sortnum;
	//是否二级
	private String hassplit;//0 未分  1  分过
	
	//人数
	private Integer peoplecount;
	//人员信息
	private String peopleinfo;
	
	public String getHassplit() {
		if(StringUtils.isBlank(hassplit)){
			return null;
		}
		return hassplit;
	}
	public void setHassplit(String hassplit) {
		this.hassplit = hassplit;
	}
	public Integer getSortnum() {
		return sortnum;
	}
	public void setSortnum(Integer sortnum) {
		this.sortnum = sortnum;
	}
	public BigDecimal getShed() {
		return shed;
	}
	public void setShed(BigDecimal shed) {
		this.shed = shed;
	}
	public String getCheckresult() {
		return checkresult;
	}
	public void setCheckresult(String checkresult) {
		this.checkresult = checkresult;
	}
	public String getCheckname() {
		return checkname;
	}
	public void setCheckname(String checkname) {
		this.checkname = checkname;
	}
	public String getCheckDate() {
		return checkDate;
	}
	public void setCheckDate(String checkDate) {
		this.checkDate = checkDate;
	}
	public String getCheckremark() {
		return checkremark;
	}
	public void setCheckremark(String checkremark) {
		this.checkremark = checkremark;
	}
	//协议
	private Agreement agreenment = new Agreement();
	//顺序号
	private IndexNum indexNum = new IndexNum();
	//腾云人列表
	List<VacatePeople> vacatelist = new ArrayList<VacatePeople>();
	
	//非在册人员列表
	List<VacatePeople> list = new ArrayList<VacatePeople>();
	//大病
	List<OtherInfo> illList = new ArrayList<OtherInfo>();
	//低保
	List<OtherInfo> basicLivingList = new ArrayList<OtherInfo>();
	//残疾
	List<OtherInfo> deformityList = new ArrayList<OtherInfo>();
	//otherList
	List<OtherInfo> otherList = new ArrayList<OtherInfo>();
	
	//
	
	public List<OtherInfo> getOtherList() {
		return otherList;
	}
	public void setOtherList(List<OtherInfo> otherList) {
		this.otherList = otherList;
	}
	public List<VacatePeople> getVacatelist() {
		return vacatelist;
	}
	public void setVacatelist(List<VacatePeople> vacatelist) {
		this.vacatelist = vacatelist;
	}
	public List<VacatePeople> getList() {
		return list;
	}
	public void setList(List<VacatePeople> list) {
		this.list = list;
	}
	public List<OtherInfo> getIllList() {
		return illList;
	}
	public void setIllList(List<OtherInfo> illList) {
		this.illList = illList;
	}
	public List<OtherInfo> getBasicLivingList() {
		return basicLivingList;
	}
	public void setBasicLivingList(List<OtherInfo> basicLivingList) {
		this.basicLivingList = basicLivingList;
	}
	public List<OtherInfo> getDeformityList() {
		return deformityList;
	}
	public void setDeformityList(List<OtherInfo> deformityList) {
		this.deformityList = deformityList;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getNames() {
		return names;
	}
	public void setNames(String names) {
		this.names = names;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getRemobile() {
		return remobile;
	}
	public void setRemobile(String remobile) {
		this.remobile = remobile;
	}
	public String getOwnership() {
		return ownership;
	}
	public void setOwnership(String ownership) {
		this.ownership = ownership;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getOwnershipprove() {
		return ownershipprove;
	}
	public void setOwnershipprove(String ownershipprove) {
		this.ownershipprove = ownershipprove;
	}
	public Integer getLocalbook() {
		return localbook;
	}
	public void setLocalbook(Integer localbook) {
		this.localbook = localbook;
	}
	public Integer getLocalpeoplecount() {
		
		return localpeoplecount;
	}
	public void setLocalpeoplecount(Integer localpeoplecount) {
		this.localpeoplecount = localpeoplecount;
	}
	public Integer getNotlocalbook() {
		return notlocalbook;
	}
	public void setNotlocalbook(Integer notlocalbook) {
		this.notlocalbook = notlocalbook;
	}
	public Integer getNotlocalpeoplecount() {
		return notlocalpeoplecount;
	}
	public void setNotlocalpeoplecount(Integer notlocalpeoplecount) {
		this.notlocalpeoplecount = notlocalpeoplecount;
	}
	public Integer getPeople() {
		return people;
	}
	public void setPeople(Integer people) {
		this.people = people;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public String getOperatecontent() {
		return operatecontent;
	}
	public void setOperatecontent(String operatecontent) {
		this.operatecontent = operatecontent;
	}
	public String getLicensename() {
		return licensename;
	}
	public void setLicensename(String licensename) {
		this.licensename = licensename;
	}
	public String getRelate() {
		return relate;
	}
	public void setRelate(String relate) {
		this.relate = relate;
	}
	public String getLicenselocation() {
		return licenselocation;
	}
	public void setLicenselocation(String licenselocation) {
		this.licenselocation = licenselocation;
	}
	public String getTaxlicense() {
		return taxlicense;
	}
	public void setTaxlicense(String taxlicense) {
		this.taxlicense = taxlicense;
	}
	public String getLeaselicense() {
		return leaselicense;
	}
	public void setLeaselicense(String leaselicense) {
		this.leaselicense = leaselicense;
	}
	public String getTaxprove() {
		return taxprove;
	}
	public void setTaxprove(String taxprove) {
		this.taxprove = taxprove;
	}
	public String getLicense() {
		return license;
	}
	public void setLicense(String license) {
		this.license = license;
	}
	public String getOperatetype() {
		return operatetype;
	}
	public void setOperatetype(String operatetype) {
		this.operatetype = operatetype;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public BigDecimal getHousecount() {
		return housecount;
	}
	public void setHousecount(BigDecimal housecount) {
		this.housecount = housecount;
	}
	public BigDecimal getZjdarea() {
		return zjdarea;
	}
	public void setZjdarea(BigDecimal zjdarea) {
		this.zjdarea = zjdarea;
	}
	public BigDecimal getFwarea() {
		return fwarea;
	}
	public void setFwarea(BigDecimal fwarea) {
		this.fwarea = fwarea;
	}
	public BigDecimal getFirstfloorarea() {
		return firstfloorarea;
	}
	public void setFirstfloorarea(BigDecimal firstfloorarea) {
		this.firstfloorarea = firstfloorarea;
	}
	public BigDecimal getAbovetwoarea() {
		return abovetwoarea;
	}
	public void setAbovetwoarea(BigDecimal abovetwoarea) {
		this.abovetwoarea = abovetwoarea;
	}
	public BigDecimal getBasement() {
		return basement;
	}
	public void setBasement(BigDecimal basement) {
		this.basement = basement;
	}
	public BigDecimal getOperatearea() {
		return operatearea;
	}
	public void setOperatearea(BigDecimal operatearea) {
		this.operatearea = operatearea;
	}
	public BigDecimal getBusinessarea() {
		return businessarea;
	}
	public void setBusinessarea(BigDecimal businessarea) {
		this.businessarea = businessarea;
	}
	public Agreement getAgreenment() {
		return agreenment;
	}
	public void setAgreenment(Agreement agreenment) {
		this.agreenment = agreenment;
	}
	public IndexNum getIndexNum() {
		return indexNum;
	}
	public void setIndexNum(IndexNum indexNum) {
		this.indexNum = indexNum;
	}
	public String getHasothers() {
		return hasothers;
	}
	public void setHasothers(String hasothers) {
		this.hasothers = hasothers;
	}
	public String getJfDate() {
		return jfDate;
	}
	public void setJfDate(String jfDate) {
		this.jfDate = jfDate;
	}
	public String getSectionindex() {
		return sectionindex;
	}
	public void setSectionindex(String sectionindex) {
		this.sectionindex = sectionindex;
	}
	public Integer getPeoplecount() {
		int result = 0;
		if(null != vacatelist){
			result = result +vacatelist.size();
		}
		if(null!=list){
			result=result+list.size();
		}
		return result;
	}
	public void setPeoplecount(Integer peoplecount) {
		this.peoplecount = peoplecount;
	}
	public String getPeopleinfo() {
		StringBuffer sb=new StringBuffer();
		sb.append(getDisplayPeopleInfo("<br>在册 :",vacatelist));
		sb.append(getDisplayPeopleInfo("<br>非在册：     ",list));
		return sb.toString();
	}
	
	private String getDisplayPeopleInfo(String typeStr,List<VacatePeople> list){
		StringBuffer sb=new StringBuffer();
		if(null == list||list.size()==0){
			return "";
		}
		sb.append(typeStr);
		for (int i = 0; i < list.size(); i++) {
			VacatePeople v = list.get(i);
			sb.append("<br><>");
			sb.append("姓名 &nbsp;&nbsp;");
			sb.append(v.getName());
			sb.append("&nbsp;&nbsp;身份证&nbsp;&nbsp;");
			sb.append(v.getIdcard());
			sb.append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		}
		return sb.toString();
	}
	
	public void setPeopleinfo(String peopleinfo) {
		this.peopleinfo = peopleinfo;
	}
}
