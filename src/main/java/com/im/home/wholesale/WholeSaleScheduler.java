package com.im.home.wholesale;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;
import reactor.core.publisher.Mono;

@Component
@Slf4j
public class WholeSaleScheduler { 
	
	@Autowired
	private  WholeSaleMapper wholeSaleMapper;
	
	
	//================= 어제 일자 정산 데이터 table 저장 =====================
	
	@Scheduled(cron = "0 30 6 * * 1-7") // 매일 오전 6시 30분 실행
	public void setTodayData() throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	      Calendar c1 = Calendar.getInstance(); 
	      Calendar c2 = Calendar.getInstance(); 
	      c1.add(Calendar.DATE, -1); // 오늘날짜로부터 -1. 어제 날짜의 정산 DB삽입 위해. 
	      c2.add(Calendar.DATE, -4); //오늘날짜로부터 3일전 일자 구함
	      
	      String yesterday = sdf.format(c1.getTime()); // String으로 저장 
	      String delDay = sdf.format(c2.getTime()); 
	      
	      
	      int[] mart = {110001,311201,240004,250001,220001,210001,210009}; //도매시장 번호 
           
	      for(int j : mart) //어제 날짜의 도매시장 데이터 삽입. 
			{
	
	    		WebClient webClient = WebClient.builder()
	    			    .codecs(configurer -> configurer.defaultCodecs().maxInMemorySize(-1))
	    				 .baseUrl("https://at.agromarket.kr/openApi/price/sale.do")
	    				 .build();
	    		
	    		Mono<String> res = webClient.get()
	    				.uri("?serviceKey=9596499878664F83A1D560AE3808376E&apiType=json&pageNo=1&whsalCd="+j+"&saleDate="+yesterday)
	    				.retrieve()
	    				.bodyToMono(String.class);
	    				
	    		String r = res.block();
	    	
	    	ObjectMapper objectMapper = new ObjectMapper();
	    	
	    	JSONParser parser = new JSONParser();
	    	Map<String, Object> data = objectMapper.readValue(r, new TypeReference<Map<String, Object>>() {});
	    	
	    		JSONObject jobj = new JSONObject(data);
	    		String count = jobj.get("totCnt").toString(); //데이터총개수
	    		
	    		//총 개수로 파라미터 페이지 총 개수를 설정해놓고,
	    		//rn으로 페이지 블락처리하고, rn이 1000을 넘으면 파라미터 page 넘어가게 처리
	    		Object jobj2 = jobj.get("data");
	    		String data2 = objectMapper.writeValueAsString(jobj2);
	    		JSONArray temp = (JSONArray)parser.parse(data2);
	    		//jsonArray를 java List에 담기
	    		List<WholeSaleVO>  wholeSaleVOs = new ArrayList<>();

	    		if(temp.size()!=0) {
				    wholeSaleMapper.deleteList(delDay); //3일전 데이터 삭제
				    
				    for(int i =0; i<temp.size(); i++) {
	    		
	    			JSONObject jsonObj = (JSONObject)temp.get(i);
	    		
	    				log.info("array => {}", jsonObj);
	    				      
	    					WholeSaleVO wholeSaleVO = new WholeSaleVO();
	    					wholeSaleVO.setRn(jsonObj.get("rn").toString());
	    					wholeSaleVO.setSaleDate(jsonObj.get("saleDate").toString());
	    					wholeSaleVO.setWhsalCd(jsonObj.get("whsalCd").toString());
	    					wholeSaleVO.setWhsalName(jsonObj.get("whsalName").toString());
	    					wholeSaleVO.setCmpCd(jsonObj.get("cmpCd").toString());
	    					wholeSaleVO.setCmpName(jsonObj.get("cmpName").toString());
	    					wholeSaleVO.setLarge(jsonObj.get("large").toString());
	    					wholeSaleVO.setLargeName(jsonObj.get("largeName").toString());
	    					wholeSaleVO.setMid(jsonObj.get("mid").toString());
	    					wholeSaleVO.setMidName(jsonObj.get("midName").toString());
	    					wholeSaleVO.setMid(jsonObj.get("mid").toString());
	    					wholeSaleVO.setMidName(jsonObj.get("midName").toString());
	    					wholeSaleVO.setSmall(jsonObj.get("small").toString());
	    					wholeSaleVO.setSmallName(jsonObj.get("smallName").toString());
	    					wholeSaleVO.setTotQty(jsonObj.get("totQty").toString());
	    					wholeSaleVO.setTotAmt(jsonObj.get("totAmt").toString());
	    					wholeSaleVO.setMinAmt(jsonObj.get("minAmt").toString());
	    					wholeSaleVO.setMaxAmt(jsonObj.get("maxAmt").toString());
	    					wholeSaleVO.setAvgAmt(jsonObj.get("avgAmt").toString());
	    					//wholeSaleVO list에 초기화되어 새로운 set값이 설정된 wholeSaleVO 추가
	    					//add(int index, WholeSaleVO element)
	    					wholeSaleMapper.setAdd(wholeSaleVO);
	    				}
	    			
	    				}
	    		
			}
	
			
			
		}
	//================= 실시간데이터 비우기 =====================
	
	@Scheduled(cron = "0 0 0 * * *") // 매일 3시간 간격으로 실행 
	public void setRealDataDel() throws Exception {
		 int[] mart = {110001,311201,240004,250001,220001,210001,210009}; //도매시장 번호 
         
	      for(int j : mart) //어제 날짜의 도매시장 데이터 삽입. 
			{
	    	  wholeSaleMapper.deleteReal(Integer.toString(j));
			}
	
		}
	
	
	
	
	//================= 실시간데이터 3시간 간격으로 업데이트 =====================
	
	@Scheduled(cron = "20 30 */3 * *  *") // 매일 3시간 간격으로 실행 
	public void setRealData() throws Exception {
		   
	      int[] mart = {110001,311201,240004,250001,220001,210001,210009}; //도매시장 번호 
         
	      for(int j : mart) //어제 날짜의 도매시장 데이터 삽입. 
			{
	  		WebClient webClient = WebClient.builder()
				    .codecs(configurer -> configurer.defaultCodecs().maxInMemorySize(-1))
					 .baseUrl("https://at.agromarket.kr/openApi/price/real.do")
					 .build();
			
			Mono<String> res = webClient.get()
					.uri("?serviceKey=9596499878664F83A1D560AE3808376E&apiType=json&pageNo=1&whsalCd="+j)
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
					wholeSaleVO.setRn("0");
					wholeSaleVO.setWhsalCd(jsonObj.get("whsalCd").toString());
					wholeSaleVO.setWhsalName(jsonObj.get("whsalName").toString());
					wholeSaleVO.setSaleDate(jsonObj.get("saleDate").toString());
					wholeSaleVO.setCmpName(jsonObj.get("cmpName").toString());
					wholeSaleVO.setMidName(jsonObj.get("midName").toString());
					wholeSaleVO.setCost(jsonObj.get("cost").toString());
					wholeSaleVO.setQty(jsonObj.get("qty").toString());
					wholeSaleVO.setSbidtime(jsonObj.get("sbidtime").toString());
					wholeSaleMapper.setAddReal(wholeSaleVO);
					
					}
			}
			}
	      }
	}
		
					
		
	
