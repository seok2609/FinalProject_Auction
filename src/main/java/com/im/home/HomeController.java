package com.im.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.im.home.members.MembersVO;

@Controller
public class HomeController {
	@GetMapping("/")
	public ModelAndView home(MembersVO membersVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("membersVO", membersVO);
		mv.setViewName("index");
		return mv;
	}
}
