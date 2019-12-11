package com.oracle5.board.model.service;

import static com.oracle5.common.JDBCTemplate.close;
import static com.oracle5.common.JDBCTemplate.commit;
import static com.oracle5.common.JDBCTemplate.getConnection;
import static com.oracle5.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import com.oracle5.board.model.dao.BoardDao;
import com.oracle5.board.model.vo.Board;
import com.oracle5.board.model.vo.CommonNote;
import com.oracle5.board.model.vo.Schedule;
import com.oracle5.common.model.vo.Attachment;
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
	//반 공지사항 등록용 메소드
	public int insertBanNotice(HashMap<String, Object> hmap,Board b) {
		Connection con = getConnection();
		
		ArrayList<Attachment> fileList = (ArrayList<Attachment>) hmap.get("fileList");
		
		int tid = 0;
		int result = 0;
		//반 공지사항 insert
		int result1 = new BoardDao().insertBanNotice(con, b);
		//반 공지사항 이미지
		if(result1 > 0) {
			tid = new BoardDao().selectBanNoticeTid(con, b);
		}
		Attachment banBImg = fileList.get(0);
		
		int result2 = new BoardDao().insertBoardImg(con, banBImg ,tid);
		
		System.out.println("result2 : "+result2);
		
		if(result1 > 0 && result2 > 0 ) {
			commit(con);
			result =1;
			
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	//반 공지사항 리스트 테이블 조회용 메소드 -한솔
	public ArrayList<Board> selectAllBanNoticeList() {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectAllBanNoticeList(con);
		
		close(con);
		
		return list;
	}
	//반 공지사항 하나 조회용 메소드 - 한솔
	public Board selectOneBoard(int num, String isUpdate) {
		Connection con = getConnection();
		
		Board b = null;
		int result = 0;
		if(isUpdate.equals("false")) {
			result = new BoardDao().updateCount(con, num);
		}
		
		if(result >0) {
			commit(con);
		}else {
			
			rollback(con);
		}
		b= new BoardDao().selectOneBoard(con, num);
		
		close(con);
		return b;

	}
	//반 공지사항 수정용 메소드
	public int updateBanBoard(Board b) {
		Connection con = getConnection();
		int result = new BoardDao().updateBanBoard(con, b);
		
		if(result >0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		return result;
	}
	//반 공지사항 삭제용 메소드 - 한솔
	public int deleteBanBoard(int num) {
		Connection con = getConnection();
		int result = new BoardDao().deleteBanBoard(con, num);
		
		if(result >0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	
	//학부모 게시판 전체 리스트
	public ArrayList<Board> selectAllParentsBoard(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectAllParentsBoard(con, currentPage, limit);
		
		close(con);
		
		return list;
	}
	
	//학부모 게시판 selectone
	public Board selectOneParentsBoard(int num) {
			Connection con = getConnection();
			
			Board b = null;
			
			int result = new BoardDao().updateParentsCount(con, num);
			
			if(result >0) {
				commit(con);
				b= new BoardDao().selectOneParentsBoard(con, num);
			}else {
				
				rollback(con);
			}
			
			close(con);
			return b;

	}
	//학부모 게시판 update
	public int updateParentBoard(Board b) {
		Connection con = getConnection();
		int result = new BoardDao().updateParentBoard(con, b);
		
		if(result >0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	
	//학부모 게시판 삭제 
	public int deleteParentBoard(int num) {
		Connection con = getConnection();
		int  result = new BoardDao().deleteParentBoard(con,num);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	




}
