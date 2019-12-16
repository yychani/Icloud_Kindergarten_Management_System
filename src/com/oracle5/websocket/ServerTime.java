package com.oracle5.websocket;

import java.io.IOException;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.Timer;
import java.util.TimerTask;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/serverTime.web")
public class ServerTime {
	static Boolean runCheck = false;
	
	
	public ServerTime() {
	}

	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	// 사용자 리스트
	@OnOpen
	public void onOpen(Session session) {
		clients.add(session);
		// 서버 연결 시점
		
		
		if(runCheck == false) {
			TimerTask task = new TimerTask() {

				@Override
				public void run() {
					Iterator<Session> itr = clients.iterator();
					while(itr.hasNext()) {
						try {
							Session session = itr.next();
							Calendar cal = Calendar.getInstance();
							String time = cal.get(Calendar.HOUR) + ":" + cal.get(Calendar.MINUTE) + ":" + cal.get(Calendar.SECOND);
							
							session.getBasicRemote().sendText(time);
							//System.out.println(time);
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
			};
			runCheck = true;
			Timer timer = new Timer(true);
			timer.scheduleAtFixedRate(task, 0, 1*1000);
		}
	}
	
	@OnMessage
	public void onMessage(String msg, Session session) throws IOException {
		// 서버로부터 테이터를 전송받을 시점
		//System.out.println(msg);
		
	}
	@OnError
	public void onError(Throwable e) {
		e.printStackTrace();
	}
	
	@OnClose
	public void onClose(Session session) {
		//지워주지 않으면 Set에 이미 나간 사용자가 남아있기 때문에 메세지 전송시 에러 난다.
		clients.remove(session);
	}
}
