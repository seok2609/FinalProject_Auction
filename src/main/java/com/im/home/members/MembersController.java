package com.im.home.members;

import java.security.Principal;
import java.util.List;

import javax.servlet.Servlet;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletMapping;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.im.home.admin.AdminMembersVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value = "/members/*")
@Slf4j
public class MembersController {

	
	@Autowired
	private MembersService membersService;
	@Autowired
	private PasswordEncoder passwordEncoder;
//	@Autowired
//	private MailSenderRunner mailSenderRunner;
	
	
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
		
		mv.addObject("membersVO", membersVO);
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
		AdminMembersVO adminMembersVO = new AdminMembersVO();
		
		
		log.info("ddddd => {}" ,principal.getName()); 
		
		membersVO.setId(principal.getName());	//시큐리티로 로그인한 아이디값을 가져오는 코드
		
		membersVO = membersService.getMyPage(membersVO);
		
//		if(request2.getRequestURI() == "inquiryList") {
//			adminMembersVO = membersService.getInquiryList(adminMembersVO);
//			mv.setViewName("kdy/inquiryList");
//		}
		
//		String url = request2.getRequestURI();
//		if(url == "inquiryList") {
//			adminMembersVO = membersService.getInquiryList(adminMembersVO);
//			mv.setViewName("kdy/inquiryList");
//		}
		
		model.addAttribute("membersVO", principal);
		log.info("Principal => {} ", principal);
		mv.addObject("membersVO", membersVO);
//		mv.addObject("membersVO", membersVO2);
		mv.setViewName("members/myPage");
		
//		if(get) {
//			adminMembersVO = membersService.getInquiryList(adminMembersVO);
//			mv.setViewName("kdy/inquiryList");
//		}
		
		
		
		return mv;
	}
	
	@GetMapping(value = "idCheck")
	@ResponseBody	//응답을 거치지 않고 바로 View (JSP)로 보냄
	public Integer getIdCheck(MembersVO membersVO) throws Exception{
		
		int result = membersService.getIdCheck(membersVO);
		
		return result;
	}
	
	
	//마이페이지에서 보이는 나의 1:1문의 내역
//	@RequestMapping(value = "/kdy/*")
	@GetMapping(value = "inquiryList")
	public ModelAndView getInquiryList(String id, AdminMembersVO adminMembersVO, Principal principal, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MembersVO membersVO = (MembersVO)session.getAttribute(principal.getName());
		adminMembersVO.setId(principal.getName());
		log.info("===================================폼폼폼폼폼폼포뫂ㅁ");
		log.info("내 로그인한 아이디 : {} ", principal.getName());
		
		List<AdminMembersVO> ar = membersService.getInquiryList(adminMembersVO);
		
		mv.addObject("AdminMembersVO", adminMembersVO);
	
		mv.addObject("inquiryList", ar);
		mv.setViewName("members/inquiryList");
		
		return mv;
	}
	
	//회원정보 수정
	@GetMapping(value = "modify")
	public String setMembersModify(String id, MembersVO membersVO) throws Exception{
		
		return "members/modify";
	}
	
	@PostMapping(value = "modify")
	public ModelAndView setMembersModify(MembersVO membersVO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		log.info("============================회원가입 수정==========================");
		mv.addObject("membersVO", membersVO);
		membersVO.setPassWord((passwordEncoder.encode(membersVO.getPassword())));
		int result = membersService.setMembersModify(membersVO);
		
		
		mv.setViewName("members/login");
		
		return mv;
	}
	
	
	//회원 탈퇴
	@GetMapping(value = "drop")
	@ResponseBody
	public ModelAndView setMembersDrop(MembersVO membersVO, HttpSession session) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		SecurityContextImpl context = (SecurityContextImpl)session.getAttribute("SPRING_SECURITY_CONTEXT");
		Authentication authentication = context.getAuthentication();
		MembersVO membersVO2 = (MembersVO)authentication.getPrincipal();
		
		int resultDrop = membersService.setMembersDrop(membersVO2);
		
		if(resultDrop == 1) {
			mv.setViewName("redirect:../");
			session.invalidate();
		}else {
			mv.setViewName("members/myPage");
		}
		
		return mv;
	}
	
	
}
