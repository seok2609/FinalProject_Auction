package com.im.home.admin;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView adminPage(MembersVO membersVO, AdminMembersVO adminMembersVO, MembersReportVO membersReportVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = adminMembersService.getTotalMembers(membersVO);
		List<AdminMembersVO> ar = adminMembersService.getAdminPageInquiryList(adminMembersVO);
		int inquiryNoResponse = adminMembersService.getTotalInquiryNo(adminMembersVO);
		int reportNoResponse = adminMembersService.getTotalReport(membersReportVO);
		mv.addObject("inquiryNoResponse", inquiryNoResponse);
		mv.addObject("reportNoResponse", reportNoResponse);
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
		log.info("pagerLastNum ==>> {}", adminPager.getLastNum());
		log.info("pagerLastRow ==>> {}", adminPager.getLastRow());
		log.info("pagerPage ==>> {}", adminPager.getPage());
		log.info("pagerStartNum ==>> {}", adminPager.getStartNum());
		log.info("pagerStartRow ==>> {}", adminPager.getStartRow());
		log.info("pagerpAGE ==>> {}", adminPager.getPerPage());
		log.info("PAGE ==>> {}", adminPager.getPage());
		
		mv.addObject("membersVO", membersVO);
		mv.addObject("pager", adminPager);
		mv.setViewName("/kdy/memberList");
		return mv;
	};
	//memberList balck
	@GetMapping("black")
	public ModelAndView setBlack(MembersVO membersVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int black = adminMembersService.setBlack(membersVO);
		mv.addObject("black", black);
		mv.setViewName("redirect:./memberList");
		return mv;
	}
	//memberList blackC
	@GetMapping("blackC")
	public ModelAndView setBlackC(MembersVO membersVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int blackCancel = adminMembersService.setBlackC(membersVO);
		mv.addObject("blackCancel", blackCancel);
		mv.setViewName("redirect:./memberList");
		return mv;
	}
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
		mv.addObject("pager", adminPager);
		mv.setViewName("kdy/inquiryList");
		return mv;
	}
	//응답하지 않은 1대1문의 리스트
	@GetMapping("inquiryNoResponseList")
	public ModelAndView getInquiryNoResponseList(AdminPager adminPager)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<AdminMembersVO> ar = adminMembersService.getInquiryNoResponseList(adminPager);
		mv.addObject("inquiryNoResponseList", ar);
		mv.addObject("pager", adminPager);
		return mv;
	}
	//응답 완효한 1대1
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
		mv.setViewName("redirect:../kdy/inquiryList");
		return mv;
	}
	//신고 요청
	@GetMapping("reportRequest")
	public String setReportRequest(MembersReportVO membersReportVO, Principal principal)throws Exception{
		membersReportVO.setId(principal.getName());
		log.info("memberReportId =======>>>>>>> {}", principal.getName());
		return "kdy/reportRequest";
	}
	//신고요청
	@PostMapping("reportRequest")
	public ModelAndView setReportRequest(MembersReportVO membersReportVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = adminMembersService.setRepoertRequest(membersReportVO);
		int blackResult = adminMembersService.setBlackWaiting(membersReportVO);
		mv.addObject("reportRequest", result);
		mv.addObject("memberResult", blackResult);
		mv.setViewName("redirect:../");
		return mv;
	}
	//신고 리스트
	@GetMapping("report")
	public ModelAndView getReportList(AdminPager adminPager, MembersReportVO membersReportVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		log.info("cccccccccccccccccccccccccccccc");
		List<MembersReportVO> ar = adminMembersService.getReportList(adminPager);
		log.info("num -->> {}", membersReportVO.getReport_num());
		log.info("id -->> {}", membersReportVO.getId());
		log.info("report_id -->> {}", membersReportVO.getReport_id());
		log.info("contents -->> {}", membersReportVO.getReport_contents());
		log.info("date -->> {}", membersReportVO.getReport_date());
		log.info("reportList ===:>>>>> {}", adminMembersService.getReportList(adminPager));
		log.info("ar=============>>>>>>>>>> {} ", ar.size());
		int result = adminMembersService.getTotalReport(membersReportVO);
		mv.addObject("reportList", ar);
		mv.addObject("totalReport", result);
		mv.addObject("pager", adminPager);
		return mv;
	}
	//신고 detail
	@GetMapping("reportDetail")
	public ModelAndView getReportDetail(MembersReportVO membersReportVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		membersReportVO= adminMembersService.getReportDetail(membersReportVO);
		log.info("idid-->>{}", membersReportVO.getId());
		mv.addObject("reportDetail", membersReportVO);
		mv.setViewName("kdy/reportDetail");
		return mv;
	}
	//신고 요청 거절
	@GetMapping("responseReportNo")
	public ModelAndView setResponseResportNo(MembersReportVO membersReportVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int memberResult = adminMembersService.setBlackCancel(membersReportVO); 
		int result = adminMembersService.setResponseReportNo(membersReportVO);
		mv.setViewName("redirect:./report");
		return mv;
	}
	@GetMapping("responseReportOk")
	public ModelAndView setResponseReportOk(MembersReportVO membersReportVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = adminMembersService.setResponseReportOk(membersReportVO);
		mv.setViewName("redirect:./report");
		return mv;
	}
	//블랙리스트
	@GetMapping("memberBlackList")
	public ModelAndView memberBlackList(AdminPager adminPager, MembersVO membersVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<MembersReportVO> ar = adminMembersService.getBlackList(adminPager);
		int totalMembersBlack = adminMembersService.getTotalBlack(membersVO);
		int BlackC = adminMembersService.setBlackC(membersVO);
		mv.addObject("blackc", BlackC);
		mv.addObject("totalMembersBlack", totalMembersBlack);
		mv.addObject("blackList", ar);
		mv.addObject("pager", adminPager);
		return mv;
	}
	//블랙 회원 디테일
	@GetMapping("blackDetail")
	public ModelAndView getBalckDetail(MembersReportVO membersReportVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		 List<MembersReportVO> ar = adminMembersService.getBalckDetail(membersReportVO);
		 log.info("arararararararararar ==>> {}", ar);
		 log.info("ar(1)==>> {}", ar.get(0).getReport_id());
		mv.addObject("blackDetail", ar);
		return mv;
	}
	//블랙 해제
	@GetMapping("balckCancel")
	public ModelAndView setBlackCancel(MembersReportVO membersReportVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = adminMembersService.setBlackCancel(membersReportVO);
		int haha = adminMembersService.setResponseReportNo(membersReportVO);
		mv.setViewName("redirect:./memberBlackList");
		return mv;
	}
	
	//경매인 구인구직
	@GetMapping("auctioneer")
	public String auctioneer()throws Exception{
		return "kdy/auctioneer";
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
