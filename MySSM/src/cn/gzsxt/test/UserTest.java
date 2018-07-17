package cn.gzsxt.test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;

import cn.gzsxt.mapper.Usermapper;
import cn.gzsxt.pojo.User;

public class UserTest {
	
	private Usermapper usermappaer;
	public  static void main(String[] args){
		UserTest u = new UserTest();
		u.selectAllUser();
	}
	
	public  void selectAllUser() {
		try {
			SqlSession session = getSession();
			Usermapper up = session.getMapper(Usermapper.class);
			List<User> user = session.selectList("getAllUser");
		//	List<User> user = up.selectAllUser();
			System.out.println(user);
			closeResource(session);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public SqlSession getSession() throws IOException {
		InputStream ips = Resources.getResourceAsStream("mybatis.cfg.xml");

		SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();

		SqlSessionFactory sqlsesionfactory = builder.build(ips);

		SqlSession sqlsession = sqlsesionfactory.openSession();
		return sqlsession;
	}

	private void closeResource(SqlSession sqlSession) {
		if (null != sqlSession) {
			sqlSession.close();
		}
	}
}
