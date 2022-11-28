//package com.im.home.members;
//
//import javax.mail.internet.MimeMessage;
//
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.boot.ApplicationArguments;
//import org.springframework.boot.ApplicationRunner;
//import org.springframework.mail.javamail.JavaMailSender;
//import org.springframework.mail.javamail.MimeMessageHelper;
//import org.springframework.stereotype.Component;
//
//import lombok.RequiredArgsConstructor;
//
//@Component
//@RequiredArgsConstructor
//public class MailSenderRunner implements ApplicationRunner{
//
//	
//	private final JavaMailSender javaMailSender;
//	
//	@Value("${spring.mail.username}")
//	private String from;
//
//	
//	@Override
//	public void run(ApplicationArguments args) throws Exception {
//		MembersVO membersVO = new MembersVO();
//		
//		MimeMessage mimeMessage = javaMailSender.createMimeMessage();
//		MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, "UTF-8");
//		
//		mimeMessageHelper.setFrom("hjs120926@naver.com");
//		mimeMessageHelper.setTo(membersVO.getEmail());
//		
//		javaMailSender.send(mimeMessage);
//		
//	}
//	
//}
