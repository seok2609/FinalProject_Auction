package com.im.home.util;

import lombok.Data;

@Data
public class Pager {
	
	private String whsalCd;
	private int saleDateStart;
	private int saleDateEnd;
	private String saleDate;
	private String largeCd;
	private String midCd;
	private Long startRow;
	private Long lastRow;
	private Long startNum;
	private Long lastNum;
	private String search;
	private Long page;
	private Long perPage;
	private Long perBlock;
	private Long totalPage;
		
		//이전 블럭의 유무-이전 블럭이 있으면 true, 없으면 false
		private boolean pre;
		//다음 블럭의 유무-다음 블럭이 있으면 true, 없으면 false
		private boolean next;
		
		public void makeRow() {
			this.startRow = (this.getPage()-1)*perPage;
			
		}
		
	public Pager(){
		this.perPage=10L;
		this.perBlock=10L;
	}
	
	public Long getPage(){
		if(this.page==null || this.page<1) {
			this.page=1L;
		}
		
		return page;
	}
	
	
	//jsp로 보내줄 페이지네이션 번호 계산
		public void getNum(Long totalCount)throws Exception{
			 
			 //totalPage 계산
			 Long totalPage = totalCount/this.getPerPage(); //this.getPerPage(); 한페이지당 출력 수 
			 
			 //totalCount에서 perPage 나눴을때 0이 아니라면 totalPage는 +1
			 //ex: totalCount:122 perPage:20 -> totalPage: 6+1 
			 if(totalCount%this.getPerPage()!=0) {
				 totalPage++; //totalPage++; 총 페이지 수
			 }
			 
			 this.totalPage = totalPage;
			 
			 if(this.getPage()>totalPage) {
				 this.setPage(totalPage);
			 }
			 //totalBlock은 페이지네이션의 총 갯수
			 Long totalBlock = totalPage/this.getPerBlock();
			 //totalPage를 PerBlock으로 나눴을때 0이 아니라면 totalBlock은 +1
			 //ex: totalPage:7 perPage:5 -> totalBlock: 1+1 
			 if(totalPage%this.getPerBlock()!=0) {
				 totalBlock++;
			 }
			 
			 //curBlock:페이지네이션의 현재 번호
			 Long curBlock = this.getPage()/this.getPerBlock();
			 if(this.getPage()%this.getPerBlock()!=0) {
				 curBlock++;
			 }
			 
			 this.startNum = (curBlock-1)*this.getPerBlock()+1;
			 this.lastNum = curBlock*this.getPerBlock();
			 
			 if(totalBlock<1) {
				 this.startNum =0L;
				 this.lastNum = 0L;
			 }
			 if(curBlock==totalBlock) {
				 this.lastNum = totalPage;
			 }
			 
			 if(curBlock>1) {
					pre=true;
				}
				
			if(curBlock<totalBlock) {
					next=true;
				}
		}
		public String getLargeCd() {
			if(this.largeCd==null) {
				this.largeCd="";
			}
			return largeCd;
		}
		
		
		public String getWhsalCd() {
			if(this.whsalCd==null) {
				this.whsalCd="110001";
			}
			return whsalCd;
		}

}
