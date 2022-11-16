package com.im.home.members;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MembersMapper {

	
	public MembersVO getMembersLogin(MembersVO membersVO) throws Exception;
}
