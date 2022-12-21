package com.im.home.auction.product;

import lombok.Data;

@Data
public class ProductVO {
	
	private Long product_num;
	private Long auction_num;
	private String id;
	private String name;
	private String category;
	private String grade;
	private Long quantity;
	private Long weight;
	private int sales;
	private String pickup_address;
	private String ext_address;
	private String detail_address;
	private String postcode;
	
}
