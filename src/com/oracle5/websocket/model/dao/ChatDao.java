package com.oracle5.websocket.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.oracle5.websocket.model.vo.Chat;

import static com.oracle5.common.JDBCTemplate.*;

public class ChatDao {
	Properties prop = new Properties();
	
	public ChatDao() {
		String fileName = ChatDao.class.getResource("/sql/chat/chat-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int searchChatRoom(Connection con, int reciever, int sendUser) {
		int chatRoomNo = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("searchChatRoom");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, reciever);
			pstmt.setInt(2, sendUser);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				chatRoomNo = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return chatRoomNo;
	}

	public int insertChatRoom(Connection con, int reciever) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("insertChatRoom");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, reciever);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int searchOneChatRoom(Connection con, int reciever) {
		int chatRoomNo = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("searchOneChatRoom");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, reciever);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				chatRoomNo = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return chatRoomNo;
	}

	public int insertOtherChatRoom(Connection con, int sendUser, int chatRoomNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("insertOtherChatRoom");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, chatRoomNo);
			pstmt.setInt(2, sendUser);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int saveChat(Connection con, int sendUser, int chatRoomNo, String message) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("saveChat");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, chatRoomNo);
			pstmt.setString(2, message);
			pstmt.setInt(3, sendUser);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public Chat searchChat(Connection con, int sendUser) {
		Chat chat = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("searchChat");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, sendUser);
			pstmt.setInt(2, sendUser);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				chat = new Chat();
				chat.setCtype(rset.getInt("C_TYPE"));
				chat.setChatNo(rset.getInt("CHAT_NO"));
				chat.setDate(rset.getDate("C_DATE"));
				chat.setTime(rset.getString("TIME"));
				chat.setCont(rset.getString("C_CONT"));
				chat.setMno(sendUser);
				chat.setViewCheck(rset.getString("VIEWCHECK"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return chat;
	}

	public ArrayList<Chat> selectChat(Connection con, int sendUser, int reciever) {
		ArrayList<Chat> chatList = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("selectChat");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, sendUser);
			pstmt.setInt(2, reciever);
			
			rset = pstmt.executeQuery();
			
			if(rset != null) {
				chatList = new ArrayList<>();
				while(rset.next()) {
					Chat chat = new Chat();
					
					chat.setCtype(rset.getInt("C_TYPE"));
					chat.setChatNo(rset.getInt("CHAT_NO"));
					chat.setDate(rset.getDate("C_DATE"));
					chat.setTime(rset.getString("TIME"));
					chat.setCont(rset.getString("C_CONT"));
					chat.setMno(rset.getInt("M_NO"));
					chat.setViewCheck(rset.getString("VIEWCHECK"));
					
					chatList.add(chat);
				}
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return chatList;
	}

	public int updateView(Connection con, int receiver, int sendUser) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("updateView");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, sendUser);
			pstmt.setInt(2, receiver);
			pstmt.setInt(3, sendUser);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Chat> selectAllUnread(Connection con, int sendUser) {
		ArrayList<Chat> chatList = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("selectAllUnread");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, sendUser);
			pstmt.setInt(2, sendUser);
			rset = pstmt.executeQuery();
			
			if(rset != null) {
				chatList = new ArrayList<>();
				while(rset.next()) {
					Chat chat = new Chat();
					
					chat.setCtype(rset.getInt("C_TYPE"));
					chat.setChatNo(rset.getInt("CHAT_NO"));
					chat.setDate(rset.getDate("C_DATE"));
					chat.setCont(rset.getString("C_CONT"));
					chat.setMno(rset.getInt("M_NO"));
					chat.setViewCheck(rset.getString("VIEWCHECK"));
					
					chatList.add(chat);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
	
		return chatList;
	}

	public int unReadCount(Connection con, int userNo) {
		int unReadCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("unReadCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				unReadCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return unReadCount;
	}
	
	
}
