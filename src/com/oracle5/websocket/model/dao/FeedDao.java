package com.oracle5.websocket.model.dao;

import static com.oracle5.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.oracle5.common.model.vo.Attachment;
import com.oracle5.websocket.model.vo.FeedVo;


public class FeedDao {
	Properties prop = new Properties();
	
	public FeedDao() {
		String fileName = ChatDao.class.getResource("/sql/feed/feed-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int saveFeed(Connection con, int cid, String message) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("saveFeed");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cid);
			pstmt.setString(2, message);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<FeedVo> selectChildFeed(Connection con, int cid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<FeedVo> feedList = null;
		
		String query = prop.getProperty("selectChildFeed");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cid);
			
			rset = pstmt.executeQuery();
			
			if(rset != null) {
				feedList = new ArrayList<>();
				while(rset.next()) {
					FeedVo feed = new FeedVo();
					feed.setFeedNo(rset.getInt("FEEDNO"));
					feed.setCid(rset.getInt("C_ID"));
					feed.setFdate(rset.getDate("F_DATE"));
					feed.setTime(rset.getString("TIME"));
					feed.setContent(rset.getString("CONTENT"));
					feed.setChangeName(rset.getString("CHANGE_NAME"));
					
					feedList.add(feed);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return feedList;
	}

	public int selectFeedNo(Connection con, int cid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int feedNo = 0;
		
		String query = prop.getProperty("selectFeedNo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cid);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				feedNo = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return feedNo;
	}

	public int insertFeedImg(Connection con, Attachment at, int feedNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("insertFeedImg");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setInt(4, feedNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
