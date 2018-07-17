package cn.gzsxt.controller;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.gzsxt.pojo.MaintainInfo;
import cn.gzsxt.pojo.PlaceInfo;
import cn.gzsxt.service.FaclitiManageService;
import cn.gzsxt.service.PlaceService;
import cn.gzsxt.util.GetLoginInfoClass;
import cn.gzsxt.util.PageUtil;
import cn.gzsxt.util.StringToDataTime;

@Controller
public class Facilitiesmanage {

	private GetLoginInfoClass getloginInfo = new GetLoginInfoClass();
	private StringToDataTime strToDataTime = new StringToDataTime();
	
	@Autowired
	private FaclitiManageService faclitiManageService;
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	
	@Autowired
	private PlaceService placeService;
	
	@RequestMapping("/update/upPlaceEmentnInfo")
	@ResponseBody
	public Map<String,Object> upPlaceEmentnInfo(HttpServletRequest request,ModelMap map){
		boolean flag = getloginInfo.getLoginInfo(request);
		if(flag){
			Map<String,Object> param = new HashMap<String,Object>();
			String placeId= request.getParameter("placeId");
			param.put("placeId", Integer.parseInt(placeId));
			String placeinstallationa= request.getParameter("placeinstallation");
			param.put("placeinstallationa", placeinstallationa);
			String placeinstallationadd= request.getParameter("placeinstallationadd");
			param.put("placeinstallationadd", placeinstallationadd);
			String placeinstallationrep= request.getParameter("placeinstallationrep");
			param.put("placeinstallationrep", placeinstallationrep);
			String summoneyadd= request.getParameter("summoneyadd");
			param.put("summoneyadd", summoneyadd);
			String summoneyrep= request.getParameter("summoneyrep");
			param.put("summoneyrep", summoneyrep);
			String mtmaintenance= request.getParameter("mtmaintenance");
			param.put("mtmaintenance", mtmaintenance);
			String mttimestart= request.getParameter("mttimestart");
			//计算场地设置金额；
			String sumMoney = request.getParameter("summoney");
			if(summoneyadd!=null&&summoneyadd!=""){
				Integer a= Integer.parseInt(sumMoney);
				Integer b = Integer.parseInt(summoneyadd);
				sumMoney = Integer.toString(a+b);;
				if(summoneyrep!=null&&summoneyrep!=""){
					sumMoney = Integer.toString((Integer.parseInt(sumMoney))-(Integer.parseInt(summoneyrep)));
				}
			}
			param.put("sumMoney", sumMoney);
			if(!"".equals(mttimestart)&&mttimestart!=null){
				param.put("mttimestart", strToDataTime.StringtoData(mttimestart));
			}
			String mttimeend= request.getParameter("mttimeend");
			if(!"".equals(mttimeend)&&mttimeend!=null){
				param.put("mttimeend", strToDataTime.StringtoData(mttimeend));
			}
			String mtdept= request.getParameter("mtdept");
			param.put("mtdept", mtdept);
			String mtpersontell= request.getParameter("mtpersontell");
			param.put("mtpersontell", mtpersontell);
			String mtsummoney= request.getParameter("mtsummoney");
			param.put("mtsummoney", mtsummoney);
			Integer postulantId  = (Integer) (request.getSession()).getAttribute("postulantId");
			param.put("postulantId", postulantId);
			param.put("recordtime", new Timestamp(System.currentTimeMillis()));
			String obj= request.getParameter("obj");//用于判断是否进入维护状态
			param.put("obj", obj);
			SqlSession openSession = sqlSessionFactory.openSession();
			try {
				//更新场地表中的场地设施
				placeService.updatePlaceStatus(param);
				//插入场地变更维护表记录
				faclitiManageService.insertPlaceFacility(param);
				openSession.commit();
				openSession.close();
				map.addAttribute("status", "1");
				map.addAttribute("massage", "操作成功！");
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
			map.addAttribute("massage", "登陆身份失效，请重新登录");
			JSONObject jsonObject = JSONObject.fromObject(map);
			return jsonObject;
		}
	}
	
	
	/**
	 * 场地变动页面
	 * @param placeDivision
	 * @param placeStatus
	 * @param placeLieu
	 * @param placeName
	 * @param request
	 * @param map
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value="/query/queryFaclitiesChange",produces="text/html;charset=UTF-8")
	public String queryFaclitiesChange(String placeDivision,String mtdept,
			String placeLieu,String placeName,
			HttpServletRequest request,ModelMap map){
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
			if(!"".equals(mtdept)&&mtdept!=null){
				param.put("mtdept", "%"+mtdept+"%");
			}
			//每页总行数
			int pagesize = 8;
			//总行数
			int rowcount ;
			//获取总行数
			rowcount = faclitiManageService.queryFaclitiesChangeCount(param);
			//当前起始页
			int begin = 8*(currnav-1);
			PageUtil pu = new PageUtil(rowcount,pagesize,currnav,8);
			//总页数
			
			param.put("begin", Integer.toString(begin));
			param.put("pagesize", Integer.toString(pagesize));
			
			List<MaintainInfo> maintainInfo = faclitiManageService.queryFaclitiesChange(param);
			map.addAttribute("listPlaceInfo", maintainInfo);*/
			//场地方位查询
			List<PlaceInfo> listpd = placeService.queryPlaceDivison();
			map.addAttribute("pDivision", listpd);
			//map.addAttribute("page", pu);
			return "WEB-INF/jsp/admin2/queryFacutilitiesChange";
		}else{
			return "login";
		}
		
	}
	
	/**
	 * 场地变动list页面
	 * @param placeDivision
	 * @param placeStatus
	 * @param placeLieu
	 * @param placeName
	 * @param request
	 * @param map
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value="/query/queryFacutilitiesChangeList",produces="text/html;charset=UTF-8")
	public String queryFacutilitiesChangeList(String placeDivision,String mtdept,
			String placeLieu,String placeName,
			HttpServletRequest request,ModelMap map){
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
			try {
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
				if(!"".equals(mtdept)&&mtdept!=null){
					mtdept=new String(mtdept.getBytes("ISO-8859-1"),"UTF-8");
					param.put("mtdept", "%"+mtdept+"%");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			//将分页查询条件放入到session中
			request.getSession().setAttribute("placeDivision", placeDivision);
			request.getSession().setAttribute("placeLieu", placeLieu);
			request.getSession().setAttribute("placeName", placeName);
			request.getSession().setAttribute("mtdept", mtdept);
			
			//每页总行数
			int pagesize = 8;
			//总行数
			int rowcount ;
			//获取总行数
			rowcount = faclitiManageService.queryFaclitiesChangeCount(param);
			//当前起始页
			int begin = 8*(currnav-1);
			PageUtil pu = new PageUtil(rowcount,pagesize,currnav,8);
			//总页数
			
			param.put("begin", Integer.toString(begin));
			param.put("pagesize", Integer.toString(pagesize));
			
			List<MaintainInfo> maintainInfo = faclitiManageService.queryFaclitiesChange(param);
			map.addAttribute("listPlaceInfo", maintainInfo);
			//场地方位查询
			/*List<PlaceInfo> listpd = placeService.queryPlaceDivison();
			map.addAttribute("pDivision", listpd);*/
			map.addAttribute("page", pu);
			return "WEB-INF/jsp/admin2/queryFacutilitiesChangeList";
		}else{
			return "login";
		}
		
	}
	
	@RequestMapping("/query/queryFacutilitiesChangSin")
	public String queryFacutilitiesChangSin(HttpServletRequest request,ModelMap map,String mtId){
		boolean flag = getloginInfo.getLoginInfo(request);
		if(flag){
			Map<String,Object> param = new HashMap<String,Object>();
			param.put("mtId", mtId);
			List<MaintainInfo> maintainInfo = faclitiManageService.queryFacutilitiesChangSin(param);
			map.addAttribute("listPlaceInfo", maintainInfo);
			return "WEB-INF/jsp/admin2/queryFacutilitiesChangSin";
		}else{
			return "login";
		}
		
	}
	
	/**
	 * 跳转到新增场地
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("/add/addPlaceinfo")
	public String addPlaceinfo(HttpServletRequest request,ModelMap map){
		boolean flag = getloginInfo.getLoginInfo(request);
		if(flag){
			//场地方位查询
			List<PlaceInfo> listpd = placeService.queryPlaceDivison();
			map.addAttribute("pDivision", listpd);
			return "WEB-INF/jsp/admin2/addPlaceInfo";
		}else{
			return "login";
		}
		
	}
	
	/**
	 * 新增场地
	 * @param requet
	 * @param map
	 * @return
	 */
	@RequestMapping("/add/insertPlaceInfo")
	@ResponseBody
	public Map<String,Object> insertPlaceInfo(HttpServletRequest request,ModelMap map){
		boolean flag = getloginInfo.getLoginInfo(request);
		if(flag){
			Map<String,Object> param = new HashMap<String,Object>();
			String placeDivision = request.getParameter("placeDivision");
			param.put("placeDivision", placeDivision);
			String placeLieu = request.getParameter("placeLieu");
			param.put("placeLieu", placeLieu);
			String placeName = request.getParameter("placeName");
			param.put("placeName", placeName);
			String SumMoney = request.getParameter("SumMoney");
			param.put("SumMoney", SumMoney);
			String placeInstallation = request.getParameter("placeInstallation");
			param.put("placeInstallation", placeInstallation);
			param.put("placeStatus", "1");
			param.put("placeAddtime", new Timestamp(System.currentTimeMillis()));
			
			Integer postulantId  = (Integer) (request.getSession()).getAttribute("postulantId");
			param.put("placeAddperson", postulantId);
			SqlSession openSession = sqlSessionFactory.openSession();
			try {
				    placeService.insertPlaceInfo(param);
					openSession.commit();
					openSession.close();
					map.put("status", "01");
					map.put("massage", "新增成功！");
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
			map.put("massage", "登陆身份失效，请重新登陆！");
			JSONObject jsonObject = JSONObject.fromObject(map);
			return jsonObject;
		}
		
	}
	
	@RequestMapping("/delete/deleteFacutilitiesChangeSin")
	public Map<String,String> deleteFacutilitiesChangeSin(HttpServletRequest request,String mtId){
		boolean flag = getloginInfo.getLoginInfo(request);
		Map<String,String> map = new HashMap<String,String>();
		Map<String,Object> param = new HashMap<String,Object>();
		SqlSession openSession = sqlSessionFactory.openSession();
		if(flag){
			try {
				param.put("mtId", mtId);
				faclitiManageService.deleteFacutilitiesChangeSin(param);
				openSession.commit();
				openSession.close();
				map.put("status", "1");
			} catch (Exception e) {
				openSession.close();
				e.printStackTrace();
				map.put("status", "0");
			}
		}else{
			map.put("status", "2");
		}
		
		return map;
	}
}
