package cn.gzsxt.service;

import java.util.List;
import java.util.Map;

import cn.gzsxt.pojo.PlaceApplyInfo;
import cn.gzsxt.vo.Reusult_PlaceApple;


public interface PlaceApplyService {

	public Integer insertPlaceApplyInfo(Map param);
	
	public Integer queryPlaceApplyStatusRowCount(Map param);
	
	public List<PlaceApplyInfo> queryPlaceApplyStatus(Map param);
	
	public void detelePlaceAppleStatus(Map param);
	

	public int queryApplyRecordRowCount(Map<String,Object> param);
	
	public List<PlaceApplyInfo> queryApplyRecord(Map<String,Object> param);
	
	public List<Reusult_PlaceApple> queryPlaceApplyById(Map<String,Object> param);
	
	public List<Reusult_PlaceApple> queryPlaceApplyApprovalNot(Map<String,Object> param);
	
	public Integer queryPlaceApplyApprovalNotCount(Map<String,Object> param);
	
	public String queryPlaceApplyBillStatus(Map<String,Object> param);
	
	public void updateApplyBill(Map<String,Object> param);
	
	public String queryPlaceApplyPlaceId(Map<String,Object> param);
	
	public Integer queryPlaceStatusFromRowCount(Map<String,Object> param);
	
	public List<Reusult_PlaceApple> queryPlaceStutas(Map<String,Object> param);
	
	public List<Integer> getPlaceApplyTablePlaceId(Map<String,Object> param);
	
	public void UpdatePlaceStatus(Map<String,Object> param);
	
	public void UpdatePlaceStatus2(Map<String,Object> param);
	
	public List<Integer> getPlaceMtTablePlaceId(Map<String,Object> param);
}
