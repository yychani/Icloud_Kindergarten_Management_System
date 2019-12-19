package com.oracle5.websocket.model.service;

import com.oracle5.common.model.vo.Attachment;
import com.oracle5.websocket.model.dao.FeedDao;
import com.oracle5.websocket.model.vo.FeedVo;

import static com.oracle5.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
public class FeedService {

	public int saveFeed(int cid, String message, Attachment at) {
		Connection con = getConnection();
		
		int result = new FeedDao().saveFeed(con, cid, message);
		int result3 = 0;
		int feedNo = new FeedDao().selectFeedNo(con, cid);
		int result2 = 0;
		if(!at.getFilePath().equals("/main/uploadFiles/null")) {
			result2 = new FeedDao().insertFeedImg(con, at, feedNo);
			if(result2 > 0) {
				commit(con);
			}else {
				rollback(con);
			}
		}
		if(result > 0) {
			commit(con);
			result3 = 1;
		}else {
			rollback(con);
		}
		close(con);
		return result3;
	}

	public ArrayList<FeedVo> selectChildFeed(int cid) {
		Connection con = getConnection();
		
		ArrayList<FeedVo> feedList = new FeedDao().selectChildFeed(con, cid);
		
		close(con);
		return feedList;
	}

}
