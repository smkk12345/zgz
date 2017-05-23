package com.hibernate.houseinfo.domain;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.common.utils.StringUtils;
import com.hibernate.base.BaseBean;
import com.hibernate.timers.utils.DateStyle;
import com.hibernate.timers.utils.DateUtil;
import com.hibernate.utils.MoneyUtils;

public class DisplayBean extends BaseBean {

	
	//标段信息
		private String section;
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
		private String operatename;
		private String islock;
		
		private String cf;
		private String cfdate;
		private String bcklq;
		private String bcklqdate;
		//协议
		private Agreement agreenment = new Agreement();
		//顺序号
		private IndexNum indexNum = new IndexNum();
		//zaice人列表
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
		
		private String hasothers;// 0 未交房   1 已经交房
		
		private String agreenmentid;
		
		//协议号
		private String protocolnumber;


		/**
		 * 协议实体类
		 */
		private String housebasicid;
		//协议编号
		private String agreementnum;
		//协议类型 0 退钱  1 分房退钱
		private String atype;
		//腾退人
		private String vacatepeople;
		//实测用地面积
		private BigDecimal scydmj;
		//宅基地年限
		private String homesteadyear;
		//宅基地控制面积
		private BigDecimal conhomestarea;
		//over  超出宅基地
		private BigDecimal overhomesteadarea;
		//大棚
		private BigDecimal shed;

		//市场估价
//		private BigDecimal scgj;
		
		//房屋补偿面积
		private BigDecimal fwbcmj;
		//认定被安置人口
		private Integer rdbazrk;
		//认定被安置人口信息
		private String rdbazrkxx;
		//选房房源信息
		private String fyxx;
		//实际选房面积
		private BigDecimal sjxfmj;
		//分房情况
		//一居室几套
		private Integer yjs;
		//两居室
		private Integer ljs70;
		//两居室
		private Integer ljs75;
		//两居室
		private Integer ljs80;
		//两居室
		private Integer ljs85;
		//三居室
		private Integer sjs;
		//棚改支持签约奖励（元）
		private BigDecimal pgzcqyjl;
		
		public BigDecimal getPgzcqyjl() {
			return pgzcqyjl;
		}


		public void setPgzcqyjl(BigDecimal pgzcqyjl) {
			this.pgzcqyjl = pgzcqyjl;
		}
		//交房日期 
		private String jfDate;
		public String getJfDate() {
			return jfDate;
		}
		public void setJfDate(String jfDate) {
			this.jfDate = jfDate;
		}
		//安置房购房款
		private BigDecimal azfgfk;
		private String dxazfgfk;
		public String getDxazfgfk() {
			return dxazfgfk;
		}
		public void setDxazfgfk(String dxazfgfk) {
			this.dxazfgfk = dxazfgfk;
		}
		//装修设备附属物
		private BigDecimal zxsbfsw;
		//指标内面积
		private BigDecimal zbnmj;
		//超指标面积
		private BigDecimal czbmj;
		//房屋家夼
		private BigDecimal fwjk;
		//指标内购房款
		private BigDecimal zbngfk;
		private String dxzbngfk;
		//指标外购房狂
		private BigDecimal zbwgfk;
		private String dxzbwgfk;
		
		//宅基地腾退总价 包括宅基地腾退补偿款，被重置房屋重置成新价，奖励费，补助费
		private BigDecimal zjdttzj;
		//评估机构
		private String pgjg;
		//宅基地腾退补偿款
		private BigDecimal zjdttbck;
		//控制宅基地区位补偿价
		private BigDecimal kzzjdqwbcj;
		//超控宅基地区位补偿价
		private BigDecimal ckzjdqwbcj;
		//被腾退房屋重置成新价
		private BigDecimal bttfwczcxj;
		//奖励费，补助费合计
		private BigDecimal jlbzhj;
		//提前搬家奖
		private BigDecimal tqbjl;
		//工程配合奖励
		private BigDecimal gcphjl;
		//腾退促进奖励
		private BigDecimal ttcjjl;
		//无违章奖励费
		private BigDecimal wwzjl;
		//未建二层及地下室奖励费
		private BigDecimal wjecjj;
		// 补助费合计
		private BigDecimal bzfhj;
		//--------------------------------补助费--------------
		//搬家及家电迁移补助费
		private BigDecimal bjbz;
		//期房补助费
		private BigDecimal qfbz;
		//大病补助
		private BigDecimal dbbz;
		//残疾补助
		private BigDecimal cjbz;
		//低保户补助
		private BigDecimal dbhbz;
		//独生子女补助
		private BigDecimal dsznbz;
		//停产停业补助
		private BigDecimal tctdbz;
		//其他
		private BigDecimal otherbz;
		//奖励费合计
		private BigDecimal jlfsum;
		
		//腾退截至日期
		private String ttrq;
		
		private String indexid;
		private Long indexnum;
		private String time;
		private String userid;
		private String operatedate;
		private String serviceip;
		private String displaydate;
		
		//实际建筑面积
		private BigDecimal sjm;		
		//计算字段
		//实际选房套数
		private Integer xfts;
		//选房面积
		private BigDecimal xfarea;
		//总补偿款-选房款
		private BigDecimal jshk;
		//rdzjdmj
		private BigDecimal rdzjdmj;
		//协议好展示
		private String indexNumStr;
		
		//复核状态
		private String checkresult;//0未审查（退回） 1 内部审核通过
		//复核人员
		private String checkname;//
		//复合日期
		private String checkDate;
		//复核备注
		private String checkremark;
		//前面的顺序好
		private String sectionindex;
		//排序情况
		private Integer sortnum;
		//人数
		private Integer peoplecount;
		//人员信息
		private String peopleinfo;
		
	    //控制面积区位补偿单价
	    private BigDecimal kzmjqwbcdj;
	    
	    //超控制面积区位补偿单价
	    private BigDecimal ckmjqwbcdj;
	    
	  //补偿宅基地面积
	    private BigDecimal bczjdmj;
		//周转补助费
		private BigDecimal zzbz;
	    
	  //补偿宅基地面积
	    private BigDecimal yxmj;
	    
	  //装修设备附属物价款
	    private BigDecimal zxsbfswjk;
		//未经批准已建二层补助
		private BigDecimal wjpzyjecbz;
		
	    //认定宅基地总补偿面积
	    private String rdzjdallarea;
		 //滴水补助费:
	    private BigDecimal dsbzf= new BigDecimal(0);
	    
	  //信鸽补助费
	    private BigDecimal xgbzf=new BigDecimal(0);
	    
	  //宅基地应批未批补助
	    private BigDecimal zjdypwpbz=new BigDecimal(0);
	  //优惠指标未选满补偿
	    private BigDecimal yhzbwxmbc=new BigDecimal(0);
	    
		//安置人口认定选项  0 4.1  1 4.2
		private String azrkxx; 
		
		//是否满足不足200平米补助200平米:
	    private String bzbzmj="1";
	    
	    private String kzqwbcmjj;
	    private String ckzqwbcmjj;
	    private String fwjkmjj;
	    private String sbzxmjj;
	    
	    private String gfbz50;
	    private String gfbz45;
	    
		public BigDecimal getWjpzyjecbz() {
			return wjpzyjecbz;
		}
		public void setWjpzyjecbz(BigDecimal wjpzyjecbz) {
			this.wjpzyjecbz = wjpzyjecbz;
		}
		public BigDecimal getKzmjqwbcdj() {
			return kzmjqwbcdj;
		}
		public BigDecimal getCkmjqwbcdj() {
			return ckmjqwbcdj;
		}
		public BigDecimal getBczjdmj() {
			return bczjdmj;
		}
		public void setKzmjqwbcdj(BigDecimal kzmjqwbcdj) {
			this.kzmjqwbcdj = kzmjqwbcdj;
		}
		public void setCkmjqwbcdj(BigDecimal ckmjqwbcdj) {
			this.ckmjqwbcdj = ckmjqwbcdj;
		}
		public void setBczjdmj(BigDecimal bczjdmj) {
			this.bczjdmj = bczjdmj;
		}
		public String getSectionindex() {
			return sectionindex;
		}
		public void setSectionindex(String sectionindex) {
			this.sectionindex = sectionindex;
		}
		public Integer getSortnum() {
			return sortnum;
		}
		public void setSortnum(Integer sortnum) {
			this.sortnum = sortnum;
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
		public BigDecimal getSjm() {
			BigDecimal bd = getSumValue(0.00,firstfloorarea);
			bd = getSumValue(bd.doubleValue(),abovetwoarea);
			bd = getSumValue(bd.doubleValue(),basement);
			bd = getSumValue(bd.doubleValue(),shed);
			return  bd;
		} 
		
		private BigDecimal getSumValue(double sum,BigDecimal bd){
			if(null != bd){
				return new BigDecimal(sum+bd.doubleValue());
			}else{
				return new BigDecimal(sum);
			}
		}
		public void setSjm(BigDecimal sjm) {
			this.sjm = sjm;
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
		public BigDecimal getHousecount() {
			return housecount;
		}
		public void setHousecount(BigDecimal housecount) {
			this.housecount = housecount;
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
		public String getRemark() {
			return remark;
		}
		public void setRemark(String remark) {
			this.remark = remark;
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
		private String getIndexNumStr(Long indexNum2) {
			// TODO Auto-generated method stub
			if(null != indexNum2){
				DecimalFormat df=new DecimalFormat("000");
				String str2=df.format(indexNum2);
				return str2;
			}else{
				return "";
			}
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
		public List<OtherInfo> getOtherList() {
			return otherList;
		}
		public void setOtherList(List<OtherInfo> otherList) {
			this.otherList = otherList;
		}
		public String getProtocolnumber() {
			return protocolnumber;
		}
		public void setProtocolnumber(String protocolnumber) {
			this.protocolnumber = protocolnumber;
		}
		public String getHousebasicid() {
			return housebasicid;
		}
		public void setHousebasicid(String housebasicid) {
			this.housebasicid = housebasicid;
		}
		public String getAgreementnum() {
			return agreementnum;
		}
		public void setAgreementnum(String agreementnum) {
			this.agreementnum = agreementnum;
		}
		public String getAtype() {
			return atype;
		}
		public void setAtype(String atype) {
			this.atype = atype;
		}
		public String getVacatepeople() {
			return vacatepeople;
		}
		public void setVacatepeople(String vacatepeople) {
			this.vacatepeople = vacatepeople;
		}
		public BigDecimal getScydmj() {
			return scydmj;
		}
		public void setScydmj(BigDecimal scydmj) {
			this.scydmj = scydmj;
		}
		public String getHomesteadyear() {
			return homesteadyear;
		}
		public void setHomesteadyear(String homesteadyear) {
			this.homesteadyear = homesteadyear;
		}
		public BigDecimal getConhomestarea() {
			return conhomestarea;
		}
		public void setConhomestarea(BigDecimal conhomestarea) {
			this.conhomestarea = conhomestarea;
		}
		public BigDecimal getOverhomesteadarea() {
			return overhomesteadarea;
		}
		public void setOverhomesteadarea(BigDecimal overhomesteadarea) {
			this.overhomesteadarea = overhomesteadarea;
		}
		public BigDecimal getShed() {
			return shed;
		}
		public void setShed(BigDecimal shed) {
			this.shed = shed;
		}
		public BigDecimal getFwbcmj() {
			return fwbcmj;
		}
		public void setFwbcmj(BigDecimal fwbcmj) {
			this.fwbcmj = fwbcmj;
		}
		public Integer getRdbazrk() {
			return rdbazrk;
		}
		public void setRdbazrk(Integer rdbazrk) {
			this.rdbazrk = rdbazrk;
		}
		public String getRdbazrkxx() {
			return rdbazrkxx;
		}
		public void setRdbazrkxx(String rdbazrkxx) {
			this.rdbazrkxx = rdbazrkxx;
		}
		public String getFyxx() {
			return fyxx;
		}
		public void setFyxx(String fyxx) {
			this.fyxx = fyxx;
		}
		public BigDecimal getSjxfmj() {
			return sjxfmj;
		}
		public void setSjxfmj(BigDecimal sjxfmj) {
			this.sjxfmj = sjxfmj;
		}
		public Integer getYjs() {
			return yjs;
		}
		public void setYjs(Integer yjs) {
			this.yjs = yjs;
		}
		public Integer getLjs70() {
			return ljs70;
		}
		public void setLjs70(Integer ljs70) {
			this.ljs70 = ljs70;
		}
		public Integer getLjs75() {
			return ljs75;
		}
		public void setLjs75(Integer ljs75) {
			this.ljs75 = ljs75;
		}
		public Integer getLjs80() {
			return ljs80;
		}
		public void setLjs80(Integer ljs80) {
			this.ljs80 = ljs80;
		}
		public Integer getLjs85() {
			return ljs85;
		}
		public void setLjs85(Integer ljs85) {
			this.ljs85 = ljs85;
		}
		public Integer getSjs() {
			return sjs;
		}
		public void setSjs(Integer sjs) {
			this.sjs = sjs;
		}
		public BigDecimal getAzfgfk() {
			return azfgfk;
		}
		public void setAzfgfk(BigDecimal azfgfk) {
			this.azfgfk = azfgfk;
			if(null !=azfgfk){
				dxazfgfk=MoneyUtils.change(azfgfk.doubleValue());
			}
		}
		public BigDecimal getZjdttzj() {
			return zjdttzj;
		}
		public void setZjdttzj(BigDecimal zjdttzj) {
			this.zjdttzj = zjdttzj;
		}
		public String getPgjg() {
			return pgjg;
		}
		public void setPgjg(String pgjg) {
			this.pgjg = pgjg;
		}
		public BigDecimal getZjdttbck() {
			return zjdttbck;
		}
		public void setZjdttbck(BigDecimal zjdttbck) {
			this.zjdttbck = zjdttbck;
		}
		public BigDecimal getKzzjdqwbcj() {
			return kzzjdqwbcj;
		}
		public void setKzzjdqwbcj(BigDecimal kzzjdqwbcj) {
			this.kzzjdqwbcj = kzzjdqwbcj;
		}
		public BigDecimal getCkzjdqwbcj() {
			return ckzjdqwbcj;
		}
		public void setCkzjdqwbcj(BigDecimal ckzjdqwbcj) {
			this.ckzjdqwbcj = ckzjdqwbcj;
		}
		public BigDecimal getBttfwczcxj() {
			return bttfwczcxj;
		}
		public void setBttfwczcxj(BigDecimal bttfwczcxj) {
			this.bttfwczcxj = bttfwczcxj;
		}
		public BigDecimal getJlbzhj() {
			return jlbzhj;
		}
		public void setJlbzhj(BigDecimal jlbzhj) {
			this.jlbzhj = jlbzhj;
		}
		public BigDecimal getTqbjl() {
			return tqbjl;
		}
		public void setTqbjl(BigDecimal tqbjl) {
			this.tqbjl = tqbjl;
		}
		public BigDecimal getGcphjl() {
			return gcphjl;
		}
		public void setGcphjl(BigDecimal gcphjl) {
			this.gcphjl = gcphjl;
		}
		public BigDecimal getTtcjjl() {
			return ttcjjl;
		}
		public void setTtcjjl(BigDecimal ttcjjl) {
			this.ttcjjl = ttcjjl;
		}
		public BigDecimal getWwzjl() {
			return wwzjl;
		}
		public void setWwzjl(BigDecimal wwzjl) {
			this.wwzjl = wwzjl;
		}
		public BigDecimal getWjecjj() {
			return wjecjj;
		}
		public void setWjecjj(BigDecimal wjecjj) {
			this.wjecjj = wjecjj;
		}
		public BigDecimal getBzfhj() {
			return bzfhj;
		}
		public void setBzfhj(BigDecimal bzfhj) {
			this.bzfhj = bzfhj;
		}
		public BigDecimal getBjbz() {
			return bjbz;
		}
		public void setBjbz(BigDecimal bjbz) {
			this.bjbz = bjbz;
		}
		public BigDecimal getQfbz() {
			return qfbz;
		}
		public void setQfbz(BigDecimal qfbz) {
			this.qfbz = qfbz;
		}
		public BigDecimal getDbbz() {
			return dbbz;
		}
		public void setDbbz(BigDecimal dbbz) {
			this.dbbz = dbbz;
		}
		public BigDecimal getCjbz() {
			return cjbz;
		}
		public void setCjbz(BigDecimal cjbz) {
			this.cjbz = cjbz;
		}
		public BigDecimal getDbhbz() {
			return dbhbz;
		}
		public void setDbhbz(BigDecimal dbhbz) {
			this.dbhbz = dbhbz;
		}
		public BigDecimal getDsznbz() {
			return dsznbz;
		}
		public void setDsznbz(BigDecimal dsznbz) {
			this.dsznbz = dsznbz;
		}
		public BigDecimal getTctdbz() {
			return tctdbz;
		}
		public void setTctdbz(BigDecimal tctdbz) {
			this.tctdbz = tctdbz;
		}
		public BigDecimal getOtherbz() {
			return otherbz;
		}
		public void setOtherbz(BigDecimal otherbz) {
			this.otherbz = otherbz;
		}
		public BigDecimal getJlfsum() {
			return jlfsum;
		}
		public void setJlfsum(BigDecimal jlfsum) {
			this.jlfsum = jlfsum;
		}
		public String getTtrq() {
			return ttrq;
		}
		public void setTtrq(String ttrq) {
			this.ttrq = ttrq;
		}
		public Long getIndexnum() {
			return indexnum;
		}
		public void setIndexnum(Long indexnum) {
			this.indexnum = indexnum;
			this.indexNumStr = getIndexNumStr(indexnum);
		}
		public String getTime() {
			return time;
		}
		public void setTime(String time) {
			this.time = time;
			if(!StringUtils.isBlank(time)){
				displaydate = DateUtil.DateToString(new Date(Long.parseLong(time)), DateStyle.YYYY_MM_DD_HH_MM_SS_CN);
			}
		}
		public String getUserid() {
			return userid;
		}
		public void setUserid(String userid) {
			this.userid = userid;
		}
		public String getOperatedate() {
			return operatedate;
		}
		public void setOperatedate(String operatedate) {
			this.operatedate = operatedate;
		}
		public String getServiceip() {
			return serviceip;
		}
		public void setServiceip(String serviceip) {
			this.serviceip = serviceip;
		}
		public String getDisplaydate() {
			return displaydate;
		}
		public void setDisplaydate(String displaydate) {
			this.displaydate = displaydate;
		}
		public String getAgreenmentid() {
			return agreenmentid;
		}
		public void setAgreenmentid(String agreenmentid) {
			this.agreenmentid = agreenmentid;
		}
		public String getIndexid() {
			return indexid;
		}
		public void setIndexid(String indexid) {
			this.indexid = indexid;
		}
		public String getHasothers() {
			return hasothers;
		}
		public void setHasothers(String hasothers) {
			this.hasothers = hasothers;
		}

		public BigDecimal getJshk() {
			try {
				BigDecimal bigzjd = new BigDecimal(0);
				BigDecimal bigazfgfk = new BigDecimal(0);
				if(null != zjdttzj){
					bigzjd = new BigDecimal(zjdttzj.doubleValue());
				}
				if(null != azfgfk){
					bigazfgfk = new BigDecimal(azfgfk.doubleValue());
				}
				BigDecimal b = new BigDecimal(bigzjd.doubleValue() - bigazfgfk.doubleValue());
				return b;
			} catch (Exception e) {
				// TODO: handle exception
			}
			return new BigDecimal(0);
		}
		public void setXfts(Integer xfts) {
			this.xfts = xfts;
		}
		public void setXfarea(BigDecimal xfarea) {
			this.xfarea = xfarea;
		}
		public void setJshk(BigDecimal jshk) {
			this.jshk = jshk;
		}	
		//over  超出宅基地
		
		public BigDecimal getRdzjdmj() {
			BigDecimal bd = getSumValue(0.00,conhomestarea);
			bd = getSumValue(bd.doubleValue(),overhomesteadarea);
			return  bd;
		}
		public void setRdzjdmj(BigDecimal rdzjdmj) {
			this.rdzjdmj = rdzjdmj;
		}
		public String getIndexNumStr() {
			return indexNumStr;
		}
		public void setIndexNumStr(String indexNumStr) {
			this.indexNumStr = indexNumStr;
		}
		public String getOperatename() {
			return operatename;
		}
		public void setOperatename(String operatename) {
			this.operatename = operatename;
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
			sb.append(getDisplayPeopleInfo("在册 :",vacatelist));
			sb.append(getDisplayPeopleInfo("非在册:     ",list));
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
//				sb.append("姓名 :&nbsp;&nbsp;");
				sb.append(v.getName());
				sb.append("&nbsp;&nbsp;身份证:&nbsp;&nbsp;"+v.getIdcard());
				sb.append("&nbsp;&nbsp;");
			}
			return sb.toString();
		}
		
		public void setPeopleinfo(String peopleinfo) {
			this.peopleinfo = peopleinfo;
		}
		public Integer getXfts() {
			return xfts;
		}
		public BigDecimal getXfarea() {
			return xfarea;
		}
		public BigDecimal getZxsbfsw() {
			return zxsbfsw;
		}
		public BigDecimal getZbnmj() {
			return zbnmj;
		}
		public BigDecimal getCzbmj() {
			return czbmj;
		}
		public BigDecimal getFwjk() {
			return fwjk;
		}
		public BigDecimal getZbngfk() {
			return zbngfk;
		}
		public BigDecimal getZbwgfk() {
			return zbwgfk;
		}
		public void setZxsbfsw(BigDecimal zxsbfsw) {
			this.zxsbfsw = zxsbfsw;
		}
		public void setZbnmj(BigDecimal zbnmj) {
			this.zbnmj = zbnmj;
		}
		public void setCzbmj(BigDecimal czbmj) {
			this.czbmj = czbmj;
		}
		public void setFwjk(BigDecimal fwjk) {
			this.fwjk = fwjk;
		}
		public void setZbngfk(BigDecimal zbngfk) {
			
			this.zbngfk = zbngfk;
		}
		public void setZbwgfk(BigDecimal zbwgfk) {
			this.zbwgfk = zbwgfk;
		}
		public String getDxzbngfk() {
			if(null != zbngfk){
				this.dxzbngfk = MoneyUtils.change(zbngfk.doubleValue());
			}
			return dxzbngfk;
		}
		public String getDxzbwgfk() {
			if(null != zbwgfk){
				this.dxzbwgfk = MoneyUtils.change(zbwgfk.doubleValue());
			}
			return dxzbwgfk;
		}
		public void setDxzbngfk(String dxzbngfk) {
			
			this.dxzbngfk = dxzbngfk;
		}
		public void setDxzbwgfk(String dxzbwgfk) {
			this.dxzbwgfk = dxzbwgfk;
		}
		public BigDecimal getYxmj() {
			return yxmj;
		}
		public BigDecimal getZxsbfswjk() {
			return zxsbfswjk;
		}
		public void setYxmj(BigDecimal yxmj) {
			this.yxmj = yxmj;
		}
		public void setZxsbfswjk(BigDecimal zxsbfswjk) {
			this.zxsbfswjk = zxsbfswjk;
		}
		public BigDecimal getDsbzf() {
			return dsbzf;
		}
		public BigDecimal getXgbzf() {
			return xgbzf;
		}
		public BigDecimal getZjdypwpbz() {
			return zjdypwpbz;
		}
		public BigDecimal getYhzbwxmbc() {
			return yhzbwxmbc;
		}

		public String getBzbzmj() {
			return bzbzmj;
		}
		public void setDsbzf(BigDecimal dsbzf) {
			this.dsbzf = dsbzf;
		}
		public void setXgbzf(BigDecimal xgbzf) {
			this.xgbzf = xgbzf;
		}
		public void setZjdypwpbz(BigDecimal zjdypwpbz) {
			this.zjdypwpbz = zjdypwpbz;
		}
		public void setYhzbwxmbc(BigDecimal yhzbwxmbc) {
			this.yhzbwxmbc = yhzbwxmbc;
		}

		public void setBzbzmj(String bzbzmj) {
			this.bzbzmj = bzbzmj;
		}
		public BigDecimal getZzbz() {
			return zzbz;
		}
		public void setZzbz(BigDecimal zzbz) {
			this.zzbz = zzbz;
		}
		public String getRdzjdallarea() {
			return rdzjdallarea.trim();
		}
		public void setRdzjdallarea(String rdzjdallarea) {
			this.rdzjdallarea = rdzjdallarea;
		}
		public String getKzqwbcmjj() {
			if(null != kzzjdqwbcj&&null != fwbcmj){
				double d = kzzjdqwbcj.doubleValue()/fwbcmj.doubleValue();
				java.text.DecimalFormat df=new java.text.DecimalFormat("#");
//				kzqwbcmjj = df.format(d);
				Double dv = new Double(d);
				return dv.intValue()+"";
			}
			return "";
		}
		public String getCkzqwbcmjj() {
			if(null != ckzjdqwbcj&&null != fwbcmj){
				double d = ckzjdqwbcj.doubleValue()/fwbcmj.doubleValue();
				Double dv = new Double(d);
				return dv.intValue()+"";
			}
			return "";
		}
		public String getFwjkmjj() {
			if(null != bttfwczcxj&&null != fwbcmj){
				double d = bttfwczcxj.doubleValue()/fwbcmj.doubleValue();
				Double dv = new Double(d);
				return dv.intValue()+"";
			}
			return "";
		}
		public String getSbzxmjj() {
			if(null != zxsbfswjk&&null != fwbcmj){
				double d = zxsbfswjk.doubleValue()/fwbcmj.doubleValue();
				Double dv = new Double(d);
				return dv.intValue()+"";
			}
			return "";
		}
		public void setKzqwbcmjj(String kzqwbcmjj) {
			this.kzqwbcmjj = kzqwbcmjj;
		}
		public void setCkzqwbcmjj(String ckzqwbcmjj) {
			this.ckzqwbcmjj = ckzqwbcmjj;
		}
		public void setFwjkmjj(String fwjkmjj) {
			this.fwjkmjj = fwjkmjj;
		}
		public void setSbzxmjj(String sbzxmjj) {
			this.sbzxmjj = sbzxmjj;
		}
		public String getIslock() {
			return islock;
		}
		public void setIslock(String islock) {
			this.islock = islock;
		}
		public String getGfbz50() {
			return gfbz50;
		}
		public String getGfbz45() {
			return gfbz45;
		}
		public void setGfbz50(String gfbz50) {
			this.gfbz50 = gfbz50;
		}
		public void setGfbz45(String gfbz45) {
			this.gfbz45 = gfbz45;
		}
		public String getAzrkxx() {
			return azrkxx;
		}
		public void setAzrkxx(String azrkxx) {
			this.azrkxx = azrkxx;
		}
		public String getCf() {
			return cf;
		}
		public void setCf(String cf) {
			this.cf = cf;
		}
		public String getCfdate() {
			return cfdate;
		}
		public void setCfdate(String cfdate) {
			this.cfdate = cfdate;
		}
		public String getBcklq() {
			return bcklq;
		}
		public void setBcklq(String bcklq) {
			this.bcklq = bcklq;
		}
		public String getBcklqdate() {
			return bcklqdate;
		}
		public void setBcklqdate(String bcklqdate) {
			this.bcklqdate = bcklqdate;
		}
		
		
		
}
