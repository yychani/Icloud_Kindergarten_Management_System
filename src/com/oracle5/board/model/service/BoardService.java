package com.oracle5.board.model.service;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import com.oracle5.board.model.dao.BoardDao;
import com.oracle5.board.model.vo.Board;
import com.oracle5.board.model.vo.CommonNote;
import com.oracle5.board.model.vo.Schedule;

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

	public ArrayList<Schedule> selectAllSchedule() {
		Connection con = getConnection();
		
		ArrayList<Schedule> list = new BoardDao().selectAllSchedule(con);
		
		close(con);
		return list;
	}

	public String selectSchedule(Date date) {
		Connection con = getConnection();
		
		String dateCont = new BoardDao().selectSchedule(con, date);
		
		close(con);
		return dateCont;
	}

	public int insertSchedule(Schedule sch) {
		Connection con = getConnection();

		int result = new BoardDao().insertSchedule(con, sch);
		System.out.println(result);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int getChildCount() {
		Connection con = getConnection();
		
		int listCount= new BoardDao().getChildCount(con);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> selectChild(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> hmapList = new BoardDao().selectChild(con, currentPage, limit);
		
		close(con); 
		
		return hmapList;
	}

	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new BoardDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<Board> selectBoardPageing(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectBoardPageing(con,currentPage,limit);
		
		
		close(con);
		return list;
	}

	public int getListCountThumbnail() {
		Connection con = getConnection();
		
		int listCount = new BoardDao().getListCountThumbnail(con);
		
		close(con);
		return listCount;
	}

	public ArrayList<Board> selectBoardPageingThumbnail(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Board> list = new BoardDao().selectBoardPageingThumbnail(con,currentPage,limit);
		
		close(con);
		return list;
	}

	public int inserParentsBoard(Board b) {
		Connection con = getConnection();
		
		int result = new BoardDao().insertParentsBoard(con,b);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return result;
	}



}
