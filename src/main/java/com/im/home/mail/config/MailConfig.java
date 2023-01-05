package com.im.home.mail.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import com.im.home.members.MembersVO;

@Configuration
public class MailConfig {
	
	//메일컨피그
	
	@Bean
	public JavaMailSender javaMailSender() {
		MembersVO membersVO = new MembersVO();
		
		JavaMailSenderImpl javaMailSenderImpl = new JavaMailSenderImpl();
		
		javaMailSenderImpl.setHost("smtp.naver.com");
		javaMailSenderImpl.setUsername("hjs120926@naver.com");
		javaMailSenderImpl.setPassword("whdtjr1209@");
		
		javaMailSenderImpl.setPort(465);
		
		javaMailSenderImpl.setJavaMailProperties(getMailProperties());
		
		return javaMailSenderImpl;
	}
	
	private Properties getMailProperties() {
		Properties properties = new Properties();
		
		properties.setProperty("mail.transport.protocol", "smtp");
		properties.setProperty("mail.smtp.auth", "true");
		properties.setProperty("mail.smtp.starttls.enable", "true");
		properties.setProperty("mail.debug", "true");
		properties.setProperty("mail.smtp.ssl.trust", "smtp.naver.com");
		properties.setProperty("mail.smtp.ssl.enable", "true");
		
		return properties;
	}

}
