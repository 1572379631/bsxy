package cn.gzsxt.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.gzsxt.mapper.PostulantuserInfoMapper;
import cn.gzsxt.pojo.PlaceApplyInfo;
import cn.gzsxt.pojo.PostulantuserInfo;
import cn.gzsxt.pojo.StudentInfo;
import cn.gzsxt.service.PostulantUserService;
import cn.gzsxt.vo.Result_person;

@Service
public class PostulantUserServiceImpl implements PostulantUserService{

	@Autowired
	private PostulantuserInfoMapper postulantuserInfoMapper;
	
	@Override
	public List<PostulantuserInfo> selectUserByName(
			PostulantuserInfo postulantuserInfo) {
		
		return postulantuserInfoMapper.selectUserByName(postulantuserInfo);
	}

	@Override
	public List<PostulantuserInfo> queryPostulantuserByName(
			Map<String, String> param) {
		
		return postulantuserInfoMapper.queryPostulantuserByName(param);
	}

	@Override
	public void insertPostulantInfo(Map<String, Object> param) {
		postulantuserInfoMapper.insertPostulantInfo(param);
	}

	@Override
	public List<PostulantuserInfo> queryPostulantuserById(
			Map<String, Object> param) {
		return postulantuserInfoMapper.queryPostulantuserById(param);
	}

	@Override
	public void updatePostulantuser(Map<String, Object> param) {
		postulantuserInfoMapper.updatePostulantuser(param);
		
	}

	@Override
	public List<Result_person> queryApplyPersonById(Map<String, Object> param) {
		return postulantuserInfoMapper.queryApplyPersonById(param);
	}

	@Override
	public List<Result_person> queryApprovalPersonInfo(Map<String, Object> param) {
		return postulantuserInfoMapper.queryApprovalPersonInfo(param);
	}

	@Override
	public void updatePersonInfo(Map<String, Object> param) {
		postulantuserInfoMapper.updatePersonInfo(param);
	}

	@Override
	public List<PostulantuserInfo> queryPostulantuserByNameAndId(Map<String, Object> param) {
		return postulantuserInfoMapper.queryPostulantuserByNameAndId(param);
	}


	

	

	
}
