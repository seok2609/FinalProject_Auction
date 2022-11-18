package com.im.home.config;

import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.im.home.aution.ChatHandler;

public class WebSocketConfig implements WebSocketConfigurer {
	
	private final ChatHandler chatHandler = new ChatHandler();
	
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		// TODO Auto-generated method stub
		registry.addHandler(chatHandler, "ws/chat").setAllowedOrigins("*");
	}
}
