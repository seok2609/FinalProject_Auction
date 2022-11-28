package com.im.home.map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MapController {
	@GetMapping("delivery")
	public String setIndex() throws Exception {
		
		return "delivery";
	}
	
	@GetMapping("navi")
	public String setNavi() throws Exception {
		
		return "navi";
	}
	
	@GetMapping("progress")
	public String setPro() throws Exception {
		
		return "progress";
	}
	
	@GetMapping("latlon")
	public String setLatlon() throws Exception {
		
		return "latlon";
	}
}
