package cn.gzsxt.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.gzsxt.mapper.BulletinMapper;
import cn.gzsxt.pojo.BulletinInfo;
import cn.gzsxt.service.BulletinService;

@Service
public class BulletinServiceImpl implements BulletinService {

	@Autowired
	private BulletinMapper bulletinMapper;
	@Override
	public void addbulletinInfo(Map<String, Object> param) {
		bulletinMapper.addbulletinInfo(param);
	}

	@Override
	public List<BulletinInfo> querybulletinInfo(Map<String, Object> param) {
		return bulletinMapper.querybulletinInfo(param);
	}

	@Override
	public void deleteBulletinById(Map<String, Object> param) {
		bulletinMapper.deleteBulletinById(param);
	}

	@Override
	public Integer querybulletinInfoCount(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return bulletinMapper.querybulletinInfoCount(param);
	}

	@Override
	public List<BulletinInfo> querybulletinInfoById(Map<String, Object> param) {
		return bulletinMapper.querybulletinInfoById(param);
	}

}
