package com.im.home.auction;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.im.home.admin.AuctionVO;
import com.im.home.admin.ProductVO;
import com.im.home.util.ProductPager;

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
	
	public int setUpdateIng(AuctionVO auctionVO) {
		return auctionMapper.setUpdateIng(auctionVO);
	}
	
	public int setUpdateWinner(ProductVO productVO) {
		return auctionMapper.setUpdateWinner(productVO);
	}
	
	public int setUpdateAward(AuctionVO auctionVO) {
		return auctionMapper.setUpdateAward(auctionVO);
	}
	
	public int setUpdatePointMinus(AuctionVO auctionVO) {
		return auctionMapper.setUpdatePointMinus(auctionVO);
	}
	
	public List<ProductVO> getMyProduct(ProductPager productPager) throws Exception{
		productPager.getRowNum();
		productPager.getNum(auctionMapper.getCountMyProduct(productPager));
		
		return auctionMapper.getMyProduct(productPager);
		
	}
	
}
