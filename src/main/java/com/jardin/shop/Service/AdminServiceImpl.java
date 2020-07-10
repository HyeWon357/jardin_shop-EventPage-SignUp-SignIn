package com.jardin.shop.Service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.jardin.shop.Dao.AdminDao;
import com.jardin.shop.Dto.EventDto;
import com.jardin.shop.Dto.JoinDto;
import com.jardin.shop.Dto.PagingDto;

@Service
public class AdminServiceImpl implements AdminService { 

	@Inject
	AdminDao adao;

	//회원리스트
	@Override
	public List<JoinDto> admin_main() {
		return adao.admin_main();
	}
	
	//이벤트 리스트
	@Override
	public List<EventDto> admin_eventlist(PagingDto pagingDto) throws Exception {
		return adao.admin_eventlist(pagingDto);
	}
	
	//게시물 총 갯수
	@Override
	public int listCount() throws Exception {
		
		return adao.listCount();
	}
	
	//이벤트 컨텐트
	@Override
	public EventDto admin_eventcontent (String bId) {
		
		int bId2 = Integer.parseInt(bId);
		System.out.println("service edto: " + bId2);
		return adao.admin_eventcontent(bId2);
	}
	
	//이벤트 글작성
	@Override
	public void eventwrite(EventDto dto) throws Exception {
		
		adao.eventwrite(dto);
	}

	
	
}
