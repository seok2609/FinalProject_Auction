package com.im.home.admin;

import java.security.Principal;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.im.home.members.MembersVO;
import com.im.home.util.AdminPager;


@Mapper
public interface AdminMembersMapper {
	//메인페이지 총 회원 수
	public Integer getTotalMembers(MembersVO membersVO)throws Exception;
	
	//메인 관리자페이지 1대1 5개 리스트
	public List<AdminMembersVO> getAdminPageInquiryList(AdminMembersVO adminMembersVO)throws Exception;
	//총 1대1문의 글 
	public Integer getTotalInquiry(AdminMembersVO adminMembersVO)throws Exception;
	//1대1 문의
	public int setInquiryRequest(AdminMembersVO adminMembersVO)throws Exception;
	//1대1문의 응답
	public int setInquiryResponse(InquiryResponseVO inquiryResponseVO)throws Exception; 
	//1대1 리스트
	public List<AdminMembersVO> getInquiryList(AdminPager adminPager)throws Exception;
	//1대1문의 detailPage
	public AdminMembersVO getInquiryDetail(AdminMembersVO adminMembersVO)throws Exception;
	//1대1 리스트 pager에 필요한 count
	public Long getInquiryRequestCount(AdminPager adminPager)throws Exception;
	//응답하지 않은 1대1문의 리스트
	public List<AdminMembersVO> getInquiryNoResponseList(AdminPager adminPager)throws Exception;
	//응답하지 않은 1대1문의
	public Integer getTotalInquiryNo(AdminMembersVO adminMembersVO)throws Exception;
	//응답완료한 1대1 문의
	public Integer getTotalInquiryYes(AdminMembersVO adminMembersVO)throws Exception;
	//회원 리스트
	public List<MembersVO> getAdminMembersList(AdminPager adminPager) throws Exception;	
	//회원 리스트 pager에 필요한 count
	public Long getAdminMembersCount(AdminPager adminPager)throws Exception;
	//신고 요청
	public int setRepoertRequest(MembersReportVO membersReportVO)throws Exception;
	//신고 요청 건 수
	public Integer getTotalReport(MembersReportVO membersReportVO)throws Exception;
	//신고 요청 리스트
	public List<MembersReportVO> getReportList(AdminPager adminPager)throws Exception;
	//신고 요청 디테일
	public MembersReportVO getReportDetail(MembersReportVO membersReportVO)throws Exception;


}
