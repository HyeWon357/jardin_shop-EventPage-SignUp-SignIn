package com.jardin.shop.Service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jardin.shop.Dao.EventDao;
import com.jardin.shop.Dto.EventDto;
import com.jardin.shop.Dto.PagingDto;
import com.jardin.shop.Dto.ReplyDto;

@Service
public class EventServiceImpl implements EventService { //서비스에 있는 메소드를 controller에 보내줌
	
	@Inject
	EventDao edao;
	
	@Override
	public List<EventDto> event_list(PagingDto pagingDto) throws Exception {
		
		return edao.event_list(pagingDto);
	}
	
	//게시물 총 갯수
	@Override
	public int listCount() throws Exception {
		
		return edao.listCount();
	}
	
	@Override
	public EventDto event_content(String bId) {
		
		int bId2 = Integer.parseInt(bId);
		edao.event_upHit(bId);
		return edao.event_content(bId2);
	}

	@Override
	public EventDto event_next(int bId2) {
		
		return edao.event_next(bId2);
	}

	@Override
	public EventDto event_prev(int bId2) {
		
		return edao.event_prev(bId2);
	}
	
}
