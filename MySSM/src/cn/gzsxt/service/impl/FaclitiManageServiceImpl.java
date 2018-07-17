package cn.gzsxt.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.gzsxt.mapper.MaintainInfoMapper;
import cn.gzsxt.pojo.MaintainInfo;
import cn.gzsxt.service.FaclitiManageService;

@Service
public class FaclitiManageServiceImpl implements FaclitiManageService {

	@Autowired
	private MaintainInfoMapper  maintainInfoMapper;

	@Override
	public void insertPlaceFacility(Map<String, Object> param) {
		maintainInfoMapper.insertPlaceFacility(param);
	}

	@Override
	public List<MaintainInfo> queryFaclitiesChange(Map<String, Object> param) {
		return maintainInfoMapper.queryFaclitiesChange(param);
	}

	@Override
	public Integer queryFaclitiesChangeCount(Map<String, Object> param) {
		return maintainInfoMapper.queryFaclitiesChangeCount(param);
	}

	@Override
	public List<MaintainInfo> queryFacutilitiesChangSin(
			Map<String, Object> param) {
		return maintainInfoMapper.queryFacutilitiesChangSin(param);
	}

	@Override
	public void deleteFacutilitiesChangeSin(Map<String, Object> param) {
		maintainInfoMapper.deleteFacutilitiesChangeSin(param);
	}
	
	
}
