package cn.gzsxt.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.gzsxt.mapper.StudentInfoMapper;
import cn.gzsxt.pojo.StudentInfo;
import cn.gzsxt.service.StudentService;

@Service
public class StudenServiceImpl implements StudentService{

	@Autowired
	private StudentInfoMapper studentInfoMapper;

	@Override
	public List<StudentInfo> queryPostulantuserNum(Map map) {
		// TODO Auto-generated method stub
		return studentInfoMapper.queryPostulantuserNum(map);
	}
}
