package com.im.home.map;

import java.sql.Date;

import lombok.Data;

@Data
public class MapVO {
	
	private double latitude;
	private double longitude;
	private Long num;
	private String name;
	private Date dateTime;
}
