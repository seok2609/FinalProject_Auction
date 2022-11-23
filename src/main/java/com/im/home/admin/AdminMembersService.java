package com.im.home.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.im.home.members.MembersVO;
import com.im.home.util.AdminPager;
import com.nimbusds.oauth2.sdk.token.BearerTokenError;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdminMembersService {
	@Autowired
	private AdminMembersMapper adminMembersMapper;
	
	public List<MembersVO> getAdminMembersList(AdminPager adminPager)throws Exception{
		Long totalCount = adminMembersMapper.getAdminMembersCount(adminPager);
		adminPager.getNum(totalCount);
//		log.info("또딸 => {}", adminPager.getNum(totalCount));
		return adminMembersMapper.getAdminMembersList(adminPager);
	}
	
	public List<AdminMembersVO> getInquiryList(AdminPager adminPager)throws Exception{
		Long totalCount = adminMembersMapper.getInquiryRequestCount(adminPager);
		adminPager.getNum(totalCount);
		return adminMembersMapper.getInquiryList(adminPager);
	}
	
	public List<AdminMembersVO> getAdminPageInquiryList(AdminMembersVO adminMembersVO)throws Exception{
		return adminMembersMapper.getAdminPageInquiryList(adminMembersVO);
	}

	public Integer getTotalMembers(MembersVO membersVO)throws Exception{
		return adminMembersMapper.getTotalMembers(membersVO);
	}
	public Integer getTotalInquiry(AdminMembersVO adminMembersVO)throws Exception{
		return adminMembersMapper.getTotalInquiry(adminMembersVO);
	}
	public Integer getTotalInquiryNo(AdminMembersVO adminMembersVO)throws Exception{
		return adminMembersMapper.getTotalInquiryNo(adminMembersVO);
	}
	public Integer getTotalInquiryYes(AdminMembersVO adminMembersVO)throws Exception{
		return adminMembersMapper.getTotalInquiryYes(adminMembersVO);
	}
	
	public int setInquiryRequest(AdminMembersVO adminMembersVO)throws Exception{
		return adminMembersMapper.setInquiryRequest(adminMembersVO);
	}
	
	
}
