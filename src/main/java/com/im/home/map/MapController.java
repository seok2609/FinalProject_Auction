package com.im.home.map;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/delivery/*")
@Slf4j
@Controller
public class MapController {
	
	@Autowired
	private MapService mapService;
	
	@GetMapping("map")
	public String setIndex(Model model) throws Exception {
		System.out.println("setMap");
		List<MapVO> arS = mapService.setStartPoint();
		List<MapVO> arE = mapService.setEndPoint();
		model.addAttribute("StartList", arS);
		model.addAttribute("EndList", arE);
		return "/deliveryMap/map";
	}
	
	@GetMapping("navi")
	public String setNavi() throws Exception {
		
		return "/deliveryMap/navi";
	}
	
	@GetMapping("progress")
	public String setPro() throws Exception {
		
		return "/deliveryMap/progress";
	}
	
	@GetMapping("latlon")
	public String setLatlon() throws Exception {
		
		return "/deliveryMap/latlon";
	}
}
