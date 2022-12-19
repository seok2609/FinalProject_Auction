package com.im.home.map;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/delivery/*")
@Slf4j
@Controller
public class MapController {
	
	@Autowired
	private MapService mapService;
	
	@GetMapping("map")
	public ModelAndView setIndex() throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println("setMap");
		
		List<StartPointVO> arS = mapService.setStartPoint();
		List<EndPointVO> arE = mapService.setEndPoint();
		mv.addObject("StartList", arS);
		mv.addObject("EndList", arE);
		mv.setViewName("/deliveryMap/map");
		
		System.out.println("=================");
		System.out.println("StartList : "+ arS);
		System.out.println("=================");
		System.out.println("EndList : "+ arE);
		
		return mv;
	}
	
	@GetMapping("navi")
	public String setNavi() throws Exception {
		
		return "/deliveryMap/navi";
	}
	
	@GetMapping("progress")
	public ModelAndView setPro() throws Exception {
		ModelAndView mv = new ModelAndView();
		StartPointVO startPointVO = new StartPointVO();
		EndPointVO endPointVO = new EndPointVO();
		
		List<StartPointVO> ar = mapService.setStartPoint();
		mv.addObject("startList", ar);
		System.out.println("=================");
		System.out.println("StartList : "+ ar);
		
		List<EndPointVO> ar2 = mapService.setEndPoint();
		mv.addObject("endList", ar2);
		System.out.println("=================");
		System.out.println("EndList : "+ ar2);
		
		LocalDate now = LocalDate.now();
		System.out.println("LocalDate : "+now);
		
		SimpleDateFormat now2 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date time = new Date();
		String timeNow = now2.format(time);
		System.out.println("timeNow : "+timeNow);
		
		mv.setViewName("/deliveryMap/progress");
		
		return mv;
	}
	
	@GetMapping("latlon")
	public String setLatlon() throws Exception {
		
		return "/deliveryMap/latlon";
	}
	
	@GetMapping("testProgress")
	public String setPro2() throws Exception {
		
		return "/deliveryMap/testProgress";
	}
	
	@GetMapping("testAnother")
	public String setAnotherMap() throws Exception {
		
		return "/deliveryMap/testAnother";
	}
}
