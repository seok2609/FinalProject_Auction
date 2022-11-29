package com.im.home.auction;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
@Mapper
public interface AuctionMapper {
	
	// 경매 상품 목록
	public List<AuctionVO> getList() throws Exception;
	
	// 경매 상품 추가
	public int setAdd() throws Exception;
	
	// 경매 상품 디테일
	public AuctionVO getDetail() throws Exception;
	
	
	
	
}
