package com.jardin.shop.Service;

import java.util.List;

import com.jardin.shop.Dto.EventDto;
import com.jardin.shop.Dto.PagingDto;
import com.jardin.shop.Dto.ReplyDto;

public interface EventService {
	
	public List<EventDto> event_list(PagingDto pagingDto) throws Exception;
	public int listCount() throws Exception; //게시물 총 갯수
	public EventDto event_content(String bId);
	
	public EventDto event_next(int bId2); //다음페이지
	public EventDto event_prev(int bId2); //이전페이지
	
}
