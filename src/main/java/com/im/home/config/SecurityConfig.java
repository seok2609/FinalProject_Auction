package com.im.home.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.im.home.members.MemberSecurityService;
import com.im.home.members.security.LoginFailed;
import com.im.home.members.security.LoginSuccess;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

	@Autowired
	private LoginSuccess loginSuccess;
	@Autowired
	private LoginFailed loginFailed;
	@Autowired
	private MemberSecurityService memberSecurityService;
	
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
			.formLogin()										//로그인 폼을 설정
				.loginPage("/members/login")					//내장된 시큐리티의 로그인폼 사용하지않고 내가 만든 로그인.jsp사용
				//.loginProcessingUrl("login")					//form태그의 action주소를 사용해라
				.usernameParameter("id")						//시큐리티의 기존 username파라미터를 내 컬럼에 속해있는 id로 파라미터명을 바꾼다
				.passwordParameter("passWord")					//시큐리티의 기존 password파라미터를 내 컬럼에 속해있는 pw로 파라미터명을 바꾼다
				//.defaultSuccessUrl("/")						//로그인 성공시 요청URL
				.successHandler(loginSuccess)                
				.failureHandler(loginFailed)
				.permitAll()
				.and()
//			.logout()
//				.logoutUrl("/members/logout")
//				.invalidateHttpSession(true)					//로그인한 세션을 지운다(true)
			
//			.rememberMe()	//RememberMe 설정
//				.rememberMeParameter("rememberMe")				//파라미터명
//				.tokenValiditySeconds(300)						//로그인 유지시간, 초단위
//				.key("rememberMe")								// 인증받은 사용자의 정보로 Token 생성시 필요, 필수값 (키 값은 자기 맘대로)
//				.userDetailsService(memberSecurityService)		//인증 절차를 실행할 UserDetailService, 필수
//				.authenticationSuccessHandler(loginSuccess)		//Login 성공
//				.and()
			
			;
		
		
		
		return httpSecurity.build();
					
		
	}
	
	@Bean
	public PasswordEncoder getEncoder() {
		
		return new BCryptPasswordEncoder();
	}
	
	
}
