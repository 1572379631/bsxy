package cn.gzsxt.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.gzsxt.mapper.TeacherInfoMapper;
import cn.gzsxt.pojo.TeacherInfo;
import cn.gzsxt.service.TeacherService;

@Service
public class TeacherServiceImpl implements TeacherService {

	@Autowired
	private TeacherInfoMapper teacherInfoMapper;
	
	@Override
	public List<TeacherInfo> queryPostulantuserNum(Map map) {
		
		return teacherInfoMapper.queryPostulantuserNum(map);
	}

	
}
