package com.im.home.admin;

import java.sql.Date;
import java.util.List;

import com.im.home.members.MembersVO;

import lombok.Data;

@Data
public class Product_FileVO {
	private Long fileNum;
	private Long product_num;
	private String fileName;
	private String oriName;
}
