package com.jardin.shop.Service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jardin.shop.Dao.JoinDao;
import com.jardin.shop.Dto.JoinDto;

@Service
public class JoinServiceImpl implements JoinService { //값을 넘겨오는거
	
	@Inject
	JoinDao dao;
	
	@Override
	public int id_ch(JoinDto dto) throws Exception {
		int result = dao.id_ch(dto);
		return result;
	}
	
	//join3 write
	@Override
	public int joinwrite(JoinDto dto) throws Exception {
		
		if(dto.getJ_add3() == null) { //null방지

			String j_add3 = "";
			dto.setJ_add3(j_add3);
		}
		
		return dao.joinwrite(dto);
	}

	
}
