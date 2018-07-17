package cn.gzsxt.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.gzsxt.mapper.TeacherInfoMapper;
import cn.gzsxt.pojo.AdminInfo;
import cn.gzsxt.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private TeacherInfoMapper teacherInfoMapper;
	@Override
	public List<AdminInfo> queryAdminInfoByNameAndNum(Map<String, String> param) {
		return teacherInfoMapper.queryAdminInfoByNameAndNum(param);
	}

}
