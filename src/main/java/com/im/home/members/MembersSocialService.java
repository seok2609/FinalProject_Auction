package com.im.home.members;

import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

//@Service
@Slf4j
public class MembersSocialService extends DefaultOAuth2UserService{
	
	
	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		
		
		log.info("===========소셜 로그인을 시도중입니다===========");
		log.info("UserRequest {} ", userRequest);
		log.info("AccessTocken : {} ", userRequest.getAccessToken());
		log.info("ClientRegistration : {} ", userRequest.getClientRegistration());
		
		String social = userRequest.getClientRegistration().getRegistrationId();
		log.info("Social : {} ", social);

		
		
		return super.loadUser(userRequest);
	}
	
	

}
