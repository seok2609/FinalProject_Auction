package com.im.home.auction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.im.home.admin.AuctionVO;
import com.im.home.admin.ProductVO;

@Service
public class AuctionService {
	@Autowired
	private AuctionMapper auctionMapper;
	
	public ProductVO getAuctionDetail(AuctionVO auctionVO) {
		return auctionMapper.getAuctionDetail(auctionVO);
	}
	
	public AuctionVO getIngBroadcasting() {
		return auctionMapper.getIngBroadcasting();
	}
	
	
}
