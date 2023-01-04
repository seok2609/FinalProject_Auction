package com.im.home.wholesale;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.im.home.util.Pager;

import lombok.extern.slf4j.Slf4j;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

@Controller
@Slf4j
@RequestMapping("/wholesale/*")
public class WholeSaleController {
	
	@Autowired
	private WholeSaleService wholeSaleService;
	@Autowired
	private WholeSaleMapper wholeSaleMapper;
	

	@GetMapping("sale")
	public String sale() throws Exception{
		
		return "wholesale/sale";
	}
	
	@GetMapping("fixData")
	public ModelAndView pagerTest(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		   Long c = wholeSaleService.getListCount(pager);
		   pager.getNum(c);
		   List<WholeSaleVO> wholeSaleVOs = wholeSaleService.getList(pager);
		   List<WholeSaleVO> bestW = wholeSaleService.getMidSale(pager);
		mv.addObject("vo", wholeSaleVOs);
		mv.addObject("bestW", bestW);
		mv.addObject("pager", pager);
		mv.setViewName("wholesale/sale");
		return mv;
		
	}
	
	
	// 실시간 데이터 20개 리스트 뽑기 ===== 메인 페이지 ======
	
	@GetMapping("realtime")
	@ResponseBody
	public ModelAndView realtime(Pager pager) throws Exception { //실시간 정보 출력 
	
		ModelAndView mv = new ModelAndView();
		List<WholeSaleVO> wholeSaleVOs = wholeSaleService.getRtime(pager.getWhsalCd());

		mv.addObject("vo", wholeSaleVOs);
		mv.setViewName("wholesale/realtime");
		return mv;
	}
	
}
