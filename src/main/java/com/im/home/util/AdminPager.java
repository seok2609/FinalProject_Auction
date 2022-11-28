package com.im.home.util;

import lombok.Data;

@Data
public class AdminPager {
   private Long page;
   private Long perPage;
   private Long startRow;
   private Long startNum;
   private Long lastNum;
   private Long perBlock;
   private boolean pre;
   private boolean next;
   private String kind;
   private String search;
   
   public AdminPager() {
      this.perPage = 10L;
      this.perBlock = 5L;
   }
   
   public Long getPage() {
      if(this.page == null || this.page < 1) {
         this.page = 1L;
      }
      return page;
   }
   
   public Long getPerBlock() {
	   if(this.perBlock < 1) {
		   this.perBlock = 1L;
	   }
	   return perBlock;
   }
   
   public Long getPerPage() {
      if(this.perPage == null) {
         this.perPage = 10L;
      }
      return perPage;
   }
   
   public void getRowNum() throws Exception {
      this.startRow = (this.getPage()-1)*perPage;
   }
   
   public void getNum(Long totalCount) throws Exception{
      Long totalPage = totalCount/this.getPerPage();
      if(totalCount % this.getPerPage() != 0) {
         totalPage++;
      }
      if(this.getPage()>totalPage) {
         this.setPage(totalPage);
      }
      Long totalBlock = totalPage/this.getPerBlock();
      if(totalPage % this.getPerBlock() != 0) {
         totalBlock++;
      }
      Long curBlock = this.getPage()/this.getPerBlock();
      if(this.getPage() % this.getPerBlock() != 0) {
         curBlock++;
      }
      this.startNum = (curBlock - 1) * this.getPerBlock() + 1;
      this.lastNum = curBlock*this.getPerBlock();
      
      if(curBlock == totalBlock) {
         this.lastNum = totalPage;
      }
      
      if(curBlock > 1) {
         pre = true;
      }
      
      if(curBlock < totalBlock) {
         next = true;
      }
   }
   	public Long getStartRow() {
		if(this.startRow == null) {
			this.startRow=0L;
		}
		return startRow;
		
	}
   public String getSearch() {
      if(this.search == null) {
         this.search = "";
      }
      return search;
   }
   
}