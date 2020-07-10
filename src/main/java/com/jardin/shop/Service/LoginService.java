package com.jardin.shop.Service;

import javax.servlet.http.HttpSession;

import com.jardin.shop.Dto.JoinDto;

public interface LoginService {
	
	//회원 로그인 체크
	public boolean loginCh(JoinDto dto, HttpSession session);
	
	//회원 로그인 정보
	public JoinDto loginUser(JoinDto dto);
	
	//회원 로그아웃
	public void logout(HttpSession session);
}
