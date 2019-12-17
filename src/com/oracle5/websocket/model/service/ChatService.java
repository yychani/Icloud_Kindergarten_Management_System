package com.oracle5.websocket.model.service;

import com.oracle5.websocket.model.dao.ChatDao;
import com.oracle5.websocket.model.vo.Chat;
import static com.oracle5.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

public class ChatService extends Chat {

	public Chat saveChat(int reciever, int sendUser, String message) {
		Connection con = getConnection();
		
		int chatRoomNo = new ChatDao().searchChatRoom(con, reciever, sendUser);
		
		if(chatRoomNo == 0) {
			int result = new ChatDao().insertChatRoom(con, reciever);
			
			if(result > 0) {
				commit(con);
				chatRoomNo = new ChatDao().searchOneChatRoom(con, reciever);
			}else {
				rollback(con);
			}
			
			int result1 = new ChatDao().insertOtherChatRoom(con, sendUser, chatRoomNo);
			if(result1 > 0) {
				commit(con);
			}else {
				rollback(con);
			}
			int result2 = new ChatDao().updateView(con, reciever, sendUser);
			if(result2 > 0) {
				commit(con);
			}else {
				rollback(con);
			}
		}
		
		int result3 = new ChatDao().saveChat(con, sendUser, chatRoomNo, message);
		if(result3 > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		Chat chat = new ChatDao().searchChat(con, sendUser);
		close(con);
		return chat;
	}

	public ArrayList<Chat> selectChat(int sendUser, int reciever) {
		Connection con = getConnection();
		
		ArrayList<Chat> chatList = new ChatDao().selectChat(con, sendUser, reciever);
		
		close(con);
		return chatList;
	}

	public int updateView(int receiver, int sendUser) {
		Connection con = getConnection();
		
		int result = new ChatDao().updateView(con, receiver, sendUser);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public ArrayList<Chat> selectAllUnread(int sendUser) {
		Connection con = getConnection();
		
		ArrayList<Chat> chatList = new ChatDao().selectAllUnread(con, sendUser);
		
		close(con);
		return chatList;
	}

	public int unReadCount(int userNo) {
		Connection con = getConnection();
		
		int unReadCount = new ChatDao().unReadCount(con, userNo);
		close(con);
		return unReadCount;
	}

}
