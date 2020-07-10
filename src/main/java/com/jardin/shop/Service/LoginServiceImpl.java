package com.jardin.shop.Service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.jardin.shop.Dao.LoginDao;
import com.jardin.shop.Dto.JoinDto;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Inject
	LoginDao dao;
	
	//login check
	@Override
	public boolean loginCh(JoinDto dto, HttpSession session) {
		
		boolean result = dao.loginCh(dto);
		
		if(result) { //true일 경우 세션에 등록
			JoinDto dto2 = loginUser(dto);
			
			//세션 변수 등록
			session.setAttribute("j_id", dto2.getJ_id());
			session.setAttribute("j_name", dto2.getJ_name());
			
		}
		return result;
	}
	
	//login 정보
	@Override
	public JoinDto loginUser(JoinDto dto) {

		return dao.loginUser(dto);
	}

	@Override
	public void logout(HttpSession session) {
		
		//세션 변수 개별 삭제
//		session.removeAttribute("j_id");
		
		//세션 정보를 초기화 시킴
		session.invalidate();
	}
	
}
