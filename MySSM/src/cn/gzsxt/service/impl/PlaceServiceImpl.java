package cn.gzsxt.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.gzsxt.mapper.PlaceInfoMapper;
import cn.gzsxt.pojo.PlaceInfo;
import cn.gzsxt.service.PlaceService;
@Service
public class PlaceServiceImpl implements PlaceService{

	@Autowired
	private PlaceInfoMapper placeInfoMapper;
	
	@Override
	public List<PlaceInfo> queryPlaceDivison() {
		return placeInfoMapper.queryPlaceDivision();
	}
	
	public List<PlaceInfo> queryPlaceLieu(Map param){
		return placeInfoMapper.queryPlaceLieu(param);
	}

	@Override
	public List<PlaceInfo> queryPlaceStutas(Map param) {
		return placeInfoMapper.queryPlaceStatus(param);
	}

	@Override
	public int queryPlaceStatusRowCount(Map param) {
		return placeInfoMapper.queryPlaceStatusRowCount(param);
	}

	@Override
	public List<PlaceInfo> queryPlaceName(Map param) {
		return placeInfoMapper.queryPlaceName(param);
	}

	@Override
	public List<PlaceInfo> querySinPlaceInfo(Map param) {
		return placeInfoMapper.querySinPlaceInfo(param);
	}

	@Override
	public String queryPlaceApplyStatusById(Map<String, Object> param) {
		
		return placeInfoMapper.queryPlaceApplyStatusById(param);
	}

	@Override
	public List<PlaceInfo> queryPlaceEmentInfoById(Map<String, Object> param) {
		return placeInfoMapper.queryPlaceEmentInfoById(param);
	}
	

	@Override
	public void updatePlaceStatus(Map<String, Object> param) {
		placeInfoMapper.updatePlaceStatus(param);
	}

	@Override
	public void insertPlaceInfo(Map<String, Object> param) {
		placeInfoMapper.insertPlaceInfo(param);
		
	}

	@Override
	public List<PlaceInfo> queryPlaceinfoByid(Map<String, Object> param) {
		return placeInfoMapper.queryPlaceinfoByid(param);
	}


}
