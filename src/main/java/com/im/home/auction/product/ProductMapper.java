package com.im.home.auction.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.im.home.admin.ProductVO;

@Mapper
public interface ProductMapper {
	
	// 판매 상품 추가
	public int setAdd(ProductVO productVO) throws Exception;
	
	// 판매 상품 목록
	public List<ProductVO> getList() throws Exception;
	
	
}
