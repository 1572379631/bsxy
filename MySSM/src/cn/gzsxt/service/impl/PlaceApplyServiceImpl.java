package cn.gzsxt.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.gzsxt.mapper.PlaceApplyInfoMapper;
import cn.gzsxt.mapper.PlaceInfoMapper;
import cn.gzsxt.pojo.PlaceApplyInfo;
import cn.gzsxt.service.PlaceApplyService;
import cn.gzsxt.vo.Reusult_PlaceApple;

@Service
public class PlaceApplyServiceImpl implements PlaceApplyService {

	@Autowired
	private PlaceApplyInfoMapper placeApplyInfoMapper;
	
	@Override
	public Integer insertPlaceApplyInfo(Map param) {
		return placeApplyInfoMapper.insertPlaceApplyInfo(param);
		
	}

	@Override
	public Integer queryPlaceApplyStatusRowCount(Map param) {
		
		return placeApplyInfoMapper.queryPlaceApplyStatusRowCount(param);
	}

	@Override
	public List<PlaceApplyInfo> queryPlaceApplyStatus(Map param) {
		return placeApplyInfoMapper.queryPlaceApplyStatus(param);
	}

	@Override
	public void detelePlaceAppleStatus(Map param) {
		
		placeApplyInfoMapper.detelePlaceAppleStatus(param);
		
	}
	
	@Override
	public int queryApplyRecordRowCount(Map<String, Object> param) {
		return placeApplyInfoMapper.queryApplyRecordRowCount(param);
	}

	@Override
	public List<PlaceApplyInfo> queryApplyRecord(Map<String, Object> param) {
		return placeApplyInfoMapper.queryApplyRecord(param);
	}

	@Override
	public List<Reusult_PlaceApple> queryPlaceApplyById(Map<String, Object> param) {
		return placeApplyInfoMapper.queryPlaceApplyById(param);
	}

	@Override
	public List<Reusult_PlaceApple> queryPlaceApplyApprovalNot(
			Map<String, Object> param) {
		return placeApplyInfoMapper.queryPlaceApplyApprovalNot(param);
	}

	/*@Override
	public Reusult_PlaceApple queryPlaceApplyApprovalNot(
			Map<String, Object> param) {
		return placeApplyInfoMapper.queryPlaceApplyApprovalNot(param);
	}*/
	
	@Override
	public Integer queryPlaceApplyApprovalNotCount(Map<String,Object> param) {
		return placeApplyInfoMapper.queryPlaceApplyApprovalNotCount(param);
	}

	@Override
	public String queryPlaceApplyBillStatus(Map<String, Object> param) {
		return placeApplyInfoMapper.queryPlaceApplyBillStatus(param);
	}

	@Override
	public void updateApplyBill(Map<String, Object> param) {
		placeApplyInfoMapper.updateApplyBill(param);
	}

	@Override
	public String queryPlaceApplyPlaceId(Map<String, Object> param) {
		
		return placeApplyInfoMapper.queryPlaceApplyPlaceId(param);
	}

	@Override
	public Integer queryPlaceStatusFromRowCount(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return placeApplyInfoMapper.queryPlaceStatusFromRowCount(param);
	}

	@Override
	public List<Reusult_PlaceApple> queryPlaceStutas(Map<String, Object> param) {
		return placeApplyInfoMapper.queryPlaceStutas(param);
	}

	@Override
	public List<Integer> getPlaceApplyTablePlaceId(Map<String, Object> param) {
		return placeApplyInfoMapper.getPlaceApplyTablePlaceId(param);
	}

	@Override
	public void UpdatePlaceStatus(Map<String, Object> param) {
		placeApplyInfoMapper.UpdatePlaceStatus(param);
		
	}

	@Override
	public void UpdatePlaceStatus2(Map<String, Object> param) {
		placeApplyInfoMapper.UpdatePlaceStatus2(param);
	}

	@Override
	public List<Integer> getPlaceMtTablePlaceId(Map<String, Object> param) {
		return placeApplyInfoMapper.getPlaceMtTablePlaceId(param);
	}



}
