package com.im.home.admin;

import java.sql.Date;
import java.util.List;

import com.im.home.members.MembersVO;

import lombok.Data;


public class AuctionVO {
	
	private Long auction_num;
	private String title;
	private Long init_price;
	private Long head_count;
	private Date sign_date;
	private Boolean bidding;
	private Boolean ing;
	private Long award;
	private String id; 
	private Long product_num;
	
	
	
	public Boolean getIng() {
		return ing;
	}
	public void setIng(Boolean ing) {
		this.ing = ing;
	}
	public Long getAuction_num() {
		return auction_num;
	}
	public void setAuction_num(Long auction_num) {
		this.auction_num = auction_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Long getInit_price() {
		return init_price;
	}
	public void setInit_price(Long init_price) {
		this.init_price = init_price;
	}
	public Long getHead_count() {
		return head_count;
	}
	public void setHead_count(Long head_count) {
		this.head_count = head_count;
	}
	public Date getSign_date() {
		return sign_date;
	}
	public void setSign_date(Date sign_date) {
		this.sign_date = sign_date;
	}
	public Boolean getBidding() {
		return bidding;
	}
	public void setBidding(Boolean bidding) {
		this.bidding = bidding;
	}
	public Long getAward() {
		return award;
	}
	public void setAward(Long award) {
		this.award = award;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Long getProduct_num() {
		return product_num;
	}
	public void setProduct_num(Long product_num) {
		this.product_num = product_num;
	}
	
}
