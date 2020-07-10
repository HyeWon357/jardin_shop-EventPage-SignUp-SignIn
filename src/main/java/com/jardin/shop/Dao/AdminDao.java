package com.jardin.shop.Dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.jardin.shop.Dto.EventDto;
import com.jardin.shop.Dto.JoinDto;
import com.jardin.shop.Dto.PagingDto;

public interface AdminDao {
	
	//회원 리스트
	public List<JoinDto> admin_main();
	
	//이벤트 리스트
	public List<EventDto> admin_eventlist(PagingDto pagingDto) throws Exception;
	
	//게시글 총 갯수
	public int listCount() throws Exception;
	
	//이벤트 컨텐트
	public EventDto admin_eventcontent(@Param("bId") int bId);
	
	//이벤트 글작성
	public void eventwrite(EventDto dto) throws Exception;

	
}
