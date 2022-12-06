package com.im.home.members;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor	//파라미터가 없는 기본 생성자를 생성
@NoArgsConstructor	//모든 필드 값을 파라미터로 받는 생성자를 만듦
//@RequiredArgsConstructor	//final이나 @NonNull인 필드 값만 파라미터로 받는 생성자 만듦
public class MailVO {
	
	private String address;
	private String title;
	private String message;
	
	
	

}
