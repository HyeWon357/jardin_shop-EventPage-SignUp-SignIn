package com.jardin.shop.Controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jardin.shop.Dto.JoinDto;
import com.jardin.shop.Service.LoginService;

@Controller
public class LoginController {
	
	@Inject
	LoginService service;
	
	//login vice
	@RequestMapping("Signin/login")
	public String login() {
		
		return "Signin/login";
	}
	
	//login check
	@RequestMapping("Signin/loginCh")
	public ModelAndView loginCh(@ModelAttribute JoinDto dto, HttpSession session) {
	
		boolean result = service.loginCh(dto, session);
		ModelAndView mav = new ModelAndView(); // ModelAndView -> 데이터를 전송시킬 수 있는 리턴 타입
		
		if(result == true) { //로그인 성공
			
			mav.setViewName("main/main"); // setViewName -> 어떤 페이지를 보여줄 것인지
			mav.addObject("msg", "success"); //addObject key와 value를 담아 보낼 수 있는 메소드 
			
		} else { //로그인 실패
			
			mav.setViewName("Signin/login"); //login 이동
			mav.addObject("msg", "failure");
		}
		
		return mav;
	}
	
	//로그아웃
	@RequestMapping("Signin/logout")
	public ModelAndView logout(HttpSession session) {
		
		service.logout(session);
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("main/main"); //main 이동
		mav.addObject("msg", "logout");
		
		return mav;
	}
}
