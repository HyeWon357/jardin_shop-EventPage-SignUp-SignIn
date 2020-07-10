package com.jardin.shop.Dao;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jardin.shop.Dto.JoinDto;

@Repository
public class JoinDaolmpl implements JoinDao { //db 데이터 불러오기
	
	@Inject
	SqlSession sql;
	
	@Override
	public int id_ch(JoinDto dto) throws Exception {
		int result = sql.selectOne("Join.id_ch", dto);
		return result;
	}

	//join3 write
	@Override
	public int joinwrite(JoinDto dto) throws Exception {
		
		return sql.insert("Join.joinwrite", dto);
	}

	
}
