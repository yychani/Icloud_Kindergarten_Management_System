package com.oracle5.websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.Timer;
import java.util.TimerTask;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;

import com.oracle5.websocket.model.service.ChatService;
import com.oracle5.websocket.model.vo.Chat;

@ServerEndpoint("/chatReadCheck.chat")
public class ChatReadCheck {
	static Boolean runCheck = false;

	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	private int userNo = 0;

	// 사용자 리스트
	@OnOpen
	public void onOpen(Session session) {
		clients.add(session);
		// 서버 연결 시점
	}

	@OnMessage
	public void onMessage(String msg, Session session) throws IOException {
		// 서버로부터 테이터를 전송받을 시점
		userNo = Integer.parseInt(msg);
		if(runCheck == false) {
			TimerTask task = new TimerTask() {
		
				@Override
				public void run() {
						try {
						String sendMessage = "";
						
						int unReadCount = new ChatService().unReadCount(userNo);
						ArrayList<Chat> chatList = new ChatService().selectAllUnread(userNo);
						
						for(Chat chat : chatList) {
							sendMessage += ":" + chat.getMno();
						}
						if(unReadCount > 0) {
							synchronized(clients) {
								for(Session client : clients) {
									client.getBasicRemote().sendText(userNo + ":" + unReadCount + sendMessage);
								}
							}
						}else {
							synchronized(clients) {
								for(Session client : clients) {
									client.getBasicRemote().sendText(userNo + ":0");							
								}
							}
						}
						//System.out.println(time);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			};
			runCheck = true;
			Timer timer = new Timer(true);
			timer.scheduleAtFixedRate(task, 0, 1*1000);
			runCheck = false;
		}
	}

	@OnError
	public void onError(Throwable e) {
		//e.printStackTrace();
	}

	@OnClose
	public void onClose(Session session) {
		// 지워주지 않으면 Set에 이미 나간 사용자가 남아있기 때문에 메세지 전송시 에러 난다.
		clients.remove(session);
	}
}
