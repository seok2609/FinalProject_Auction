package com.im.home.auction;


import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.im.home.admin.AuctionVO;
import com.im.home.admin.ProductVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/auction/*")
@Slf4j
public class AuctionController {
	
	@Autowired
	private AuctionService auctionService;
	
	
	@GetMapping("live")
	public String getLive(Model model,Principal principal) {
		
		if(principal == null) {
			return "redirect:/";
		}
		
		model.addAttribute("id", principal.getName());
		
		return "auction/live";
	}
	
	
	
	
	@GetMapping("chat")
	public ModelAndView chatTest(Principal principal, AuctionVO auctionVO) {						
		ModelAndView mv = new ModelAndView();
		log.info(" 진행중인 경매 번호 : {}", auctionVO);
		
		ProductVO productVO = auctionService.getAuctionDetail(auctionVO);
		
		if(principal == null) {
			mv.setViewName("redirect:/");
			return mv;
		}
		mv.addObject("member", principal.getName());
		mv.addObject("vo", productVO);
		mv.setViewName("auction/chat");
		return mv;
		
	}
	
	@GetMapping
	@ResponseBody
	public Long getIngBroadcasting() {
		
		AuctionVO auctionVO = auctionService.getIngBroadcasting();
		if(auctionVO == null) {
			return null;
		}else {
			return auctionVO.getAuction_num();
		}
		
		
	}
	
	
	
	
	
	
}
