package com.jardin.shop.Dao;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jardin.shop.Dto.JoinDto;

@Repository //현재 클래스를 스프링에서 관리하는 dao bean으로 등록
public class LoginDaoImpl implements LoginDao {
	//SqlSession 객체를 스프링에서 생성하여 주입
	//의존관계 주입(Dependency Injection)
	
	@Inject
	SqlSession sql; //mybatis 객체
	
	//login check
	@Override
	public boolean loginCh(JoinDto dto) {
		String name = sql.selectOne("Login.loginCh", dto);
		return (name == null) ? false : true;
	}
	
	//login User 정보
	@Override
	public JoinDto loginUser(JoinDto dto) {
		return sql.selectOne("Login.loginUser", dto);
	}
	
	//logout
	@Override
	public void logout(HttpSession session) {
		
	}
	
	
	
}
