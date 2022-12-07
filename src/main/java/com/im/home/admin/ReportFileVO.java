package com.im.home.admin;

import java.sql.Date;
import java.util.List;

import com.im.home.members.MembersVO;

import lombok.Data;

@Data
public class ReportFileVO {
	private Long report_file_num;
	private int report_num;
	private String report_fileName;
	private String report_oriName;
}
