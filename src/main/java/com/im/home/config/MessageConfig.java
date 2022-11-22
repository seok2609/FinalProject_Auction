package com.im.home.config;

import java.util.Locale;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;

@Configuration
public class MessageConfig implements WebMvcConfigurer{
	
	@Bean
	public LocaleResolver local() {
		
		CookieLocaleResolver cookieLocaleResolver = new CookieLocaleResolver();
		
		cookieLocaleResolver.setDefaultLocale(Locale.KOREAN);	//기본 메세지 위치(나라)
		cookieLocaleResolver.setCookieName("lang");			//파라미터이름
		
		
		return cookieLocaleResolver;
	}

}
