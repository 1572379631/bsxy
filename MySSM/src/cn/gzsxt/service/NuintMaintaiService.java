package cn.gzsxt.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import cn.gzsxt.pojo.BulletinInfo;
import cn.gzsxt.pojo.NuintMaintaiInfo;


public interface NuintMaintaiService {
	
	public Integer queryMuInfoCount(Map<String,Object> param);
	
	public List<NuintMaintaiInfo> queryMuInfo(Map<String,Object> param);
	
	public void insertNuinMaintai(Map<String,Object> param);
	
	public List<BulletinInfo> queryMuInfoById(Map<String,Object> param);
	
	public void deleteMuInfoById(Map<String,Object> param);

}
