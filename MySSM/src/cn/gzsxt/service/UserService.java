package cn.gzsxt.service;

import java.util.List;

import cn.gzsxt.pojo.User;

public interface UserService {
	
	public List<User> seletAllUser();
	
	public List<User> selectUserByid(int id);

}
