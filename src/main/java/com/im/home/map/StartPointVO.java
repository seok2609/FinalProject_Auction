package com.im.home.map;

import java.sql.Date;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class StartPointVO {
	private double latitude;
	private double longitude;
	private Long S_Num;
	private String S_Name;
	private LocalDateTime startDate;
	
	
}
