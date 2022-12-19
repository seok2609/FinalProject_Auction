package com.im.home;

import java.io.Console;

import javax.servlet.http.Cookie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.im.home.members.MembersVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HomeController {
	@GetMapping("/")
	public ModelAndView home(MembersVO membersVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("membersVO", membersVO);
		mv.setViewName("index");
		return mv;
	}
}
