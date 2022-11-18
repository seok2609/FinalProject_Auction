package com.im.home.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/kdy/*")
public class AdminController {

	@GetMapping("adminPage")
	public String adminPage()throws Exception{
		return "kdy/adminPage";
	}
	@GetMapping("inquiry")
	public String inquiry()throws Exception{
		return "kdy/inquiry";
	}
	@GetMapping("memberBlackList")
	public String memberBlackList()throws Exception{
		return "kdy/memberBlackList";
	}
	@GetMapping("memberList")
	public String memberList()throws Exception{
		return "kdy/memberList";
	}
	@GetMapping("paymentList")
	public String paymentList()throws Exception{
		return "kdy/paymentList";
	}
	@GetMapping("report")
	public String report()throws Exception{
		return "kdy/report";
	}
	@GetMapping("saleList")
	public String saleList()throws Exception{
		return "kdy/saleList";
	}
	@GetMapping("saleTypeList")
	public String saleTypeList()throws Exception{
		return "kdy/saleTypeList";
	}
}
