package com.im.home;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.im.home.members.MembersVO;
import com.im.home.util.Pager;
import com.im.home.wholesale.WholeSaleService;
import com.im.home.wholesale.WholeSaleVO;

import lombok.extern.slf4j.Slf4j;
import reactor.core.publisher.Mono;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HomeController {
	
	@Autowired
	private WholeSaleService wholeSaleService;
	
	@GetMapping("/")
	public ModelAndView home(MembersVO membersVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	      Calendar c1 = Calendar.getInstance(); 
	      Calendar c2 = Calendar.getInstance(); 
	      c1.add(Calendar.DATE, -1); // 오늘날짜로부터 -1. 어제 날짜의 정산 DB삽입 위해. 
	      c2.add(Calendar.DATE, -3);
	      String saleDate = sdf.format(c1.getTime());
	      String lastDate = sdf.format(c2.getTime());
	
	      WholeSaleVO whsal = new WholeSaleVO();
		if(wholeSaleService.getWhsalMain(saleDate).size()>=1) {
			 whsal = wholeSaleService.getWhsalMain(saleDate).get(0);//어제날짜설정
	     }else {
	    	whsal = wholeSaleService.getWhsalMain("20221210").get(0);//없을 경우 샘플데이터
	     }
		
		WholeSaleVO mid =new WholeSaleVO();
		if(wholeSaleService.getMidMain(saleDate).size()>=1) {
			mid = wholeSaleService.getMidMain(saleDate).get(0);
	     }else {
	    	mid = wholeSaleService.getMidMain("20221210").get(0);
	     }
		
		WholeSaleVO totAmt = new WholeSaleVO();
		if(wholeSaleService.getTotAmt(saleDate)!=null) {
			totAmt = wholeSaleService.getTotAmt(saleDate);
		}else {
			 totAmt  = wholeSaleService.getTotAmt("20221210");
	     }
		
		WholeSaleVO totQty = new WholeSaleVO();
		if(wholeSaleService.getTotQty(saleDate)!=null) {
			totQty = wholeSaleService.getTotQty(saleDate);
	     }else {
	    	 totQty = wholeSaleService.getTotQty("20221210");
	     }
		
		int q = Integer.parseInt(totQty.getTotQty())/1000;
		String q2 = Integer.toString(q);
		totQty.setTotQty(q2);
	
		Long q3 = Long.parseLong(totAmt.getTotAmt())/1000000;
			
		String q4 = Long.toString(q3);
		totAmt.setTotAmt(q4);
		
		
		//====================================== 차트 =====================================
		
		List<WholeSaleVO> best = wholeSaleService.getMidMain(saleDate);
		List<WholeSaleVO> bestW = wholeSaleService.getWhsalMain(saleDate);
		if(best.size()<1) {
			best = wholeSaleService.getMidMain("20221210");
	     }
		if(bestW.size()<1) {
			bestW = wholeSaleService.getWhsalMain("20221210");
	     }
				
		

		//====================================== 실시간 리스트 ===============================
		
		List<WholeSaleVO> wholeSaleVOs = wholeSaleService.getRtime("110001");
		List<WholeSaleVO> wholeSaleVOs2 = wholeSaleService.getRtime("220001");
		List<WholeSaleVO> wholeSaleVOs3 = wholeSaleService.getRtime("210001");
		if(wholeSaleVOs.size()<1) {
			wholeSaleVOs = wholeSaleService.getMidMain("1");
	     }
		if(wholeSaleVOs2.size()<1) {
			wholeSaleVOs2 =wholeSaleService.getMidMain("1");
	     }if(wholeSaleVOs3.size()<1) {
			wholeSaleVOs3 =wholeSaleService.getMidMain("1");
	     }
		
				mv.addObject("seoul", wholeSaleVOs);
				mv.addObject("deagu", wholeSaleVOs2);
				mv.addObject("busan", wholeSaleVOs3);
			
		
		mv.addObject("best", best);
		mv.addObject("bestW", bestW);
		mv.addObject("whsal",whsal);
		mv.addObject("mid",mid);
		mv.addObject("totQty", totQty);
		mv.addObject("totAmt", totAmt);
		mv.addObject("membersVO", membersVO);
		mv.setViewName("index");
		return mv;
	}
	
	
	
	//====================================================================================
	
	
	
}
