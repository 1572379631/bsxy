package cn.gzsxt.mapper;

import java.util.List;

import cn.gzsxt.pojo.User;

public interface Usermapper {
	
	public List<User> selectAllUser();
	
	public List<User> selectUserByid(int id);
}
