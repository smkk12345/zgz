package com.hibernate.houseinfo.domain;

import java.io.Serializable;
import java.math.BigDecimal;

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
	//房屋坐落 
	private String location;
	//联系固话
	private String telephone;
	//手机
	private	String mobile;
	//被腾退人姓名
	private String names;
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
	
	private String housebasicid;
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
}
