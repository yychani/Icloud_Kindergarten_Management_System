package com.oracle5.websocket.model.service;

import com.oracle5.websocket.model.dao.chatDao;
import com.oracle5.websocket.model.vo.Chat;
import static com.oracle5.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

public class chatService extends Chat {

	public Chat saveChat(int reciever, int sendUser, String message) {
		Connection con = getConnection();
		
		int chatRoomNo = new chatDao().searchChatRoom(con, reciever, sendUser);
		
		if(chatRoomNo == 0) {
			int result = new chatDao().insertChatRoom(con, reciever);
			
			if(result > 0) {
				commit(con);
				chatRoomNo = new chatDao().searchOneChatRoom(con, reciever);
			}else {
				rollback(con);
			}
			
			int result1 = new chatDao().insertOtherChatRoom(con, sendUser, chatRoomNo);
			if(result1 > 0) {
				commit(con);
			}else {
				rollback(con);
			}
		}
		
		int result3 = new chatDao().saveChat(con, sendUser, chatRoomNo, message);
		if(result3 > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		Chat chat = new chatDao().searchChat(con, sendUser);
		close(con);
		return chat;
	}

	public ArrayList<Chat> selectChat(int sendUser, int reciever) {
		Connection con = getConnection();
		
		ArrayList<Chat> chatList = new chatDao().selectChat(con, sendUser, reciever);
		
		close(con);
		return chatList;
	}

}
