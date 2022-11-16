package com.im.home.members;

import java.util.List;

import lombok.Data;

@Data
public class MembersVO {
	
	private String id;
	private String passWord;
	private String userName;
	private String email;
	private String birth;
	private Integer gender;
	private String phone;
	
	private List<RoleVO> roleVOs;

}
