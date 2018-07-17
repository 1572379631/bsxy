package cn.gzsxt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.gzsxt.mapper.Usermapper;
import cn.gzsxt.pojo.User;
import cn.gzsxt.service.UserService;

@Service
public class Userimpl implements UserService{

	@Autowired
	private Usermapper usermapper;
	
	@Override
	public List<User> seletAllUser() {
		return usermapper.selectAllUser();
	}

	@Override
	public List<User> selectUserByid(int id) {
		return usermapper.selectUserByid(id);
	}



}
