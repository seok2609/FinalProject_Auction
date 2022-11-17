package com.im.home.wholesale;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.reactive.function.client.WebClient;
import lombok.extern.slf4j.Slf4j;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

@Controller
@Slf4j
@RequestMapping("/wholesale/*")
public class WholeSaleController {
	
	@GetMapping("test")
	@ResponseBody
	public String wholeSale() {
		
		WebClient webClient = WebClient.builder()
			    .codecs(configurer -> configurer.defaultCodecs().maxInMemorySize(-1)) // to unlimited memory size
				 .baseUrl("https://at.agromarket.kr/openApi/price/sale.do")
				 .build();
		
		Mono<String> res = webClient.get()
				.uri("?serviceKey=9596499878664F83A1D560AE3808376E&apiType=json&pageNo=1&whsalCd=110001&saleDate=20221116")
				.retrieve()
				.bodyToMono(String.class);
				
		String r = res.block();
//		res.subscribe((s)->{
//		WholeSaleVO wsVO = s;
//			log.info("WhsalName => {}", s);
//		});
		log.info("r => {}", r);
		return "wholesale/test";
		
		//String을json으로 변경 
		//jackson
		//VO에 set 반복
	}

}
