package com.im.home.members;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
		
		return result;
	}
	
	
	public MembersVO getMyPage(MembersVO membersVO) throws Exception{
		
		membersVO = membersMapper.getMyPage(membersVO);
		
		return membersVO;
	}

	
	public Integer getIdCheck(MembersVO membersVO) throws Exception{
		
		int result = membersMapper.getIdCheck(membersVO);
		
		return result;
	}
}
