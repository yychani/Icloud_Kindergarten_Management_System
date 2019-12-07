package com.oracle5.board.model.service;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import com.oracle5.board.model.dao.BoardDao;
import com.oracle5.board.model.vo.CommonNote;

import static com.oracle5.common.JDBCTemplate.*;
public class BoardService {
	
	public String selectPreNote(Date date) {
		Connection con = getConnection();
		
		String dateCont = new BoardDao().selectPreNote(con, date);
		
		close(con);
		return dateCont;
	}

	public int insertPreNote(CommonNote cNote) {
		Connection con = getConnection();
		
		int result = new BoardDao().insertPreNote(con, cNote);
		System.out.println(result);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public ArrayList<CommonNote> selectAllPreNote() {
		Connection con = getConnection();
		
		ArrayList<CommonNote> list = new BoardDao().selectAllPreNote(con);
		
		close(con);
		return list;
	}

}
