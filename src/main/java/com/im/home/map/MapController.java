package com.im.home.map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/delivery/*")
@Slf4j
@Controller
public class MapController {
	@GetMapping("map")
	public String setIndex() throws Exception {
		
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
