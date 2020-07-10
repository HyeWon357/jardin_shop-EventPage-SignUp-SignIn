package com.jardin.shop.Dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jardin.shop.Dto.EventDto;
import com.jardin.shop.Dto.PagingDto;
import com.jardin.shop.Dto.ReplyDto;

public interface EventDao {
	
	public List<EventDto> event_list(PagingDto pagingDto) throws Exception;
	public int listCount() throws Exception; //게시글 총 갯수
	public EventDto event_content(@Param("bId") int bId);
	public void event_upHit(String bId);
	
	//이전페이지, 다음페이지
	public EventDto event_next(int bId2);
	public EventDto event_prev(int bId2);
	
	public List<ReplyDto> reply_list(int r_listnum); //댓글 리스트
	public void reply_write(ReplyDto dto);
	
}
