package cn.gzsxt.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.gzsxt.mapper.NuintMaintaiMapper;
import cn.gzsxt.pojo.BulletinInfo;
import cn.gzsxt.pojo.NuintMaintaiInfo;
import cn.gzsxt.service.NuintMaintaiService;

@Service
public class NuintMaintaiServiceImpl implements NuintMaintaiService {

	@Autowired
	private NuintMaintaiMapper nuintMaintaiMapper;
	@Override
	public Integer queryMuInfoCount(Map<String, Object> param) {
		return nuintMaintaiMapper.queryMuInfoCount(param);
	}
	@Override
	public List<NuintMaintaiInfo> queryMuInfo(Map<String, Object> param) {
		return nuintMaintaiMapper.queryMuInfo(param);
	}
	@Override
	public void insertNuinMaintai(Map<String, Object> param) {
		nuintMaintaiMapper.insertNuinMaintai(param);
	}
	@Override
	public List<BulletinInfo> queryMuInfoById(Map<String, Object> param) {
		return nuintMaintaiMapper.queryMuInfoById(param);
	}
	@Override
	public void deleteMuInfoById(Map<String, Object> param) {
		nuintMaintaiMapper.deleteMuInfoById(param);
	}

}
