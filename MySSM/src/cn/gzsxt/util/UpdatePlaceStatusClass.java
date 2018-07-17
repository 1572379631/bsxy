package cn.gzsxt.util;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.scheduling.quartz.AdaptableJobFactory;
import org.springframework.scheduling.quartz.SpringBeanJobFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import cn.gzsxt.service.PlaceApplyService;

@Service
public class UpdatePlaceStatusClass extends SpringBeanJobFactory{

	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	@Autowired
	private PlaceApplyService placeApplyService ;
	@Autowired    
    private AutowireCapableBeanFactory capableBeanFactory;   
	
	public void UpdatePlaceStatus(){
		//1、在场地申请单中查询申请结束时间小于当前时间的，如果该记录中存在id，获取id，并将其删除，
		//并根据该id修改该场地的使用状态。
		SqlSession openSession = sqlSessionFactory.openSession();
		try {
			Timestamp time = new Timestamp(System.currentTimeMillis());
			Map<String,Object> param = new HashMap<String,Object>();
			param.put("time", time);
			//获取在场地申请单中查询申请结束时间小于当前时间的场地id
			List<Integer> placeId = placeApplyService.getPlaceApplyTablePlaceId(param);
			//根据查出来的场地id修改该场地的使用状态。
			for (Integer id : placeId) {
				param.put("placeId", id);
				param.put("flag", "1");//用于SQL判断进行何种更新，空闲和使用中
				placeApplyService.UpdatePlaceStatus(param);
			}
			System.err.println("更新场地使用状态完毕");
			//场地变动维护表中的场地id，
			//场地变动维护表中查询维护结束时间小于当前时间的场地id
			List<Integer> placeId2 = placeApplyService.getPlaceMtTablePlaceId(param);
			for (Integer id : placeId2) {
				param.put("placeId", id);
				placeApplyService.UpdatePlaceStatus2(param);
			}
			System.err.println("更新场地维修状态完毕");
			openSession.commit();
			openSession.close();
		} catch (Exception e) {
			e.printStackTrace();
			openSession.rollback();
		}
	}
}
