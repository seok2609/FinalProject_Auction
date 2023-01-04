package com.im.home.members;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.im.home.admin.AdminMembersVO;

@Mapper
public interface MembersMapper {

	
	//로그인
	public MembersVO getMembersLogin(String username) throws UsernameNotFoundException;
	
	//회원가입
	public int setMembersSignUp(MembersVO membersVO) throws Exception;
	
	//파일추가
	public int setMembersFileAdd(MembersFileVO membersFileVO) throws Exception;
	
	//마이페이지
	public MembersVO getMyPage(MembersVO membersVO) throws Exception;
	
	//아이디 중복체크
	public Integer getIdCheck(MembersVO membersVO) throws Exception;
	
	//닉네임 중복체크
	public Integer getNickNameCheck(MembersVO membersVO) throws Exception;
	
	//전화번호 중복체크
	public Integer getPhoneCheck(MembersVO membersVO) throws Exception;
	
	//등급부여
	public int setMembersRole(MembersVO membersVO) throws Exception;

	//사진삭제
	public int setMembersFileDelete(MembersFileVO membersFileVO) throws Exception;
	
	//마이페이지에서 보이는 나의 1:1문의 내역
	public List<AdminMembersVO> getInquiryList(AdminMembersVO adminMembersVO) throws Exception;
	
	//회원정보 수정
	public int setMembersModify (MembersVO membersVO) throws Exception;
	
	//일반회원 탈퇴
	public int setMembersDrop (MembersVO membersVO) throws Exception;
	
	//카카오 로그인
	public MembersVO getKakaoLogin(MembersVO membersVO) throws Exception;
	
	//카카오 회원가입
	public int setKakao(MembersVO membersVO) throws Exception;
	
	//결제
	public int setPoint(MembersVO membersVO) throws Exception;
	public MembersVO getMemberInfo(MembersVO membersVO) throws Exception;
	//
	
}
