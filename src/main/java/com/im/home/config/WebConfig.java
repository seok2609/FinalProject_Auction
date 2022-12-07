package com.im.home.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;

import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// TODO Auto-generated method stub
		// 정적자원 매핑
		registry.addResourceHandler("/assets/**").addResourceLocations("classpath:/assets/");
		registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
		

	}

	@Override
	public void addCorsMappings(CorsRegistry registry) {
		  registry.addMapping("/**")
          .allowedOrigins("*")
          .allowedMethods("GET", "POST");
	}
}
