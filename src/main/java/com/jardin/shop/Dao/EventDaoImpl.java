package com.jardin.shop.Dao;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.jardin.shop.Dto.EventDto;
import com.jardin.shop.Dto.PagingDto;
import com.jardin.shop.Dto.ReplyDto;

@Repository
public class EventDaoImpl implements EventDao { //mapper에 있는 정보를 닫아옴 

	@Inject
	SqlSession sql;
	
	
	@Override
	public List<EventDto> event_list(PagingDto pagingDto) throws Exception {
		
		return sql.selectList("Event.event_list", pagingDto);
	}
	
	//게시물 총 갯수
	@Override
	public int listCount() throws Exception {
		return sql.selectOne("Event.listCount");
	}

	@Override
	public EventDto event_content(int bId) {
		
		return sql.selectOne("Event.event_content", bId);
	}

	@Override
	public void event_upHit(String bId) {
		
		sql.update("Event.event_upHit", bId);
	}
	
	//다음페이지
	@Override
	public EventDto event_next(int bId2) {
		return sql.selectOne("Event.event_next", bId2);
	}

	//이전페이지
	@Override
	public EventDto event_prev(int bId2) {
		return sql.selectOne("Event.event_prev", bId2);
	}

	//댓글 리스트
	@Override
	public List<ReplyDto> reply_list(int r_listnum) {
		return sql.selectList("Event.reply_list", r_listnum);
	}

	@Override
	public void reply_write(ReplyDto dto) {
		sql.insert("Event.reply_write", dto);
	}

}
