package com.oracle5.websocket.model.dao;

import static com.oracle5.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.oracle5.websocket.Feed;

public class FeedDao extends Feed {
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

}
