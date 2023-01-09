package com.im.home.util;

import lombok.Data;

@Data
public class ProductPager {
	
	private Long startRow;
	private Long lastRow;
	private Long startNum;
	private Long lastNum;
	private Long page;
	private Long perPage;
	private Long perBlock;
	private Long totalPage;
	
	private String id;
	
	// 이전 블럭 유무 확인
	private boolean pre;
	// 다음 블럭 유무 확인
	private boolean next;
	
	public ProductPager() {
		this.perBlock = 5L;
		this.perPage = 10L;
	}
	
	public void getRowNum() throws Exception{
		this.startRow = (this.getPage() - 1)* this.getPerPage();
	}
	
	public Long getPage() {
		if(this.page == null || this.page<1) {
			this.page=1L;
		}
		
		return this.page;
	}
	
	public void getNum(Long totalCount) throws Exception{
		
		//totalPage 계산
		Long totalPage = totalCount/this.getPerPage();
		
		if(totalCount%this.getPerPage() != 0) {
			totalPage++;
		}
		
		this.totalPage = totalPage;
		
		if(this.getPage() > totalPage) {
			this.setPage(totalPage);
		}
		
		Long totalBlock = totalPage/this.getPerBlock();
		
		if(totalPage%this.getPerBlock() != 0) {
			totalBlock++;
		}
		
		Long curBlock = this.getPage() / this.getPerBlock();
		if(this.getPage()%this.getPerBlock() != 0) {
			curBlock++;
		}
		
		this.startNum = (curBlock-1)*this.getPerBlock()+1;
		this.lastNum = curBlock*this.getPerBlock();
		
		if(curBlock == totalBlock) {
			this.lastNum = totalPage;
		}
		
		if(curBlock > 1) {
			pre = true;
		}
		
		if(curBlock<totalBlock) {
			next = true;
		}
		
		
		
	}
	
	
}
