package cn.gzsxt.controller;

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

import cn.gzsxt.pojo.BulletinInfo;
import cn.gzsxt.pojo.MaintainInfo;
import cn.gzsxt.pojo.NuintMaintaiInfo;
import cn.gzsxt.pojo.PlaceInfo;
import cn.gzsxt.service.FaclitiManageService;
import cn.gzsxt.service.NuintMaintaiService;
import cn.gzsxt.util.GetLoginInfoClass;
import cn.gzsxt.util.PageUtil;
import cn.gzsxt.util.StringToDataTime;

@Controller
public class NuintMaintaiController {
	
	private GetLoginInfoClass getloginInfo = new GetLoginInfoClass();
	private StringToDataTime strToDataTime = new StringToDataTime();
	
	@Autowired
	private FaclitiManageService faclitiManageService;
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	
	@Autowired
	private NuintMaintaiService nuintMaintaiService;

	@RequestMapping("/query/queryMuInfo")
	public String queryMuInfo(HttpServletRequest request,ModelMap map,String muName){
		boolean flag = getloginInfo.getLoginInfo(request);
		if(flag){
			Map<String,Object> param = new HashMap<String,Object>();
			String pageCurrnav = request.getParameter("currnav");
			int currnav;
			if(pageCurrnav!=null&&!"".equals(pageCurrnav)){
				currnav = Integer.parseInt(pageCurrnav);
			} else{
				currnav = 1;//当前页
			}
			if(!"".equals(muName)&&muName!=null){
				param.put("muName", "%"+muName+"%");
			}
			//每页总行数
			int pagesize = 8;
			//总行数
			int rowcount ;
			//获取总行数
			rowcount = nuintMaintaiService.queryMuInfoCount(param);
			//当前起始页
			int begin = 8*(currnav-1);
			PageUtil pu = new PageUtil(rowcount,pagesize,currnav,8);
			//总页数
			
			param.put("begin", Integer.toString(begin));
			param.put("pagesize", Integer.toString(pagesize));
			
			List<NuintMaintaiInfo> nuintMaintaiInfo  = nuintMaintaiService.queryMuInfo(param);
			map.addAttribute("listPlaceInfo", nuintMaintaiInfo);
			map.addAttribute("page", pu);
			return "WEB-INF/jsp/admin2/queryNuinMaintaiList";
		
		}else{
			return "login";
		}
		
	}
	
	/**
	 * 跳转到维护单位信息添加页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/query/addMuInfo")
	public String ddMuInfo(HttpServletRequest request){
		boolean flag = getloginInfo.getLoginInfo(request);
		if(flag){
			return "WEB-INF/jsp/admin2/addNuinMaintai";
		}else{
			return "login";
		}
	}
	
	@RequestMapping("/add/insertNuinMaintai")
	@ResponseBody
	public Map<String,Object> insertNuinMaintai(HttpServletRequest request,ModelMap map){
		boolean flag = getloginInfo.getLoginInfo(request);
		if(flag){
			Map<String,Object> param = new HashMap<String,Object>();
			String muTell = request.getParameter("muTell");
			param.put("muTell", muTell);
			String muName = request.getParameter("muName");
			param.put("muName", muName);
			String muAddress = request.getParameter("muAddress");
			param.put("muAddress", muAddress);
			SqlSession openSession = sqlSessionFactory.openSession();
			try {
				nuintMaintaiService.insertNuinMaintai(param);
				openSession.commit();
				openSession.close();
				map.addAttribute("status", "01");
				map.addAttribute("massage", "操作成功！");
				JSONObject jsonObject = JSONObject.fromObject(map);
				return jsonObject;
			} catch (Exception e) {
				openSession.rollback();
				e.printStackTrace();
				map.addAttribute("status", "02");
				map.addAttribute("massage", "系统服务正忙，请稍后在试");
				JSONObject jsonObject = JSONObject.fromObject(map);
				return jsonObject;
			}	
		}else{
			map.addAttribute("status", "03");
			map.addAttribute("massage", "登陆身份失效，请重新登陆！");
			JSONObject jsonObject = JSONObject.fromObject(map);
			return jsonObject;
		}
		
	}
	
	@RequestMapping("/delete/deleteMuInfoById")
	@ResponseBody
	public Map<String,String> deleteMuInfoById(HttpServletRequest request){
		boolean flag = getloginInfo.getLoginInfo(request);
		Map<String,String> map = new HashMap<String,String>();
		if(flag){
			Map<String,Object> param = new HashMap<String,Object>();
			String muId = request.getParameter("muId");
			param.put("muId", muId.toString());
			List<BulletinInfo> list = nuintMaintaiService.queryMuInfoById(param);
			if(list.size()>0&&list!=null){
				SqlSession openSession = sqlSessionFactory.openSession();
				try {
					nuintMaintaiService.deleteMuInfoById(param);
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
