package com.im.home.members;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.im.home.admin.AdminMembersVO;

@Mapper
public interface MembersMapper {

	
	public MembersVO getMembersLogin(String username) throws UsernameNotFoundException;
	
	public int setMembersSignUp(MembersVO membersVO) throws Exception;
	
	public int setMembersFileAdd(MembersFileVO membersFileVO) throws Exception;
	
	public MembersVO getMyPage(MembersVO membersVO) throws Exception;
	
	public Integer getIdCheck(MembersVO membersVO) throws Exception;
	
	public int setMembersRole(MembersVO membersVO) throws Exception;
	
	//마이페이지에서 보이는 나의 1:1문의 내역
	public List<AdminMembersVO> getInquiryList(AdminMembersVO adminMembersVO) throws Exception;
	
	//회원정보 수정
	public int setMembersModify (MembersVO membersVO) throws Exception;
	
	//일반회원 탈퇴
	public int setMembersDrop (MembersVO membersVO) throws Exception;
}
