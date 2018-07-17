package cn.gzsxt.service;

import java.util.List;
import java.util.Map;

import cn.gzsxt.pojo.PlaceInfo;

public interface PlaceService {

	public List<PlaceInfo> queryPlaceDivison();
	
	public List<PlaceInfo> queryPlaceLieu(Map param);
	
	public List<PlaceInfo> queryPlaceName(Map param);
	
	public List<PlaceInfo> queryPlaceStutas(Map param);
	
	public int queryPlaceStatusRowCount(Map param);
	
	public List<PlaceInfo> querySinPlaceInfo(Map param);
	

	public String queryPlaceApplyStatusById(Map<String,Object> param);
	
	public List<PlaceInfo> queryPlaceEmentInfoById(Map<String,Object> param);
	
	public void updatePlaceStatus(Map<String,Object> map);
	
	public void insertPlaceInfo(Map<String,Object> map);
	
	public List<PlaceInfo> queryPlaceinfoByid(Map<String,Object> map);
} 
