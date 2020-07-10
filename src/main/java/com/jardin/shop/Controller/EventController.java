package com.jardin.shop.Controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jardin.shop.Dao.EventDao;
import com.jardin.shop.Dto.PagingDto;
import com.jardin.shop.Dto.PagingDto2;
import com.jardin.shop.Dto.ReplyDto;
import com.jardin.shop.Service.EventService;

@Controller
public class EventController {
	
	@Inject
	EventService service;
	
	@Inject
	SqlSession sql;
	
	//이벤트 리스트, 페이징
	@RequestMapping("event/event_list")
	public String event_list (PagingDto pagingDto, Model model) throws Exception {
		
		model.addAttribute("event_list", service.event_list(pagingDto));

		PagingDto2 pagingDto2 = new PagingDto2();
		pagingDto2.setpagingDto(pagingDto);
		pagingDto2.settotalCount(service.listCount());
		
		model.addAttribute("pagingDto2", pagingDto2);
		return "event/event_list";
	}
	
	//이벤트 컨텐트
	@RequestMapping("event/event_content")
	public String event_content(HttpServletRequest request, Model model) {
		
		String bId = request.getParameter("bId");
		model.addAttribute("event_content", service.event_content(bId));
		
		//이전글 다음글
		int bId2 = Integer.parseInt(bId);
		model.addAttribute("event_nextcontent", service.event_next(bId2));
		model.addAttribute("event_prevcontent", service.event_prev(bId2));
		
		return "event/event_content";
	}
	
	//댓글 리스트
	@RequestMapping("event/reply_list")
	@ResponseBody
	public List<ReplyDto> reply_list( int r_listnum) {
		
		EventDao dao = sql.getMapper(EventDao.class);
		return dao.reply_list(r_listnum);
	}
	
	//댓글 쓰기
	@RequestMapping("event/reply_write")
	@ResponseBody
	public String reply_write (@ModelAttribute ReplyDto dto) {
		
		EventDao dao = sql.getMapper(EventDao.class);
		dao.reply_write(dto);
		return "success";
	}
}
