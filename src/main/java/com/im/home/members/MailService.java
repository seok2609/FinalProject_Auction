package com.im.home.members;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

import com.im.home.mail.config.MailConfig;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MailService {
	
	@Autowired
	private MailConfig mailConfig;
	
	
	//임시비밀번호 메일 전송 코드
		public void sendPw(MembersVO membersVO) throws Exception{
			
			SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
			
			simpleMailMessage.setFrom("hjs120926@naver.com");
			simpleMailMessage.setTo(membersVO.getEmail());	//디비에 저장되있는 이메일로 보냄
			simpleMailMessage.setSubject("임시 비밀번호: ");
			simpleMailMessage.setText(membersVO.getPassword());
			mailConfig.javaMailSender().send(simpleMailMessage);
			
			
		}
		
		
		public void sendSimpleMessage(MailVO mailVO) {
	        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
	        simpleMailMessage.setFrom("gogkgxgg@gmail.com");
	        simpleMailMessage.setTo(mailVO.getAddress());
	        simpleMailMessage.setSubject(mailVO.getTitle());
	        simpleMailMessage.setText(mailVO.getMessage());
	        mailConfig.javaMailSender().send(simpleMailMessage);
	    }

}
