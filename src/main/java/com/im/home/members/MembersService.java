package com.im.home.members;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MembersService {
	
	@Autowired
	private MembersMapper membersMapper;
	
	public MembersVO getMembersLogin(MembersVO membersVO) throws Exception{
		 
		return membersMapper.getMembersLogin(membersVO);
	}

	
	public int setMembersSignUp(MembersVO membersVO) throws Exception{
		
		return membersMapper.setMembersSignUp(membersVO);
	}

}
