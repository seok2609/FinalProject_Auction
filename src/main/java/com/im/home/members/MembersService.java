package com.im.home.members;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.security.SecurityProperties.User;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.im.home.admin.AdminMembersVO;
import com.im.home.util.MembersFileManager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MembersService {
	
	@Autowired
	private MembersMapper membersMapper;
	@Autowired
	private MembersFileManager membersFileManager;
	
	@Value("${app.upload.membersFile}")
	private String path;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	
	
	public int setMembersSignUp(MembersVO membersVO, MultipartFile mpf) throws Exception{
		
		int result = membersMapper.setMembersSignUp(membersVO);
		
		log.info("Path => {}" ,path);
		
		File file = new File(path);
		
		if(!file.exists()) {	//파일이 존재하지 않다면~~
			boolean check = file.mkdirs();
			log.info("Check => {} " , check);
			
		}
		
		
		if(!mpf.isEmpty()) {
			log.info("FileName => {} " , mpf.getOriginalFilename());
			
			String fileName = membersFileManager.saveFile(mpf, path);
			
			MembersFileVO membersFileVO = new MembersFileVO();
			membersFileVO.setFileName(fileName);
			membersFileVO.setOriName(mpf.getOriginalFilename());
			membersFileVO.setId(membersVO.getId());
			
			membersMapper.setMembersFileAdd(membersFileVO);
			
		}
		
//		String url = "";
//		RoleVO roleVO = new RoleVO();
//		if(url == "members/signUpC") {
//			int result2 = membersMapper.setMembersRole(roleVO.setRoleNum(2));
//		}
		
		return result;
	}
	
	public int setMembersFileDelete(MembersFileVO membersFileVO) throws Exception{
		
		return membersMapper.setMembersFileDelete(membersFileVO);
	}
	
	
	public MembersVO getMyPage(MembersVO membersVO) throws Exception{
		
		membersVO = membersMapper.getMyPage(membersVO);
		
		return membersVO;
	}

	
	public Integer getIdCheck(MembersVO membersVO) throws Exception{
		
		int result = membersMapper.getIdCheck(membersVO);
		
		return result;
	}
	
	
	//검증메서드
	public boolean getMembersError(MembersVO membersVO, BindingResult bindingResult) throws Exception{
		
		boolean check = false;
		//check가 false라면 검증이 성공	-> 에러없다
		//check가 true라면 검증 실패  -> 에러있다
		
		//1. Annotation검증
		check = bindingResult.hasErrors();
		
		//2. 비밀번호가 일치하는지 검증 코드
		if(!membersVO.getPassword().equals(membersVO.getPassWordCheck())) {
			check = true;	//pw와 pw확인 값이 같지 않다면 에러발생 (check=true)
			
			bindingResult.reject("passWordCheck", "members.passWord.notEqual");
		}
		
		//3. 아이디가 중복인지 확인
		
		int result = membersMapper.getIdCheck(membersVO);
		
		//result가 0보다 크면 에러발생 => 중복된 ID
		//result가 0이면 에러 발생 X => 사용가능한 ID
		
		if(result > 0) {
			check = true;
			bindingResult.reject("id", "members.id.Overlap");
		}
		
		return check;
	}
	
//	public boolean userEmailCheck(String userEmail, String userName) throws Exception{
//		
//		User user = userrepos
//	}
	
	public int setMembersRole(MembersVO membersVO) throws Exception{
		int result = membersMapper.setMembersRole(membersVO);
		return result;
	}
	
	
	//마이페이지에서 보이는 1:1문의 내역
	public List<AdminMembersVO> getInquiryList(AdminMembersVO adminMembersVO) throws Exception{
		
		 
		
		return membersMapper.getInquiryList(adminMembersVO);
	}
	
	
	//회원정보 수정
	public int setMembersModify(MembersVO membersVO, MultipartFile mpf) throws Exception{
		
		int result = membersMapper.setMembersModify(membersVO);
		
		File file = new File(path);
		
		if(!file.exists()) {	//파일이 존재하지 않다면~~
			boolean check = file.mkdirs();
			log.info("Check => {} " , check);
			
		}
		
		
		if(!mpf.isEmpty()) {
			log.info("FileName => {} " , mpf.getOriginalFilename());
			
			String fileName = membersFileManager.saveFile(mpf, path);
			
			MembersFileVO membersFileVO = new MembersFileVO();
			membersFileVO.setFileName(fileName);
			membersFileVO.setOriName(mpf.getOriginalFilename());
			membersFileVO.setId(membersVO.getId());
			
			membersMapper.setMembersFileAdd(membersFileVO);
			
		}
		
		return result;
	}
	
	
	//회원정보 탈퇴
	
	public int setMembersDrop(MembersVO membersVO) throws Exception{
		
		int result = membersMapper.setMembersDrop(membersVO); 
		
		return result;
	}
	
//	public boolean isMatches(String dbPassWord, String inputPassWord) throws Exception{
//		boolean check = passwordEncoder.matches(dbPassWord, inputPassWord);
//		
//		return check;
//	}
	
	public boolean checkPassWord(String membersId, String checkPassWord) throws Exception{
	
//		SecurityContextImpl context = (SecurityContextImpl)session.getAttribute("SPRING_SECURITY_CONTEXT");
//		log.info("context :{} " , context);
//		Authentication authentication = context.getAuthentication();
//		MembersVO membersVO2 = (MembersVO)authentication.getPrincipal();
		MembersVO membersVO = new MembersVO();
		membersVO = membersMapper.getMembersLogin(membersId);
		
		String realPassWord = membersVO.getPassword();
		boolean matches = passwordEncoder.matches(checkPassWord, realPassWord);
		
		
		return matches;
		
		
	}
	
	
	//카카오 로그인
	public MembersVO getKakaoLogin (MembersVO membersVO) throws Exception{
		
		return membersMapper.getKakaoLogin(membersVO);
		
	}
	
	//카카오 회원가입
	public int setKakao(MembersVO membersVO) throws Exception{
		
		return membersMapper.setKakao(membersVO);
	}
	
	
	
	
}
