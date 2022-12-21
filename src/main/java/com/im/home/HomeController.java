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
		
				//===============서울=============
				WebClient webClient = WebClient.builder()
					    .codecs(configurer -> configurer.defaultCodecs().maxInMemorySize(-1))
						 .baseUrl("https://at.agromarket.kr/openApi/price/real.do")
						 .build();
				
				Mono<String> res = webClient.get()
						.uri("?serviceKey=9596499878664F83A1D560AE3808376E&apiType=json&pageNo=1&whsalCd=110001")
						.retrieve()
						.bodyToMono(String.class);
				String r = res.block();
			ObjectMapper objectMapper = new ObjectMapper();
			JSONParser parser = new JSONParser();
			Map<String, Object> data = objectMapper.readValue(r, new TypeReference<Map<String, Object>>() {});
			
				JSONObject jobj = new JSONObject(data);
				Object jobj2 = jobj.get("data");
				String data2 = objectMapper.writeValueAsString(jobj2); 
				JSONArray temp = (JSONArray)parser.parse(data2);
				List<WholeSaleVO>  wholeSaleVOs = new ArrayList<>();
				
				if(temp != null) {
				for(int i =0; i<10; i++) {
					JSONObject jsonObj = (JSONObject)temp.get(i);
						log.info("array => {}", jsonObj);
							WholeSaleVO wholeSaleVO = new WholeSaleVO();
							wholeSaleVO.setRn(jsonObj.get("rn").toString());
							wholeSaleVO.setSaleDate(jsonObj.get("saleDate").toString());
							wholeSaleVO.setCmpName(jsonObj.get("cmpName").toString());
							wholeSaleVO.setMid(jsonObj.get("mid").toString());
							wholeSaleVO.setMidName(jsonObj.get("midName").toString());
							wholeSaleVO.setCost(jsonObj.get("cost").toString());
							wholeSaleVO.setQty(jsonObj.get("qty").toString());
							wholeSaleVO.setSbidtime(jsonObj.get("sbidtime").toString());
							wholeSaleVOs.add(i, wholeSaleVO);
					
						}
				}
				
				//===============대구=============
					webClient = WebClient.builder()
							    .codecs(configurer -> configurer.defaultCodecs().maxInMemorySize(-1))
								 .baseUrl("https://at.agromarket.kr/openApi/price/real.do")
								 .build();
						
						res = webClient.get()
								.uri("?serviceKey=9596499878664F83A1D560AE3808376E&apiType=json&pageNo=1&whsalCd=220001")
								.retrieve()
								.bodyToMono(String.class);
					 r = res.block();
					 objectMapper = new ObjectMapper();
					 parser = new JSONParser();
					 data = objectMapper.readValue(r, new TypeReference<Map<String, Object>>() {});
					
						 jobj = new JSONObject(data);
						 jobj2 = jobj.get("data");
						 data2 = objectMapper.writeValueAsString(jobj2); 
						 temp = (JSONArray)parser.parse(data2);
						List<WholeSaleVO>  wholeSaleVOs2 = new ArrayList<>();
						
						if(temp != null) {
						for(int i =0; i<10; i++) {
							JSONObject jsonObj = (JSONObject)temp.get(i);
								log.info("array => {}", jsonObj);
									WholeSaleVO wholeSaleVO = new WholeSaleVO();
									wholeSaleVO.setRn(jsonObj.get("rn").toString());
									wholeSaleVO.setSaleDate(jsonObj.get("saleDate").toString());
									wholeSaleVO.setCmpName(jsonObj.get("cmpName").toString());
									wholeSaleVO.setMid(jsonObj.get("mid").toString());
									wholeSaleVO.setMidName(jsonObj.get("midName").toString());
									wholeSaleVO.setCost(jsonObj.get("cost").toString());
									wholeSaleVO.setQty(jsonObj.get("qty").toString());
									wholeSaleVO.setSbidtime(jsonObj.get("sbidtime").toString());
									wholeSaleVOs2.add(i, wholeSaleVO);
							
								}
						}
						
						//===============부산=============
						webClient = WebClient.builder()
								    .codecs(configurer -> configurer.defaultCodecs().maxInMemorySize(-1))
									 .baseUrl("https://at.agromarket.kr/openApi/price/real.do")
									 .build();
							
							res = webClient.get()
									.uri("?serviceKey=9596499878664F83A1D560AE3808376E&apiType=json&pageNo=1&whsalCd=210001")
									.retrieve()
									.bodyToMono(String.class);
						 r = res.block();
						 objectMapper = new ObjectMapper();
						 parser = new JSONParser();
					data = objectMapper.readValue(r, new TypeReference<Map<String, Object>>() {});
						
							 jobj = new JSONObject(data);
							 jobj2 = jobj.get("data");
							 data2 = objectMapper.writeValueAsString(jobj2); 
							 temp = (JSONArray)parser.parse(data2);
							List<WholeSaleVO>  wholeSaleVOs3 = new ArrayList<>();
							
							if(temp != null) {
							for(int i =0; i<10; i++) {
								JSONObject jsonObj = (JSONObject)temp.get(i);
									log.info("array => {}", jsonObj);
										WholeSaleVO wholeSaleVO = new WholeSaleVO();
										wholeSaleVO.setRn(jsonObj.get("rn").toString());
										wholeSaleVO.setSaleDate(jsonObj.get("saleDate").toString());
										wholeSaleVO.setCmpName(jsonObj.get("cmpName").toString());
										wholeSaleVO.setMid(jsonObj.get("mid").toString());
										wholeSaleVO.setMidName(jsonObj.get("midName").toString());
										wholeSaleVO.setCost(jsonObj.get("cost").toString());
										wholeSaleVO.setQty(jsonObj.get("qty").toString());
										wholeSaleVO.setSbidtime(jsonObj.get("sbidtime").toString());
										wholeSaleVOs3.add(i, wholeSaleVO);
								
									}
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
