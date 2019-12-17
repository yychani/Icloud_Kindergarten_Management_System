package com.oracle5.board.model.service;

import static com.oracle5.common.JDBCTemplate.close;
import static com.oracle5.common.JDBCTemplate.commit;
import static com.oracle5.common.JDBCTemplate.getConnection;
import static com.oracle5.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.HashMap;

import com.oracle5.board.model.dao.BoardDao;
import com.oracle5.board.model.vo.Board;
import com.oracle5.board.model.vo.CommonNote;
import com.oracle5.board.model.vo.Reply;
import com.oracle5.board.model.vo.Schedule;
import com.oracle5.common.model.vo.Attachment;
import com.oracle5.member.model.dao.MemberDao;
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
	//학부모 게시판 insert
	public int inserParentsBoard(HashMap<String, Object> hmap,Board b) {
		Connection con = getConnection();
		
		ArrayList<Attachment> fileList = (ArrayList<Attachment>) hmap.get("fileList");
		int pid = 0;
		int result =0;
		
		
		int result1 = new BoardDao().insertParentsBoard(con,b);
		
		if(result1 >0) {
			pid = new BoardDao().selectParentBoardTid(con,b);
			System.out.println("tid"+pid);
		}
		Attachment parBImg = fileList.get(0);
		
		int result2 = new BoardDao().insertParentBoardImg(con,parBImg,pid);
		
		
		if(result1>0 && result2>0) {
			commit(con);
			result =1;
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
			System.out.println("tid : "+tid);
		}
		int result2 = 0;
		for(int i=0; i<fileList.size(); i++) {
		ArrayList<Attachment> at = new ArrayList<>();
		Attachment banBImg = fileList.get(i);
		at.add(banBImg);
		if(banBImg.getOriginName() != null) {
			result2 = new BoardDao().insertBoardImg(con, at ,tid);
			
		}else {
			result2 = 1;
		}
		}
		
		System.out.println("b.tno : "+ b.getTno());
		System.out.println("b.bdid : "+ b.getBdid());
		System.out.println("tid : "+ tid);
		System.out.println("result1 : "+result1);
		System.out.println("result2 : "+result2);
		
		if(result1 > 0 && result2 > 0 ) {
			commit(con);
			result = 1;
			
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	//반 공지사항 리스트 테이블 조회용 메소드 -한솔
	public ArrayList<Board> selectAllBanNoticeList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectAllBanNoticeList(con,currentPage, limit);
		
		close(con);
		
		return list;
	}
	//반 공지사항 하나 조회용 메소드 - 한솔
	public Board selectOneBoard(int num, String isUpdate) {
		Connection con = getConnection();
		
		Board b1 = null;
		int tid = 0;
		int result = 0;
		if(isUpdate.equals("false")) {
			result = new BoardDao().updateCount(con, num);
		}
		
		if(result >0) {
			commit(con);
		}else {
			
			rollback(con);
		}
		
		b1= new BoardDao().selectOneBoard(con, num);
		
		
		close(con);
		return b1;

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
	public Board selectOneParentsBoard(int num ,String isUpdate) {
			Connection con = getConnection();
			
			Board b = null;
			int tid = 0;			
			int result = 0;
			
			if(isUpdate.equals("false")) {
				result = new BoardDao().updateParentsCount(con, num);
			}
			System.out.println("result   :"+result);
			if(result >0) {
				commit(con);
				
			}else {
				
				rollback(con);
			}
			b= new BoardDao().selectOneParentsBoard(con, num);
			System.out.println("b"+b);
			
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
  
  
	//반 공지사항 이미지 조회
	public ArrayList<Attachment> selectOneImg(int num) {
		Connection con = getConnection();
		ArrayList<Attachment> list = new BoardDao().selectOneImg(con,num);
		
		if(list != null) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
  
  		return list;
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
	
	//반공지사항 listCount
	public int getListCountBan() {
		Connection con = getConnection();
		
		int listCount = new BoardDao().getListCountBan(con);
		
		close(con);
		return listCount;
	}
	
	//학부모 게시판 이미지 select
	public Attachment selectOneParentBoardImg(int num) {
		Connection con = getConnection();
		Attachment att = new BoardDao().selectOneParentBoardImg(con,num);
		
		if(att != null) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
  
  		return att;
	}
	
	//앨범 게시판 listCount
	public int getChildImgListCount() {
		Connection con = getConnection();
		
		int listCount = new BoardDao().getChildImgListCount(con);
		
		close(con);
		
		return listCount;
	}
	
	//앨범 게시판 전체 리스트
	public ArrayList<Board> selectAllTcChildImgList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectAllTcChildImgList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}
	
	//앨범 게시판 insert
	public int insertChildImg(HashMap<String, Object> hmap, Board b) {
		Connection con = getConnection();
		
		ArrayList<Attachment> fileList = (ArrayList<Attachment>) hmap.get("fileList");
		int tid = 0;
		int result =0;
		
		
		int result1 = new BoardDao().insertTcChildImgBoard(con,b);
		
		if(result1 >0) {
			tid = new BoardDao().selectTcChildImgBoardTid(con,b);
			System.out.println(tid);
		}
		int result2 = 0;
		for(int i=0; i<fileList.size(); i++) {
			ArrayList<Attachment> attchment = new ArrayList<>();
			Attachment tcChildImg = fileList.get(i);
			attchment.add(tcChildImg);
		if(tcChildImg.getOriginName() != null) {
			result2 = new BoardDao().insertTcChildBoardImg(con, tcChildImg ,tid);
			
		}else {
			result2 = 1;
			}
		}
		
		if(result1 >0 && result2>0) {
			commit(con);
			result =1;
			
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	
	//앨범게시판 selectOne
	public Board selectOneTcChildImgBoard(int num, String isUpdate) {
		Connection con = getConnection();
		Board b = null;
		int result =0;
		if(isUpdate.equals("false")) {
			result = new BoardDao().updateCountChildImgBoard(con, num);
		}
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		b = new BoardDao().selectOneChildImg(con,num);
		
		close(con);
		
		
		return b;
	}
	
	//앨범게시판 이미지 보여주기
	public ArrayList<Attachment> selectOneChildImg(int num) {
		Connection con = getConnection();
		ArrayList<Attachment> attachment = new BoardDao().selectTcChildImg(con,num);
		
		if(attachment != null) {
			commit(con);
    }else {
			rollback(con);
		}
		close(con);
    return attachment;

  }

	//원 공지사항 listCount
	public int getListCountPreNotice() {
		Connection con = getConnection();
		
		int result = new BoardDao().listCountPreNotice(con);
		
		close(con);
		return result;
	}
  
	//원 공지사항 전체조회
	public ArrayList<Board> selectAllpreNoticeList(int currentPage, int limit) {
		Connection con =getConnection();
		
		ArrayList<Board> list = new BoardDao().selectAllpreNoticeList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}
  
	//원 공지사항 insert
	public int insertPreKNotice(HashMap<String, Object> hmap, Board b) {
		Connection con = getConnection();
		
		ArrayList<Attachment> fileList = (ArrayList<Attachment>) hmap.get("fileList");
		int tid = 0;
		int result =0;
		//원 공지사항 insert
		int result1 = new BoardDao().insertPreKNotice(con,b);
		//원 공지사항 이미지
		if(result1 > 0) {
			tid = new BoardDao().selectPreKNoticeTid(con,b);
		}
		int result2 = 0;
		for(int i=0; i<fileList.size(); i++) {
			ArrayList<Attachment> at = new ArrayList<>();
			Attachment preKImg = fileList.get(i);	
			at.add(preKImg);
			if(preKImg.getOriginName() != null) {
				result2= new BoardDao().insertPreKImg(con, at, tid);
			}else {
				result2 =1;
			}
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(con);
			result =1;
    }else {
			rollback(con);
		}
		
		close(con);
    
    		return result;
	}
	
	//원공지사항 게시글 보기
	public Board selectOnePreKNotice(int num, String isUpdate) {
		Connection con = getConnection();
		
		Board b1 = null;
		int tid = 0;
		int result =0;
		if(isUpdate.equals("false")) {
			result = new BoardDao().updatePreKNoticeCount(con, num);
		}
		
		if(result >0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		b1 = new BoardDao().selectOnePreKNotice(con,num);
		
		close(con);
		
		return b1;
	}
	//원공지사항 게시물 이미지 보기
	public ArrayList<Attachment> selectOnePreKNoticeImg(int num) {
		Connection con  = getConnection();
		ArrayList<Attachment> list = new BoardDao().selectOnePreKNoticeImg(con, num);
		
		if(list != null) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return list;
	}
	//원 공지사항 수정용 매소드
	public int updatePreKNotice(Board b) {
		Connection con =getConnection();
		int result = new BoardDao().updatePreKNotice(con,b);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	//원 공지사항 삭제용 메소드
	public int deletePreKNotice(int num) {
		Connection con = getConnection();
		int result = new BoardDao().deletePreKNotice(con, num);
		
		if(result >0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return result;
	}
	
	//앨범 사진 다운로드 
	public Attachment selectOneDownImg(int num) {
		Connection con = getConnection();
		Attachment file = new BoardDao().selectOneDownImg(con,num);
		
		close(con);
		return file;
	}
	
	//앨범 수정 상세 보기 
	public Board selectOneUpdateChilImge(int num, String isUpdate) {
		Connection con = getConnection();
		Board b = null;
		int tid = 0;
		int result = 0;
		if(isUpdate.equals("false")) {
			result = new BoardDao().updateChildImgCountF(con,num);
		}
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		b = new BoardDao().selectOneUpdateChilImge(con,num);
		
		close(con);
		
		
		return b;
	}

	public int deleteChildImgBoard(int num) {
		Connection con = getConnection();
		int result = new BoardDao().deleteChildImgBoard(con, num);
		
		if(result >0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int updateChildImg(HashMap<String, Object> hmap, Board b) {
		Connection con = getConnection();
		
		ArrayList<Attachment> fileList = (ArrayList<Attachment>) hmap.get("fileList");
		int tid = 0;
		int result =0;
		
		tid = new BoardDao().selectTcChildImgBoardTid2(con,b);
		Attachment tcChildImg = fileList.get(0);
		int result2 = 0;
		if(tcChildImg.getOriginName() != null) {
			result2 = new BoardDao().updateChildImg(con, tcChildImg ,tid);	
		}else {
			result2 = 1;
		}
		
		
		if(result2 > 0 ) {
			commit(con);
			result = 1;
			
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int insertTcNote(CommonNote cNote, int tno) {
		Connection con = getConnection();
		
		int result = new BoardDao().insertTcNote(con, cNote, tno);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public String selectTcNote(Date date, int tno) {
		Connection con = getConnection();
		
		String dateCont = new BoardDao().selectTcNote(con, date, tno);
		
		close(con);
		
		return dateCont;
	}

	public ArrayList<CommonNote> selectAllTcNote(int tno) {
		Connection con = getConnection();
		
		ArrayList<CommonNote> list = new BoardDao().selectAllTcNote(con, tno);
		
		close(con);
		
		return list;
	}


	//유치원 운영 위원회 게시판 insert
	public int insertPreHBoard(HashMap<String, Object> hmap, Board b) {
		Connection con = getConnection();
		
		ArrayList<Attachment> fileList = (ArrayList<Attachment>) hmap.get("fileList");
		int tid=0;
		int result = 0;
		
		//유치원 운영 위원회 insert
		int result1= new BoardDao().insertPreHBoard(con,b);
		//유치원 운영위원회 이미지 insert
		if(result1>0) {
			tid = new BoardDao().selectPreHBoardTid(con,b);
		}
		int result2 = 0;
		for(int i=0; i<fileList.size(); i++) {
			ArrayList<Attachment> at = new ArrayList<>();
			Attachment preHImg = fileList.get(i);
			at.add(preHImg);
			if(preHImg.getOriginName() != null) {
				result2 = new BoardDao().insertPreHImg(con,at,tid);
			}else {
				result2= 1;
			}
		}
		
		if(result1 >0 && result2>0) {
			commit(con);
			result =1;
			
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	//유치원 운영 위원회 listCount
	public int getListCountPreHNotice() {
		Connection con = getConnection();
		
		int result = new BoardDao().listCountPreHBoard(con);
		
		close(con);
		
		return result;
	}

	//유치원 운영위원회 전체 조회
	public ArrayList<Board> selectAllPreHBoard(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectAllPreHBoard(con,currentPage,limit);
		
		close(con);
		
		return list;
	}

	//유치원 운영 위원회 게시글 보기
	public Board selectOnePreHBoard(int num, String isUpdate) {
		Connection con = getConnection();
		Board b = null;
		int tid=0;
		int result=0;
		if(isUpdate.equals("false")) {
			result = new BoardDao().updatePreHBoardCount(con, num);
		}
		
		if(result >0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		b= new BoardDao().selectOnePreHBoard(con,num);
		
		return b;
	}
  
	//유치원 운영 위원회 게시글이미지 보기
	public ArrayList<Attachment> selectOnePreHBoardImg(int num) {
		Connection con = getConnection();
		ArrayList<Attachment> list = new BoardDao().selectOnePreHBoardImg(con, num);
		
		if(list != null) {
			commit(con);
		}else {
			rollback(con);
		}
		return list;
	}

	//가정통신문 리스트
	public ArrayList<Board> selectAllTcFamilyList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectAllTcFamilyList(con,currentPage,limit);
		
		close(con);
		
		
		return list;
	}
  
	//가정 통신문 리스트 카운트
	public int getFamilyListCount() {
		Connection con = getConnection();
		
		int listCount = new BoardDao().getFamilyListCount(con);
		
		close(con);
		
		return listCount;
	}
	
	//가정통신문 insert
	public int insertFLetter(HashMap<String, Object> hmap, Board b) {
		Connection con = getConnection();
		
		ArrayList<Attachment> fileList = (ArrayList<Attachment>) hmap.get("fileList");
		
		int tid = 0;
		int result = 0;
		//가정통신문 
		int result1 = new BoardDao().insertFLetter(con, b);
		if(result1 > 0) {
			tid = new BoardDao().selectFLetterTid(con, b);
			
		}
		int result2 = 0;
		for(int i=0; i<fileList.size(); i++) {
			ArrayList<Attachment> attchment = new ArrayList<>();
			Attachment tcFL = fileList.get(i);
			attchment.add(tcFL);
		if(tcFL.getOriginName() != null) {
			result2 = new BoardDao().insertFLetterImg(con, tcFL ,tid);
			
		}else {
			result2 = 1;
			}
		}
		
		if(result1 >0 && result2>0) {
			commit(con);
			result =1;
			
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	
	//가정 통신문 selectOne
	public Board selectOneFLetter(int num, String isUpdate) {
		Connection con = getConnection();
		
		Board b = null;
		int tid = 0;
		int result = 0;
		if(isUpdate.equals("false")) {
			result = new BoardDao().updateFLetterCount(con, num);
		}
		
		if(result >0) {
			commit(con);
		}else {
			
			rollback(con);
		}
		
		b= new BoardDao().selectOneFLetter(con, num);
		
		
		close(con);
		
		return b;

	}


	public Board selectOneUpdateTcL(int num, String isUpdate) {
		Connection con = getConnection();
		
		Board b = null;
		int tid = 0;
		int result = 0;
		if(isUpdate.equals("false")) {
			result = new BoardDao().updateCountTcL(con, num);
		}
		
		if(result >0) {
			commit(con);
		}else {
			
			rollback(con);
		}
		
		b= new BoardDao().selectOneUpdateTcL(con, num);
		
		
		close(con);
		return b;

	}
	//가정통신문 수정 update
	public int updateTcFamilyLetter(Board b) {
		Connection con = getConnection();
		int result = new BoardDao().updateTcFamilyLetter(con, b);
		
		if(result >0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		return result;
	}
	//가정통신문 삭제
	public int deleteTcFamilyLetter(int num) {
		Connection con = getConnection();
		int result = new BoardDao().deleteTcFamilyLetter(con, num);
		
		if(result >0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	//앨범 리
	public ArrayList<Board> insertReplyChildImg(Board b) {
		Connection con = getConnection();
		ArrayList<Board> replyList = null;
		
		int result = new BoardDao().insertReplyChildImg(con,b);
		
		if(result>0) {
			commit(con);
			replyList = new BoardDao().selectReplyChildImg(con,b.getTid());
		}else {
			rollback(con);
		}
		
		close(con);
		return replyList;
	}

	//학부모 운영 위원회 게시판 수정용 메소드
	public int updatePreHBoard(Board b) {
		Connection con = getConnection();
		int result = new BoardDao().updatePreHBoard(con, b);
		
		if(result >0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	//학부모 위원회 게시판 삭제용 메소드
	public int deletePreHBoard(int num) {
		Connection con =getConnection();
		
		int result = new BoardDao().deletePreHBoard(con, num);
		
		if(result >0) {
			commit(con);
		}else {
			rollback(con);
		}
		return result;
	}

	public ArrayList<Reply> insertReplyPreHBoard(Reply r) {
		Connection con = getConnection();
		ArrayList<Reply> replyList = null;
		
		int result = new BoardDao().insertReplyPreHBoard(con, r);
		
		if(result >0) {
			commit(con);
			replyList = new BoardDao().selectPreHBoardReplyList(con, r.getTid());
			System.out.println(replyList);
		}else {
			rollback(con);
		}
		return replyList;
	}
	
	//앨범 수정 
	public int updateChildImges(Board b) {
		Connection con = getConnection();
		int result = new BoardDao().updateChildImges(con, b);
		
		if(result >0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		return result;
	}
	
	
	//test앨범 one
	public int updateChildoneImg(HashMap<String, Object> hmap, Board b) {
		Connection con = getConnection();
		
		ArrayList<Attachment> fileList = (ArrayList<Attachment>) hmap.get("fileList");
		int tid = 0;
		int result =0;

		int result1 = new BoardDao().insertTcChildImgBoardone(con,b);
		
		if(result1 >0) {
			tid = new BoardDao().selectTcChildImgBoardOneTid(con,b);
			System.out.println(tid);
		}
		int result2 = 0;
		for(int i=0; i<fileList.size(); i++) {
			ArrayList<Attachment> attchment = new ArrayList<>();
			Attachment oneimgch = fileList.get(i);
			attchment.add(oneimgch);
		if(oneimgch.getOriginName() != null) {
			result2 = new BoardDao().insertTcChildBoardOneImg(con, oneimgch ,tid);
			
		}else {
			result2 = 1;
			}
		}
		
		if(result2>0) {
			commit(con);
			result =1;
			
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	//가정통신문 selectOne IMG
		public ArrayList<Attachment> selectOneFLetterImg(int num) {
			Connection con = getConnection();
			ArrayList<Attachment> list = new BoardDao().selectOneFLetterImg(con,num);
			
			if(list != null) {
				commit(con);
			}else {
				rollback(con);
			}
			
			close(con);
	  
	  		return list;
		}

	//선생님 게시판 전체 리스트 카운트용 메소드
	public int getListCountTctcBoard() {
		Connection con = getConnection();
		
		int result = new BoardDao().listCountTctcBoard(con);
		
		close(con);
		return result;
	}

	//선생님 게시판 전체조회용 메소드
	public ArrayList<Board> selectAllTctcBoard(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectAllTctcBoard(con,currentPage,limit);
		
		close(con);
		
		return list;
	}

	//선생님 게시판 insert 메소드
	public int insertTctcBoard(HashMap<String, Object> hmap, Board b) {
		Connection con = getConnection();
		
		ArrayList<Attachment> fileList = (ArrayList<Attachment>) hmap.get("fileList");
		int tid = 0;
		int result =0;
		//선생님 게시판 insert
		int result1= new BoardDao().insertTctcBoard(con, b);
		//선생님 게시판 이미지
		if(result >0) {
			tid = new BoardDao().selectTctcBoardTid(con, b);
		}
		int result2 = 0;
		for(int i=0; i<fileList.size(); i++) {
			ArrayList<Attachment> at = new ArrayList<>();
			Attachment tctcImg = fileList.get(i);
			at.add(tctcImg);
			if(tctcImg.getOriginName() != null) {
				result2 = new BoardDao().insertTctcImg(con,at,tid);
			}else {
				result2 =1;
			}
		}
		
		if(result1 >0 && result2 >0) {
			commit(con);
			result=1;
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	//선생님 게시판 게시글 보기
	public Board selectOneTctcBoard(int num, String isUpdate) {
		Connection con = getConnection();
		
		Board b = null;
		int tid =0; 
		int result = 0;
		if(isUpdate.equals("false")) {
			result = new BoardDao().updateTctcBoardCount(con, num);
		}
		
		if(result >0) {
			commit(con);	
		}else {
			rollback(con);
		}
		
		b= new BoardDao().selectOneTctcBoard(con, num);
		close(con);
		
		return b;
	}

	//선생님 게시판 이미지 보기
	public ArrayList<Attachment> selectOneTctcBoardImg(int num) {
		Connection con = getConnection();
		ArrayList<Attachment> list = new BoardDao().selectOneTctcBoardImg(con, num);
		
		if(list != null) {
			commit(con);
			
		}else {
			rollback(con);
		}
		
		close(con);
		
		return list;
	}
	

	//앨범 하나 수정 넣기
	public int updateinsertChildImg(HashMap<String, Object> hmap, int fid) {
		Connection con = getConnection();
		ArrayList<Attachment> fileList = (ArrayList<Attachment>) hmap.get("fileList");
		int result = 0;
		
		int result2 = 0;
		for(int i=0; i<fileList.size(); i++) {
			ArrayList<Attachment> attchment = new ArrayList<>();
			Attachment tcChildImgOne = fileList.get(i);
			attchment.add(tcChildImgOne);
		if(tcChildImgOne.getOriginName() != null) {
			result2 = new BoardDao().insertTcChildImgOne(con, tcChildImgOne ,fid);
			
		}else {
			result2 = 1;
			}
		}
		
		if(result2>0) {
			commit(con);
			result =1;
			
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<Attachment> selectUpdateOneImg(int fid) {
		// TODO Auto-generated method stub
		return null;
	}

	/** 선생 건의 문의 게시판 보기
	 * @param tno 건의 문의 내용 보려는 교사번호
	 * @return
	 */
	public ArrayList<Board> selectQnA(int tno) {
		Connection con = getConnection();
		
		ArrayList<Board> qnaList = new BoardDao().selectQnA(con, tno);
		
		close(con);
		return qnaList;
	}
		

}












