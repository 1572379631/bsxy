package cn.gzsxt.mapper;

import java.util.List;
import java.util.Map;

import cn.gzsxt.pojo.MaintainInfo;


public interface MaintainInfoMapper {
    
	public void insertPlaceFacility(Map<String, Object> param);
	
	public List<MaintainInfo> queryFaclitiesChange(Map<String, Object> param);
	
	public Integer queryFaclitiesChangeCount(Map<String, Object> param);
	
	public List<MaintainInfo> queryFacutilitiesChangSin(Map<String, Object> param);
	
	public void deleteFacutilitiesChangeSin(Map<String, Object> param);
}