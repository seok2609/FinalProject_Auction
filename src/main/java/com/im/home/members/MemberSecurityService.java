package com.im.home.members;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberSecurityService implements UserDetailsService{
	
	
	@Autowired
	private MembersMapper membersMapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		MembersVO membersVO = new MembersVO();
		
		log.info("===========로그인 시도중입니다========");
		
		membersVO = membersMapper.getMembersLogin(username);
		
		log.info("membersVO : {} ", membersVO);
		
		
		return membersVO;
	}
}
