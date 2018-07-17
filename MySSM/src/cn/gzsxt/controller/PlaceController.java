package cn.gzsxt.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.gzsxt.mapper.PlaceInfoMapper;
import cn.gzsxt.pojo.BulletinInfo;
import cn.gzsxt.pojo.PlaceApplyInfo;
import cn.gzsxt.pojo.PlaceInfo;
import cn.gzsxt.service.BulletinService;
import cn.gzsxt.service.PlaceApplyService;
import cn.gzsxt.service.PlaceService;
import cn.gzsxt.util.PageUtil;
import cn.gzsxt.util.StringToDataTime;

@Controller
public class PlaceController {
	
	@Autowired
	private PlaceService placeService;
	
	@Autowired
	private BulletinService bulletinService;
	
	@Autowired
	private PlaceApplyService placeApplyService ;
	
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	private StringToDataTime strToDataTime = new StringToDataTime();
	/**
	 * 场地使用状态主页面查询
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/query/placeStatus",produces="text/html;charset=UTF-8")
	public String queryPlaceStatus(String placeDivision,String placeLieu,String place_name,HttpServletRequest request,ModelMap map){
		Boolean flag = getLoginInfo(request);
		if(flag){
			List<PlaceInfo> listpd = placeService.queryPlaceDivison();
			map.put("pDivision", listpd);
			return "WEB-INF/jsp/placeStatus";
		}else{
			return "login";
		}
	}
	
	/**
	 * 场地方位下拉框选择查询
	 * @return
	 */
	@RequestMapping("/query/placeLieu")
	@ResponseBody
	public List<PlaceInfo> queryPlaceLieu(String division,ModelMap map){
		Map<String,String> param = new HashMap<>();
		param.put("division", division);
		List<PlaceInfo> pLieu = placeService.queryPlaceLieu(param);
		return pLieu;
	}
	/**
	 * 场地名称和场地id下来框
	 * @param placeName
	 * @param map
	 * @return
	 */
	@RequestMapping("/query/placeName")
	@ResponseBody
	public List<PlaceInfo> queryPlaceName(String Place_lieu,ModelMap map){
		Map<String,String> param = new HashMap<>();
		param.put("placeName", Place_lieu);
		List<PlaceInfo> pLieu = placeService.queryPlaceName(param);
		return pLieu;
	}
	
	/**
	 * 跳转到场地申请信息添加
	 * @return
	 */
	@RequestMapping("/placeApply/addApplyInfo")
	public String addPlaceApplyInfo(String placeId,Map map,HttpServletRequest request){
		Boolean flag = getLoginInfo(request);
		Map<String,String> param = new HashMap<String,String>();
		if(placeId!=null&&!"".equals(placeId)){
			param.put("placeId", placeId);
		}
		if(flag){
			//单条场地信息查询，用于直接从场地使用状态跳转到申请页面，自动带回值
			List<PlaceInfo> listPlaceInfo  = placeService.querySinPlaceInfo(param);
			map.put("listPlaceInfo", listPlaceInfo);
			//校区查询
			List<PlaceInfo> listpd = placeService.queryPlaceDivison();
			map.put("pDivision", listpd);
			map.put("bulletinCon", queryBulletinStr());
			return "WEB-INF/jsp/placeApply";
		}else{
			return "login";
		}
		
	}
	/**
	 * 添加场地申请信息
	 * @return
	 */
	@RequestMapping(value="/Add/placeApplyInfo")
	@ResponseBody
	public Map<String,String> AddPlaceApplyInfo(String  placeNametext,HttpServletRequest request){
		Map<String,Object> param = new HashMap<String,Object>();
		String postulantId = request.getParameter("postulantId");
		if(postulantId!=null&&!"".equals(postulantId)){
			param.put("postulantId", Integer.parseInt(postulantId));
		}
		//String placeId = request.getParameter("placeId");
		
		String teamYesnot = request.getParameter("teamYesnot");
		param.put("teamYesnot", teamYesnot);
		String deptId = request.getParameter("deptId");
		if(deptId!=null&&!"".equals(deptId)){
			param.put("deptId", Integer.parseInt(deptId));
		}
		String deptName = request.getParameter("deptName");
		param.put("deptName", deptName);
		
		String applyTimeStart = request.getParameter("applyTimeStart");
		if(applyTimeStart!=null&&!"".equals(applyTimeStart)){
			param.put("applyTimeStart", strToDataTime.StringtoData(applyTimeStart));
		}
		String applyTimeEnd = request.getParameter("applyTimeEnd");
		if(applyTimeEnd!=null&&!"".equals(applyTimeEnd)){
			param.put("applyTimeEnd", strToDataTime.StringtoData(applyTimeEnd));
		}
		String ApplyPlaceType = request.getParameter("ApplyPlaceType");
			param.put("ApplyPlaceType", ApplyPlaceType);
		
		String 	placeName = request.getParameter("placeName");//获取select的val值，这个值是场地的id值，不是场地名称
		if(placeName!=null&&!"".equals(placeName)){
			param.put("placeId", Integer.parseInt(placeName));
		}
		//String  placeNametext = request.getParameter("placeNametext");//这个值才是场地名称(快速选择的时候)
		String 	placeName1 = request.getParameter("placeName1");//这个值也是场地名称(自定义的时候)
		if("1".equals(ApplyPlaceType)){ //对应前台的如果选择方式为自定义，则put入对应的input框中的值。
			param.put("placeName", placeName1);//自定义
		}else{
			param.put("placeName", placeNametext);
		}
		
		String 	placeDivision = request.getParameter("placeDivision");
		String  placeDivision1 = request.getParameter("placeDivision1");
		if("1".equals(ApplyPlaceType)){ //对应前台的如果选择方式为自定义，则put入对应的input框中的值。
			param.put("placeDivision", placeDivision1);//自定义
		}else{
			param.put("placeDivision", placeDivision);
		}
			
		String 	placeLieu = request.getParameter("placeLieu");
		param.put("placeLieu", placeLieu);
		Timestamp time = new Timestamp(System.currentTimeMillis());
			param.put("applyTime", time);
			param.put("applyStatus", "0");
		String sponsor = request.getParameter("sponsor");
			param.put("sponsor", sponsor);
		String activityName = request.getParameter("activityName");
			param.put("activityName", activityName);
		String activityContent = request.getParameter("activityContent");
			param.put("activityContent", activityContent);
		String activityNature = request.getParameter("activityNature");
			param.put("activityNature", activityNature);
		String participant = request.getParameter("participant");
			param.put("participant", participant);
		String participantSum = request.getParameter("participantSum");
			param.put("participantSum", participantSum);
		String principalTell = request.getParameter("principalTell");
			param.put("principalTell", principalTell);
		String reamk = request.getParameter("reamk");
			param.put("reamk", reamk);
		Map<String,String> map = new HashMap<String,String>();
		Boolean flag = getLoginInfo(request);
		SqlSession openSession = sqlSessionFactory.openSession();
		if(flag){
			try {
				placeApplyService.insertPlaceApplyInfo(param);
				openSession.commit();
				openSession.close();
				map.put("status", "01");
				map.put("massage", "提交成功,申请审批中！");
				//JSONObject jsonObject = JSONObject.fromObject(map);
			} catch (Exception e) {
				openSession.rollback();
				e.printStackTrace();
				map.put("status", "02");
				map.put("massage", "系统服务正忙，请稍后在试");
				//JSONObject jsonObject = JSONObject.fromObject(map);
			}
		}else{
			map.put("status", "03");
			map.put("massage", "登陆信息失效，请重新登录！");
			//JSONObject jsonObject = JSONObject.fromObject(map);
		}
		return map;
		
	}
	
	//获取登录人信息公用方法
	public static Boolean getLoginInfo(HttpServletRequest request){
		String postulantName  = (String) (request.getSession()).getAttribute("postulantName");
		String postulantPwd  = (String) (request.getSession()).getAttribute("postulantPwd");
		if(postulantName!=null&&!"".equals(postulantName)&&postulantPwd!=null&&!"".equals(postulantPwd)){
			return true;
		}else{
			return false;
		}
		
	}
	
	
	/**
	 * 场地申请进度
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/placeApply/placeApplyStatus",produces="text/html;charset=UTF-8")
	public String queryPlaceApplyStatus(HttpServletRequest request,ModelMap map){
		Boolean flag = getLoginInfo(request);
		if(flag){
			return "WEB-INF/jsp/placeApplyStatus";
		}else{
			return "login";
		}
	}
	
	/**
	 * 删除场地申请信息
	 * @param placeApplyId
	 * @param request
	 * @return
	 */
	@RequestMapping("/detele/detelePlaceAppleStatus")
	@ResponseBody
	public Map<String,Object> detelePlaceAppleStatus(String placeApplyId,HttpServletRequest request){
		Map<String,Object> param = new HashMap<String,Object>();
		Integer postulantId  = (Integer) (request.getSession()).getAttribute("postulantId");
		param.put("postulantId", postulantId);
		param.put("placeApplyId", placeApplyId);
		Map<String,Object> map = new HashMap<String,Object>();
		Boolean flag = getLoginInfo(request);
		if(flag){
			SqlSession openSession = sqlSessionFactory.openSession();
			try {
				placeApplyService.detelePlaceAppleStatus(param);
				openSession.commit();
				openSession.close();
				map.put("status", "01");
				map.put("massage", "取消成功！");
				JSONObject jsonObject = JSONObject.fromObject(map);
				return jsonObject;
			} catch (Exception e) {
				openSession.rollback();
				e.printStackTrace();
				map.put("status", "02");
				map.put("massage", "系统服务正忙，请稍后在试");
				JSONObject jsonObject = JSONObject.fromObject(map);
				return jsonObject;
			}
		}else{
			map.put("status", "03");
			map.put("massage", "登录身份失效，请重新登录！");
			JSONObject jsonObject = JSONObject.fromObject(map);
			return jsonObject;
		}
	}
	
	/**
	 * 根据id查询场地信息，
	 * @param request
	 * @param map
	 * @param placeId
	 * @return
	 */
	@RequestMapping("/query/queryPlaceinfoByid")
	public String queryPlaceinfoByid(HttpServletRequest request,ModelMap map,String placeId){
		Boolean flag = getLoginInfo(request);
		if(flag){
			Map<String,Object> param = new HashMap<String,Object>();
			param.put("placeId", placeId);
			List<PlaceInfo> listPlaceInfo = placeService.queryPlaceinfoByid(param);
			map.addAttribute("listPlaceInfo", listPlaceInfo);
			map.put("bulletinCon", queryBulletinStr());
			return "WEB-INF/jsp/admin2/queryPlaceInfo";
		}else{
			return "login";
		}
	}
	
	
	/**
	 * 获取公告公用方法
	 * @return
	 */
	public String queryBulletinStr(){
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("bb", "bb");
		List<BulletinInfo> info = bulletinService.querybulletinInfo(null);
		BulletinInfo bulletinInfo = info.get(0);
		String bulletinCon = bulletinInfo.getBulletinCon();
		return bulletinCon;
		
	}
	
	/**
	 * 场地使用状态list页面
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/query/placeStatusList",produces="text/html;charset=UTF-8")
	public String placeStatusList(String placeDivision,String placeLieu,String place_name,HttpServletRequest request,ModelMap map){
		Boolean flag = getLoginInfo(request);
		if(flag){
			
			String pageCurrnav = request.getParameter("currnav");
			int currnav;
			if(pageCurrnav!=null&&!"".equals(pageCurrnav)){
				currnav = Integer.parseInt(pageCurrnav);
			} else{
				currnav = 1;//当前页
			}
			Map<String,String> param = new HashMap<>();
			try {
				if(!"".equals(placeDivision)&&placeDivision!=null&&!"0".equals(placeDivision)){
					placeDivision = new String(placeDivision.getBytes("ISO-8859-1"),"UTF-8");
					param.put("placeDivision", placeDivision);
				}
				if(!"".equals(placeLieu)&&placeLieu!=null&&!"0".equals(placeLieu)){
					placeLieu = new String(placeLieu.getBytes("ISO-8859-1"),"UTF-8");
					param.put("placeLieu", placeLieu);
				}
				if(!"".equals(place_name)&&place_name!=null&&!"0".equals(place_name)){
					place_name = new String(place_name.getBytes("ISO-8859-1"),"UTF-8");
					param.put("place_name", place_name);
				}
				
				//将参数存在session中，用于有条件的分页查询
				request.getSession().setAttribute("placeDivision", placeDivision);
				request.getSession().setAttribute("placeLieu", placeLieu);
				request.getSession().setAttribute("place_name", place_name);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			//每页总行数
			int pagesize = 10;
			//总行数
			int rowcount ;
			//获取总行数
			rowcount = placeService.queryPlaceStatusRowCount(param);
			//当前起始页
			int begin = 10*(currnav-1);
			PageUtil pu = new PageUtil(rowcount,pagesize,currnav,10);
			//总页数
			
			param.put("begin", Integer.toString(begin));
			param.put("pagesize", Integer.toString(pagesize));
			//查询下可使用的对象
			List<PlaceInfo> listPlaceInfo  = placeService.queryPlaceStutas(param);
			//场地方位查询
			//List<PlaceInfo> listpd = placeService.queryPlaceDivison();
			map.put("listPlaceInfo", listPlaceInfo);
			//map.put("pDivision", listpd);
		    map.put("page", pu);
			//map.put("bulletinCon", queryBulletinStr());
			return "WEB-INF/jsp/placeStatusList";
		}else{
			return "login";
		}
		
	}
	/**
	 * 申请进度list页面查询
	 * @param placeName
	 * @param applyTime
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("/query/placeApplyStatusList")
	public String placeApplyStatusList(String placeName,String applyTime,HttpServletRequest request,ModelMap map){
		String pageCurrnav = request.getParameter("currnav");
		int currnav;
		if(pageCurrnav!=null&&!"".equals(pageCurrnav)){
			currnav = Integer.parseInt(pageCurrnav);
		} else{
			currnav = 1;//当前页
		}
		Map<String,Object> param = new HashMap<String,Object>();
		try {
			if(!"".equals(placeName)&&placeName!=null&&!"0".equals(placeName)){
				placeName = new String(placeName.getBytes("ISO-8859-1"),"UTF-8");
				param.put("placeName", placeName);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(!"".equals(applyTime)&&applyTime!=null&&!"0".equals(applyTime)){
			applyTime = StringUtils.substringBeforeLast(applyTime,"T");
			param.put("applyTime", applyTime);
		}
		
		//将条件存入session，用于有条件的分页
		request.getSession().setAttribute("placeName", placeName);
		request.getSession().setAttribute("applyTime", StringUtils.substringBeforeLast(applyTime,"T"));
		
		Integer postulantId  = (Integer) (request.getSession()).getAttribute("postulantId");
		param.put("postulantId", postulantId.toString());
		param.put("approvalnum", "2");//用于SQL判断
		//每页总行数
		int pagesize = 10;
		//总行数
		int rowcount ;
		//获取总行数
		rowcount = placeApplyService.queryPlaceApplyStatusRowCount(param);
		//当前起始页
		int begin = 10*(currnav-1);
		PageUtil pu = new PageUtil(rowcount,pagesize,currnav,10);
		//总页数
		
		param.put("begin", Integer.toString(begin));
		param.put("pagesize", Integer.toString(pagesize));
		Boolean flag = getLoginInfo(request);
		if(flag){
			//查询下可使用的对象
			List<PlaceApplyInfo> placeInfoMapper  = placeApplyService.queryPlaceApplyStatus(param);
			map.put("listPlaceInfo", placeInfoMapper);
			map.put("page", pu);
			map.put("bulletinCon", queryBulletinStr());
			return "WEB-INF/jsp/placeApplyStatusList";
		}else{
			return "login";
		}
	}
}
