package com.jardin.shop.Controller;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.jardin.shop.Dao.AdminDao;
import com.jardin.shop.Dto.EventDto;
import com.jardin.shop.Dto.PagingDto;
import com.jardin.shop.Dto.PagingDto2;
import com.jardin.shop.Service.AdminService;


@Controller
public class AdminController {
	
	@Inject
	AdminService service;
	
	
	//회원 리스트
	@RequestMapping("admin/admin_main")
	public String admin_main(Model model) {
		
		model.addAttribute("admin_main", service.admin_main());
		return "admin/admin_main";
	}
	
	//이벤트 리스트
	@RequestMapping("admin/admin_eventlist")
	public String admin_eventlist(PagingDto pagingDto, Model model) throws Exception {
		
		PagingDto2 pagingDto2 = new PagingDto2();
		pagingDto2.setpagingDto(pagingDto);
		pagingDto2.settotalCount(service.listCount());
		
		model.addAttribute("pagingDto2", pagingDto2);
		
		model.addAttribute("admin_eventlist", service.admin_eventlist(pagingDto));
		return "admin/admin_eventlist";
	}
	
	//이벤트 컨텐트
	@RequestMapping("admin/admin_eventcontent")
	public String admin_eventcontent(HttpServletRequest request, Model model) {
		
		String bId = request.getParameter("bId");
		model.addAttribute("admin_eventcontent", service.admin_eventcontent(bId));
		
		return "admin/admin_eventcontent";
	}
	
	//이벤트 글쓰기(페이지)
	@RequestMapping("admin/admin_eventwrite")
	public String admin_eventwrite() {
		
		return "admin/admin_eventwrite";
	}
	
	//이벤트 글쓰기(입력)
	@PostMapping("admin/eventwrite")
	public String eventwrite(String bName, String bTitle, String bDate, String bDate2, MultipartFile bFile,  MultipartFile bFile2) throws Exception {
		
		String path ="C:/workpace/jardin_shop/src/main/webapp/uploadFile/";
		String save = bFile.getOriginalFilename();
		String save2 = bFile2.getOriginalFilename();
		
		//파일이 없을시 폴더 만들기
		File dirpath = new File(path);
		if(!dirpath.exists()) {
			dirpath.mkdirs();
		}
		
		bFile.transferTo(new File(path + save));
		bFile2.transferTo(new File(path + save2));
		
		EventDto dto = new EventDto();
		dto.setbName(bName);
		dto.setbTitle(bTitle);
		dto.setbDate(bDate);
		dto.setbDate2(bDate2);
		dto.setbFile(save);
		dto.setbFile2(save2);
		
		service.eventwrite(dto);
		return "redirect:admin_eventlist";
	}
	
}
