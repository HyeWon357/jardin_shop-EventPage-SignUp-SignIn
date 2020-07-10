package com.jardin.shop.Dao;


import com.jardin.shop.Dto.JoinDto;

public interface JoinDao {

	//join3 insert
	public int joinwrite(JoinDto dto) throws Exception;
	
	//id check
	public int id_ch(JoinDto dto) throws Exception;

	
}
