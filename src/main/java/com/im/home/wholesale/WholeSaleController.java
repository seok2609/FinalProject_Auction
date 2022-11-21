package com.im.home.wholesale;

import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.reactive.function.client.WebClient;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

@Controller
@Slf4j
@RequestMapping("/wholesale/*")
public class WholeSaleController {
	
	@GetMapping("test")
	@ResponseBody
	public String wholeSale() throws Exception{
		
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
	
//		ObjectMapper objectMapper = new ObjectMapper();
//		String data = objectMapper.writeValueAsString(r);
	
	ObjectMapper objectMapper = new ObjectMapper();
	JSONParser parser = new JSONParser();
	Map<String, Object> data = objectMapper.readValue(r, new TypeReference<Map<String, Object>>() {});
	
		JSONObject jobj = new JSONObject(data);

		Object jobj2 = jobj.get("data");
		String data2 = objectMapper.writeValueAsString(jobj2);
		JSONArray temp = (JSONArray)parser.parse(data2);

		for(int i =0; i<temp.size(); i++) {
			JSONObject jsonObj = (JSONObject)temp.get(i);
			log.info("array => {}", jsonObj);
			log.info("largeName => {}", jsonObj.get("largeName"));
			
		}
		
		
//		
//		JSONParser parser = new JSONParser();
//			
//		JSONObject jsonObject = parser.parse(r);
//		log.info("plssssss => {}", jsonObject);
	
//		log.info("objjj => {}", obj);
//		Object datajson = obj.get("data");
//		log.info("objjj222 => {}", datajson);
//		
//		JSONArray temp = (JSONArray)datajson;
//		for(int i =0; i<temp.size(); i++) {
//			
//			JSONObject jsonObj = (JSONObject)temp.get(i);
//			log.info("plssssss => {}", jsonObj);
//			
//		}
			
		
//		log.info("daaaaaaaaaaata => {}", obj.get("data"));

		
		//WholeSaleVO wholeSaleVO  = objectMapper.readValue(data, WholeSaleVO.class);

		//log.info("VO======= => {}", wholeSaleVO);
	
		return "wholesale/test";
		
		
		//String을json으로 변경 
		//jackson
		//VO에 set 반복
	}

}
