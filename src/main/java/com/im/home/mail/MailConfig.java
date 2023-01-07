package com.im.home.mail;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import com.im.home.members.MembersVO;

@Configuration
public class MailConfig {
	
	//시크릿 폴더에서 정해놓은 이메일 아이디, 비밀번호
	@Value("${spring.mail.username}")
	private String id;
	
	@Value("${spring.mail.password}")
	private String pw;
	
	
	//메일컨피그ㅇㅇㅇ
	
	@Bean
	public JavaMailSender javaMailSender() {
		MembersVO membersVO = new MembersVO();
		
		JavaMailSenderImpl javaMailSenderImpl = new JavaMailSenderImpl();
		
		javaMailSenderImpl.setHost("smtp.naver.com");
//		javaMailSenderImpl.setUsername(id);
//		javaMailSenderImpl.setPassword(pw);
		
		javaMailSenderImpl.setPort(465);
		
		javaMailSenderImpl.setJavaMailProperties(getMailProperties());
		javaMailSenderImpl.setDefaultEncoding("UTF-8");
		
		return javaMailSenderImpl;
	}
	
	private Properties getMailProperties() {
		Properties prop = new Properties();
		
//		properties.setProperty("mail.transport.protocol", "smtp");
//		properties.setProperty("mail.smtp.auth", "true");
//		properties.setProperty("mail.smtp.starttls.enable", "true");
//		properties.setProperty("mail.debug", "true");
//		properties.setProperty("mail.smtp.ssl.trust", "smtp.naver.com");
//		properties.setProperty("mail.smtp.ssl.enable", "true");
		
        prop.put("mail.smtp.host", "smtp.naver.com");
        prop.put("mail.smtp.port", 465);
        prop.put("mail.smtp.auth", "true");
        prop.put("defaultEncoding","utf-8");
        prop.put("mail.smtp.ssl.enable", "true");
        prop.put("mail.smtp.ssl.trust", "smtp.naver.com");
        prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
		
		return prop;
	}

}
