package com.im.home.admin;

import java.sql.Date;
import java.util.List;

import com.im.home.members.MembersVO;

import lombok.Data;

@Data
public class AdminMembersVO {
	private String inquiry_num;
	private String id;
	private String inquiry_contents;
	private String inquiry_text;
	private Date inquiry_date;
	private Integer inquiry_response;
	
	private MembersVO membersVO;

	

}
