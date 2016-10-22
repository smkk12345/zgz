package com.spring.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.utils.CalendarUtil;
import com.common.utils.FileUtils;
import com.common.utils.RequestUtil;
import com.common.utils.StringUtils;
import com.hibernate.barnInfo.domain.AoJianBean;
import com.hibernate.barnInfo.domain.AoJianGrainInfoBean;
import com.hibernate.barnInfo.domain.BarnBean;
import com.hibernate.base.Md5;
import com.hibernate.baseSettingInfo.domain.AlarmBean;
import com.hibernate.baseSettingInfo.domain.BaseSettingBean;
import com.hibernate.baseSettingInfo.domain.GrainTypeBean;
import com.hibernate.sernsorInfo.domain.AlarmDataInfoBean;
import com.hibernate.sernsorInfo.domain.AoJianDataBean;
import com.hibernate.sernsorInfo.domain.OperateRecordBean;
import com.hibernate.sernsorInfo.domain.SensorArrangementBean;
import com.hibernate.sernsorInfo.domain.SensorDataBean;
import com.hibernate.userInfo.damain.RoleBean;
import com.hibernate.userInfo.damain.User;
import com.spring.ServiceManager;

@Controller
public class MobileController {

	private String returnResult = "";
	private JSONArray SensorDataBeanArray;
	private String temJsonString;
	private String humJsonString;
	private String wetJsonString;
	private AoJianDataBean aoJianDataBean;
	private ArrayList<AoJianBean> aojianbeanList;
	private AoJianBean aoJianBean;
	private SensorArrangementBean arrangementBean;
	private List<OperateRecordBean> operateRecordList;

	private ArrayList<SensorDataBean> bigFormList;
	private String rightLevelId;
	private ArrayList<ArrayList<SensorDataBean>> bigFormLists = new ArrayList<ArrayList<SensorDataBean>>();
	private List<AoJianDataBean> aoJianDataBeansTemps = new ArrayList<AoJianDataBean>();
	private ArrayList<List<SensorDataBean>> sensorDataBeanSS = new ArrayList<List<SensorDataBean>>();

	public static void builtAlarmData(Date occurTime) {
		// aoJian
		String zyAoJianNum = "zy07311104313510000";
		String displayAlarmInfo = "2仓（2#廒间）";
		String alarmInfoType = "粮情告警";

		String[] userInfo = { "001", "admin" };
		AlarmDataInfoBean bean = new AlarmDataInfoBean();

		bean.setAlarmInfo("当前面(列4)垂直温度极差偏高");

		bean.setAlarmInfoType(alarmInfoType);
		bean.setAlarmTime(occurTime);
		bean.setDisplayAlarmInfo(displayAlarmInfo);
		bean.setDisplayNames(userInfo[1]);
		bean.setUserId(userInfo[0]);
		bean.setSecondAlarmType("温度告警");
		bean.setZyAoJianNum(zyAoJianNum);
		bean.setStatus("0");
		try {
			ServiceManager.getAlarmDataInfoServiceImpl().save(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// //
	// public static void main(String[] args) {
	// // for (int i = 0; i < 29; i++) {
	// // Date date = new Date(2015, 9, i + 1);
	// // builtAlarmData(date);
	// // }
	// // TODO Auto-generated method stub
	// try {
	// // new test().saveFile();
	// String[] a = { "402881e8505f70cf01505fb96878144c",
	// "402881e8505f70cf01505fb96878144d",
	// "402881e8506153fe015061589c3c0010",
	// "402881eb501c484901501c74da51003a" };
	// // System.out.println();
	// // ArrayList<AoJianBean> aaaa =(ArrayList<AoJianBean>)
	// ServiceManager.getAoJianServiceImpl().findAll();
	// for (int i = 0; i < a.length; i++) {
	// AoJianDataBean data = ServiceManager.getAoJianBlockService()
	// .getById(a[i]);
	// if(data!=null&& data.getSensors()!=null){
	// Iterator<SensorDataBean> it = data.getSensors().iterator();
	// while (it.hasNext()) {
	// SensorDataBean sensorData = (SensorDataBean) it.next();
	// String[] posArr = sensorData.getSensorIndex().split(",");
	// System.out.println(sensorData.getSensorIndex());
	// Integer index = (Integer.valueOf(posArr[0]) + 1)
	// + (Integer.valueOf(posArr[1]) + 1) * 10000
	// + Integer.valueOf(posArr[2]) * 100;
	// System.out.println(index);
	// sensorData.setOrderIndex(index);
	// try {
	// ServiceManager.getAoJianBlockService()
	// .updateSensorData(sensorData);
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	// }
	//
	// }else{
	// System.out.println("---weikong");
	// }
	// }
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	//
	// }

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// TRY {
		// // NEW TEST().SAVEFILE();
		// ARRAYLIST<AOJIANDATABEAN> AOJIANDATABEANS =
		// (ARRAYLIST<AOJIANDATABEAN>) SERVICEMANAGER
		// .GETAOJIANBLOCKSERVICE().FINDALL();
		// // AOJIANDATABEAN DATA =
		// //
		// SERVICEMANAGER.GETAOJIANBLOCKSERVICE().GETBYID("297E6FB650A2E3FB0150A2E49A030002");
		// FOR (INT I = 0; I < AOJIANDATABEANS.SIZE(); I++) {
		// AOJIANDATABEAN DATA = AOJIANDATABEANS.GET(I);
		//
		// // ITERATOR<SENSORDATABEAN> IT = DATA.GETSENSORS().ITERATOR();
		// WHILE (IT.HASNEXT()) {
		// SENSORDATABEAN SENSORDATA = (SENSORDATABEAN) IT.NEXT();
		// STRING[] POSARR = SENSORDATA.GETSENSORINDEX().SPLIT(",");
		// INTEGER INDEX = (INTEGER.VALUEOF(POSARR[0]) + 1) * 1000
		// + (INTEGER.VALUEOF(POSARR[1]) + 1) * 10
		// + INTEGER.VALUEOF(POSARR[2]);
		// SENSORDATA.SETORDERINDEX(INDEX);
		// TRY {
		// SERVICEMANAGER.GETAOJIANBLOCKSERVICE().UPDATE(DATA);
		// } CATCH (EXCEPTION E) {
		// E.PRINTSTACKTRACE();
		// }
		// }
		// }

		// } catch (Exception e) {
		// e.printStackTrace();
		// }
	}

	/**
	 * 用法登陆验证
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return @RequestMapping({"/mobile/allUser.action"},
	 *         method=RequestMethod.GET)
	 */
	@RequestMapping(value = "/mobile/singleAoJianInfo.action", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	// 用法登陆验证
	// @RequestMapping(value = "/mobile/allUser.action")
	public String singleAoJianInfo(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {

		int code = 0;
		String message = "成功了";
		User user = null;
		String name = RequestUtil.getRequestParameter(request, "userName");
		String pwd = RequestUtil.getRequestParameter(request, "password");
		String zyAoJianNum = RequestUtil.getRequestParameter(request,
				"zyAoJianNum");

		// System.out.println("---name---" + name + "---pwd----" + pwd);
		if ((name.length() > 0 || pwd.length() > 0)) {
			pwd = Md5.getMD5(pwd.getBytes());
			List<User> list = ServiceManager.getUserService().getByName(name);
			System.out.println("\r\nlist---" + list.toString());
			String nameList = null;
			if (list != null && list.size() > 0) {
				user = list.get(0);
				String[] aoJianBianHaoShuZu;
				if (user.getPassWord().equals(pwd)) {// 密码验证成功

					AoJianBean aoJian = ServiceManager.getAoJianServiceImpl()
							.getById(zyAoJianNum);
					if (aoJian != null) {
						SensorArrangementBean arrangementBean = ServiceManager
								.getSensorArrangementServiceImpl().getById(
										aoJian.getSensorArrangementbeanId());
						BarnBean barn = ServiceManager.getBarnServiceImpl()
								.getById(aoJian.getBarnId());
						getAoJianDataBean(aoJian);
						Map<String, AlarmBean> map = getAlarmInfo(aoJian);

						AlarmBean temAlarmBean = (AlarmBean) map.get("tem");
						AlarmBean humAlarmBean = (AlarmBean) map.get("hum");
						AlarmBean wetAlarmBean = (AlarmBean) map.get("wet");
						if (temAlarmBean != null) {
							JSONObject temJson = JSONObject
									.fromObject(temAlarmBean);
							temJsonString = temJson.toString();
							System.out.println("----1-----" + temJsonString);
						}
						if (humAlarmBean != null) {
							JSONObject humJson = JSONObject
									.fromObject(humAlarmBean);
							humJsonString = humJson.toString();
							System.out.println("----2-----" + humJsonString);
						}
						if (wetAlarmBean != null) {
							JSONObject wetJson = JSONObject
									.fromObject(wetAlarmBean);
							wetJsonString = wetJson.toString();
							System.out.println("----3-----" + wetJsonString);
						}
						List<User> userList = new ArrayList<User>();

						List<String> operateTypeList = ServiceManager
								.getOperateRecordServiceImpl()
								.getOperateTypeList();
						List<User> userListAlarm = new ArrayList<User>();
						// 告警类别
						List<String> alarmTypeList = new ArrayList<String>() {
							{
								add("粮情告警");
							}
						};
						String aoJianGrainType = aoJian
								.getAoJianGrainInfoBean().getGrainType();
						GrainTypeBean grainTypeBeans = ServiceManager
								.getGrainTypeServiceImpl().getById(
										aoJianGrainType);
						String rightLevelId = user.getRightLevel();
						if ("3".equals(rightLevelId)
								|| "4".equals(rightLevelId)) {
							userList = ServiceManager.getUserService()
									.findByContent(aoJian.getZyAoJianNum());
							userListAlarm = userList;
						} else {
							userList = ServiceManager.getUserService()
									.findAll();
							userListAlarm = ServiceManager.getUserService()
									.getListByRoleId("3");

						}
						code = 200;
						message = "数据获取成功！";
						returnResult = "{\"code\":" + code + ",\"message\":\""
								+ message
								+"\",\"loginBean\":{\"aoJianBean\":"
								+ JSONObject.fromObject(aoJian).toString()
								+ ",\"barnBean\":"
								+ JSONObject.fromObject(barn).toString()
								+ ",\"user\":"
								+ JSONObject.fromObject(user).toString()
								+ ",\"aoJianDataBeans\":"
								+ JSONArray.fromObject(aoJianDataBeansTemps)
								+ ",\"sensorDataBeanSS\":"
								+ JSONArray.fromObject(sensorDataBeanSS)
								+ ",\"bigFormLists\":"
								+ JSONArray.fromObject(bigFormLists)
								+ ",\"temJsonString\":" + temJsonString
								+ ",\"humJsonString\":" + humJsonString
								+ ",\"wetJsonString\":" + wetJsonString
								+ ",\"userList\":"
								+ JSONArray.fromObject(userList)
								+ ",\"operateTypeList\":"
								+ JSONArray.fromObject(operateTypeList)
								+ ",\"userListAlarm\":"
								+ JSONArray.fromObject(userListAlarm)
								+ ",\"alarmTypeList\":"
								+ JSONArray.fromObject(alarmTypeList)
								+ ",\"grainTypeBeans\":"
								+ JSONArray.fromObject(grainTypeBeans)
								+ ",\"arrangementBean\":"
								+ JSONObject.fromObject(arrangementBean) + "}}";
					} else {
						code = 403;
						message = "密码已验证，默认廒间为空!";
						returnResult = "{\"code\":" + code + ",\"message\":\""
								+ message + "\"}";
					}
				} else {
					code = 402;
					message = "密码验证失败!";
					returnResult = "{\"code\":" + code + ",\"message\":\""
							+ message + "\"}";
				}

			}

		} else {// 密码验证失败
			code = 401;
			message = "账号密码为空!";
			returnResult = "{\"code\":" + code + ",\"message\":\"" + message
					+ "\"}";
		}

		System.out.println(returnResult);
		return returnResult;

	}

	/**
	 * 用法登陆验证
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return @RequestMapping({"/mobile/allUser.action"},
	 *         method=RequestMethod.GET)
	 */
	@RequestMapping(value = "/mobile/getMoreAlarmInfo.action", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	// 用法登陆验证
	// @RequestMapping(value = "/mobile/allUser.action")
	public String getMoreAlarmInfo(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		JSONArray barnSetArray = null, aoJianBeansArray = null, aoJianDataBeansArray = null;

		int code = 0;
		String message = "成功了";
		User user = null;
		String name = RequestUtil.getRequestParameter(request, "userName");
		String pwd = RequestUtil.getRequestParameter(request, "password");
		String pageNoTemp = RequestUtil.getRequestParameter(request, "pageNo");

		// System.out.println("---name---" + name + "---pwd----" + pwd);
		if ((name.length() > 0 || pwd.length() > 0)) {
			pwd = Md5.getMD5(pwd.getBytes());
			List<User> list = ServiceManager.getUserService().getByName(name);
			System.out.println("\r\nlist---" + list.toString());
			String nameList = null;
			if (list != null && list.size() > 0) {
				user = list.get(0);
				String[] aoJianBianHaoShuZu;
				if (user.getPassWord().equals(pwd)) {// 密码验证成功
					code = 200;
					message = "账号密码验证成功！";

					int pageSize = 0;
					int pageNo = 0;
					if (!StringUtils.isEmpty(pageNoTemp)) {
						pageNo = Integer.parseInt(RequestUtil
								.getRequestParameter(request, "pageNo"));
					}
					if (!StringUtils.isEmpty(RequestUtil.getRequestParameter(
							request, "pageSize"))) {
						pageSize = Integer.parseInt(RequestUtil
								.getRequestParameter(request, "pageSize"));
					}
					rightLevelId = user.getRightLevel();
					List<AlarmDataInfoBean> alarmDataInfoList = new ArrayList<AlarmDataInfoBean>();
					if ("3".equals(rightLevelId) || "4".equals(rightLevelId)) {

						alarmDataInfoList = ServiceManager
								.getAlarmDataInfoServiceImpl()
								.getAlarmListByStatus("0", pageNo, pageSize,
										user.getId());
					} else {

						alarmDataInfoList = ServiceManager
								.getAlarmDataInfoServiceImpl()
								.getAlarmListByStatus("0", pageNo, pageSize,
										null);
					}

					JSONArray alarmDataInfoListArray = JSONArray
							.fromObject(alarmDataInfoList);
					code = 200;
					message = "数据获取成功!";
					returnResult = "{\"code\":" + code + ",\"message\":\""
							+ message + "\",\"alarmDataInfoList\":"
							+ alarmDataInfoListArray.toString() + "}";
					System.out.println(returnResult);
				} else {
					code = 403;
					message = "密码验证失败!";
					returnResult = "{\"code\":" + code + ",\"message\":\""
							+ message + "\"}";
				}

			} else {// 密码验证失败
				code = 402;
				message = "没有这个账号";
				returnResult = "{\"code\":" + code + ",\"message\":\""
						+ message + "\"}";
			}

		} else {
			code = 401;
			message = "账号密码为空";
			returnResult = "{\"code\":" + code + ",\"message\":\"" + message
					+ "\"}";
		}

		return returnResult;

	}

	/**
	 * 用法登陆验证
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return @RequestMapping({"/mobile/allUser.action"},
	 *         method=RequestMethod.GET)
	 */
	@RequestMapping(value = "/mobile/updatePwd.action", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	// 用法登陆验证
	// @RequestMapping(value = "/mobile/allUser.action")
	public String usePwdrManager(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		JSONArray barnSetArray = null, aoJianBeansArray = null, aoJianDataBeansArray = null;

		int code = 0;
		String message = "成功了";
		User user = null;
		String name = RequestUtil.getRequestParameter(request, "userName");
		String pwd = RequestUtil.getRequestParameter(request, "password");

		// System.out.println("---name---" + name + "---pwd----" + pwd);
		if ((name.length() > 0 || pwd.length() > 0)) {
			pwd = Md5.getMD5(pwd.getBytes());
			List<User> list = ServiceManager.getUserService().getByName(name);
			System.out.println("\r\nlist---" + list.toString());

			String nameList = null;
			if (list != null && list.size() > 0) {
				user = list.get(0);
				String[] aoJianBianHaoShuZu;
				if (user.getPassWord().equals(pwd)) {// 密码验证成功
					code = 200;
					message = "账号密码验证成功！";
					boolean isUpdatePwdState = updatePwdMethod(request,
							user.getId());
					if (isUpdatePwdState) {
						code = 200;
						message = "密码修改成功";
						returnResult = "{\"code\":" + code + ",\"message\":\""
								+ message + "\"}";

					} else {
						code = 404;
						message = "密码修改失败";
						returnResult = "{\"code\":" + code + ",\"message\":\""
								+ message + "\"}";
					}

				} else {
					code = 403;
					message = "密码错误";
					returnResult = "{\"code\":" + code + ",\"message\":\""
							+ message + "\"}";

				}
			} else {// 密码验证失败
				code = 402;
				message = "没有这个账号";
				returnResult = "{\"code\":" + code + ",\"message\":\""
						+ message + "\"}";
			}
		} else {
			code = 401;
			message = "账号密码为空";
			returnResult = "{\"code\":" + code + ",\"message\":\"" + message
					+ "\"}";
		}

		System.out.println(returnResult);
		return returnResult;

	}

	public boolean updatePwdMethod(HttpServletRequest request, String userId) {

		User bean;

		bean = ServiceManager.getUserService().getById(userId);
		if (bean == null)
			bean = new User();
		String passWord = RequestUtil.getRequestParameter(request, "newpwd");
		if (!StringUtils.isEmpty(passWord)) {
			passWord = Md5.getMD5(passWord.getBytes());
			bean.setPassWord(passWord);
		}
		String userName = RequestUtil.getRequestParameter(request, "userName");
		if (!StringUtils.isEmpty(userName)) {
			bean.setUserName(userName);
		}
		String displayName = RequestUtil.getRequestParameter(request,
				"displayName");
		if (!StringUtils.isEmpty(displayName)) {
			bean.setDisplayName(displayName);
		}
		String tel = RequestUtil.getRequestParameter(request, "tel");
		if (!StringUtils.isEmpty(tel)) {
			bean.setTel(tel);
		}
		String roleId = RequestUtil.getRequestParameter(request, "roleId");
		if (!StringUtils.isEmpty(roleId)) {
			bean.setRightLevel(roleId);
		}
		String area = RequestUtil.getRequestParameter(request, "area");
		if (!StringUtils.isEmpty(area)) {
			bean.setArea(area);
		}
		String email = RequestUtil.getRequestParameter(request, "email");
		bean.setEmail(email);
		String memo = RequestUtil.getRequestParameter(request, "memo");
		bean.setMemo(memo);
		bean.setBuiltInUser("0");
		try {
			if (StringUtils.isEmpty(bean.getId())) {
				bean.setCreateTime(new Date());
				bean = ServiceManager.getUserService().save(bean);
				return true;
			} else {
				ServiceManager.getUserService().update(bean);
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 用法登陆验证
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return @RequestMapping({"/mobile/allUser.action"},
	 *         method=RequestMethod.GET)
	 */
	@RequestMapping(value = "/mobile/isDataDisConnection.action", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String isDataConnectionManager(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		String result = "";
		try {
			String cacheTime = "";
			BaseSettingBean bsBean = ServiceManager.getBaseSettingServiceImpl()
					.findValueByKey("cacheTime");
			if (null == bsBean) {
				cacheTime = "0.1";
			} else {
				cacheTime = bsBean.getValue();
			}

			URL path = Thread.currentThread().getContextClassLoader()
					.getResource("");
			String pathStr = path.getPath();
			String[] pathStrArr = pathStr.split("WEB-INF");
			String timeWriteInPath = pathStrArr[0] + "data\\sys\\"
					+ "RecentNewDataTime.txt";
			String timeStr = new FileUtils().read(timeWriteInPath);
			if (StringUtils.isEmpty(timeStr)) {
				Date curDate = new Date();
				timeStr = CalendarUtil.formatStr(curDate,
						CalendarUtil.DATE_FORMAT_MODE4);
			}
			Date date = CalendarUtil.formatDate(timeStr,
					CalendarUtil.DATE_FORMAT_MODE4);

			long timeDifference = new Date().getTime() - date.getTime();
			double cacheTimeLong = Double.parseDouble(cacheTime) * 3600 * 1000;

			if (timeDifference - cacheTimeLong > 60000) {
				returnResult = "{\"code\":" + 200 + ",\"message\":\"" + "状态异常"
						+ "\"" + ",\"isSecority\":\"false\"" + "}";
			} else {
				returnResult = "{\"code\":" + 200 + ",\"message\":\"" + "状态正常"
						+ "\"" + ",\"isSecority\":\"true\"" + "}";
			}
		} catch (Exception e) {
			e.printStackTrace();
			returnResult = "{\"code\":" + 400 + ",\"message\":\"" + "状态正常"
					+ "\"" + ",\"isSecority\":\"no\"" + "}";
		}
		System.out.println("---123--" + returnResult);
		return returnResult;
	}

	/**
	 * 用法登陆验证
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return @RequestMapping({"/mobile/allUser.action"},
	 *         method=RequestMethod.GET)
	 */
	@RequestMapping(value = "/mobile/allUser.action", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	// 用法登陆验证
	// @RequestMapping(value = "/mobile/allUser.action")
	public String userManager(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		JSONArray barnSetArray = null, aoJianBeansArray = null, aoJianDataBeansArray = null;

		int code = 0;
		String message = "成功了";
		User user = null;
		String name = RequestUtil.getRequestParameter(request, "userName");
		String pwd = RequestUtil.getRequestParameter(request, "password");

		// System.out.println("---name---" + name + "---pwd----" + pwd);
		if ((name.length() > 0 || pwd.length() > 0)) {
			pwd = Md5.getMD5(pwd.getBytes());
			List<User> list = ServiceManager.getUserService().getByName(name);

			String nameList = null;
			if (list != null && list.size() > 0) {
				user = list.get(0);
				String[] aoJianBianHaoShuZu;
				if (user.getPassWord().equals(pwd)) {// 密码验证成功

					Set<BarnBean> barnSet = new HashSet<BarnBean>();
					Set<AoJianBean> aoJianBeans = new HashSet<AoJianBean>();
					Set<AoJianDataBean> aoJianDataBeans = new HashSet<AoJianDataBean>();

					List<BarnBean> barnList = new ArrayList<BarnBean>();
					String aoJianIds = user.getRight_Content();
					if (!StringUtils.isEmpty(aoJianIds)) {
						if (aoJianIds.equals("all")) {
							barnList = ServiceManager.getBarnServiceImpl()
									.findAll();
						} else {
							String[] idArr = aoJianIds.split("#");
							for (int i = 0; i < idArr.length; i++) {
								String id = idArr[i];
								AoJianBean aoJian = ServiceManager
										.getAoJianServiceImpl().getById(id);

								aoJianBeans.add(aoJian);
								if (null != aoJian) {

									BarnBean barn = ServiceManager
											.getBarnServiceImpl().getById(
													aoJian.getBarnId());
									if (barnList.size() == 0)
										barnList.add(barn);
									else {
										for (int j = 0; j < barnList.size(); j++) {
											if ((!barn.getId().equals(
													barnList.get(j).getId()))
													&& (j == (barnList.size() - 1))) {
												barnList.add(barn);
											}
										}
									}
								}
							}
						}
						String rightLeveid = user.getRightLevel();
						RoleBean roleBean = ServiceManager.getRoleServiceImpl()
								.getById(rightLeveid);
						String aoJianId = user.getCurAoJianId();
						String aojianDataBeanString = "";
						BarnBean barnBean = new BarnBean();
						if (!StringUtils.isEmpty(aoJianId)) {
							AoJianBean bean = ServiceManager
									.getAoJianServiceImpl().getById(aoJianId);

							if (bean != null) {
								arrangementBean = ServiceManager
										.getSensorArrangementServiceImpl()
										.getById(
												bean.getSensorArrangementbeanId());
								barnBean = ServiceManager.getBarnServiceImpl()
										.getById(bean.getBarnId());

								getAoJianDataBean(bean);

								List<BarnBean> barnBeanList = barnList;

								barnSetArray = JSONArray
										.fromObject(barnBeanList);

								aoJianBeansArray = JSONArray
										.fromObject(aoJianBeans);

								Map<String, AlarmBean> map = getAlarmInfo(bean);
								;
								AlarmBean temAlarmBean = (AlarmBean) map
										.get("tem");
								AlarmBean humAlarmBean = (AlarmBean) map
										.get("hum");
								AlarmBean wetAlarmBean = (AlarmBean) map
										.get("wet");
								if (temAlarmBean != null) {
									JSONObject temJson = JSONObject
											.fromObject(temAlarmBean);
									temJsonString = temJson.toString();

								}
								if (humAlarmBean != null) {
									JSONObject humJson = JSONObject
											.fromObject(humAlarmBean);
									humJsonString = humJson.toString();

								}
								if (wetAlarmBean != null) {
									JSONObject wetJson = JSONObject
											.fromObject(wetAlarmBean);
									wetJsonString = wetJson.toString();

								}
							} else {
								bean = new AoJianBean();
							}

							List<User> userList = new ArrayList<User>();
							List<User> userListAlarm = new ArrayList<User>();
							String rightLevelId = user.getRightLevel();

							if ("3".equals(rightLevelId)
									|| "4".equals(rightLevelId)) {
								userList = ServiceManager.getUserService()
										.findByContent(bean.getZyAoJianNum());
								userListAlarm = userList;
							} else {
								userList = ServiceManager.getUserService()
										.findAll();
								userListAlarm = ServiceManager.getUserService()
										.getListByRoleId("3");

							}
							// userListAlarm = userList;
							// 告警类别
							List<String> alarmTypeList = new ArrayList<String>() {
								{
									add("粮情告警");
								}
							};
							StringBuffer sb = new StringBuffer();
							String uid = userList.get(0).getId();
							if (!StringUtils.isEmpty(uid)) {
								sb.append(" a.operateUserId='").append(uid)
										.append("' and ");
								Date end = new Date(System.currentTimeMillis());
								Calendar calendar = Calendar.getInstance();
								calendar.setTimeInMillis(System
										.currentTimeMillis());

								calendar.add(Calendar.DATE, -7); // 得到前一天
								String startDateStr = new SimpleDateFormat(
										"yyyy-MM-dd")
										.format(calendar.getTime());
								Date endDate = null;
								try {
									endDate = CalendarUtil.formatDate(
											end.toLocaleString(),
											CalendarUtil.DATE_FORMAT_MODE1);
								} catch (ParseException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
								endDate = CalendarUtil.getNextDate(endDate, 1,
										Calendar.DATE);
								String dateStr = CalendarUtil
										.formatStr(endDate,
												CalendarUtil.DATE_FORMAT_MODE1);
								sb.append(" a.operateTime <'").append(dateStr)
										.append("' and ");
								sb.append(" a.operateTime >'")
										.append(startDateStr).append("' and ");

							}
							String hql = "";
							if (sb.length() > 0) {
								hql = sb.substring(0, sb.length() - 4);
							}

							// 分页设置
							int pageNo = 0;
							int pageSize = 25;

							int defaultCounts = 100;// 默认页面显示数量
							operateRecordList = ServiceManager
									.getOperateRecordServiceImpl()
									.getOperateRecordByHql(hql, pageNo,
											pageSize);
							JSONArray operateRecordListArray = JSONArray
									.fromObject(operateRecordList);

							GrainTypeBean grainTypeBeans = new GrainTypeBean();
							if (bean.getAoJianGrainInfoBean() != null) {
								String aoJianGrainType = bean
										.getAoJianGrainInfoBean()
										.getGrainType();
								grainTypeBeans = ServiceManager
										.getGrainTypeServiceImpl().getById(
												aoJianGrainType);
							}

							pageNo = 0;
							pageSize = 5;

							if (!StringUtils.isEmpty(RequestUtil
									.getRequestParameter(request, "pageNo"))) {
								pageNo = Integer
										.parseInt(RequestUtil
												.getRequestParameter(request,
														"pageNo"));
							}
							if (!StringUtils.isEmpty(RequestUtil
									.getRequestParameter(request, "pageSize"))) {
								pageSize = Integer.parseInt(RequestUtil
										.getRequestParameter(request,
												"pageSize"));
							}
							pageNo = 1;
							pageSize = 50;
							int recordCount = 0;
							List<AlarmDataInfoBean> alarmDataInfoList = new ArrayList<AlarmDataInfoBean>();
							List<AlarmDataInfoBean> alarmDataInfoListDone = new ArrayList<AlarmDataInfoBean>();
							if ("3".equals(rightLevelId)
									|| "4".equals(rightLevelId)) {
								recordCount = ServiceManager
										.getAlarmDataInfoServiceImpl()
										.getAlarmNumByStatus("0",
												userList.get(0).getId());
								alarmDataInfoList = ServiceManager
										.getAlarmDataInfoServiceImpl()
										.getAlarmListByStatus("0", pageNo,
												pageSize,
												userList.get(0).getId());
								alarmDataInfoListDone = ServiceManager
										.getAlarmDataInfoServiceImpl()
										.getAlarmListByStatus("1", pageNo,
												pageSize,
												userList.get(0).getId());
							} else {
								recordCount = ServiceManager
										.getAlarmDataInfoServiceImpl()
										.getAlarmNumByStatus("0", null);
								alarmDataInfoList = ServiceManager
										.getAlarmDataInfoServiceImpl()
										.getAlarmListByStatus("0", pageNo,
												pageSize, null);
								alarmDataInfoListDone = ServiceManager
										.getAlarmDataInfoServiceImpl()
										.getAlarmListByStatus("1", pageNo,
												pageSize, null);
							}
							List<String> operateTypeList = ServiceManager
									.getOperateRecordServiceImpl()
									.getOperateTypeList();
							JSONArray alarmDataInfoListArray = JSONArray
									.fromObject(alarmDataInfoList);
							JSONArray alarmDataInfoListDoneArray = JSONArray
									.fromObject(alarmDataInfoListDone);
							code = 200;
							message = "获取数据成功";
							returnResult = "{\"code\":"
									+ code
									+ ",\"message\":\""
									+ message
									+ "\",\"loginBean\":{"
									+ "\"barnBeanLists\":"
									+ barnSetArray.toString()
									+ ",\"aoJianBeanLists\":"
									+ aoJianBeansArray.toString()
									+ ",\"aoJianBean\":"
									+ JSONObject.fromObject(bean).toString()
									+ ",\"barnBean\":"
									+ JSONObject.fromObject(barnBean)
											.toString()
									+ ",\"user\":"
									+ JSONObject.fromObject(user).toString()
									+ ",\"aoJianDataBeans\":"
									+ JSONArray
											.fromObject(aoJianDataBeansTemps)
									+ ",\"temAlarm\":" + temJsonString
									+ ",\"humAlarm\":" + humJsonString
									+ ",\"wetAlarm\":" + wetJsonString
									+ ",\"users\":"
									+ JSONArray.fromObject(userList)
									+ ",\"operationTypes\":"
									+ JSONArray.fromObject(operateTypeList)
									+ ",\"usersAlarm\":"
									+ JSONArray.fromObject(userListAlarm)
									+ ",\"alarmTypeListGaoJing\":"
									+ JSONArray.fromObject(alarmTypeList)
									+ ",\"bigFormLists\":"
									+ JSONArray.fromObject(bigFormLists)
									+ ",\"grainTypeBeanArrayLists\":"
									+ JSONArray.fromObject(grainTypeBeans)
									+ ",\"alarmDataInfoBeanDoneTempList\":"
									+ alarmDataInfoListDoneArray.toString()
									+ ",\"alarmDataInfoBeanTempList\":"
									+ alarmDataInfoListArray.toString()
									+ ",\"recordCount\":" + recordCount
									+ ",\"arrangementBean\":"
									+ JSONObject.fromObject(arrangementBean)
									+ ",\"roleBean\":"
									+ JSONObject.fromObject(roleBean)
									+ ",\"operateRecordList\":"
									+ operateRecordListArray.toString()
									+ ",\"sensorDataBeanSS\":"
									+ JSONArray.fromObject(sensorDataBeanSS)
									+ "}}";
						} else {
							code = 405;
							message = "默认廒间为空";
							returnResult = "{\"code\":" + code
									+ ",\"message\":\"" + message + "\"}";
						}

					} else {
						code = 404;
						message = "服务器数据异常";
						returnResult = "{\"code\":" + code + ",\"message\":\""
								+ message + "\"}";
					}

				} else {
					code = 403;
					message = "密码错误";
					returnResult = "{\"code\":" + code + ",\"message\":\""
							+ message + "\"}";
				}

			} else {// 密码验证失败
				code = 402;
				message = "账号密码验证失败";
				returnResult = "{\"code\":" + code + ",\"message\":\""
						+ message + "\"}";
			}

		} else {
			code = 401;
			message = "账号密码验证失败";
			returnResult = "{\"code\":" + code + ",\"message\":\"" + message
					+ "\"}";
		}

		System.out.println(returnResult);
		return returnResult;

	}

	private void getAoJianDataBean(AoJianBean aoJianBean) {
		// TODO Auto-generated method stub
		Map<Integer, List<SensorDataBean>> temMap;
		String result = "";
		AoJianGrainInfoBean aoJianGrainInfoBean = aoJianBean
				.getAoJianGrainInfoBean();
		if (aoJianGrainInfoBean != null) {
			String ZyAoJianNum = aoJianGrainInfoBean.getId();

			if (ZyAoJianNum != null && ZyAoJianNum.length() > 0) {
				String endDate = CalendarUtil
						.getCurrentDate(CalendarUtil.DATE_FORMAT_MODE1);
				Calendar calendar = Calendar.getInstance();
				calendar.add(Calendar.DATE, -1); // 得到前一天

				String startDate = new SimpleDateFormat("yyyy-MM-dd")
						.format(calendar.getTime());

				aoJianDataBeansTemps = ServiceManager.getAoJianBlockService()
						.getAoJianDataList(ZyAoJianNum, startDate, endDate);

				arrangementBean = ServiceManager
						.getSensorArrangementServiceImpl().getById(
								aoJianBean.getSensorArrangementbeanId());
				sensorDataBeanSS = new ArrayList<List<SensorDataBean>>();
				bigFormLists = new ArrayList<ArrayList<SensorDataBean>>();
				if (aoJianDataBeansTemps != null
						&& aoJianDataBeansTemps.size() > 0) {
					AoJianDataBean aoJianDataBeanTemp = aoJianDataBeansTemps
							.get(0);

					int count = arrangementBean.getLayerCount();
					List<SensorDataBean> sernorDataBeans = new ArrayList<SensorDataBean>();
					for (int j = 0; j < count; j++) {
						String abc = "%,%," + j;
						List<SensorDataBean> beans = ServiceManager
								.getAoJianBlockService().getSensorDataList(
										aoJianDataBeanTemp, abc, "orderIndex");
						if (beans != null && beans.size() > 0)
							sernorDataBeans.addAll(beans);
					}

					sensorDataBeanSS.add(sernorDataBeans);
					List<Integer> cableIndexList = ServiceManager
							.getAoJianBlockService()
							.getCableIndexListByAoJianDataId(
									aoJianDataBeanTemp.getId());
					temMap = new HashMap<Integer, List<SensorDataBean>>();
					temMap = initTemMap(cableIndexList);// 先出结构
					for (int j = 0; j < sernorDataBeans.size(); j++) {
						SensorDataBean sensorDataBean = sernorDataBeans.get(j);
						if (!StringUtils
								.isEmpty(sensorDataBean.getCableIndex())) {
							String cableIndex = sensorDataBean.getCableIndex()
									.trim();
							temMap.get(Integer.parseInt(cableIndex)).add(
									sensorDataBean);
						}
					}

					bigFormList = new ArrayList<SensorDataBean>();
					for (int k = 0; k <= cableIndexList.size(); k++) {
						List<SensorDataBean> temp = temMap.get(k + 1);
						if (temp != null)
							bigFormList.addAll(temp);
					}
					bigFormLists.add(bigFormList);
				}

			}
		}
	}

	// 组装数据结构
	private Map<Integer, List<SensorDataBean>> initTemMap(
			List<Integer> cableIndexList) {
		Map<Integer, List<SensorDataBean>> temMap = new HashMap<Integer, List<SensorDataBean>>();
		for (int i = 0; i < cableIndexList.size(); i++) {
			Integer key = cableIndexList.get(i);
			if (temMap.containsKey(key)) {
				continue;
			} else {
				temMap.put(key, new ArrayList<SensorDataBean>());
			}
		}
		return temMap;
	}

	/*
	 * 用户三维的数据的定时定点查询 参数信息： 用户名，账号密码
	 * 参数：账号密码，粮食id，查询的开始起点和终止时间点，操作选项（最近一次0，某一个时间点1，某个时间段落2）
	 */
	@RequestMapping(value = "/mobile/sernorsXYZWhenSelect.action", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String sernorsXYZWhenSelect(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {

		List<List<SensorDataBean>> SensorDataBeansList = new ArrayList<List<SensorDataBean>>();
		Map<Integer, List<SensorDataBean>> temMap;
		int code = 0;
		String message = "成功了";
		User user = null;

		String name = RequestUtil.getRequestParameter(request, "userName");

		String pwd = RequestUtil.getRequestParameter(request, "password");

		String selectIndex = RequestUtil.getRequestParameter(request,
				"selectIndex");

		String startDate = RequestUtil
				.getRequestParameter(request, "startDate");

		String endDate = RequestUtil.getRequestParameter(request, "endDate");

		String grainId = RequestUtil.getRequestParameter(request, "grainId");
		String zyAoJianNum = RequestUtil.getRequestParameter(request,
				"zyAoJianNum");

		String xyzPoint = RequestUtil.getRequestParameter(request, "xyzPoint");
		List<SensorDataBean> SensorDataBean = null;
		JSONArray array = null;

		if ((name.length() > 0 || pwd.length() > 0)) {
			pwd = Md5.getMD5(pwd.getBytes());
			List<User> list = ServiceManager.getUserService().getByName(name);
			String nameList = null;

			if (list != null && list.size() > 0) {
				user = list.get(0);
				if (user.getPassWord().equals(pwd)) {// 密码验证成功
					code = 200;
					message = "账号密码验证成功！";

					int selectIndexKey = Integer.parseInt(selectIndex);

					switch (selectIndexKey) {
					case 0:// 最近一次
						AoJianDataBean aoJianDataBean = ServiceManager
								.getAoJianBlockService()
								.getRecentAoJianDataBeanByGrainId(grainId);

						if (aoJianDataBean != null)
							SensorDataBean = ServiceManager
									.getAoJianBlockService().getSensorDataList(
											aoJianDataBean, xyzPoint,
											"orderIndex");
						else {
							SensorDataBean = new ArrayList<SensorDataBean>();
						}

						SensorDataBeanArray = JSONArray
								.fromObject(SensorDataBean);

						returnResult = "{\"code\":" + code + ",\"message\":\""
								+ message + "\",\"aoJianDataBeans\":"
								+ JSONObject.fromObject(aoJianDataBean) + "}";
						break;
					case 1:// 某一个日期的
						Date pointDate = null;
						try {
							pointDate = new java.text.SimpleDateFormat(
									"yyyy-MM-dd hh:mm:ss").parse(startDate);
						} catch (ParseException e) {

							e.printStackTrace();
						}
						AoJianDataBean aoJianDataBean1 = ServiceManager
								.getAoJianBlockService().getByGrainIdAndDate(
										grainId, pointDate);
						AoJianBean bean1 = ServiceManager
								.getAoJianServiceImpl().getById(zyAoJianNum);
						List<SensorDataBean> sernorDataBeans = new ArrayList<SensorDataBean>();
						sensorDataBeanSS.clear();
						arrangementBean = ServiceManager
								.getSensorArrangementServiceImpl().getById(
										bean1.getSensorArrangementbeanId());
						int count = arrangementBean.getLayerCount();

						for (int j = 0; j < count; j++) {
							String abc = "%,%," + j;
							List<SensorDataBean> beans = ServiceManager
									.getAoJianBlockService().getSensorDataList(
											aoJianDataBean1, abc, "orderIndex");
							if (beans != null && beans.size() > 0)
								sernorDataBeans.addAll(beans);
						}
						if ("%,%,%".equals(xyzPoint)) {
							sensorDataBeanSS.add(sernorDataBeans);
						} else {
							List<SensorDataBean> beans = ServiceManager
									.getAoJianBlockService().getSensorDataList(
											aoJianDataBean1, xyzPoint,
											"orderIndex");
							sensorDataBeanSS.add(beans);
						}

						List<Integer> cableIndexList = ServiceManager
								.getAoJianBlockService()
								.getCableIndexListByAoJianDataId(
										aoJianDataBean1.getId());
						temMap = new HashMap<Integer, List<SensorDataBean>>();
						temMap = initTemMap(cableIndexList);// 先出结构
						for (int j = 0; j < sernorDataBeans.size(); j++) {
							SensorDataBean sensorDataBean = sernorDataBeans
									.get(j);
							if (!StringUtils.isEmpty(sensorDataBean
									.getCableIndex())) {
								String cableIndex = sensorDataBean
										.getCableIndex().trim();
								temMap.get(Integer.parseInt(cableIndex)).add(
										sensorDataBean);
							}
						}

						bigFormList = new ArrayList<SensorDataBean>();
						for (int k = 0; k <= cableIndexList.size(); k++) {
							List<SensorDataBean> temp = temMap.get(k + 1);
							if (temp != null)
								bigFormList.addAll(temp);
						}
						bigFormLists.clear();
						bigFormLists.add(bigFormList);
						System.out.println("-------bigFormLists.size()-------"
								+ bigFormLists.size());
						array = JSONArray.fromObject(aoJianDataBean1);
						returnResult = "{\"code\":" + code + ",\"message\":\""
								+ message + "\",\"aoJianDataBeans\":"
								+ array.toString() + ",\"sensorDataBeanSS\":"
								+ JSONArray.fromObject(sensorDataBeanSS)
								+ ",\"bigFormLists\":"
								+ JSONArray.fromObject(bigFormLists) + "}";
						break;
					case 2:// 某一个时间段的
						if (!"null".equals(endDate)
								&& !"null".equals(startDate)) {
							List<AoJianDataBean> aoJianDataBeans2 = ServiceManager
									.getAoJianBlockService().getAoJianDataList(
											grainId, startDate, endDate);
							array = JSONArray.fromObject(aoJianDataBeans2);
							returnResult = "{\"code\":" + code
									+ ",\"message\":\"" + message
									+ "\",\"aoJianDataBeans\":"
									+ array.toString() + "}";

						} else {
							code = 403;
							message = "账号密码验证失败";
							returnResult = "{\"code\":" + code
									+ ",\"message\":\"" + message + "\"}";
						}
						break;
					case 3:
						if (!"null".equals(endDate)
								&& !"null".equals(startDate)) {
							List<AoJianDataBean> aoJianDataBeansTemps = ServiceManager
									.getAoJianBlockService().getAoJianDataList(
											grainId, startDate, endDate);
							AoJianBean bean = ServiceManager
									.getAoJianServiceImpl()
									.getById(zyAoJianNum);
							arrangementBean = ServiceManager
									.getSensorArrangementServiceImpl().getById(
											bean.getSensorArrangementbeanId());
							List<List<SensorDataBean>> sensorDataBeanSS = new ArrayList<List<SensorDataBean>>();
							if (aoJianDataBeansTemps != null
									&& aoJianDataBeansTemps.size() > 0) {
								AoJianDataBean aoJianDataBeanTemp = aoJianDataBeansTemps
										.get(0);
								count = arrangementBean.getColumnCount();
								List<SensorDataBean> sernorDataBeans1 = new ArrayList<SensorDataBean>();
								for (int j = 0; j < count; j++) {
									String abc = "%,%," + j;
									List<SensorDataBean> beans = ServiceManager
											.getAoJianBlockService()
											.getSensorDataList(
													aoJianDataBeanTemp, abc,
													"orderIndex");
									if (beans != null && beans.size() > 0)
										sernorDataBeans1.addAll(beans);
								}

								sensorDataBeanSS.add(sernorDataBeans1);
							}
							array = JSONArray.fromObject(aoJianDataBeansTemps);
							JSONArray array1 = JSONArray
									.fromObject(sensorDataBeanSS);
							StringBuffer buffer = new StringBuffer();

							returnResult = "{\"code\":" + code
									+ ",\"message\":\"" + message
									+ "\",\"aoJianDataBeans\":"
									+ array.toString()
									+ ",\"sensorDataBeanSS\":"
									+ array1.toString() + "}";

						} else {
							code = 403;
							message = "账号密码验证失败";
							returnResult = "{\"code\":" + code
									+ ",\"message\":\"" + message + "\"}";
						}
						break;
					case 4:
						if (!"null".equals(endDate)
								&& !"null".equals(startDate)) {
							List<AoJianDataBean> aoJianDataBeansTemps = ServiceManager
									.getAoJianBlockService().getAoJianDataList(
											grainId, startDate, endDate);

							List<List<SensorDataBean>> sensorDataBeanSS = new ArrayList<List<SensorDataBean>>();
							if (aoJianDataBeansTemps != null
									&& aoJianDataBeansTemps.size() > 0) {
								AoJianDataBean aoJianDataBeanTemp = aoJianDataBeansTemps
										.get(0);
								List<SensorDataBean> beans = ServiceManager
										.getAoJianBlockService()
										.getSensorDataList(aoJianDataBeanTemp,
												xyzPoint, "orderIndex");
								sensorDataBeanSS.add(beans);
							}

							array = JSONArray.fromObject(aoJianDataBeansTemps);
							JSONArray array1 = JSONArray
									.fromObject(sensorDataBeanSS);
							StringBuffer buffer = new StringBuffer();

							returnResult = "{\"code\":" + code
									+ ",\"message\":\"" + message
									+ "\",\"aoJianDataBeans\":"
									+ array.toString()
									+ ",\"sensorDataBeanSS\":"
									+ array1.toString() + "}";

						} else {
							code = 403;
							message = "账号密码验证失败";
							returnResult = "{\"code\":" + code
									+ ",\"message\":\"" + message + "\"}";
						}
						break;
					default:
						break;
					}

				} else {
					code = 403;
					message = "密码错误";
					returnResult = "{\"code\":" + code + ",\"message\":\""
							+ message + "\"}";
				}

			} else {// 密码验证失败
				code = 402;
				message = "账号不存在";
				returnResult = "{\"code\":" + code + ",\"message\":\""
						+ message + "\"}";
			}

		} else {
			code = 401;
			message = "账号密码为空";
			returnResult = "{\"code\":" + code + ",\"message\":\"" + message
					+ "\"}";
		}
		System.out.println(returnResult);

		return returnResult;
	}

	public List<AoJianBean> zuZhuangBarnArrayList(Set<BarnBean> barnBeans,
			Set<AoJianBean> aoJianBeans) {
		barnBeans.toArray();

		List<BarnBean> barnBeanArrayList = new ArrayList<BarnBean>(barnBeans);
		List<AoJianBean> aoJianBeanArrayList = new ArrayList<AoJianBean>(
				aoJianBeans);
		List<AoJianBean> tempAoJianBeans = new ArrayList<AoJianBean>();

		for (int i = 0; i < barnBeanArrayList.size(); i++) {
			BarnBean barnBean = barnBeanArrayList.get(i);

			for (int j = 0; j < aoJianBeanArrayList.size(); j++) {

				AoJianBean aoJianBean = aoJianBeanArrayList.get(j);
				tempAoJianBeans.add(aoJianBean);
			}
		}
		return tempAoJianBeans;
	}

	private Map<String, AlarmBean> getAlarmInfo(AoJianBean bean) {
		// TODO Auto-generated method stub
		AoJianGrainInfoBean grainBean = bean.getAoJianGrainInfoBean();
		Map<String, AlarmBean> map = new HashMap<String, AlarmBean>();

		if (null != grainBean) {
			map = ControllerUtils.getAlarmDataInfo(grainBean);
		}
		return map;
	}

	private String getCurProvinces() {
		BaseSettingBean bean = ServiceManager.getBaseSettingServiceImpl()
				.findValueByKey("szsf");
		return bean.getValue();
	}

	private Map<String, Object> getAlarmDataInfo(String regionStr,
			AoJianGrainInfoBean grainBean) {
		Map<String, Object> result = new HashMap<String, Object>();
		List<AlarmBean> list = ServiceManager.getAlarmServiceImpl()
				.findListByType(grainBean.getStoreType());
		AlarmBean temAlarm;
		if (list.size() > 1) {
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getGrainBeanId()
						.equals(grainBean.getGrainType())) {
					temAlarm = list.get(i);
					result.put("tem", temAlarm);
					break;
				}
			}
		} else if (list.size() == 1) {
			temAlarm = list.get(0);
			result.put("tem", temAlarm);
		}
		GrainTypeBean grainTypeBean = ServiceManager.getGrainTypeServiceImpl()
				.getById(grainBean.getGrainType());
		List<AlarmBean> humList = ServiceManager.getAlarmServiceImpl()
				.findListByGrainBeanIdAndType("湿度", grainTypeBean);
		if (humList.size() > 0) {
			result.put("hum", humList.get(0));
		}
		List<AlarmBean> wetList = ServiceManager.getAlarmServiceImpl()
				.findListByGrainBeanIdAndType("水分", grainTypeBean);
		for (int i = 0; i < wetList.size(); i++) {
			String area = wetList.get(i).getArea();
			if (regionStr.contains(area)) {
				result.put("wet", wetList.get(i));
				break;
			}
		}
		return result;
	}

	private List<AlarmDataInfoBean> queryAlarmInfo(String aoJianId,
			String userId, String alarmType, String alarmStatus,
			String startDateStr, String endDateStr, int pageNo, int pageSize,
			int recordCount) {
		List<AlarmDataInfoBean> alarmDataInfoList = null;
		// TODO Auto-generated method stub
		try {
			StringBuffer sb = new StringBuffer();
			if (!StringUtils.isEmpty(aoJianId)) {
				sb.append(" a.zyAoJianNum='").append(aoJianId).append("' and ");
			}
			if (!StringUtils.isEmpty(userId)) {
				sb.append(" a.userId='").append(userId).append("' and ");
			}
			if (!StringUtils.isEmpty(alarmType) && !alarmType.equals("-1")
					&& !alarmType.equals("全部")) {
				sb.append(" a.alarmInfoType='").append(alarmType)
						.append("' and ");
			}
			if (!StringUtils.isEmpty(alarmStatus) && !alarmStatus.equals("-1")
					&& !alarmStatus.equals("全部")) {
				sb.append(" a.status='").append(alarmStatus).append("' and ");
			}
			if (!StringUtils.isEmpty(endDateStr)) {
				Date endDate = CalendarUtil.formatDate(endDateStr,
						CalendarUtil.DATE_FORMAT_MODE1);
				endDate = CalendarUtil.getNextDate(endDate, 1, Calendar.DATE);
				String dateStr = CalendarUtil.formatStr(endDate,
						CalendarUtil.DATE_FORMAT_MODE1);
				sb.append(" a.alarmTime <'").append(dateStr).append("' and ");
			}
			if (!StringUtils.isEmpty(startDateStr)) {
				Date startDate = CalendarUtil.formatDate(startDateStr,
						CalendarUtil.DATE_FORMAT_MODE1);
				sb.append(" a.alarmTime >'").append(startDateStr)
						.append("' and ");
			}
			String hql = "";
			if (sb.length() > 0) {
				hql = sb.substring(0, sb.length() - 4);
			}

			recordCount = ServiceManager.getAlarmDataInfoServiceImpl()
					.getTotalNumByHql(hql);

			alarmDataInfoList = ServiceManager.getAlarmDataInfoServiceImpl()
					.getAlarmListByHql(hql, pageNo, pageSize);

		} catch (Exception e) {
			// TODO: handle exception
		}
		return alarmDataInfoList;
	}

	/**
	 * 告警条件查询
	 * 
	 * @param request
	 * @param response
	 * @param model
	 *            , method = RequestMethod.GET,produces =
	 *            "application/json; charset=utf-8"
	 * @return
	 */
	@RequestMapping(value = "/mobile/gjxx/gjtjcx.action", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String gjtjcx(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		String result = "";
		try {
			int code = 0;
			String message = "成功了";
			User user = null;

			String name = RequestUtil.getRequestParameter(request, "userName");

			String pwd = RequestUtil.getRequestParameter(request, "password");

			String aoJianId = RequestUtil.getRequestParameter(request,
					"aoJianId");
			String userId = RequestUtil.getRequestParameter(request, "userId");
			// String alarmType = RequestUtil.getRequestParameter(request,
			// "alarmType");
			String alarmStatus = RequestUtil.getRequestParameter(request,
					"alarmStatus");
			String startDateStr = RequestUtil.getRequestParameter(request,
					"startDate");
			String pageNoTemp = RequestUtil.getRequestParameter(request,
					"pageNo");
			String endDateStr = RequestUtil.getRequestParameter(request,
					"endDate");
			String alarmType = new String(request.getParameter("alarmType")
					.getBytes("iso-8859-1"), "utf-8");

			int pageNo = Integer.parseInt(pageNoTemp);
			int pageSize = 25;
			int recordCount;
			// pageSize = 65535;

			if ((name.length() > 0 || pwd.length() > 0)) {
				pwd = Md5.getMD5(pwd.getBytes());

				List<User> list = ServiceManager.getUserService().getByName(
						name);
				// System.out.println("\r\nlist---" + list.toString());
				String nameList = null;

				if (list != null && list.size() > 0) {
					user = list.get(0);
					if (user.getPassWord().equals(pwd)) {// 密码验证成功
						code = 200;
						message = "账号密码验证成功！";
						Map map = new HashMap();
						List<AlarmDataInfoBean> alarmDataInfoList = queryAlarmInfo(
								aoJianId, userId, alarmType, alarmStatus,
								startDateStr, endDateStr, pageNo, pageSize, -1);

						JSONArray aoJianBeansArray = JSONArray
								.fromObject(alarmDataInfoList);
						result = "{\"code\":" + code + ",\"message\":\""
								+ message + "\",\"alarmDataInfoList\":"
								+ aoJianBeansArray.toString() + "}";

					} else {
						code = 403;
						message = "密码错误";
						result = "{\"code\":" + code + ",\"message\":\""
								+ message + "\"}";
					}
				} else {
					code = 402;
					message = "账号不存在";
					result = "{\"code\":" + code + ",\"message\":\"" + message
							+ "\"}";
				}
			} else {
				code = 401;
				message = "账号密码为空";
				result = "{\"code\":" + code + ",\"message\":\"" + message
						+ "\"}";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("--result--" + result);

		return result;
	}

	/**
	 * 操作查询
	 * 
	 * @param request
	 * @param response
	 * @param model
	 *            (value = "/mobile/gjxx/gjtjcx.action", method =
	 *            RequestMethod.GET,produces =
	 *            "application/json; charset=utf-8")
	 * @return
	 */
	@RequestMapping(value = "/mobile/gjxx/czcxDetail.action", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String czcxDetail(HttpServletRequest request,
			HttpServletResponse response) {
		String result = "";
		try {
			int code = 0;
			String message = "成功了";
			User user = null;
			request.setCharacterEncoding("ISO8859-1");
			String name = RequestUtil.getRequestParameter(request, "userName");

			String pwd = RequestUtil.getRequestParameter(request, "password");
			String userId = RequestUtil.getRequestParameter(request, "userId");
			String startDateStr = new String(RequestUtil.getRequestParameter(
					request, "startDate").getBytes("ISO8859-1"), "utf-8");
			String endDateStr = new String(RequestUtil.getRequestParameter(
					request, "endDate").getBytes("ISO8859-1"), "utf-8");

			String doSearch = RequestUtil.getRequestParameter(request,
					"doSearch");

			String operateType = new String(RequestUtil.getRequestParameter(
					request, "operateType").getBytes("ISO8859-1"), "utf-8");

			System.out.println("operateType" + operateType);
			String operateInfo = new String(RequestUtil.getRequestParameter(
					request, "operateInfo").getBytes("ISO8859-1"), "utf-8");
			System.out.println("operateInfo" + operateInfo);

			if ((name.length() > 0 || pwd.length() > 0)) {
				pwd = Md5.getMD5(pwd.getBytes());

				List<User> list = ServiceManager.getUserService().getByName(
						name);

				String nameList = null;

				if (list != null && list.size() > 0) {
					user = list.get(0);
					if (user.getPassWord().equals(pwd)) {// 密码验证成功
						code = 200;
						message = "账号密码验证成功！";
						// userId =user.getId();
						StringBuffer sb = new StringBuffer();

						if (!StringUtils.isEmpty(operateType)
								&& !operateType.equals("-1")) {
							sb.append(" a.operateType='").append(operateType)
									.append("' and ");
						}
						if (!StringUtils.isEmpty(userId)) {
							sb.append(" a.operateUserId='").append(userId)
									.append("' and ");
						}
						if (!StringUtils.isEmpty(operateInfo)) {
							sb.append(" a.operateInfo like '%")
									.append(operateInfo).append("%' and ");
						}
						if (!StringUtils.isEmpty(endDateStr)) {
							Date endDate = CalendarUtil.formatDate(endDateStr,
									CalendarUtil.DATE_FORMAT_MODE1);
							endDate = CalendarUtil.getNextDate(endDate, 1,
									Calendar.DATE);
							String dateStr = CalendarUtil.formatStr(endDate,
									CalendarUtil.DATE_FORMAT_MODE1);
							sb.append(" a.operateTime <'").append(dateStr)
									.append("' and ");
						}
						if (!StringUtils.isEmpty(startDateStr)) {
							sb.append(" a.operateTime >'").append(startDateStr)
									.append("' and ");
						}
						String hql = "";
						if (sb.length() > 0) {
							hql = sb.substring(0, sb.length() - 4);
						}
						Map map = new HashMap();
						// 分页设置
						int pageNo = 0;
						int pageSize = 13;
						int recordCount;
						int defaultCounts = 100;// 默认页面显示数量
						if (!StringUtils.isEmpty(RequestUtil
								.getRequestParameter(request, "pageNo"))) {
							pageNo = Integer.parseInt(RequestUtil
									.getRequestParameter(request, "pageNo"));
						}
						if (!StringUtils.isEmpty(RequestUtil
								.getRequestParameter(request, "pageSize"))) {
							pageSize = Integer.parseInt(RequestUtil
									.getRequestParameter(request, "pageSize"));
						}

						List<OperateRecordBean> operateRecordList;
						if ("do".equals(doSearch)) {
							operateRecordList = ServiceManager
									.getOperateRecordServiceImpl()
									.getOperateRecordByHql(hql, pageNo,
											pageSize);
						} else {
							operateRecordList = ServiceManager
									.getOperateRecordServiceImpl()
									.getOperateRecordByPageSize(defaultCounts,
											pageNo, pageSize);
						}

						JSONArray operateRecordListArray = JSONArray
								.fromObject(operateRecordList);
						result = "{\"code\":" + code + ",\"message\":\""
								+ message + "\",\"operateRecordList\":"
								+ operateRecordListArray.toString() + "}";

						System.out.println(result);

					} else {
						code = 403;
						message = "密码错误";
						result = "{\"code\":" + code + ",\"message\":\""
								+ message + "\"}";
					}
				} else {
					code = 402;
					message = "账号不存在";
					result = "{\"code\":" + code + ",\"message\":\"" + message
							+ "\"}";
				}
			} else {
				code = 401;
				message = "账号密码为空";
				result = "{\"code\":" + code + ",\"message\":\"" + message
						+ "\"}";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	/**
	 * @名称: changeStatus
	 * @日期：2015-9-26 上午10:36:55
	 * @作者： lxb
	 * @描述: 修改为全部已阅，或者单个已阅操作
	 * @参数 @param request
	 * @参数 @param response
	 * @参数 @param model
	 * @返回值 void
	 * @异常
	 */
	@RequestMapping(value = "/mobile/gjxx/changeStatus.action", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String changeStatus(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {

		User user = null;
		String name = RequestUtil.getRequestParameter(request, "userName");

		String pwd = RequestUtil.getRequestParameter(request, "password");
		String operateType = RequestUtil.getRequestParameter(request,
				"operateType");
		System.out.println("----pwd0" + pwd);
		int code = 0;
		String message = "";
		String isChange = "";
		if ((name.length() > 0 && pwd.length() > 0)) {
			pwd = Md5.getMD5(pwd.getBytes());

			List<User> list = ServiceManager.getUserService().getByName(name);
			String nameList = null;

			if (list != null && list.size() > 0) {
				user = list.get(0);
				if (user.getPassWord().equals(pwd)) {// 密码验证成功
					if ("all".equals(operateType)) {

						ServiceManager.getAlarmDataInfoServiceImpl()
								.changeAllAlarmStatusByUserId(user.getId());
					} else {
						String alarmDataId = RequestUtil.getRequestParameter(
								request, "alarmDataId");
						ServiceManager.getAlarmDataInfoServiceImpl()
								.changeAlarmStatusById(alarmDataId);
					}
					code = 200;
					message = "更改成功了";
					isChange = "true";
				} else {
					code = 403;
					message = "更改失败，账号密码错误";
					isChange = "false";
				}
			} else {
				code = 402;
				message = "更改失败，没有这个用户";
				isChange = "false";
			}
		} else {
			code = 401;
			message = "更改失败，账号或者密码为空";
			isChange = "false";
		}
		String result = "{\"code\":" + code + ",\"message\":\"" + message
				+ "\",\"isChange\":\"" + isChange + "\"}";
		System.out.println("result--" + result);
		return result;
	}
}
