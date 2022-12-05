package com.im.home.wholesale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.im.home.members.MembersVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class WholeSaleService {
	
	@Autowired
	private WholeSaleMapper wholeSaleMapper;
	
	public int setAdd(WholeSaleVO wholeSaleVO) throws Exception{
		
		return wholeSaleMapper.setAdd(wholeSaleVO);
	}

}
