package com.im.home.members.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.stereotype.Component;

import com.im.home.members.MembersVO;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class LogoutSuccess implements LogoutSuccessHandler{
	
	
	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		
		log.info("=========로그아웃 성공======");
		
		MembersVO membersVO = (MembersVO)authentication.getPrincipal();
		
		response.sendRedirect("/");
		
		
	}

		
	
}
