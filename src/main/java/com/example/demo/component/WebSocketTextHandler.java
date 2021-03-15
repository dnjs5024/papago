package com.example.demo.component;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;
@Component
@Slf4j

public class WebSocketTextHandler extends TextWebSocketHandler{

	private Map<String,WebSocketSession> wsMap = Collections.synchronizedMap(new HashMap<>());
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	log.info("session.getId()=>{}",session.getId());	
	log.info("오 연결됬음 ㅋㅋ");
	wsMap.put(session.getId(), session);
	}
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		wsMap.remove(session.getId());
	log.info("오 연결끊김 ㅋㅋ");
	}	
	@Override
	protected void handleTextMessage(WebSocketSession session,TextMessage message)throws Exception{
		log.info("ws id=>{}",session.getId());
		log.info("message=>{}",message.getPayload());
		 for (WebSocketSession s : wsMap.values()) { 	      
	            s.sendMessage(message);
	            log.info(s.getId() + "에 메시지 발송: " + message.getPayload());
	        }
	}
}
