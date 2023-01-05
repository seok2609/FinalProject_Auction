package com.im.home.auction;

import org.apache.ibatis.annotations.Mapper;

import com.im.home.admin.AuctionVO;
import com.im.home.admin.ProductVO;
@Mapper
public interface AuctionMapper {
	
	public ProductVO getAuctionDetail(AuctionVO auctionVO);
	
	public AuctionVO getIngBroadcasting();
	
}
