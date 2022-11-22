package com.im.home.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import lombok.extern.slf4j.Slf4j;

@Configuration
@Slf4j
public class MemberWebConfig implements WebMvcConfigurer{

	
	// file/**
	@Value("${app.url.path}")
	private String urlPath;
	
	@Value("${app.upload.base}")
	private String filePath;

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		log.info("===============MemberWebConfig=========");
		log.info("urlPath => {}" , urlPath);
		log.info("filePath => {} " , filePath);
		
		registry.addResourceHandler(urlPath)
				.addResourceLocations(filePath);
		
	}
	
	
}
