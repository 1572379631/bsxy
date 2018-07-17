package cn.gzsxt.mapper;

import java.util.List;
import java.util.Map;

import cn.gzsxt.pojo.AdminInfo;
import cn.gzsxt.pojo.TeacherInfo;
public interface TeacherInfoMapper {
    
	public List<TeacherInfo> queryPostulantuserNum(Map map);
	
	public List<AdminInfo> queryAdminInfoByNameAndNum(Map<String, String> param);
}