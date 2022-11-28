package com.im.home.util;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class MembersFileManager {

	//파일 저장
	public String saveFile(MultipartFile mpf, String path)throws Exception{
		
		//1. 중복되지 않는 파일명 생성 (UUID, DATE)
		String fileName = UUID.randomUUID().toString();
		
		//2. 확장자 붙히기
		StringBuffer sbf = new StringBuffer();
		sbf.append(fileName);
		sbf.append("_");
		
		// 파일명과 확장자를 분리
		String divide = mpf.getOriginalFilename();
		
		//파일명은 항상 같지 않고 확장자는 거의 일정하므로, lastIndexOf를 통해 확장자와 파일명을 분리시킨다
		divide = divide.substring(divide.lastIndexOf("."));
		
		sbf.append(divide);
		
		log.info("FileName => {} " , fileName);
		
		fileName = sbf.toString();
		
		//3. File 저장
		File file = new File(path, fileName);
		
		mpf.transferTo(file);
		
		return fileName;
	}
	
}
