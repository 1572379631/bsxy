package cn.gzsxt.mapper;

import java.util.List;
import java.util.Map;

import cn.gzsxt.pojo.BulletinInfo;

public interface BulletinMapper {

	public void addbulletinInfo(Map<String, Object> param);
	
	public List<BulletinInfo> querybulletinInfo(Map<String, Object> param);
	
	public void deleteBulletinById(Map<String, Object> param);
	
	public Integer querybulletinInfoCount(Map<String, Object> param);
	
	public List<BulletinInfo> querybulletinInfoById(Map<String, Object> param);
}
