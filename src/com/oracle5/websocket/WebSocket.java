package com.oracle5.websocket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/chat")
public class WebSocket {
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	// 사용자 리스트
	@OnOpen
	public void onOpen(Session session) {
		clients.add(session);
		//System.out.println(session.getId() + "서버 연결");
		// 서버 연결 시점
	}
	
	@OnMessage
	public void onMessage(String msg, Session session) throws IOException {
		// 서버로부터 테이터를 전송받을 시점
		//System.out.println(msg);
		String[] srr = msg.split(":");
		
		String userName = srr[0];
		String recieveUser = srr[1];
		String message = srr[2];
		String hour = srr[3];
		String min = srr[4];
		String sec = srr[5];
		
		String sendMessage = recieveUser + ":" + userName+ ":" + message + ":" + hour + ":" + min + ":" + sec;
		
		//System.out.println(sendMessage);
		
		// 하나의 일 처리를 수행하는동안 사용자의 변경이 일어나면 안된다.
		// 즉 NullPointer를 방지하기 위해 동기화 처리를 해준다.
		synchronized(clients) {
			for(Session client : clients) {
				client.getBasicRemote().sendText(sendMessage);
			}
		}
	}
	@OnError
	public void onError(Throwable e) {
		e.printStackTrace();
	}
	
	@OnClose
	public void onClose(Session session) {
		//지워주지 않으면 Set에 이미 나간 사용자가 남아있기 때문에 메세지 전송시 에러 난다.
		//System.out.println("서버 종료");
		clients.remove(session);
	}
}
