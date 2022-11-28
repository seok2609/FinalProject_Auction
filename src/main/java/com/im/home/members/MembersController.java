package com.im.home.members;

import java.security.Principal;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value = "/members/*")
@Slf4j
public class MembersController {

	
	@Autowired
	private MembersService membersService;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private MailSenderRunner mailSenderRunner;
	
	
	@GetMapping(value = "login")
	public String getMembersLogin() throws Exception{
	
		return "members/login";
	}
	
//	@PostMapping(value = "login")
//	public ModelAndView getMembersLogin() throws Exception{
//		ModelAndView mv = new ModelAndView();
//		
//		log.info("==================로그인 실행================");
//		
//		mv.setViewName("redirect:../");
//		
//		return mv;
//	}
	
	//약관동의로 보내기
	@GetMapping(value = "agree")
	public String setMembersAgree() throws Exception{
		
		return "members/agree";
	}
	
	//약관동의가 끝나고 다음버튼을 누르면 회원가입 주소로감
	@GetMapping(value = "signUpHead")
	public String setMembersSignUpHead(String roleNum) throws Exception{
		
		return "members/signUpHead";
	}
	
	
	//약관동의가 끝나고 다음버튼을 누르면 회원가입 주소로감
	@GetMapping(value = "signUp")
	public String setMembersSignUp(String roleNum) throws Exception{
		
		return "members/signUp";
	}
	
	//약관동의가 끝나고 다음버튼을 누르면 회원가입 주소로감
	@GetMapping(value = "signUpC")
	public String setMembersSignUpC(String roleNum) throws Exception{
		log.info("roleNum : {} " ,roleNum);
		return "members/signUpC";
	}
	
	//약관동의가 끝나고 다음버튼을 누르면 회원가입 주소로감
	@GetMapping(value = "signUpD")
	public String setMembersSignUpD(String roleNum) throws Exception{
		
		return "members/signUpD";
	}
	
	//약관동의가 끝나고 다음버튼을 누르면 회원가입 주소로감
	@GetMapping(value = "signUpG")
	public String setMembersSignUpG(String roleNum) throws Exception{
		
		return "members/signUpG";
	}
	
	//약관동의가 끝나고 다음버튼을 누르면 회원가입 주소로감
	@GetMapping(value = "signUpS")
	public String setMembersSignUpS(String roleNum) throws Exception{
		
		return "members/signUpS";
	}
	
	
	
	@PostMapping(value = "signUp")
	public ModelAndView setMembersSignUp(MembersVO membersVO, MultipartFile files) throws Exception{
		ModelAndView mv = new ModelAndView();	
		
//		if(bindingResult.hasErrors()) {
//			log.info("검증 에러 발생");
//			mv.setViewName("members/signUp");
//			return mv;
//		}
		
		log.info("============================회원가입 완료==========================");
		
		membersVO.setPassWord((passwordEncoder.encode(membersVO.getPassword())));;
		int result = membersService.setMembersSignUp(membersVO, files);
		membersService.setMembersRole(membersVO);
		
		mv.setViewName("members/login");
		
		
		return mv;
	}
	
	@GetMapping(value = "logout")
	public String getLogOut(HttpSession session) throws Exception{
		log.info("로그아웃 실행 준비");
		
		session.invalidate();					//세션삭제			
		
		return "redirect:../";
	}
	
	@GetMapping(value = "myPage")
	public ModelAndView getMyPage(MembersVO membersVO, String id, Principal principal , Model model) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		log.info("ddddd => {}" ,principal.getName()); 
		
		membersVO.setId(principal.getName());	//시큐리티로 로그인한 아이디값을 가져오는 코드
		
		membersVO = membersService.getMyPage(membersVO);
		
		model.addAttribute("membersVO", principal);
		log.info("Principal => {} ", principal);
		mv.addObject("membersVO", membersVO);
//		mv.addObject("membersVO", membersVO2);
		mv.setViewName("members/myPage");
		
		
		return mv;
	}
	
	@GetMapping(value = "idCheck")
	@ResponseBody	//응답을 거치지 않고 바로 View (JSP)로 보냄
	public Integer getIdCheck(MembersVO membersVO) throws Exception{
		
		int result = membersService.getIdCheck(membersVO);
		
		return result;
	}
}
