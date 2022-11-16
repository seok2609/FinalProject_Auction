package com.im.home.cconfig;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

	
	@Bean
	//회원가입시 필터 적용 제외
	WebSecurityCustomizer webSecurityCustomizer() {
		
		//Security에서 무시해야하는 URL 등록
		return web -> web
				.ignoring()
				.antMatchers("/images/**")
				.antMatchers("/css/**")
				.antMatchers("/js/**")
				.antMatchers("/favicon/**")
				.antMatchers("/resources/**")
				.antMatchers("/file/**");
		
	}
	
	@Bean
	SecurityFilterChain securityFilterChain (HttpSecurity httpSecurity) throws Exception{
		
		httpSecurity
					.csrf()
					.disable()
					.cors()
					.and()
				.authorizeRequests()	//인가요청
				.antMatchers("./login").permitAll()	// "./login"페이지는 아무나 아무나 접속을 허용
				.anyRequest().permitAll()
				.and()
			.formLogin()								//로그인 폼을 설정
				.usernameParameter("id")					//시큐리티의 기존 username파라미터를 내 컬럼에 속해있는 id로 파라미터명을 바꾼다
				.passwordParameter("passWord")				//시큐리티의 기존 password파라미터를 내 컬럼에 속해있는 pw로 파라미터명을 바꾼다
				.defaultSuccessUrl("/")						//로그인 성공시 요청URL
				.permitAll()
			
			;
		
		
		
		return httpSecurity.build();
					
		
	}
	
	
}
