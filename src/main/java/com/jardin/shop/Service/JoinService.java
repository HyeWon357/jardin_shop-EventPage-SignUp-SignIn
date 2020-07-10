package com.jardin.shop.Service;

import com.jardin.shop.Dto.JoinDto;

public interface JoinService {
	
	//id check
	public int id_ch (JoinDto dto) throws Exception;
	
	//join3 write
	public int joinwrite(JoinDto dto) throws Exception;

}
