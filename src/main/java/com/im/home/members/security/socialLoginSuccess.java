package com.im.home.members.security;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.client.OAuth2AuthorizationSuccessHandler;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.im.home.members.MembersVO;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class socialLoginSuccess extends SimpleUrlAuthenticationSuccessHandler{
	
	
	
	
	//소셜로그인이 성공되면 들어오는 곳
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {

			
			ModelAndView mv = new ModelAndView();
			MembersVO membersVO = new MembersVO();
		
			// 추가정보를 입력하지 않았다면 추가정보 입력폼으로 보냄
			if(membersVO.getId() == null) {
				mv.setViewName("/members/socialAdd");
			}else {	// 추가정보를 입력한 사람이라면 루트로 보냄	
				mv.setViewName("/");
			}
				
		}
	
	
}
