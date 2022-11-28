package com.im.home.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.im.home.adminInquiryResponse.InquiryResponseVO;
import com.im.home.members.MembersVO;
import com.im.home.util.AdminPager;
import com.nimbusds.oauth2.sdk.token.BearerTokenError;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdminMembersService {
	@Autowired
	private AdminMembersMapper adminMembersMapper;
	
	//회원 리스트
	public List<MembersVO> getAdminMembersList(AdminPager adminPager)throws Exception{
		Long totalCount = adminMembersMapper.getAdminMembersCount(adminPager);
		adminPager.getNum(totalCount);
//		log.info("또딸 => {}", adminPager.getNum(totalCount));
		return adminMembersMapper.getAdminMembersList(adminPager);
	}
	//메인 관리자페이지 1대1 5개 리스트
	public List<AdminMembersVO> getAdminPageInquiryList(AdminMembersVO adminMembersVO)throws Exception{
		return adminMembersMapper.getAdminPageInquiryList(adminMembersVO);
	}
	//1대1 리스트
	public List<AdminMembersVO> getInquiryList(AdminPager adminPager)throws Exception{
		Long totalCount = adminMembersMapper.getInquiryRequestCount(adminPager);
		adminPager.getNum(totalCount);
		return adminMembersMapper.getInquiryList(adminPager);
	}
	//1대1문의 detailPage
	public AdminMembersVO getInquiryDetail(AdminMembersVO adminMembersVO)throws Exception{
		return adminMembersMapper.getInquiryDetail(adminMembersVO);
	}
	//1대1 문의
	public int setInquiryRequest(AdminMembersVO adminMembersVO)throws Exception{
		return adminMembersMapper.setInquiryRequest(adminMembersVO);
	}
	//1대1 문의 응답
	public int setInquiryResponse(InquiryResponseVO inquiryResponseVO)throws Exception{
		return adminMembersMapper.setInquiryResponse(inquiryResponseVO);
	}
	//총 1대1문의 글 
	public Integer getTotalInquiry(AdminMembersVO adminMembersVO)throws Exception{
		return adminMembersMapper.getTotalInquiry(adminMembersVO);
	}
	//응답하지 않은 1대1문의 리스트
	public List<AdminMembersVO> getInquiryNoResponseList(AdminPager adminPager)throws Exception{
		return adminMembersMapper.getInquiryNoResponseList(adminPager);
	}
	//응답하지 않은 1대1문의
	public Integer getTotalInquiryNo(AdminMembersVO adminMembersVO)throws Exception{
		return adminMembersMapper.getTotalInquiryNo(adminMembersVO);
	}
	//응답완료한 1대1 문의
	public Integer getTotalInquiryYes(AdminMembersVO adminMembersVO)throws Exception{
		return adminMembersMapper.getTotalInquiryYes(adminMembersVO);
	}
	//메인페이지 총 회원 수
	public Integer getTotalMembers(MembersVO membersVO)throws Exception{
		return adminMembersMapper.getTotalMembers(membersVO);
	}
	
	
	
}
