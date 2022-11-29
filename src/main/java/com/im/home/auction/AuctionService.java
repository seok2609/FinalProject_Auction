package com.im.home.auction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuctionService {
	@Autowired
	private AuctionMapper auctionMapper;
	
	public int setAdd(AuctionVO auctionVO) throws Exception{
		return auctionMapper.setAdd(); 
	}
	
}
