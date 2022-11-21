package com.im.home.members;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

@Mapper
public interface MembersMapper {

	
	public MembersVO getMembersLogin(String username) throws UsernameNotFoundException;
	
	public int setMembersSignUp(MembersVO membersVO) throws Exception;
	
	public int setMembersFileAdd(MembersFileVO membersFileVO) throws Exception;
}
