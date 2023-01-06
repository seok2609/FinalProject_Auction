package com.im.home.mail;

import java.util.Random;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailException;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MailService implements OtherService{

//	@Value("${spring.mail.username}")
	private String myEmail;
	
	@Autowired
	private MailConfig mailConfig;
	
	public static final String cPw = createKey();
	
	
	
	private MimeMessage createMessage(String to) throws Exception{
		
		
		log.info("보내는 대상 :: {} " , to);
		log.info("인증 번호 :: {} " , cPw);
		
		MimeMessage mimeMessage = mailConfig.javaMailSender().createMimeMessage();
		log.info("크키크키크키크키킄키크키크킼크키크키크킼크키크키크키킄키");
		
		//보내는 대상
		mimeMessage.addRecipients(RecipientType.TO, to);
		
		//제목
		mimeMessage.setSubject("OO도매시장에서 인증번호가 도착했습니다.");
		
		String msg = "";
		
		msg+= "<div style='margin:100px;'>";
		msg+= "<h1> 안녕하세요  OO도매시장 입니다!!! </h1>";
		msg+= "<br>";
		msg+= "<p>아래 코드로 로그인 한 후, 비밀번호 재 설정을 해주시길 바랍니다.<p>";
		msg+= "<br>";
		msg+= "<p>감사합니다!<p>";
		msg+= "<br>";
		msg+= "<div align='center' style='border:1px solid black; font-family:verdana';>";
		msg+= "<h3 style='color:blue;'>임시 비밀번호 입니다.</h3>";
		msg+= "<div style='font-size:130%'>";
		msg+= "CODE : <strong>";
		msg+= cPw+"</strong><div><br/> ";
		msg+= "</div>";
		mimeMessage.setText(msg, "utf-8", "html");//내용
		mimeMessage.setFrom(new InternetAddress(myEmail, "OO도매시장"));//보내는 사람
        
        return mimeMessage;
    }
	
	
	
	
	//인증 코드를 만들어줌
	public static String createKey() {
		StringBuffer key = new StringBuffer();
		Random rnd = new Random();

		for (int i = 0; i < 8; i++) { // 인증코드 8자리
			int index = rnd.nextInt(3); // 0~2 까지 랜덤

			switch (index) {
			case 0:
				key.append((char) ((int) (rnd.nextInt(26)) + 97));
				//  a~z  (ex. 1+97=98 => (char)98 = 'b')
				break;
			case 1:
				key.append((char) ((int) (rnd.nextInt(26)) + 65));
				//  A~Z 
				break;
			case 2:
				key.append((rnd.nextInt(10)));
				// 0~9
				break;
			}
		}
		
		log.info("난수 된 비밀번호 :: {} " , key.toString());

		return key.toString();
	}
	
	
	// sendSimpleMessage 의 매개변수로 들어온 to 는 곧 이메일 주소가 된다
	@Override
	public String sendSimpleMessage(String to)throws Exception {
		
		log.info("=========sendSimpleMessage============");
		log.info("to :: {}" , to);
		MimeMessage mimeMessage = createMessage(to);
		log.info("11 : {} " , mimeMessage);
		        try{//예외처리
		        	log.info("=========sendSimpleMessage try try============");
		        	mailConfig.javaMailSender().send(mimeMessage);
		        	log.info("===========try문 실행 후 =================");
		        }catch(MailException es){
		        	es.printStackTrace();
		            throw new IllegalArgumentException();
		        }
		        
		        return cPw;
		
	}
	
	
}
