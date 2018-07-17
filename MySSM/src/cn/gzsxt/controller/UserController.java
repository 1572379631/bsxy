package cn.gzsxt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.gzsxt.pojo.User;
import cn.gzsxt.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userservice;
	
	@RequestMapping("/alluser")
	public String selectAllUser(ModelMap map){
		List<User> list = userservice.seletAllUser();
		map.addAttribute("Userlist",list);
		return "userList";
		
	}
	
	@RequestMapping("byid")
	@ResponseBody
	public List<User> selectUserByid(int id){
		return userservice.selectUserByid(id);
	}
}
