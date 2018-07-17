package cn.gzsxt.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.gzsxt.pojo.PlaceApplyInfo;
import cn.gzsxt.pojo.PlaceInfo;
import cn.gzsxt.service.PlaceApplyService;
import cn.gzsxt.service.PlaceService;
import cn.gzsxt.service.PostulantUserService;
import cn.gzsxt.util.GetLoginInfoClass;
import cn.gzsxt.util.PageUtil;
import cn.gzsxt.vo.Result_person;
import cn.gzsxt.vo.Reusult_PlaceApple;

@Controller
public class ApproverController {

	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	@Autowired
	private PlaceApplyService placeApplyService ;
	
	@Autowired
	private PlaceService placeService;
	@Autowired
	private PostulantUserService postulantUserService;
	
	private GetLoginInfoClass getloginInfo = new GetLoginInfoClass();
	
	@RequestMapping(value="/query/approvadNot",produces="text/html;charset=UTF-8")
	public String approvadNot(String flagb,String placeName,String postulantName,HttpServletRequest request,ModelMap map){
		boolean flag = getloginInfo.getLoginInfo(request);
		
		if(flag){
			String pageCurrnav = request.getParameter("currnav");
			int currnav;
			if(pageCurrnav!=null&&!"".equals(pageCurrnav)){
				currnav = Integer.parseInt(pageCurrnav);
			} else{
				currnav = 1;//当前页
			}
			Map<String,Object> param = new HashMap<String,Object>();
			if(!"".equals(placeName)&&placeName!=null){
				param.put("placeName", placeName);
			}
			
			if(!"".equals(postulantName)&&postulantName!=null){
				param.put("postulantName", postulantName);
			}
			param.put("flagb", flagb);
			//每页总行数
			int pagesize =8;
			//总行数
			int rowcount ;
			//获取待审批或者已审批审批的申请单总行数
			rowcount = placeApplyService.queryPlaceApplyApprovalNotCount(param);
			//当前起始页
			int begin = 8*(currnav-1);
			PageUtil pu = new PageUtil(rowcount,pagesize,currnav,8);
			
			param.put("begin", Integer.toString(begin));
			param.put("pagesize", Integer.toString(pagesize));
			//待审批的申请单查询
			List<Reusult_PlaceApple> placeInfo = placeApplyService.queryPlaceApplyApprovalNot(param);
			JSONArray jsonObject = JSONArray.fromObject(placeInfo);
			map.addAttribute("listPlaceInfo", jsonObject);
			map.addAttribute("page", pu);
			
			if("0".equals(flagb)){
				return "WEB-INF/jsp/admin2/approvedNot";
			}else{
				return "WEB-INF/jsp/admin2/approvedYes";
			}
		}else{
			return "login";
		}
		
	}
	
	/**
	 * 未审批申请单总数信息提醒
	 * @param request
	 * @return
	 */
	@RequestMapping("/query/queryApprovalNotCount")
	@ResponseBody
	public Map<String,Object> queryApprovalNotCount(HttpServletRequest request){
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("status", "0");
		param.put("flagb", "0");//表示未审批
		int count = placeApplyService.queryPlaceApplyApprovalNotCount(param);
		param.put("massage", count);
		JSONObject jsonObject = JSONObject.fromObject(param);
		return jsonObject;
	}
	
	/**
	 * 查看申请单详细信息
	 * @param placeApplyId
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/query/checkApprovalBill",produces="text/html;charset=UTF-8")
	public String checkApprovalBill(String placeApplyId,HttpServletRequest request,ModelMap map){
		boolean flag = getloginInfo.getLoginInfo(request);
		if(flag){
			Map<String,Object> param = new HashMap<String,Object>();
			param.put("placeApplyId", placeApplyId);
			//查询该场地是否空闲(如果申请单中存在场地id，则可以通过精确查询判断该场地是否空闲)
		    String placeId = placeApplyService.queryPlaceApplyPlaceId(param);
		    //不为空可进行精确查询
		    if(placeId!=null&&!"".equals(placeId.trim())){
		    	param.put("placeId", placeId);
		    	//根据场地的id查询该场地是否已被使用()
		    	String placeStatus = placeService.queryPlaceApplyStatusById(param);
		    	if("1".equals(placeStatus)){
		    		map.addAttribute("result", "1");
		    		map.addAttribute("resultQurey", "该场地空闲，可以通过审批！");
		    	}else if("0".equals(placeStatus)){
		    		map.addAttribute("result", "0");
		    		map.addAttribute("resultQurey", "该场地正在使用中！");
		    	}else if("2".equals(placeStatus)){
		    		map.addAttribute("result", "2");
		    		map.addAttribute("resultQurey", "该场地正在维修中！");
		    	}
		    }else{
		    	//场地id为空，说明场地申请方式为自定义，无法精确判断，需要审批人手动查询
		    	map.addAttribute("result", "3");
		    	map.addAttribute("resultQurey", "该场地申请方式为自定义，请手动确认在审批！");
		    }
			List<Reusult_PlaceApple> Reusult_PlaceAppleList  = placeApplyService.queryPlaceApplyById(param);
			Reusult_PlaceApple reusult_PlaceApple = Reusult_PlaceAppleList.get(0);
			JSONArray jsonObject = JSONArray.fromObject(reusult_PlaceApple);
			map.addAttribute("listPlaceInfo", jsonObject);
			return "WEB-INF/jsp/admin2/checkApprovalBill";
		}else{
			return "login";
		}
		
	}
	
	/**
	 * 审批申请单
	 * @param id
	 * @param status 用于判断进行通过操作还是驳回操作
	 * @param request
	 * @return
	 */
	@RequestMapping("/approval/apporvalApplyBill")
	@ResponseBody
	public Map<String,Object> apporvalApplyBill(String placeId,String id,String advise,String status,HttpServletRequest request,ModelMap map){
		boolean flag = getloginInfo.getLoginInfo(request);
		if(flag){
			//获取审批人id
			Integer postulantId  = (Integer) (request.getSession()).getAttribute("postulantId");
			Map<String,Object> param = new HashMap<String,Object>();
			param.put("placeApplyId", id);
			param.put("status", status);
			param.put("advise", advise);
			param.put("placeId", placeId);
			param.put("approvalPerson", postulantId);//登陆人审批人id
			//判断该审批单是否是属于未审批状态
			String i = placeApplyService.queryPlaceApplyBillStatus(param);
			SqlSession openSession = sqlSessionFactory.openSession();
			if("0".equals(i)){
				try {
					placeApplyService.updateApplyBill(param);
					openSession.commit();
					openSession.close();
					
					if("1".equals(status)){
						//审批通过，将场地的使用状态更改为使用中
						param.put("flag", "0");//用于SQL判断做何种更新
						placeApplyService.UpdatePlaceStatus(param);
						map.addAttribute("status", "1");
						map.addAttribute("massage", "审批通过！");
					}else{
						map.addAttribute("status", "1");
						map.addAttribute("massage", "驳回成功！");
					}
					JSONObject jsonObject = JSONObject.fromObject(map);
					return jsonObject;
				} catch (Exception e) {
					openSession.rollback();
					e.printStackTrace();
					map.addAttribute("status", "0");
					map.addAttribute("massage", "系统服务正忙，请稍后在试");
					JSONObject jsonObject = JSONObject.fromObject(map);
					return jsonObject;
				}
			}else{
				map.addAttribute("status", "2");
				map.addAttribute("massage", "该申请单已审批，不能重复审批！");
				JSONObject jsonObject = JSONObject.fromObject(map);
				return jsonObject;
			}
		}else{
			map.addAttribute("status", "3");
			map.addAttribute("massage", "登陆信息失效，请重新登录！");
			JSONObject jsonObject = JSONObject.fromObject(map);
			return jsonObject;
		}
	}
	
	/**
	 * 申请人详细信息
	 * @param postulantId
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/query/queryApplyPerson",produces="text/html;charset=UTF-8")
	public String queryApplyPerson(String postulantId,HttpServletRequest request,ModelMap map){
		boolean flag = getloginInfo.getLoginInfo(request);
		if(flag){
			Map<String,Object> param = new HashMap<String,Object>();
			param.put("postulantId", postulantId);
			List<Result_person> result_personList  = postulantUserService.queryApplyPersonById(param);
			Result_person result_person = result_personList.get(0);
			JSONArray jsonObject = JSONArray.fromObject(result_person);
			map.addAttribute("listPlaceInfo", jsonObject);
			return "WEB-INF/jsp/admin2/applyPersonInfo";
		}else{
			return "login";
		}
		
	}
	
	/**
	 * 场地使用状态
	 * @param placeDivision
	 * @param placeStatus
	 * @param placeLieu
	 * @param placeName
	 * @param request
	 * @param map
	 * fla 用于判断查询的表
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/query/placeUseStatus",produces="text/html;charset=UTF-8")
	public String placeUseStatus(String placeDivision,String placeStatus,
			String placeLieu,String placeName,String fla,
			HttpServletRequest request,ModelMap map) throws UnsupportedEncodingException{
		boolean flag = getloginInfo.getLoginInfo(request);
		/*if("fla".equals(fla)){//解决a标签中文乱码问题
			placeName=new String(placeName.getBytes("ISO-8859-1"),"UTF-8");
		}*/
		if(flag){
			/*String pageCurrnav = request.getParameter("currnav");
			int currnav;
			if(pageCurrnav!=null&&!"".equals(pageCurrnav)){
				currnav = Integer.parseInt(pageCurrnav);
			} else{
				currnav = 1;//当前页
			}
			Map<String,Object> param = new HashMap<>();
			if(!"".equals(placeDivision)&&placeDivision!=null&&!"0".equals(placeDivision)){
				param.put("placeDivision", placeDivision);
			}
			if(!"".equals(placeLieu)&&placeLieu!=null&&!"0".equals(placeLieu)){
				param.put("placeLieu", placeLieu);
			}
			if(!"".equals(placeName)&&placeName!=null){
				param.put("place_name", "%"+placeName+"%");
			}
			if(!"".equals(placeStatus)&&placeStatus!=null){
				param.put("placeStatus", placeStatus);
			}
			param.put("pp", "pp");//用于场地查询时候，判断是否只查可申请的，不为空为全查
			//每页总行数
			int pagesize = 8;
			Timestamp nowtime = new Timestamp(System.currentTimeMillis());//用于在场地申请表中查询
			param.put("nowtime", nowtime);
			//总行数
			int rowcount ;
			//获取总行数
			if("fla".equals(fla)||"2".equals(fla)){//fla不为空，到场场地审批表中查
				//拼接字符，进行模块匹配
				String[] pName = placeName.split("");
				placeName = "";//先将场地名称字段置空
				for (int i = 1; i < pName.length; i++) {
					if(i==pName.length-1){
						placeName += "  Place_name like '%"+pName[i]+"%'";
					}else{
						placeName += "  Place_name like '%"+pName[i]+"%'  or";
					}
				}
				param.put("place_name", placeName);
				rowcount = placeApplyService.queryPlaceStatusFromRowCount(param);
			}else{//fla为空，精确定位，到场地表中查
				rowcount = placeService.queryPlaceStatusRowCount(param);
			}
			//当前起始页
			int begin = 10*(currnav-1);
			PageUtil pu = new PageUtil(rowcount,pagesize,currnav,10);
			//总页数
			
			param.put("begin", Integer.toString(begin));
			param.put("pagesize", Integer.toString(pagesize));
			//查询下可使用的对象
			
			if("fla".equals(fla)||"2".equals(fla)){//fla不为空，到场场地审批表中查
				List<Reusult_PlaceApple> listPlaceInfo =placeApplyService.queryPlaceStutas(param);
				map.addAttribute("listPlaceInfo", listPlaceInfo);
			}else{//fla为空，精确定位，到场场地表中查
				List<PlaceInfo> listPlaceInfo =placeService.queryPlaceStutas(param);
				map.addAttribute("listPlaceInfo", listPlaceInfo);
			}*/
				//场地方位查询
			List<PlaceInfo> listpd = placeService.queryPlaceDivison();
			map.addAttribute("pDivision", listpd);
			//map.addAttribute("page", pu);
			return "WEB-INF/jsp/admin2/placeUseStatus";
		}else{
			return "login";
		}
		
	}
	
	/**
	 * 场地使用状态list页面
	 * @param placeDivision
	 * @param placeStatus
	 * @param placeLieu
	 * @param placeName
	 * @param fla
	 * @param request
	 * @param map
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value="/query/placeUseStatusList",produces="text/html;charset=UTF-8")
	public String placeUseStatusList(String placeDivision,String placeStatus,
			String placeLieu,String placeName,String fla,
			HttpServletRequest request,ModelMap map) throws UnsupportedEncodingException{
		boolean flag = getloginInfo.getLoginInfo(request);
		if("fla".equals(fla)){//解决a标签中文乱码问题
			placeName=new String(placeName.getBytes("ISO-8859-1"),"UTF-8");
		}
		
		
		
		if(flag){
			String pageCurrnav = request.getParameter("currnav");
			int currnav;
			if(pageCurrnav!=null&&!"".equals(pageCurrnav)){
				currnav = Integer.parseInt(pageCurrnav);
			} else{
				currnav = 1;//当前页
			}
			Map<String,Object> param = new HashMap<>();
			if(!"".equals(placeDivision)&&placeDivision!=null&&!"0".equals(placeDivision)){
				placeDivision=new String(placeDivision.getBytes("ISO-8859-1"),"UTF-8");
				param.put("placeDivision", placeDivision);
			}
			if(!"".equals(placeLieu)&&placeLieu!=null&&!"0".equals(placeLieu)){
				placeLieu=new String(placeLieu.getBytes("ISO-8859-1"),"UTF-8");
				param.put("placeLieu", placeLieu);
			}
			if(!"".equals(placeName)&&placeName!=null){
				placeName=new String(placeName.getBytes("ISO-8859-1"),"UTF-8");
				param.put("place_name", "%"+placeName+"%");
			}
			if(!"".equals(placeStatus)&&placeStatus!=null){
				param.put("placeStatus", placeStatus);
			}
			
			//将分页条件放入session中,用于条件分页
			request.getSession().setAttribute("placeDivision", placeDivision);
			request.getSession().setAttribute("placeLieu", placeLieu);
			request.getSession().setAttribute("placeName", placeName);
			request.getSession().setAttribute("placeStatus", placeStatus);
			
			param.put("pp", "pp");//用于场地查询时候，判断是否只查可申请的，不为空为全查
			//每页总行数
			int pagesize = 8;
			Timestamp nowtime = new Timestamp(System.currentTimeMillis());//用于在场地申请表中查询
			param.put("nowtime", nowtime);
			//总行数
			int rowcount ;
			//获取总行数
			if("fla".equals(fla)||"2".equals(fla)){//fla不为空，到场场地审批表中查
				//拼接字符，进行模块匹配
				String[] pName = placeName.split("");
				placeName = "";//先将场地名称字段置空
				for (int i = 1; i < pName.length; i++) {
					if(i==pName.length-1){
						placeName += "  Place_name like '%"+pName[i]+"%'";
					}else{
						placeName += "  Place_name like '%"+pName[i]+"%'  or";
					}
				}
				param.put("place_name", placeName);
				rowcount = placeApplyService.queryPlaceStatusFromRowCount(param);
			}else{//fla为空，精确定位，到场地表中查
				rowcount = placeService.queryPlaceStatusRowCount(param);
			}
			//当前起始页
			int begin = 10*(currnav-1);
			PageUtil pu = new PageUtil(rowcount,pagesize,currnav,10);
			//总页数
			
			param.put("begin", Integer.toString(begin));
			param.put("pagesize", Integer.toString(pagesize));
			//查询下可使用的对象
			
			if("fla".equals(fla)||"2".equals(fla)){//fla不为空，到场场地审批表中查
				List<Reusult_PlaceApple> listPlaceInfo =placeApplyService.queryPlaceStutas(param);
				map.addAttribute("listPlaceInfo", listPlaceInfo);
			}else{//fla为空，精确定位，到场场地表中查
				List<PlaceInfo> listPlaceInfo =placeService.queryPlaceStutas(param);
				map.addAttribute("listPlaceInfo", listPlaceInfo);
			}
			
			map.addAttribute("page", pu);
			return "WEB-INF/jsp/admin2/placeUseStatusList";
		}else{
			return "login";
		}
		
	}
	
	
	/**
	 * 查看审批人基本信息
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/query/queryApprovalPersonInfo",produces="text/html;charset=UTF-8")
	public String queryApprovalPersonInfo(HttpServletRequest request,ModelMap map){
		boolean flag = getloginInfo.getLoginInfo(request);
		if(flag){
			//审批人id
			Integer postulantId  = (Integer) (request.getSession()).getAttribute("postulantId");
			Map<String,Object> param = new HashMap<String,Object>();
			param.put("postulantId", postulantId);
			List<Result_person> result_personList  = postulantUserService.queryApplyPersonById(param);
			Result_person result_person = result_personList.get(0);
			JSONArray jsonObject = JSONArray.fromObject(result_person);
			map.addAttribute("listPlaceInfo", jsonObject);
			return "WEB-INF/jsp/admin2/aprovalPersonInfo";
		}else{
			return "login";
		}
		
	}
	
	
	@RequestMapping(value="/update/updateApprovalPersonInfo",produces="text/html;charset=UTF-8")
	public String updateApprovalPersonInfo(HttpServletRequest request,ModelMap map){
		boolean flag = getloginInfo.getLoginInfo(request);
		if(flag){
			//审批人id
			Integer postulantId  = (Integer) (request.getSession()).getAttribute("postulantId");
			Map<String,Object> param = new HashMap<String,Object>();
			param.put("postulantId", postulantId);
			List<Result_person> result_personList  = postulantUserService.queryApplyPersonById(param);
			Result_person result_person = result_personList.get(0);
			JSONArray jsonObject = JSONArray.fromObject(result_person);
			map.addAttribute("listPlaceInfo", jsonObject);
			return "WEB-INF/jsp/admin2/updatePersonInfo";
		}else{
			return "login";
		}
		
	}
	
	/**
	 * 审批人信息修改
	 * @param postulantPwdNew
	 * @param postulantEmaill
	 * @param postulantTell
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("/update/updatePersonInfo")
	@ResponseBody
	public Map<String,Object> updatePersonInfo(String postulantPwdNew,String postulantEmaill,
			String postulantTell,HttpServletRequest request,ModelMap map){
		
		boolean flag = getloginInfo.getLoginInfo(request);
		if(flag){
			//获取审批人id
			Integer postulantId  = (Integer) (request.getSession()).getAttribute("postulantId");
			Map<String,Object> param = new HashMap<String,Object>();
			if(postulantPwdNew!=null&&!"".equals(postulantPwdNew)){
				param.put("postulantPwdNew", postulantPwdNew);
			}
			param.put("postulantEmaill", postulantEmaill);
			param.put("postulantTell", postulantTell);
			param.put("postulantId", postulantId);//登陆人审批人id
			SqlSession openSession = sqlSessionFactory.openSession();
				try {
					postulantUserService.updatePersonInfo(param);
					openSession.commit();
					openSession.close();
					//修改成功后，将新密码重新放到session中，否则登陆校验失效
					request.getSession().setAttribute("postulantPwd", postulantPwdNew);
					map.addAttribute("status", "1");
					map.addAttribute("massage", "修改成功！");
					JSONObject jsonObject = JSONObject.fromObject(map);
					return jsonObject;
				} catch (Exception e) {
					openSession.rollback();
					e.printStackTrace();
					map.addAttribute("status", "0");
					map.addAttribute("massage", "系统服务正忙，请稍后在试");
					JSONObject jsonObject = JSONObject.fromObject(map);
					return jsonObject;
				}
		}else{
			map.addAttribute("status", "3");
			map.addAttribute("massage", "登陆信息失效，请重新登录！");
			JSONObject jsonObject = JSONObject.fromObject(map);
			return jsonObject;
		}
	}
	
	/**
	 * 场地设备信息
	 * @param placeDivision
	 * @param placeStatus
	 * @param placeLieu
	 * @param placeName
	 * @param request
	 * @param map
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value="/query/queryPlace",produces="text/html;charset=UTF-8")
	public String queryPlace(String placeDivision,String placeStatus,
			String placeLieu,String placeName,
			HttpServletRequest request,ModelMap map) throws UnsupportedEncodingException{
		boolean flag = getloginInfo.getLoginInfo(request);
		if(flag){
			/*String pageCurrnav = request.getParameter("currnav");
			int currnav;
			if(pageCurrnav!=null&&!"".equals(pageCurrnav)){
				currnav = Integer.parseInt(pageCurrnav);
			} else{
				currnav = 1;//当前页
			}
			Map<String,Object> param = new HashMap<>();
			if(!"".equals(placeDivision)&&placeDivision!=null&&!"0".equals(placeDivision)){
				param.put("placeDivision", placeDivision);
			}
			if(!"".equals(placeLieu)&&placeLieu!=null&&!"0".equals(placeLieu)){
				param.put("placeLieu", placeLieu);
			}
			if(!"".equals(placeName)&&placeName!=null){
				param.put("place_name", "%"+placeName+"%");
			}
			if(!"".equals(placeStatus)&&placeStatus!=null){
				param.put("placeStatus", placeStatus);
			}
			//每页总行数
			int pagesize = 8;
			Timestamp nowtime = new Timestamp(System.currentTimeMillis());//用于在场地申请表中查询
			param.put("nowtime", nowtime);
			//总行数
			param.put("pp", "pp");//用于场地查询时候，判断是否只查可申请的，不为空为全查
			int rowcount ;
			//获取总行数
			rowcount = placeService.queryPlaceStatusRowCount(param);
			//当前起始页
			int begin = 8*(currnav-1);
			PageUtil pu = new PageUtil(rowcount,pagesize,currnav,8);
			//总页数
			
			param.put("begin", Integer.toString(begin));
			param.put("pagesize", Integer.toString(pagesize));
			//查询下可使用的对象
			List<PlaceInfo> listPlaceInfo =placeService.queryPlaceStutas(param);
			map.addAttribute("listPlaceInfo", listPlaceInfo);
			*///场地方位查询
			List<PlaceInfo> listpd = placeService.queryPlaceDivison();
			map.addAttribute("pDivision", listpd);
		//	map.addAttribute("page", pu);
			return "WEB-INF/jsp/admin2/queryEmentInfo";
		}else{
			return "login";
		}
		
	}
	
	/**
	 * 场地设备信息list
	 * @param placeDivision
	 * @param placeStatus
	 * @param placeLieu
	 * @param placeName
	 * @param request
	 * @param map
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value="/query/queryEmentInfoList",produces="text/html;charset=UTF-8")
	public String queryEmentInfoList(String placeDivision,String placeStatus,
			String placeLieu,String placeName,
			HttpServletRequest request,ModelMap map) throws UnsupportedEncodingException{
		boolean flag = getloginInfo.getLoginInfo(request);
		if(flag){
			String pageCurrnav = request.getParameter("currnav");
			int currnav;
			if(pageCurrnav!=null&&!"".equals(pageCurrnav)){
				currnav = Integer.parseInt(pageCurrnav);
			} else{
				currnav = 1;//当前页
			}
			Map<String,Object> param = new HashMap<>();
			if(!"".equals(placeDivision)&&placeDivision!=null&&!"0".equals(placeDivision)){
				placeDivision=new String(placeDivision.getBytes("ISO-8859-1"),"UTF-8");
				param.put("placeDivision", placeDivision);
			}
			if(!"".equals(placeLieu)&&placeLieu!=null&&!"0".equals(placeLieu)){
				placeLieu=new String(placeLieu.getBytes("ISO-8859-1"),"UTF-8");
				param.put("placeLieu", placeLieu);
			}
			if(!"".equals(placeName)&&placeName!=null){
				placeName=new String(placeName.getBytes("ISO-8859-1"),"UTF-8");
				param.put("place_name", "%"+placeName+"%");
			}
			if(!"".equals(placeStatus)&&placeStatus!=null){
				param.put("placeStatus", placeStatus);
			}
			//将分页条件放入session中，
			request.getSession().setAttribute("placeDivision", placeDivision);
			request.getSession().setAttribute("placeLieu", placeLieu);
			request.getSession().setAttribute("placeName", placeName);
			
			//每页总行数
			int pagesize = 8;
			Timestamp nowtime = new Timestamp(System.currentTimeMillis());//用于在场地申请表中查询
			param.put("nowtime", nowtime);
			//总行数
			param.put("pp", "pp");//用于场地查询时候，判断是否只查可申请的，不为空为全查
			int rowcount ;
			//获取总行数
			rowcount = placeService.queryPlaceStatusRowCount(param);
			//当前起始页
			int begin = 8*(currnav-1);
			PageUtil pu = new PageUtil(rowcount,pagesize,currnav,8);
			//总页数
			
			param.put("begin", Integer.toString(begin));
			param.put("pagesize", Integer.toString(pagesize));
			//查询下可使用的对象
			List<PlaceInfo> listPlaceInfo =placeService.queryPlaceStutas(param);
			map.addAttribute("listPlaceInfo", listPlaceInfo);
			//场地方位查询
			//List<PlaceInfo> listpd = placeService.queryPlaceDivison();
			//map.addAttribute("pDivision", listpd);
			map.addAttribute("page", pu);
			return "WEB-INF/jsp/admin2/queryEmentInfoList";
		}else{
			return "login";
		}
		
	}
	
	/**
	 * 根据id查询场地设备信息
	 * @param placeId
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("/query/queryPlaceEmentInfo")
	public String queryPlaceEmentInfo(String placeId,HttpServletRequest request,ModelMap map){
		boolean flag = getloginInfo.getLoginInfo(request);
		if(flag){
			Map<String,Object> param = new HashMap<>();
			param.put("placeId", placeId);
			List<PlaceInfo> listPlaceInfo =placeService.queryPlaceEmentInfoById(param);
			map.addAttribute("listPlaceInfo", listPlaceInfo);
			return "WEB-INF/jsp/admin2/PleceEmentInfo";
		}else{
			return "login";
		}
		
		
	}
}
