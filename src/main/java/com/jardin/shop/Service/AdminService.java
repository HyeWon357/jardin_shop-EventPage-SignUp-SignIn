package com.jardin.shop.Service;

import java.util.List;
import java.util.Map;


import com.jardin.shop.Dto.EventDto;
import com.jardin.shop.Dto.JoinDto;
import com.jardin.shop.Dto.PagingDto;

public interface AdminService {

	//회원 리스트
	public List<JoinDto> admin_main();

	//이벤트 리스트
	public List<EventDto> admin_eventlist(PagingDto pagingDto) throws Exception;
	
	//게시물 총 갯수
	public int listCount() throws Exception;
	
	//이벤트 컨텐트
	public EventDto admin_eventcontent(String bId);
	
	//이벤트 글작성
	public void eventwrite(EventDto dto) throws Exception;


	
	

}
