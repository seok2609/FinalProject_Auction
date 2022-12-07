package com.im.home.wholesale;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.im.home.members.MembersVO;
import com.im.home.util.Pager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class WholeSaleService {
	
	@Autowired
	private WholeSaleMapper wholeSaleMapper;
	
	public int setAdd(WholeSaleVO wholeSaleVO) throws Exception{
		
		return wholeSaleMapper.setAdd(wholeSaleVO);
	}
	
	public List<WholeSaleVO> getList(Pager pager) throws Exception{
		pager.makeRow();
		pager.getNum(1000L);
		return wholeSaleMapper.getList(pager);
	}

}
