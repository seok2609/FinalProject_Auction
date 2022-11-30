package com.im.home.admin;

import java.sql.Date;

import lombok.Data;

//1대1 관리자 답변
@Data
public class InquiryResponseVO {
	private int inquiry_response_num;
	private int inquiry_num;
	private String inquiry_response_contents;
	private Date inquiry_response_date;
}
