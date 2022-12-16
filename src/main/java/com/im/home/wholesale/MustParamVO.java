package com.im.home.wholesale;

import lombok.Data;

@Data
public class MustParamVO {

	private String pageNo; //필수 
	private String saleDate; //필수 
	private String whsalCd; //필수gh
	private String cmpCd;
	private String largeCd;
	private String midCd;
	private String smallCd;

}
