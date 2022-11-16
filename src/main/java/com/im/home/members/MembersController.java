package com.im.home.members;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value = "/members/*")
@Slf4j
public class MembersController {

	
	@Autowired
	private MembersService membersService;
	
	@GetMapping(value = "login")
	public String getMembersLogin(Model model) throws Exception{
		
		return "members/login";
	}
	
	@PostMapping(value = "login")
	public ModelAndView getMembersLogin() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		log.info("==================로그인 실행================");
		
		mv.setViewName("redirect:../");
		
		return mv;
	}
	
	@GetMapping(value = "signUp")
	public String setMembersSignUp() throws Exception{
		
		return "members/signUp";
	}
	
	
	@PostMapping(value = "signUp")
	public ModelAndView setMembersSignUp(MembersVO membersVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		log.info("============================회원가입 완료==========================");
		
		int result = membersService.setMembersSignUp(membersVO);
		
		mv.setViewName("members/login");
		
		
		return mv;
	}
}
