package com.jardin.shop.Dao;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jardin.shop.Dto.EventDto;
import com.jardin.shop.Dto.JoinDto;
import com.jardin.shop.Dto.PagingDto;

@Repository
public class AdminDaoImpl implements AdminDao {

	//select는 Dto를 사용하여 무조건 return 값이 있다.
	//update, delete, 등등.. void를 이용하여 return 값을 사용하지 않음
	
	@Inject
	SqlSession sql;
	
	//회원 리스트
	@Override
	public List<JoinDto> admin_main() {
		
		return sql.selectList("Admin.admin_main");
	}
	
	//이벤트 리스트
	@Override
	public List<EventDto> admin_eventlist(PagingDto pagingDto) throws Exception {
		
		return sql.selectList("Admin.admin_eventlist", pagingDto);
	}
	
	//게시물 총 갯수
	@Override
	public int listCount() throws Exception {
		return sql.selectOne("Admin.listCount");
	}

	//이벤트 컨텐트
	@Override
	public EventDto admin_eventcontent(int bId) {
		System.out.println("dao edto: " + bId);
		
		return sql.selectOne("Admin.admin_eventcontent", bId);
	}
	
	//이벤트 글쓰기
	public void eventwrite(EventDto dto) throws Exception {
		
		sql.insert("Admin.eventwrite", dto);
	}
}
