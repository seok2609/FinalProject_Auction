package com.im.home.admin;

import java.sql.Date;
import java.util.List;

import com.im.home.admin.report.MembersReportVO;
import com.im.home.adminInquiryResponse.InquiryResponseVO;
import com.im.home.members.MembersVO;

import lombok.Data;

//1대1 문의
@Data
public class AdminMembersVO {
	private int inquiry_num;
	private String id;
	private String inquiry_contents;
	private String inquiry_text;
	private Date inquiry_date;
	private Integer inquiry_response;
	
	private MembersVO membersVO;
	private InquiryResponseVO inquiryResponseVO;
	private List<MembersReportVO> membersReportVOs;

	

}
