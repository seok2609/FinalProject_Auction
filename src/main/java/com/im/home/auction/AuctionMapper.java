package com.im.home.auction;

import org.apache.ibatis.annotations.Mapper;

import com.im.home.admin.AuctionVO;
import com.im.home.admin.ProductVO;
@Mapper
public interface AuctionMapper {
	
	public ProductVO getAuctionDetail(AuctionVO auctionVO);
	
	//진행중인 경매 확인
	public AuctionVO getIngBroadcasting();
	
	//경매 상태(ING) 업데이트
	public int setUpdateIng(AuctionVO auctionVO);
	
	public int setUpdateWinner(ProductVO productVO);
	
	public int setUpdateAward(AuctionVO auctionVO);
	
	public int setUpdatePointMinus(AuctionVO auctionVO);
	
}
