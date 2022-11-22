package com.im.home.wholesale;

import java.util.List;

import lombok.Data;

@Data
public class WholeSaleVO {
	
	private List<WholeSaleVO> wholeSaleVOs;

	//Open API 출력결과
	private String status; //상태 : success 또는 fail
	private String totCnt; //총 건수 : 전체 데이터 건수
	private String pageNo; //페이지 번호 : 호출 페이지 번호
	private String dataCnt; //데이터 건수, 호출 페이지 데이터 건수
	private String saleDate; //정산일
	private String whsalCd; //도매시장 코드
	private String whsalName; //도매시장명 
	private String cmpCd; //법인코드 
	private String cmpName; //법인코드명 
	private String large; //대분류코드 
	private String largeName; //대분류명 
	private String mid; //중분류코드 
	private String midName; //중분류명 
	private String small; //소분류코드 
	private String smallName; //소분류명 
	private String danq; //단량 
	private String danCd; //단위코드 
	private String pojCd; //포장코드 
	private String std; //규격(단량, 단위, 포장 )
	private String sizeCd; //크기명 
	private String sizeName; //등급코드 
	private String lvName; //등급명 
	private String sanCd; //산지코드 
	private String sanName; //산지명  
	private String totQty; //총물량 
	private String totAmt; //총금액 
	private String minAmt; //최저가 
	private String maxAmt; //최고가 
	private String avgAmt; //평균
	private String qty; //물량 - 	only 실시간
	private String sbidtime; //경락일시 - only 실시간
	private String Cost; // -실시간? 근데 파라미터 정보란에 기재가 안되어잇음


}
