package com.oracle5.websocket.model.service;

import com.oracle5.websocket.Feed;
import com.oracle5.websocket.model.dao.FeedDao;

import static com.oracle5.common.JDBCTemplate.*;

import java.sql.Connection;
public class FeedService {

	public int saveFeed(int cid, String message) {
		Connection con = getConnection();
		
		int result = new FeedDao().saveFeed(con, cid, message);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

}
