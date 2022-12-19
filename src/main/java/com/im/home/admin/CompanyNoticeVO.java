package com.im.home.admin;

import java.sql.Date;
import java.util.List;

import com.im.home.members.MembersVO;

import lombok.Data;

@Data
public class CompanyNoticeVO {
	private int notice_num;
	private String notice_title;
	private String notice_contents;
	private int notice_hit;
	private Date notice_date;
}
