package com.im.home.admin;

import java.sql.Date;

import com.im.home.members.MembersVO;

import lombok.Data;

//신고요청
@Data
public class MembersReportVO {
	private int report_num;
	private String id;
	private String report_id;
	private String report_contents;
	private Date report_date;
	private MembersVO membersVO;
	
}
