package com.im.home.openvidu;

import java.util.Map;
import java.util.concurrent.ExecutionException;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import io.openvidu.java.client.Connection;
import io.openvidu.java.client.ConnectionProperties;
import io.openvidu.java.client.OpenVidu;
import io.openvidu.java.client.Session;
import io.openvidu.java.client.SessionProperties;
import lombok.extern.slf4j.Slf4j;

@CrossOrigin(origins = "*")
@RestController
@Slf4j
public class ViduController {
	
	@Value("${OPENVIDU_URL}")
	private String OPENVIDU_URL;
	@Value("${OPENVIDU_SECRET}")
	private String OPENVIDU_SECRET;
	
	private OpenVidu openvidu;
	
	@PostConstruct
	public void init() {
		this.openvidu = new OpenVidu(OPENVIDU_URL, OPENVIDU_SECRET);
	}
	
	/**
	 * @param params The Session properties
	 * @return The Session ID
	 * @throws Exception
	 */
	
	@PostMapping("/api/sessions")
	public ResponseEntity<String> initializeSession(@RequestBody(required = false)Map<String, Object> params) throws Exception{
		SessionProperties properties = SessionProperties.fromJson(params).build();
		Session session = openvidu.createSession(properties);
		return new ResponseEntity<>(session.getSessionId(), HttpStatus.OK);
	}
	
	@PostMapping("/api/sessions/{sessionId}/connections")
	public ResponseEntity<String> createConnection(@PathVariable("sessionId") String sessionId, @RequestBody(required = false)Map<String, Object> params) throws Exception{

		Session session = openvidu.getActiveSession(sessionId);
		
		if(session == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		ConnectionProperties properties = ConnectionProperties.fromJson(params).build();
		Connection connection = session.createConnection(properties);
		
		
		return new ResponseEntity<>(connection.getToken(), HttpStatus.OK);
		
	}
	
	@GetMapping("auction/test")
	@ResponseBody
	public String test() {
		return "bad";
	}
	
	
}
