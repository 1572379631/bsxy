package cn.gzsxt.service;

import java.util.List;
import java.util.Map;

import cn.gzsxt.pojo.AdminInfo;

public interface AdminService {

	public List<AdminInfo> queryAdminInfoByNameAndNum(Map<String,String> param);
}
