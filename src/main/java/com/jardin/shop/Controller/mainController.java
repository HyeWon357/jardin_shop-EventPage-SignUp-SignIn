package com.jardin.shop.Controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jardin.shop.Dao.JoinDao;

@Controller
public class mainController {
	
	@Inject
	JoinDao service;
	
	//main
	@RequestMapping(value = "main/main")
	public String main() throws Exception {
		
		return "main/main";
	}
	
}
