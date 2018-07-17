package cn.gzsxt.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.gzsxt.pojo.AdminInfo;
import cn.gzsxt.pojo.BulletinInfo;
import cn.gzsxt.pojo.PlaceApplyInfo;
import cn.gzsxt.pojo.PostulantuserInfo;
import cn.gzsxt.pojo.StudentInfo;
import cn.gzsxt.pojo.TeacherInfo;
import cn.gzsxt.service.AdminService;
import cn.gzsxt.service.BulletinService;
import cn.gzsxt.service.PlaceApplyService;
import cn.gzsxt.service.PostulantUserService;
import cn.gzsxt.service.StudentService;
import cn.gzsxt.service.TeacherService;
import cn.gzsxt.test.MD5Text;
import cn.gzsxt.util.GetLoginInfoClass;
import cn.gzsxt.util.PageUtil;
import cn.gzsxt.util.StringToDataTime;
import cn.gzsxt.vo.Reusult_PlaceApple;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

@Controller
public class PostulantController {
	
	@Autowired
	private BulletinService bulletinService;
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	private StringToDataTime strToDataTime = new StringToDataTime();
	@Autowired
	private PostulantUserService postulantUserService;
	@Autowired
	private StudentService studentService;
	@Autowired
	private PlaceApplyService placeApplyService ;
	@Autowired
	private TeacherService teacherService;
	@Autowired
	private AdminService adminService;
	private GetLoginInfoClass getloginInfo = new GetLoginInfoClass();
	private MD5Text md5text = new MD5Text();
	private Configuration configuration = null;
	
	@RequestMapping("/query/Postulant3")
	public String selectUserByName(@ModelAttribute PostulantuserInfo postulantuserInfo){
		String name=postulantuserInfo.getPostulantName();
		List<PostulantuserInfo> list = postulantUserService.selectUserByName(postulantuserInfo);
		return null;
		
	}
	
	@RequestMapping("/query/Postulant2")
	public String selectUserByName(String Rand,HttpServletRequest request,ModelMap map){
		String postulantName  = (String) (request.getSession()).getAttribute("postulantName");
		String postulantPwd  = (String) (request.getSession()).getAttribute("postulantPwd");
		String identity = (String) (request.getSession()).getAttribute("identity");
		if(postulantName!=null&&!"".equals(postulantName)&&postulantPwd!=null&&!"".equals(postulantPwd)){
			if("1".equals(identity)||"2".equals(identity)){
				map.addAttribute("bulletinCon", queryBulletinStr());
				return "WEB-INF/jsp/AmazeUI/admin-index";//申请人界面
			}else if("3".equals(identity)){
				return "WEB-INF/jsp/admin2/index";//审批人界面
			}else{
				return "WEB-INF/jsp/admin2/index";//管理员界面
			}
		}else{
			return "login";
		}
	}
	/**
	 * 登陆检验
	 * @param postulantName
	 * @param postulantPwd
	 * @param Rand
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/query/Postulant",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,String> selectUserByNametext(String postulantName,String postulantPwd,String Rand,HttpServletRequest request){
		String identity = request.getParameter("identity");
		String num = null;
		if("1".equals(identity)){
			num = request.getParameter("studentNum");
		}else if("2".equals(identity)){
			num = request.getParameter("teacherNum");
		}else if("3".equals(identity)){
			num = request.getParameter("approverNum");
		}else if("4".equals(identity)){
			num = request.getParameter("administratorNum");
		}
		String Session1postulantPwd = md5text.StrToMD5_to1(postulantPwd);//用于修改密码的新旧密码对比（申请人）
		String Session2postulantPwd = postulantPwd;//用于修改密码的新旧密码对比（管理员）
		HttpSession session = request.getSession();
		String sRand = ((String) session.getAttribute("rand")).toLowerCase();
		Map<String,String> param = new HashMap<>();
		param.put("postulantName", postulantName);
		if("1".equals(identity)||"2".equals(identity)){
			postulantPwd = md5text.StrToMD5(postulantPwd);
		}
		param.put("postulantPwd", postulantPwd);
		param.put("identity", identity);
		param.put("num", num);
		
		Map<String,String> map = new HashMap<>();
		//登录之前判断对应角色是否存在！
		//判断所输入的学号或教师号是否存在
				List<StudentInfo> lists  = null;
				List<TeacherInfo> listt  = null;
				List<AdminInfo> lista  = null;
				if("1".equals(identity)){
					lists = studentService.queryPostulantuserNum(param);
					if(lists.size()==0||lists==null){
						map.put("status", "04");
						map.put("massage", "请核对学号和姓名！");
						JSONObject jsonObject = JSONObject.fromObject(map);
						return jsonObject;
					}
				}else if("2".equals(identity)){
					listt = teacherService.queryPostulantuserNum(param);
					if(listt.size()==0||listt==null){
						map.put("status", "04");
						map.put("massage", "请核对教职工号和姓名！");
						JSONObject jsonObject = JSONObject.fromObject(map);
						return jsonObject;
					}
				}else if("3".equals(identity)){
					lista = adminService.queryAdminInfoByNameAndNum(param);
					if(lista.size()==0||lista==null){
						map.put("status", "04");
						map.put("massage", "管理员登录信息有误！");
						JSONObject jsonObject = JSONObject.fromObject(map);
						return jsonObject;
					}
				}
		List<PostulantuserInfo> list = postulantUserService.queryPostulantuserByName(param);
		if(list.size()>0&&null!=list&&Rand.equals(sRand)){
			//将登陆人信息存入session中
			session.setAttribute("postulantName", postulantName);
			if("1".equals(identity)||"2".equals(identity)){//申请人时，将密码解密存到session中
				session.setAttribute("postulantPwd", Session1postulantPwd);
			}else{
				session.setAttribute("postulantPwd", Session2postulantPwd);//
			}
			session.setAttribute("identity", identity);
			Integer postulantId = list.get(0).getPostulantId();
			session.setAttribute("postulantId", postulantId);
			map.put("status", "1");
			return map;
		}else{
			map.put("status", "0");
			map.put("massage", "用户名或密码错误！");
			JSONObject jsonObject = JSONObject.fromObject(map);
			return jsonObject;
		}
	}
	
	//注册
	@RequestMapping("/add/Postulant")
	@ResponseBody
	public Map<String,Object> addPostulant(String Rand,HttpServletRequest request){
		HttpSession session = request.getSession();
		String sRand = ((String) session.getAttribute("rand")).toLowerCase();
		String postulantName = request.getParameter("postulantName");
		String postulantPwd = request.getParameter("postulantPwd");
		String postulantPwdNew = request.getParameter("postulantPwdNew");
		String identity = request.getParameter("identityR");
		String num = null;
		if("1".equals(identity)){
			num = request.getParameter("studentNumR");
		}else if("2".equals(identity)){
			num = request.getParameter("teacherNumR");
		}
		Map<String,Object> map = new HashMap<String,Object>();
		if(!Rand.equals(sRand)){
			map.put("status", "01");
			map.put("massage", "验证码错误！");
			JSONObject jsonObject = JSONObject.fromObject(map);
			return jsonObject;
		}else if(!postulantPwd.equals(postulantPwdNew)){
			map.put("status", "02");
			map.put("massage", "两次密码输入不一致，请重新输入！");
			JSONObject jsonObject = JSONObject.fromObject(map);
			return jsonObject;
		}else{
			Map<String,Object> param = new HashMap<String,Object>();
			param.put("postulantName", postulantName);
			postulantPwd = md5text.StrToMD5(postulantPwd);
			param.put("postulantPwd", postulantPwd);
			/*param.put("identity", identity);*/
			param.put("num", num);
			
			//判断所输入的学号或教师号是否存在
			List<StudentInfo> lists  = null;
			List<TeacherInfo> listt  = null;
			if("1".equals(identity)){
				lists = studentService.queryPostulantuserNum(param);
				if(lists.size()==0||lists==null){
					map.put("status", "04");
					map.put("massage", "请核对学号和姓名！");
					JSONObject jsonObject = JSONObject.fromObject(map);
					return jsonObject;
				}
			}else if("2".equals(identity)){
				listt = teacherService.queryPostulantuserNum(param);
				if(listt.size()==0||listt==null){
					map.put("status", "04");
					map.put("massage", "请核对教师号和姓名！");
					JSONObject jsonObject = JSONObject.fromObject(map);
					return jsonObject;
				}
			}
			if(lists!=null||listt!=null){
				//判断该编号是否已经注册过是否已经注册过，注册过不能再注册
				List<PostulantuserInfo> nameAndnum = postulantUserService.queryPostulantuserByNameAndId(param);
				if(nameAndnum.size()>0&&nameAndnum!=null){
					map.put("status", "04");
					map.put("massage", "该学号或教职工号已注册！");
					JSONObject jsonObject = JSONObject.fromObject(map);
					return jsonObject;
				}else{
					SqlSession openSession = sqlSessionFactory.openSession();
					try {
						postulantUserService.insertPostulantInfo(param);
						openSession.commit();
						openSession.close();
						map.put("status", "03");
						map.put("massage", "注册成功！");
						JSONObject jsonObject = JSONObject.fromObject(map);
						return jsonObject;
					} catch (Exception e) {
						openSession.rollback();
						e.printStackTrace();
						map.put("status", "04");
						map.put("massage", "系统服务正忙，请稍后在试");
						JSONObject jsonObject = JSONObject.fromObject(map);
						return jsonObject;
					}
				}
			}
			return null;
		}
		
	}
	/**
	 * 修改申请人信息
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("/update/updatePostulantuser")
	public String updatePostulantuser(HttpServletRequest request,ModelMap map){
		Boolean flag = getloginInfo.getLoginInfo(request);
		if(flag){
			Integer postulantId  = (Integer) (request.getSession()).getAttribute("postulantId");
			Map<String,Object> param = new HashMap<String,Object>();
			param.put("postulantId", postulantId);
			String identity = (String) request.getSession().getAttribute("identity");
			param.put("identity", identity);
			List<PostulantuserInfo> posList= postulantUserService.queryPostulantuserById(param);
			map.put("posList", posList);
			map.put("bulletinCon", queryBulletinStr());
			return "WEB-INF/jsp/updatePostulantuser";
		}
		return "login";
		
	}
	
	/**
	 * 查看申请人信息
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("/query/queryPostulantuser")
	public String queryPostulantuser(HttpServletRequest request,ModelMap map){
		Boolean flag = getloginInfo.getLoginInfo(request);
		if(flag){
			Integer postulantId  = (Integer) (request.getSession()).getAttribute("postulantId");
			Map<String,Object> param = new HashMap<String,Object>();
			String identity = (String) request.getSession().getAttribute("identity");
			param.put("identity", identity);
			param.put("postulantId", postulantId);
			List<PostulantuserInfo> posList= postulantUserService.queryPostulantuserById(param);
			map.put("posList", posList);
			map.put("bulletinCon", queryBulletinStr());
				return "WEB-INF/jsp/queryPostulantuser";
		}
		return "login";
		
	}
	/**
	 * 修改申请人信息
	 * @return
	 */
	@RequestMapping("/update/updatePostulantuserInfo")
	@ResponseBody
	public Map<String,Object> updatePostulantuserInfo(HttpServletRequest request){
		Map<String,Object> map = new HashMap<String,Object>();
		Boolean flag = getloginInfo.getLoginInfo(request);
		if(flag){
			Map<String,Object> param = new HashMap<String,Object>();
			String postulantPwdNew = request.getParameter("postulantPwdNew");
			String postuantPwdNewSession1 = md5text.StrToMD5_to1(postulantPwdNew);//用于存到session中(申请人时)
			String postuantPwdNewSession2 = postulantPwdNew;//用于存到session中（管理人员是）
			if(postulantPwdNew!=null&&!"".equals(postulantPwdNew)){
				postulantPwdNew = md5text.StrToMD5(postulantPwdNew);
				param.put("postulantPwdNew", postulantPwdNew);
			}
			String postulantTell = request.getParameter("postulantTell");
			String postulantEmaill = request.getParameter("postulantEmaill");
			Integer postulantId  = (Integer) (request.getSession()).getAttribute("postulantId");
			param.put("postulantTell", postulantTell);
			param.put("postulantEmaill", postulantEmaill);
			param.put("postulantId", postulantId);
			
			String identity = (String) request.getSession().getAttribute("identity");
			SqlSession openSession = sqlSessionFactory.openSession();
			try {
				postulantUserService.updatePostulantuser(param);
				openSession.commit();
				openSession.close();
				map.put("status", "01");
				map.put("massage", "修改成功！");
				//修改成功后，将密码重新存到session中
				if("1".equals(identity)||"2".equals(identity)){//申请人时，将密码解密存到session中
					request.getSession().setAttribute("postulantPwd", postuantPwdNewSession1);
				}else{
					request.getSession().setAttribute("postulantPwd", postuantPwdNewSession2);
				}
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
			map.put("massage", "登陆身份失效，请重新登录");
			return map;
		}
		
	}
	
	/**
	 *申请记录查询
	 * @param placeName
	 * @param applyTime
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/query/queryApplyRecord",produces="text/html;charset=UTF-8")
	public String queryPlaceApplyStatus(String placeName,String applyTime,String placeDivision,HttpServletRequest request,ModelMap map){
		Boolean flag = getloginInfo.getLoginInfo(request);
		if(flag){
			return "WEB-INF/jsp/applyRecord";
		}else{
			return "login";
		}
	}
	
	/**
	 * 场地申请记录list页面
	 * @param placeName
	 * @param applyTime
	 * @param placeDivision
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/query/queryApplyRecordList",produces="text/html;charset=UTF-8")
	public String queryApplyRecordList(String placeName,String applyTime,String placeDivision,HttpServletRequest request,ModelMap map){
		Boolean flag = getloginInfo.getLoginInfo(request);
		if(flag){
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
					placeName= new String(placeName.getBytes("ISO-8859-1"),"UTF-8");
					param.put("placeName", placeName);
				}
				if(!"".equals(applyTime)&&applyTime!=null&&!"0".equals(applyTime)){
					applyTime = StringUtils.substringBeforeLast(applyTime,"T");
					param.put("applyTime", applyTime);
				}
		
				if(!"".equals(placeDivision)&&placeDivision!=null&&!"0".equals(placeDivision)){
					placeDivision= new String(placeDivision.getBytes("ISO-8859-1"),"UTF-8");
					param.put("placeDivision", placeDivision);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			//将条件存入session，用于有条件的分页
			request.getSession().setAttribute("placeName", placeName);
			request.getSession().setAttribute("placeDivision", placeDivision);
			request.getSession().setAttribute("applyTime", StringUtils.substringBeforeLast(applyTime,"T"));
			
			Integer postulantId  = (Integer) (request.getSession()).getAttribute("postulantId");
			param.put("postulantId", postulantId.toString());
			param.put("approvalnum", "1");//用于SQL判断
			//每页总行数
			int pagesize = 10;
			//总行数
			int rowcount = 0 ;
			//获取总行数
			rowcount = placeApplyService.queryPlaceApplyStatusRowCount(param);
			//当前起始页
			int begin = 10*(currnav-1);
			PageUtil pu = new PageUtil(rowcount,pagesize,currnav,10);
			//总页数
			
			param.put("begin", Integer.toString(begin));
			param.put("pagesize", Integer.toString(pagesize));
			//查询申请记录
			List<PlaceApplyInfo> placeInfoMapper  = placeApplyService.queryPlaceApplyStatus(param);
			map.put("listPlaceInfo", placeInfoMapper);
			map.put("bulletinCon", queryBulletinStr());
			map.put("page", pu);
			return "WEB-INF/jsp/applyRecordList";
		}else{
			return "login";
		}
	}
	
	/**
	 * 申请单导出
	 * @param request
	 * @param placeApplyId
	 */
	@RequestMapping("/download/downloadApplyDoc")
	@ResponseBody
	public Map<String,Object> downloadApplyDoc(HttpServletRequest request,String placeApplyId){
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("placeApplyId", placeApplyId);
		List<Reusult_PlaceApple> reusult_PlaceApple  = placeApplyService.queryPlaceApplyById(param);
		Reusult_PlaceApple rp =  reusult_PlaceApple.get(0);
		
		configuration = new Configuration();  
		configuration.setDefaultEncoding("UTF-8");
		Map<String, Object> dataMap = new HashMap<String, Object>();
		configuration.setClassForTemplateLoading(this.getClass(), "/downloadText");// 模板文件所在路径
		Template t = null;
		try {
			t = configuration.getTemplate("applyTable.ftl"); // 获取模板文件
		} catch (IOException e) {
			e.printStackTrace();
		}
		File outFile = new File("D:/outFile/" + "场地申请单"+Math.random() * 10000 + ".doc"); // 导出文件
		Writer out = null;
		try {
			out = new BufferedWriter(new OutputStreamWriter(
					new FileOutputStream(outFile)));
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		}
		JSONObject jsonObject = null;
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			Map<String,Object> param2 = new HashMap<String,Object>();
			//将对象属性放入param中
			
			param2.put("deptName", rp.getDeptName());
			String teamYesnot = rp.getTeamYesnot();//获取申请方式
			if("1".equals(teamYesnot)){
				param2.put("deptName","个人");
			}
			//获取审批人的id，查询他的name
			String approvalPerson = rp.getApprovalPerson();
			param2.put("postulantId", approvalPerson);
			String identity = (String) request.getSession().getAttribute("identity");
			param2.put("identity", identity);
			
			List<PostulantuserInfo> list2 = postulantUserService.queryPostulantuserById(param2);
			param2.put("tName", list2.get(0).getPostulantName());
			
			param2.put("postulantName", rp.getPostulantName());
			param2.put("studentNum",rp.getStudentNum());
			param2.put("principalTell",rp.getPrincipalTell());
			param2.put("sponsor",rp.getSponsor());
			param2.put("postulantTell",rp.getPostulantTell());
			param2.put("placeDivision",rp.getPlaceDivision());
			param2.put("placeLieu",rp.getPlaceLieu());
			param2.put("placeName",rp.getPlaceName());
			param2.put("applyTimeStart",rp.getApplyTimeStart());
			param2.put("applyTimeEnd",rp.getApplyTimeEnd());
			param2.put("approvalTime",rp.getApprovalTime());
			param2.put("activityName",rp.getActivityName());
			param2.put("activityContent",rp.getActivityContent());
			param2.put("activityNature",rp.getActivityNature());
			param2.put("participant",rp.getParticipant());
			param2.put("participantSum",rp.getParticipantSum());
			param2.put("advise",rp.getAdvise());

			t.process(param2, out); // 将填充数据填入模板文件并输出到目标文件
			out.close();
			
			map.put("status", "1");
			map.put("massage", "文件导出成功");
			JSONObject.fromObject(map);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			map.put("status", "2");
			map.put("massage", "导出异常，请联系管理员！");
			JSONObject.fromObject(map);
			return map;
		}
	}
	
    public String queryBulletinStr(){
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("bb", "bb");
		List<BulletinInfo> info = bulletinService.querybulletinInfo(param);
		BulletinInfo bulletinInfo = info.get(0);
		String bulletinCon = bulletinInfo.getBulletinCon();
		return bulletinCon;
		
	}
    /**
     * 退出登录
     * @param reqeust
     * @return
     */
    @RequestMapping("/out/OutLogin")
    @ResponseBody
    public Map<String,Object> OutLogin(HttpServletRequest request){
    	HttpSession session = request.getSession();
    	Map<String,Object> map = new HashMap<String,Object>();
    	try {
    		session.removeAttribute("postulantName");
    		session.removeAttribute("postulantPwd");
    		session.removeAttribute("identity");
    		session.removeAttribute("postulantId");
    		map.put("status", "1");
    		return map;
		} catch (Exception e) {
			map.put("status", "0");
			return map;
		}
    	
    }
	
}
