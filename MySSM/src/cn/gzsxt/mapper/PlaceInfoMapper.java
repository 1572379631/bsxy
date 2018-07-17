package cn.gzsxt.mapper;

import java.util.List;
import java.util.Map;

import cn.gzsxt.pojo.PlaceInfo;

public interface PlaceInfoMapper {
    

    int deleteByPrimaryKey(Integer placeId);

    int insert(PlaceInfo record);

    int insertSelective(PlaceInfo record);


    PlaceInfo selectByPrimaryKey(Integer placeId);


    int updateByPrimaryKeySelective(PlaceInfo record);

    int updateByPrimaryKey(PlaceInfo record);
    
    public List<PlaceInfo> queryPlaceDivision();
    
    public List<PlaceInfo> queryPlaceLieu(Map param);
    
    public List<PlaceInfo> queryPlaceName(Map param);
    
    public List<PlaceInfo> queryPlaceStatus(Map param);
    
    public int queryPlaceStatusRowCount(Map param);
    
    public List<PlaceInfo> querySinPlaceInfo(Map param);
    
    public String queryPlaceApplyStatusById(Map<String, Object> param);
    
    
    public List<PlaceInfo> queryPlaceEmentInfoById(Map<String, Object> param);
    
    public void updatePlaceStatus(Map<String, Object> param);
    
    public void insertPlaceInfo(Map<String, Object> param);
    
    public List<PlaceInfo> queryPlaceinfoByid(Map<String, Object> param);
    
    
} 