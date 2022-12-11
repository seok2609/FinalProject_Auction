package com.im.home.admin;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.im.home.members.MembersVO;
import com.im.home.util.AdminPager;
import com.im.home.util.MembersFileManager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdminMembersService {
	@Autowired
	private AdminMembersMapper adminMembersMapper;
	@Autowired
	private MembersFileManager membersFileManager;
	
	@Value("${app.upload.membersFile}")
	private String path;
	
	//회원 리스트
	public List<MembersVO> getAdminMembersList(AdminPager adminPager)throws Exception{
		Long totalCount = adminMembersMapper.getAdminMembersCount(adminPager);
		adminPager.getNum(totalCount);
		log.info("total {}", totalCount);
		adminPager.getRowNum();
		return adminMembersMapper.getAdminMembersList(adminPager);
	}
	public AdminMembersVO getAdminMembersDetail(AdminMembersVO adminMembersVO)throws Exception{
		return adminMembersMapper.getAdminMembersDetail(adminMembersVO);
	}
	//메인 관리자페이지 1대1 5개 리스트
	public List<AdminMembersVO> getAdminPageInquiryList(AdminMembersVO adminMembersVO)throws Exception{
		return adminMembersMapper.getAdminPageInquiryList(adminMembersVO);
	}
	//1대1 리스트
	public List<AdminMembersVO> getInquiryList(AdminPager adminPager)throws Exception{
		Long totalCount = adminMembersMapper.getInquiryRequestCount(adminPager);
		adminPager.getNum(totalCount);
		adminPager.getRowNum();
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
		Long totalCount = adminMembersMapper.getNoInquiryResponseCount(adminPager);
		adminPager.getNum(totalCount);
		adminPager.getRowNum();
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
	//신고 요청
	public int setRepoertRequest(MembersReportVO membersReportVO, MultipartFile mpf)throws Exception{
		int result = adminMembersMapper.setRepoertRequest(membersReportVO);
		File file = new File(path);
		if(!file.exists()) {
			boolean check = file.mkdirs();
		}
		if(!mpf.isEmpty()) {
			String fileName = membersFileManager.saveFile(mpf, path);
			
			ReportFileVO reportFileVO = new ReportFileVO();
			reportFileVO.setReport_num(membersReportVO.getReport_num());
			reportFileVO.setReport_fileName(fileName);
			reportFileVO.setReport_oriName(mpf.getOriginalFilename());
			adminMembersMapper.setReportFileAdd(reportFileVO);
		}
		return result;
	}
	//신고 파일
	public int setReportFileAdd(ReportFileVO reportFileVO)throws Exception{
		return adminMembersMapper.setReportFileAdd(reportFileVO);
	}
	//신고 요청 대기
	public int setBlackWaiting(MembersReportVO membersReportVO)throws Exception{
		return adminMembersMapper.setBlackWaiting(membersReportVO);
	}
	//신고 요청 건 수
	public Integer getTotalReport(MembersReportVO membersReportVO)throws Exception{
		return adminMembersMapper.getTotalReport(membersReportVO);
	}
	//신고 리스트
	public List<MembersReportVO> getReportList(AdminPager adminPager)throws Exception{
		Long totalCount = adminMembersMapper.getReportCount(adminPager);
		adminPager.getNum(totalCount);
		adminPager.getRowNum();
		return adminMembersMapper.getReportList(adminPager);
	}
	//신고 디테일
	public MembersReportVO getReportDetail(MembersReportVO membersReportVO)throws Exception{
		return adminMembersMapper.getReportDetail(membersReportVO);
	}
	//신고 요청 거절
	public int setResponseReportNo(MembersReportVO membersReportVO)throws Exception{
		return adminMembersMapper.setResponseReportNo(membersReportVO);
	}
	//신고 요청 승인
	public int setResponseReportOk(MembersReportVO membersReportVO)throws Exception{
		return adminMembersMapper.setResponseReportOk(membersReportVO);
	}
	//블랙 리스트
	public List<MembersReportVO> getBlackList(AdminPager adminPager)throws Exception{
		Long totalCount = adminMembersMapper.getBlackMembersCount(adminPager);
		adminPager.getNum(totalCount);
		adminPager.getRowNum();
		return adminMembersMapper.getBlackList(adminPager);
	}
	//블랙 회원 수
	public Integer getTotalBlack(MembersVO membersVO)throws Exception{
		return adminMembersMapper.getTotalBlack(membersVO);
	}
	//블랙 회원 디테일
	public List<MembersReportVO> getBalckDetail(MembersReportVO membersReportVO)throws Exception{
		return adminMembersMapper.getBlackDetail(membersReportVO);
	}
	//블랙 해제
	public int setBlackCancel(MembersReportVO membersReportVO)throws Exception{
		return adminMembersMapper.setBlackCancel(membersReportVO);
	}
	public int setBlack(MembersVO membersVO)throws Exception{
		return adminMembersMapper.setBlack(membersVO);
	}
	public int setBlackC(MembersVO membersVO)throws Exception{
		return adminMembersMapper.setBlackC(membersVO);
	}
	
}
