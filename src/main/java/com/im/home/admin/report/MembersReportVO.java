package com.im.home.admin.report;

import java.sql.Date;

import lombok.Data;

//신고요청
@Data
public class MembersReportVO {
	private int report_num;
	private String id;
	private String report_id;
	private String report_contents;
	private Date report_date;
	
}
