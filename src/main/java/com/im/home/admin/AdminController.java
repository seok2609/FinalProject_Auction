package com.im.home.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/kdy/*")
public class AdminController {

	//main관리자 page
	@GetMapping("adminPage")
	public String adminPage()throws Exception{
		return "kdy/adminPage";
	}
	
	//회원 조회
	@GetMapping("memberList")
	public String memberList()throws Exception{
		return "kdy/memberList";
	}
	//1대1문의
	@GetMapping("inquiry")
	public String inquiry()throws Exception{
		return "kdy/inquiry";
	}
	//경매인 구인구직
	@GetMapping("auctioneer")
	public String auctioneer()throws Exception{
		return "kdy/auctioneer";
	}
	
	//신고
	@GetMapping("report")
	public String report()throws Exception{
		return "kdy/report";
	}
	//블랙리스트
	@GetMapping("memberBlackList")
	public String memberBlackList()throws Exception{
		return "kdy/memberBlackList";
	}
	
	//판매내역
	@GetMapping("saleList")
	public String saleList()throws Exception{
		return "kdy/saleList";
	}
	//판매 품목
	@GetMapping("saleTypeList")
	public String saleTypeList()throws Exception{
		return "kdy/saleTypeList";
	}
	//결제내역
	@GetMapping("paymentList")
	public String paymentList()throws Exception{
		return "kdy/paymentList";
	}
}
