package com.im.home.aution;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/auction/*")
public class AuctionController {
	
	@GetMapping("detail")
	public String getDetail() throws Exception{
		return "auction/detail";
	}
	
}
