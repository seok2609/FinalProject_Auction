package com.im.home.admin;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.im.home.adminInquiryResponse.InquiryResponseVO;
import com.im.home.members.MembersVO;
import com.im.home.util.AdminPager;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/kdy/*")
@Slf4j
public class AdminMembersController {
	
	@Autowired AdminMembersService adminMembersService;

	//main관리자 page
	@GetMapping("adminPage")
	public ModelAndView adminPage(MembersVO membersVO, AdminMembersVO adminMembersVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = adminMembersService.getTotalMembers(membersVO);
		List<AdminMembersVO> ar = adminMembersService.getAdminPageInquiryList(adminMembersVO);
		mv.addObject("totalMembers", membersVO);
		mv.addObject("adminInquiryList", ar);
		mv.addObject("result", result);
		return mv;
	}
	//회원 조회
	@GetMapping("memberList")
	public ModelAndView getAdminMembersList(AdminPager adminPager)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<MembersVO> membersVO =  adminMembersService.getAdminMembersList(adminPager);
		log.info("memberVO ==> {}", membersVO);
		mv.addObject("membersVO", membersVO);
		mv.addObject("AdminPager", adminPager);
		mv.setViewName("/kdy/memberList");
		return mv;
	};
	//1대1문의
	@GetMapping("inquiryList")
	public ModelAndView getInquiryList(AdminPager adminPager, AdminMembersVO adminMembersVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<AdminMembersVO> ar = adminMembersService.getInquiryList(adminPager);
		int totalInquiry = adminMembersService.getTotalInquiry(adminMembersVO);
		int totalInquiryNo = adminMembersService.getTotalInquiryNo(adminMembersVO);
		int totalInquiryYes = adminMembersService.getTotalInquiryYes(adminMembersVO);
		mv.addObject("totalInquiry", totalInquiry);
		mv.addObject("totalInquiryNo", totalInquiryNo);
		mv.addObject("totalInquiryYes", totalInquiryYes);
		mv.addObject("inquiryList", ar);
		mv.addObject("adminPager", adminPager);
		mv.setViewName("kdy/inquiryList");
		return mv;
	}
	//응답하지 않은 1대1문의 리스트
	@GetMapping("inquiryNoResponseList")
	public ModelAndView getInquiryNoResponseList(AdminPager adminPager)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<AdminMembersVO> ar = adminMembersService.getInquiryNoResponseList(adminPager);
		mv.addObject("inquiryNoResponseList", ar);
		return mv;
		
	}
//	1대1 detail
	@GetMapping("inquiryDetail")
	public ModelAndView getInquiryDetail(AdminMembersVO adminMembersVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		adminMembersVO = adminMembersService.getInquiryDetail(adminMembersVO);
		mv.addObject("inquiryDetail", adminMembersVO);
		mv.setViewName("kdy/inquiryDetail");
		return mv;
	}
//	//1대1문의
	@GetMapping("inquiryRequest")
	public String setInquiryRequest(AdminMembersVO adminMembersVO, Principal principal)throws Exception{
		adminMembersVO.setId(principal.getName());	
		return "kdy/inquiryRequest";
	}
	//1대1문의
	@PostMapping("inquiryRequest")
	public ModelAndView setInquiryRequest(AdminMembersVO adminMembersVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = adminMembersService.setInquiryRequest(adminMembersVO);
//	log.info("아이디 -->> {}", principal.getName());
		mv.addObject("inquiryRequestResult", result);
		mv.setViewName("redirect:../");
		return mv;
	}
	//1대1문의 응답
	@GetMapping("inquiryResponse")
	public String setInquiryResponse(AdminMembersVO adminMembersVO, InquiryResponseVO inquiryResponseVO)throws Exception{
		 inquiryResponseVO.setInquiry_num(adminMembersVO.getInquiry_num());
		return "kdy/inquiryList";
	}
	//1대1문의 응답
	@PostMapping("inquiryResponse")
	public ModelAndView setInquiryResponse(InquiryResponseVO InquiryResponseVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = adminMembersService.setInquiryResponse(InquiryResponseVO);
		mv.addObject("inquiryResponseResult", result);
		mv.setViewName("redirect:../kdy/inquiryNoResponseList");
		return mv;
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
