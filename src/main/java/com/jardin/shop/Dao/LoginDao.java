package com.jardin.shop.Dao;

import javax.servlet.http.HttpSession;

import com.jardin.shop.Dto.JoinDto;

public interface LoginDao {

	//login check
	public boolean loginCh(JoinDto dto);

	//회원 login 정보
	public JoinDto loginUser(JoinDto dto);
	
	//logout
	public void logout(HttpSession session);
	
}
