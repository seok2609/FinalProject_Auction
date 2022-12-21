package com.im.home.members;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MembersSocialService extends DefaultOAuth2UserService{
	
	
	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		
		
		log.info("===========소셜 로그인을 시도중입니다===========");
		log.info("UserRequest : {} ", userRequest);
		log.info("AccessTocken : {} ", userRequest.getAccessToken());
		log.info("ClientRegistration : {} ", userRequest.getClientRegistration());
		
		String social = userRequest.getClientRegistration().getRegistrationId();
		log.info("Social : {} ", social);

		OAuth2User oAuth2User = this.socailJoinCheck(userRequest);
		
		
		return oAuth2User;
	}
	
	
	private OAuth2User socailJoinCheck(OAuth2UserRequest userRequest) {
		
		//회원가입 유무
		
		OAuth2User oAuth2User = super.loadUser(userRequest);
		
		log.info("************** 사용자 정보 *************");
		log.info("Name : {} ", oAuth2User.getName());
		log.info("Attributes : {} " , oAuth2User.getAttributes());
		log.info("auth :: {} " , oAuth2User.getAuthorities());
		
		Map<String, Object> map = oAuth2User.getAttributes();
		
		//key들 꺼내기
		Iterator<String> keys = map.keySet().iterator();
		
		while(keys.hasNext()) {	//열거한 후 다음게 있냐고 물어봄
			String key = keys.next();
			
			log.info("KEY ==>> {} " , key);
			
		}
		
		
		log.info("ClassName : {} " , oAuth2User.getAttribute("properties").getClass());
		
		Map<String, String> lm = oAuth2User.getAttribute("properties");
		Map<String, Object> ks = oAuth2User.getAttribute("kakao_account");
		
		MembersVO membersVO = new MembersVO();
		
		membersVO.setId(oAuth2User.getName());
		
		//pw가 없으므로 비워두거나, 랜덤한 값으로 일단 채워넣는다
		//membersVO.setPw(null);
		
		membersVO.setNickName(lm.get("nickname"));
		membersVO.setEmail(ks.get("email").toString());
		
		membersVO.setSocial(userRequest.getClientRegistration().getRegistrationId());
		
		membersVO.setAttributes(oAuth2User.getAttributes());
		
		//Role을 임의로 작성
		List<RoleVO> lr = new ArrayList<>();
		RoleVO roleVO = new RoleVO();
		
		roleVO.setRoleName("ROLE_MEMBER");
		
		lr.add(roleVO);
		
		membersVO.setRoleVOs(lr);
		
		
		
		return membersVO;
		
		
	}
	
	

}
