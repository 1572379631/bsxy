package cn.gzsxt.util;

import javax.servlet.http.HttpServletRequest;

public class GetLoginInfoClass {

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
}
