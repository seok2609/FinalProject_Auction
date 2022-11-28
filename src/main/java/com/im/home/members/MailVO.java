package com.im.home.members;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
//모달창에 입력하는 정보
public class MailVO {
	
	private String address;
	private String title;
	private String message;
	
	private List<MembersVO> membersVOs;

}
