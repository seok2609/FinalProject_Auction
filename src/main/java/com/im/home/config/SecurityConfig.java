package com.im.home.config;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import com.im.home.members.MemberSecurityService;
import com.im.home.members.MembersSocialService;
import com.im.home.members.security.LoginFailed;
import com.im.home.members.security.LoginSuccess;
import com.im.home.members.security.LogoutSuccess;
import com.im.home.members.security.socialLoginSuccess;


@Configuration
@EnableWebSecurity
public class SecurityConfig {

	@Autowired
	private LoginSuccess loginSuccess;
	@Autowired
	private LoginFailed loginFailed;
	@Autowired
	private MemberSecurityService memberSecurityService;
	@Autowired
	private LogoutSuccess logoutSuccess;
	@Autowired
	private MembersSocialService membersSocialService;
	@Autowired
	private socialLoginSuccess socialLoginSuccess;
	
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

				.cors()
        		.and()
        		.csrf()
        		.disable()
		
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
			.logout()
				.logoutUrl("/members/logout")
				.invalidateHttpSession(true)					//로그인한 세션을 지운다(true)
				//.logoutSuccessUrl("/")
				.logoutSuccessHandler(logoutSuccess)
				.deleteCookies("JESSIONID")
				.permitAll()
				.and()
			
			.rememberMe()	//RememberMe 설정
				.rememberMeParameter("rememberMe")				//파라미터명
				.tokenValiditySeconds(300)						//로그인 유지시간, 초단위
				.key("rememberMe")								// 인증받은 사용자의 정보로 Token 생성시 필요, 필수값 (키 값은 자기 맘대로)
				.userDetailsService(memberSecurityService)		//인증 절차를 실행할 UserDetailService, 필수
				.authenticationSuccessHandler(loginSuccess)		//Login 성공
				.and()
			.oauth2Login() //Social Login 설정
				.userInfoEndpoint()
				.userService(membersSocialService)
				.and()
//				.defaultSuccessUrl("/members/socialAdd")
				.successHandler(loginSuccess)
				
				;
		
		
		return httpSecurity.build();
					
		
	}
	
	//회원가입할때 패스워드를 노출안시키도록 HASH시켜주는 코드
	@Bean
	public PasswordEncoder getEncoder() {
		
		return new BCryptPasswordEncoder();
	}
	

	CorsConfigurationSource configurationSource () {
		CorsConfiguration configuration = new CorsConfiguration();
		
		//configuration.setAllowedOrigins(Arrays.asList("http://127.0.0.1:5500", "*")); //asList(여기에 들어간 타입으로 제네릭을 만들어라.여러개넣을수있음.)
		//Arrays : 	배열에 관련된 메서드가 있는 클래스.
		// "*" = 어디서 접근하든 모두 허용 
		//configuration.setAllowedMethods(Arrays.asList("GET", "POST")); //어떤 메소드 허용?
		
        configuration.addAllowedOrigin("*");
        configuration.addAllowedHeader("*");
        configuration.addAllowedMethod("*");
        configuration.setAllowCredentials(true);

		
		UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
		source.registerCorsConfiguration("/**", configuration);
		//사이트 내 어떤 url에 적용할 것이냐 
		//루트로 시작하는 것 모두 허용 
		return source;
	}

}
