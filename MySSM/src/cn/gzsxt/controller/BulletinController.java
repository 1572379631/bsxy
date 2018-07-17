package cn.gzsxt.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.jws.WebParam.Mode;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.gzsxt.pojo.BulletinInfo;
import cn.gzsxt.service.BulletinService;
import cn.gzsxt.util.GetLoginInfoClass;
import cn.gzsxt.util.PageUtil;
import cn.gzsxt.util.StringToDataTime;
import cn.gzsxt.vo.Reusult_PlaceApple;

@Controller
public class BulletinController {

	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	@Autowired
	private BulletinService bulletinService;
	
	private StringToDataTime strToDataTime = new StringToDataTime();
	private GetLoginInfoClass getloginInfo = new GetLoginInfoClass();
	
	/**
	 * 跳转到发布公告页面
	 * @return
	 */
	@RequestMapping("/add/addBulletin")
	public String addBulletin(HttpServletRequest request, ModelMap map){
		boolean flag = getloginInfo.getLoginInfo(request);
		if(flag){
			map.put("flag", "add");
			return "WEB-INF/jsp/admin2/addBulletin";
		}else{
			return "login";
		}
	}
	/**
	 * 发布公告
	 * @return
	 */
	@RequestMapping("/add/addbulletinInfo")
	@ResponseBody
	public Map<String,String> addbulletinInfo(HttpServletRequest request){
		boolean flag = getloginInfo.getLoginInfo(request);
		Map<String,String> map = new HashMap<String,String>();
		if(flag){
			Map<String,Object> param = new HashMap<String,Object>();
			String bulletinCon = request.getParameter("bulletinCon");
			Integer bulletinPerson = (Integer) (request.getSession()).getAttribute("postulantId");
			Timestamp time = new Timestamp(System.currentTimeMillis());
			param.put("bulletinCon", bulletinCon);
			param.put("bulletinPerson", bulletinPerson);
			param.put("time", time);
			SqlSession openSession = sqlSessionFactory.openSession();
				try {
					bulletinService.addbulletinInfo(param);
					openSession.commit();
					openSession.close();
					map.put("status", "1");
					map.put("massage", "发布成功！");
				} catch (Exception e) {
					openSession.rollback();
					e.printStackTrace();
					map.put("status", "0");
					map.put("massage", "系统服务正忙，请稍后在试");
				}
		}else{
			map.put("status", "2");
			map.put("massage", "登陆身份过期，请重新登陆！");
		}
		return map;
	}
	
	@RequestMapping("/query/queryBulletin")
	public String queryBulletin(HttpServletRequest request,String bulletinPerson,ModelMap map){
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
			param.put("bulletinPerson", bulletinPerson);
			//每页总行数
			int pagesize =8;
			//总行数
			int rowcount ;
			//获取待审批或者已审批审批的申请单总行数
			rowcount = bulletinService.querybulletinInfoCount(param);
			//当前起始页
			int begin = 8*(currnav-1);
			PageUtil pu = new PageUtil(rowcount,pagesize,currnav,8);
			
			param.put("begin", Integer.toString(begin));
			param.put("pagesize", Integer.toString(pagesize));
			//历史公告
			List<BulletinInfo> placeInfo = bulletinService.querybulletinInfo(param);
			JSONArray jsonObject = JSONArray.fromObject(placeInfo);
			map.addAttribute("listPlaceInfo", jsonObject);
			map.addAttribute("page", pu);
			return "WEB-INF/jsp/admin2/bulletinInfoList";
		}else{
			return "login";
		}
	}
	/**
	 * 
	 * @return
	 */
	@RequestMapping("/delete/deleteBulletinById")
	@ResponseBody
	public Map<String,String> deleteBulletinById(HttpServletRequest request){
		boolean flag = getloginInfo.getLoginInfo(request);
		Map<String,String> map = new HashMap<String,String>();
		if(flag){
			Map<String,Object> param = new HashMap<String,Object>();
			String bulletinId = request.getParameter("bulletinId");
			param.put("bulletinId", bulletinId.toString());
			List<BulletinInfo> list = bulletinService.querybulletinInfoById(param);
			if(list.size()>0&&list!=null){
				SqlSession openSession = sqlSessionFactory.openSession();
				try {
					bulletinService.deleteBulletinById(param);
					openSession.commit();
					openSession.close();
					map.put("status", "1");
					map.put("massage", "删除成功！");
				} catch (Exception e) {
					openSession.rollback();
					e.printStackTrace();
					map.put("status", "0");
					map.put("massage", "系统服务正忙，请稍后在试");
				}
			}else{
				map.put("status", "2");
				map.put("massage", "该条数据已不存在，请刷新页面！");
			}
		}else{
			map.put("status", "3");
			map.put("massage", "登陆身份校验失败，请重新登录！");
		}
		return map;
	}
}
