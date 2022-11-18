package com.im.home.aution;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class AuctionVO {
	
	private String id;
	private Long auction_num;
	private String title;
	private String contents;
	private String category;
	private Long init_price;
	private Long head_count;
	private Date sign_date;
	private Boolean bidding;
	private Date start_date;
	private Boolean approval;
	private Long award;
	
	private List<AskingPriceVO> askingPriceVOs;
	
	
}
