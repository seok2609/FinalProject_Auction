package com.im.home.members.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class LoginSuccess implements AuthenticationSuccessHandler{
	
	
	// 로그인 성공시 실행되는 메서드
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		log.info("==========로그인 성공===========");
		log.info("ID => {} ", request.getParameter("id"));
		
		
		String check = request.getParameter("rememberId");
		
		
		log.info("CHECK => {} " , check);
		
		if(check != null && check.equals("on")) {	//체크박스에 클릭이 되었을때
			
			Cookie cookie = new Cookie("Id", request.getParameter("id"));
			
			cookie.setHttpOnly(true);
			cookie.setMaxAge(24*60*60);	//24번*60번*60초 => 하루종일
			cookie.setPath("/");	// 같은 도메인 내 URL 사용가능한지 보여주는 메서드
			
			response.addCookie(cookie);
			
		}else {
			Cookie [] cookies = request.getCookies();
			for(Cookie cookie : cookies) {
				
				if(cookie.getName().equals("Id")) {
					cookie.setMaxAge(0);
					cookie.setPath("/");		//쿠키가 생성된 도메인에서만 쿠키가 지워짐
					
					response.addCookie(cookie);
					break;
				}
			}
		}
		
		
		response.sendRedirect("/");	//로그인에 성공한다면 루트로 보냄
	
		
	}
	
	

}
