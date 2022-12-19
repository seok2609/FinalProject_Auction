package com.im.home.map;

import java.sql.Date;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class EndPointVO {		
	private double latitude;
	private double longitude;
	private Long E_Num;
	private String E_Name;
	private LocalDateTime endDate;
	
}
