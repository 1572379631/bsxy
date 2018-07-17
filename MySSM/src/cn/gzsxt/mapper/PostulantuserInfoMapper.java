package cn.gzsxt.mapper;

import java.util.List;
import java.util.Map;

import cn.gzsxt.pojo.PlaceApplyInfo;
import cn.gzsxt.pojo.PostulantuserInfo;
import cn.gzsxt.pojo.StudentInfo;
import cn.gzsxt.vo.Result_person;

public interface PostulantuserInfoMapper {
   /*
    * 登陆检验
    */
	public List<PostulantuserInfo> selectUserByName(PostulantuserInfo postulantuserInfo);

	public List<PostulantuserInfo> queryPostulantuserByName(Map<String,String> param);
	
	public void insertPostulantInfo(Map<String,Object> param);
	
	public List<StudentInfo> queryPostulantuserNum(String num);
	
	public List<PostulantuserInfo> queryPostulantuserById(Map<String,Object> param);
	
	public void updatePostulantuser(Map<String,Object> param);
	
	public List<Result_person> queryApplyPersonById(Map<String, Object> param);
	
	public List<Result_person> queryApprovalPersonInfo(Map<String, Object> param);
	
	public void updatePersonInfo(Map<String, Object> param);
	
	public List<PostulantuserInfo> queryPostulantuserByNameAndId(Map<String, Object> param);
	
	
}