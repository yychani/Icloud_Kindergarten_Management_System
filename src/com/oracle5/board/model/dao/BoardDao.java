package com.oracle5.board.model.dao;

import static com.oracle5.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.oracle5.board.model.vo.Board;
import com.oracle5.board.model.vo.CommonNote;
import com.oracle5.board.model.vo.Reply;
import com.oracle5.board.model.vo.Schedule;
import com.oracle5.common.model.vo.Attachment;
import com.oracle5.member.model.vo.Ban;
import com.oracle5.member.model.vo.Children;
import com.oracle5.member.model.vo.Parents;

public class BoardDao {
	Properties prop = new Properties();

	public BoardDao() {
		String fileName = BoardDao.class.getResource("/sql/board/board-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public String selectPreNote(Connection con, Date date) {
		String dateCont = "";
		ResultSet rset = null;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("selectPreNote");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setDate(1, date);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				dateCont = rset.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return dateCont;
	}

	public int insertPreNote(Connection con, CommonNote cNote) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertPreNote");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setDate(1, cNote.getDate());
			pstmt.setString(2, cNote.getNote());
			pstmt.setString(3, cNote.getNote());
			pstmt.setDate(4, cNote.getDate());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public ArrayList<CommonNote> selectAllPreNote(Connection con) {
		ResultSet rset = null;
		Statement stmt = null;
		ArrayList<CommonNote> list = null;

		String query = prop.getProperty("selectAllPreNote");

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(query);

			if (rset != null) {
				list = new ArrayList<>();
				while (rset.next()) {
					CommonNote cn = new CommonNote();

					cn.setNote(rset.getString("NOTE"));
					cn.setDate(rset.getDate("C_DATE"));
					cn.setTNo(rset.getInt("T_NO"));

					list.add(cn);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return list;
	}

	public ArrayList<Schedule> selectAllSchedule(Connection con) {
		ResultSet rset = null;
		Statement stmt = null;
		ArrayList<Schedule> list = null;

		String query = prop.getProperty("selectAllSchedule");

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(query);

			if (rset != null) {
				list = new ArrayList<>();
				while (rset.next()) {
					Schedule sch = new Schedule();

					sch.setDate(rset.getDate("SC_DATE"));
					sch.setContent(rset.getString("CONTENT"));

					list.add(sch);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return list;
	}

	public String selectSchedule(Connection con, Date date) {
		String dateCont = "";
		ResultSet rset = null;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("selectSchedule");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setDate(1, date);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				dateCont = rset.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return dateCont;
	}

	public int insertSchedule(Connection con, Schedule sch) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertSchedule");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setDate(1, sch.getDate());
			pstmt.setString(2, sch.getContent());
			pstmt.setDate(3, sch.getDate());
			pstmt.setString(4, sch.getContent());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int getChildCount(Connection con) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("childCount");

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(query);

			if (rset.next()) {
				listCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> selectChild(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> hmapList = null;

		String query = prop.getProperty("selectChildren");

		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			if (rset != null) {
				hmapList = new ArrayList<>();

				while (rset.next()) {
					HashMap<String, Object> hmap = new HashMap();
					Children c = new Children();
					c.setCId(rset.getInt("C_ID"));
					c.setBcNo(rset.getInt("RNUM"));
					c.setName(rset.getString("C_NAME"));
					c.setPno(rset.getInt("M_NO"));

					Parents p = new Parents();
					p.setPNo(rset.getInt("M_NO"));
					p.setPAddress(rset.getString("NAME"));

					Ban b = new Ban();
					b.setBanName(rset.getString("B_NAME"));
					
					hmap.put("Children", c);
					hmap.put("Parents", p);
					hmap.put("Ban", b);
					
					hmapList.add(hmap);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return hmapList;
	}

	public int getListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("listCount");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
		
		if(rset.next()) {
			listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
	
		return listCount;
	}

	public ArrayList<Board> selectBoardPageing(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectBoardPageing");
		
		int startRow = (currentPage -1 ) * limit +1;
		int endRow = startRow + limit -1;
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<Board>();
			
			while(rset.next()) {
				Board b = new Board();
				
				b.setTid(rset.getInt("T_ID"));
				b.setTtitle(rset.getString("T_TITLE"));
				b.setTwriter(rset.getInt("T_WRITER"));
				b.setTcount(rset.getInt("T_COUNT"));
				b.setTtime(rset.getDate("T_TIME"));
				
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return list;
	}

	public int getListCountThumbnail(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("listCountThumbnail");
		
		try {
			stmt = con.createStatement();
			
		rset = stmt.executeQuery(query);
		
		if(rset.next()) {
			listCount = rset.getInt(1);
			
			
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
	
		return listCount;
	}

	public ArrayList<Board> selectBoardPageingThumbnail(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectBoardPageingThumbnail");
		
		int startRow = (currentPage -1 ) * limit +1;
		int endRow = startRow + limit -1;
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<Board>();
			
			while(rset.next()) {
				Board b = new Board();
				
				b.setTid(rset.getInt("T_ID"));
				b.setTtitle(rset.getString("T_TITLE"));
				b.setTwriter(rset.getInt("T_WRITER"));
				b.setTcount(rset.getInt("T_COUNT"));
				b.setTtime(rset.getDate("T_TIME"));
				
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return list;
	}


	public int insertParentsBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertparentsBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, b.getTtitle());
			pstmt.setString(2, b.getTcont());
			pstmt.setInt(3, b.getPno());
			pstmt.setInt(4, b.getBdid());
			
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		return result;
	}

	//반공지사항 등록 - 한솔
	public int insertBanNotice(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBanNotice");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getTtitle());
			pstmt.setString(2, b.getTcont());
			pstmt.setInt(3, b.getTno());
			pstmt.setInt(4, b.getBdid());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	//반 공지사항 테이블 조회용 리스트 - 한솔selectAllBanNoticeList
	public ArrayList<Board> selectAllBanNoticeList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectAllBanNoticeList");
		int startRow = (currentPage -1 ) * limit +1;
		int endRow = startRow + limit -1;
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
				list = new ArrayList<Board>();
				while(rset.next()) {
					Board b = new Board();
					b.setTid(rset.getInt("T_ID"));
					b.setTtitle(rset.getString("T_TITLE"));
					b.setName(rset.getString("NAME"));
					b.setTcount(rset.getInt("T_COUNT"));
					b.setTtime(rset.getDate("T_TIME"));
					b.setPno(rset.getInt("RNUM"));
					System.out.println(b);
					
					list.add(b); 
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}
public ArrayList<Board> selectAllParentsBoar(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectAllParentsBoard");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, 6);
			
			rset = pstmt.executeQuery();
			
			if(rset!=null) {
				list = new ArrayList<>();
				while(rset.next()) {
					Board b = new Board();
					b.setTid(rset.getInt("T_ID"));
					b.setTtitle(rset.getString("T_TITLE"));
					b.setTcont(rset.getString("T_CONT"));
					b.setTwriter(rset.getInt("T_WRITER"));
					b.setTcount(rset.getInt("T_COUNT"));
					b.setTtime(rset.getDate("T_TIME"));
					b.setTno(rset.getInt("T_NO"));
					b.setPno(rset.getInt("P_NO"));
					b.setBdid(rset.getInt("BD_ID"));
					b.setTstmt(rset.getString("T_STMT"));
					
					list.add(b); 
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return list;

	}
	// 반 공지사항 조회수 업데이트용 메소드 -한솔

	public int updateCount(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, num);
			pstmt.setInt(2, num);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	// 반 공지사항 글 중 하나 조회하는 메소드 - 한솔
	public Board selectOneBoard(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;
		
		String query = prop.getProperty("selectOneBoard");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b= new Board();
				
				b.setTid(rset.getInt("T_ID"));
				b.setTtitle(rset.getString("T_TITLE"));
				b.setTcont(rset.getString("T_CONT"));
				b.setName(rset.getString("NAME"));
				b.setTcount(rset.getInt("T_COUNT"));
				b.setTtime(rset.getDate("T_TIME"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return b;
	}
	//반 공지사항 수정용 메소드
	public int updateBanBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = prop.getProperty("updateBanBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getTtitle());
			pstmt.setString(2, b.getTcont());
			pstmt.setInt(3, b.getTid());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}
	// 반 공지사항 delete
	public int deleteBanBoard(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = prop.getProperty("deleteBanBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int insertBoardImg(Connection con, ArrayList<Attachment>at, int tid) {
		PreparedStatement pstmt = null;
		int result =0;
		ArrayList<Attachment> file= null;
		
		String query = prop.getProperty("insertBanBImg");
		
		try {
			for(int i=0; i<at.size(); i++) {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, at.get(i).getOriginName());
			pstmt.setString(2, at.get(i).getChangeName());
			pstmt.setString(3, at.get(i).getFilePath());
			pstmt.setInt(4, tid);
			}
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//학부모 게시판 all list
	public ArrayList<Board> selectAllParentsBoard(Connection con, int currentPage, int limit ) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectAllParentsBoard");
		int startRow = (currentPage -1 ) * limit +1;
		int endRow = startRow + limit -1;
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
				list = new ArrayList<Board>();
				while(rset.next()) {
					Board b = new Board();
					b.setTid(rset.getInt("T_ID"));
					b.setTtitle(rset.getString("T_TITLE"));
					b.setName(rset.getString("NAME"));
					b.setTcount(rset.getInt("T_COUNT"));
					b.setTtime(rset.getDate("T_TIME"));
					b.setPno(rset.getInt("RNUM"));
					
			
			
					
					list.add(b); 
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}
	
	//학부모 게시판 updatecount
	public int updateParentsCount(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = prop.getProperty("updateParentsCount");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, num);
			pstmt.setInt(2, num);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//학부모 게시판 selectOneBoard
	public Board selectOneParentsBoard(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;
		
		String query = prop.getProperty("selectOneParentsBoard");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b= new Board();
				
				b.setTid(rset.getInt("T_ID"));
				b.setTtitle(rset.getString("T_TITLE"));
				b.setTcont(rset.getString("T_CONT"));
				b.setName(rset.getString("NAME"));
				b.setTcount(rset.getInt("T_COUNT"));
				b.setTtime(rset.getDate("T_TIME"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return b;
	}
	//학부모 게시판 update
	public int updateParentBoard(Connection con, Board b) {
		
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = prop.getProperty("updateParentBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getTtitle());
			pstmt.setString(2, b.getTcont());
			pstmt.setInt(3, b.getTid());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int deleteParentBoard(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteParentBoard");
		
		try {
			pstmt = con.prepareStatement(query);	
			pstmt.setInt(1, num);	
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int selectBanNoticeTid(Connection con, Board b) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("selectBanNoticeTid");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, b.getTno());
			pstmt.setInt(2, b.getBdid());
			
			System.out.println("tno"+b.getTno());
			System.out.println("bdid"+b.getBdid());
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Attachment> selectOneImg(Connection con, int num) {
		PreparedStatement pstmt = null;
		ArrayList<Attachment> list = new ArrayList<>();
		Attachment at = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectOneImg");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				at = new Attachment();
				
				at.setFid(rset.getInt("F_ID"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
				at.setUploadDate(rset.getDate("UPLOAD_DATE"));
				at.setFileLevel(rset.getInt("FILE_LEVEL"));
				at.setStatus(rset.getString("STATUS"));
				at.setType(rset.getInt("TYPE"));
				at.setCId(rset.getInt("C_ID"));
				at.setFeedNo(rset.getInt("FEEDNO"));
				at.setTId(rset.getInt("T_ID"));
				
				list.add(at);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	//반 리스트 공지사항 보기
	public int getListCountBan(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("listCountBan");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
		
		if(rset.next()) {
			listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
	
		return listCount;
	}

	public int selectParentBoardTid(Connection con, Board b) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("selectParentBoardtid");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, b.getPno());
			pstmt.setInt(2, b.getBdid());
			
			System.out.println("tno"+b.getPno());
			System.out.println("bdid"+b.getBdid());
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	//반 공지사항 이미지 삽입 한솔
	public int insertParentBoardImg(Connection con, Attachment parBImg, int tid) {
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = prop.getProperty("insertParentBoardImg");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, parBImg.getOriginName());
			pstmt.setString(2, parBImg.getChangeName());
			pstmt.setString(3, parBImg.getFilePath());
			pstmt.setInt(4, tid);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//학부모 게시판 이미지 보기
	public ArrayList<Attachment> selectOneParentBoardImg(Connection con, int num) {
		PreparedStatement pstmt = null;
		ArrayList<Attachment> list = new ArrayList<>();
		Attachment att = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectOneFLetterImg");
		
		try {
	         pstmt = con.prepareStatement(query);
	         pstmt.setInt(1, num);
	         
	         rset = pstmt.executeQuery();
	         while(rset.next()) {
	            att = new Attachment();
	            
	            att.setFid(rset.getInt("F_ID"));
	            att.setOriginName(rset.getString("ORIGIN_NAME"));
	            att.setChangeName(rset.getString("CHANGE_NAME"));
	            att.setFilePath(rset.getString("FILE_PATH"));
	            att.setUploadDate(rset.getDate("UPLOAD_DATE"));
	            att.setFileLevel(rset.getInt("FILE_LEVEL"));
	            att.setStatus(rset.getString("STATUS"));
	            att.setType(rset.getInt("TYPE"));
	            att.setCId(rset.getInt("C_ID"));
	            att.setFeedNo(rset.getInt("FEEDNO"));
	            att.setTId(rset.getInt("T_ID"));
	            
	            list.add(att);
	         }
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }finally {
	         close(rset);
	         close(pstmt);
	      }
	      
	      return list;
	   }
  
	
	//앨범 게시판 리스트 카운트
	public int getChildImgListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("getChildImgListCount");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
		
		if(rset.next()) {
			listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
	
		return listCount;
	}
	
	//앨범 리스트 보여 주기
	public ArrayList<Board> selectAllTcChildImgList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectAllTcChildImgList");
		int startRow = (currentPage -1 ) * limit +1;
		int endRow = startRow + limit -1;
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
				list = new ArrayList<Board>();
				while(rset.next()) {
					Board b = new Board();
					b.setTid(rset.getInt("T_ID"));
					b.setTtitle(rset.getString("T_TITLE"));
					b.setName(rset.getString("NAME"));
					b.setTcount(rset.getInt("T_COUNT"));
					b.setTtime(rset.getDate("T_TIME"));
					b.setPno(rset.getInt("RNUM"));
					
			
			
					
					list.add(b); 
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}
	//원 공지사항 listCount 한솔
	public int listCountPreNotice(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("listCountPreNotice");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		
		
		return listCount;
	}
	//원 공지사항 전체 조회
	public ArrayList<Board> selectAllpreNoticeList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectAllpreNoticeList");
		int startRow = (currentPage -1) * limit +1;
		int endRow = startRow + limit -1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			while(rset.next()) {
				Board b = new  Board();
				b.setTid(rset.getInt("T_ID"));
				b.setTtitle(rset.getString("T_TITLE"));
				b.setName(rset.getString("NAME"));
				b.setTcount(rset.getInt("T_COUNT"));
				b.setTtime(rset.getDate("T_TIME"));
				b.setPno(rset.getInt("RNUM"));
				
				list.add(b);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}
	//원 공지사항 글 isnert
	public int insertPreKNotice(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertPreKNotice");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getTtitle());
			pstmt.setString(2, b.getTcont());
			pstmt.setInt(3, b.getTno());
			pstmt.setInt(4, b.getBdid());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	//원 공지사항 tid 찾기
	public int selectPreKNoticeTid(Connection con, Board b) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result =0;
		
		String query = prop.getProperty("selectPreKNoticeTid");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, b.getTno());
			pstmt.setInt(2, b.getBdid());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	//원 공지사항 이미지 삽입
	public int insertPreKImg(Connection con, ArrayList<Attachment> at, int tid) {
		PreparedStatement pstmt = null;
		int result =0;
		ArrayList<Attachment> file = null;
		
		
		String query = prop.getProperty("insertPreKImg");
		
		try {
			for(int i=0; i<at.size(); i++) {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, at.get(i).getOriginName());
			pstmt.setString(2, at.get(i).getChangeName());
			pstmt.setString(3, at.get(i).getFilePath());
			pstmt.setInt(4, tid);
			}
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//앨범 insert
	public int insertTcChildImgBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertTcChildImgBoard");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getTtitle());
			pstmt.setString(2, b.getTcont());
			pstmt.setInt(3, b.getTno());
			pstmt.setInt(4, b.getBdid());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//앨범  Tid
	public int selectTcChildImgBoardTid(Connection con, Board b) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("selectTcChildImgBoardTid");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, b.getTno());
			pstmt.setInt(2, b.getBdid());

			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	
	//앨범 insert Img
	public int insertTcChildBoardImg(Connection con, Attachment tcChildImg, int tid) {
		PreparedStatement pstmt = null; 
		int result =0;
		ArrayList<Attachment> file = null;
		
		String query = prop.getProperty("insertTcChildBoardImg");
									
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, tcChildImg.getOriginName());
			pstmt.setString(2, tcChildImg.getChangeName());
			pstmt.setString(3, tcChildImg.getFilePath());
			pstmt.setInt(4, tid);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//앨범 updateCount
	public int updateCountChildImgBoard(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCountChildImgBoard");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, num);
			pstmt.setInt(2, num);
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//앨범 selectone 
	public Board selectOneChildImg(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;
		
		String query = prop.getProperty("selectOneChildImg");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board();
				
				b.setTid(rset.getInt("T_ID"));
				b.setTtitle(rset.getString("T_TITLE"));
				b.setTcont(rset.getString("T_CONT"));
				b.setName(rset.getString("NAME"));
				b.setTcount(rset.getInt("T_COUNT"));
				b.setTtime(rset.getDate("T_TIME"));
				
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
			
		}
		
		
		return b;
	}
	
	//앨범 img 보기
	public ArrayList<Attachment> selectTcChildImg(Connection con, int num) {
		PreparedStatement pstmt = null;
		ArrayList<Attachment> list = new ArrayList<>();
		Attachment att = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectTcChildImg");
		
		 try {
	         pstmt = con.prepareStatement(query);
	         pstmt.setInt(1, num);
	         
	         rset = pstmt.executeQuery();
	         while(rset.next()) {
	            att = new Attachment();
	            
	            att.setFid(rset.getInt("F_ID"));
	            att.setOriginName(rset.getString("ORIGIN_NAME"));
	            att.setChangeName(rset.getString("CHANGE_NAME"));
	            att.setFilePath(rset.getString("FILE_PATH"));
	            att.setUploadDate(rset.getDate("UPLOAD_DATE"));
	            att.setFileLevel(rset.getInt("FILE_LEVEL"));
	            att.setStatus(rset.getString("STATUS"));
	            att.setType(rset.getInt("TYPE"));
	            att.setCId(rset.getInt("C_ID"));
	            att.setFeedNo(rset.getInt("FEEDNO"));
	            att.setTId(rset.getInt("T_ID"));
	            
	            list.add(att);
	         }
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }finally {
	         close(rset);
	         close(pstmt);
	      }
	      
	      return list;
	   }
	//원 공지사항 조회수용 메소드-한솔
	public int updatePreKNoticeCount(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = prop.getProperty("updatePreKNoticeCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			pstmt.setInt(2, num);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	//원 공지사항 하나 조회용 메소드 -한솔
	public Board selectOnePreKNotice(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;
		String query = prop.getProperty("selectOnePreKNotice");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board();
				
				b.setTid(rset.getInt("T_ID"));
				b.setTtitle(rset.getString("T_TItle"));
				b.setTcont(rset.getString("T_CONT"));
				b.setName(rset.getString("NAME"));
				b.setTcount(rset.getInt("T_COUNT"));
				b.setTtime(rset.getDate("T_TIME"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return b;
	}

	//앨범 다운로드
	public Attachment selectOneDownImg(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Attachment file = null;
		
		String query = prop.getProperty("selectOneDownImg");
		
		try {
			pstmt =con.prepareStatement(query);
      pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
      file = new Attachment();
				
				file.setFid(rset.getInt("F_ID"));
				file.setOriginName(rset.getString("ORIGIN_NAME"));
				file.setChangeName(rset.getString("CHANGE_NAME"));
				file.setFilePath(rset.getString("FILE_PATH"));
				file.setUploadDate(rset.getDate("UPLOAD_DATE"));
				file.setFileLevel(rset.getInt("FILE_LEVEL"));
				file.setStatus(rset.getString("STATUS"));
				file.setType(rset.getInt("TYPE"));
				file.setCId(rset.getInt("C_ID"));
				file.setFeedNo(rset.getInt("FEEDNO"));
				file.setTId(rset.getInt("T_ID"));
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return file;
}
      
	public ArrayList<Attachment> selectOnePreKNoticeImg(Connection con, int num) {
		PreparedStatement pstmt = null;
		ArrayList<Attachment> list = new ArrayList<>();
		Attachment att = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectOnePreKNoticeImg");
		
		try {
			pstmt = con.prepareStatement(query);
      			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
			
				att = new Attachment();
				
				att.setFid(rset.getInt("F_ID"));
				att.setOriginName(rset.getString("ORIGIN_NAME"));
				att.setChangeName(rset.getString("CHANGE_NAME"));
				att.setFilePath(rset.getString("FILE_PATH"));
				att.setUploadDate(rset.getDate("UPLOAD_DATE"));
				att.setFileLevel(rset.getInt("FILE_LEVEL"));
				att.setStatus(rset.getString("STATUS"));
				att.setType(rset.getInt("TYPE"));
				att.setCId(rset.getInt("C_ID"));
				att.setFeedNo(rset.getInt("FEEDNO"));
				att.setTId(rset.getInt("T_ID"));
				
				list.add(att);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
			
		return list;
	}

	//원 공지사항 수정용 메소드
	public int updatePreKNotice(Connection con,Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updatePreKNotice");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getTtitle());
			pstmt.setString(2, b.getTcont());
			pstmt.setInt(3, b.getTid());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deletePreKNotice(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deletePreKNotice");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;

	}
	//앨범 카운트 FALSE
	public int updateChildImgCountF(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = prop.getProperty("updateChildImgCountF");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, num);
			pstmt.setInt(2, num);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//앨범 SELECTONE UPDATEPAGE
	public Board selectOneUpdateChilImge(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;
		
		String query = prop.getProperty("selectOneUpdateChilImge");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b= new Board();
				
				b.setTid(rset.getInt("T_ID"));
				b.setTtitle(rset.getString("T_TITLE"));
				b.setTcont(rset.getString("T_CONT"));
				b.setName(rset.getString("NAME"));
				b.setTcount(rset.getInt("T_COUNT"));
				b.setTtime(rset.getDate("T_TIME"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return b;
	}
	
	//앨범 게시판 게시판 삭제
	public int deleteChildImgBoard(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = prop.getProperty("deleteChildImgBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	//앨범 수정 tid값 가져오기
	public int selectTcChildImgBoardTid2(Connection con, Board b) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("selectTcChildImgBoardTid2");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, b.getTno());
			pstmt.setInt(2, b.getBdid());

			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//앨범 수정 이미지 insert
	public int updateChildImg(Connection con, Attachment tcChildImg, int tid) {
		PreparedStatement pstmt = null; 
		int result =0;
		
		String query = prop.getProperty("updateChildImg");
									
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, tcChildImg.getOriginName());
			pstmt.setString(2, tcChildImg.getChangeName());
			pstmt.setString(3, tcChildImg.getFilePath());
			pstmt.setInt(4, tid);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertTcNote(Connection con, CommonNote cNote, int tno) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertTcNote");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setDate(1, cNote.getDate());
			pstmt.setInt(2, tno);
			pstmt.setString(3, cNote.getNote());
			pstmt.setString(4, cNote.getNote());
			pstmt.setDate(5, cNote.getDate());
			pstmt.setInt(6, tno);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public String selectTcNote(Connection con, Date date, int tno) {
		String dateCont = "";
		ResultSet rset = null;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("selectTcNote");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setDate(1, date);
			pstmt.setInt(2, tno);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				dateCont = rset.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return dateCont;
	}

	public ArrayList<CommonNote> selectAllTcNote(Connection con, int tno) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		ArrayList<CommonNote> list = null;

		String sql = prop.getProperty("selectAllTcNote");

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, tno);
			
			rset = pstmt.executeQuery();
			
			if (rset != null) {
				list = new ArrayList<>();
				while (rset.next()) {
					CommonNote cn = new CommonNote();

					cn.setNote(rset.getString("NOTE"));
					cn.setDate(rset.getDate("C_DATE"));
					cn.setTNo(rset.getInt("T_NO"));

					list.add(cn);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}


	//유치원 운영위원회 게시판 등록용 메소드
	public int insertPreHBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = prop.getProperty("insertPreHBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, b.getTtitle());
			pstmt.setString(2, b.getTcont());
			pstmt.setInt(3,b.getTno());
			pstmt.setInt(4, b.getBdid());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
	
		
		return result;
	}
  
	//유치원 운영위원회 t_id 조회용 메소드
	public int selectPreHBoardTid(Connection con, Board b) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result =0;
		
		String query = prop.getProperty("selectPreHBoardTid");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, b.getTno());
			pstmt.setInt(2, b.getBdid());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return result;
	}
  
	//유치원 운영위원회 이미지 등록용 메소드
	public int insertPreHImg(Connection con, ArrayList<Attachment> at, int tid) {
		PreparedStatement pstmt = null;
		int result =0;
		ArrayList<Attachment> file = null;
		
		String query = prop.getProperty("insertPreHImg");
		
		try {
			for(int i=0; i<at.size(); i++) {
				pstmt= con.prepareStatement(query);
				pstmt.setString(1, at.get(i).getOriginName());
				pstmt.setString(2, at.get(i).getChangeName());
				pstmt.setString(3, at.get(i).getFilePath());
				pstmt.setInt(4, tid);
				
			}
			result = pstmt.executeUpdate();

			
		} catch (SQLException e) {
      e.printStackTrace();
		}finally {
			close(pstmt);
			//close(rset);
		}
		
		return result;
	}

	//가정통신문 리스트
	public ArrayList<Board> selectAllTcFamilyList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectAllTcFamilyList");
		int startRow = (currentPage -1 ) * limit +1;
		int endRow = startRow + limit -1;
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
				list = new ArrayList<Board>();
				while(rset.next()) {
					Board b = new Board();
					b.setTid(rset.getInt("T_ID"));
					b.setTtitle(rset.getString("T_TITLE"));
					b.setName(rset.getString("NAME"));
					b.setTcount(rset.getInt("T_COUNT"));
					b.setTtime(rset.getDate("T_TIME"));
					b.setPno(rset.getInt("RNUM"));
					
					list.add(b); 
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}
	
	//가정통신문 리스트 카운트
	public int getFamilyListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("getFamilyListCount");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
		
		if(rset.next()) {
			listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
	
		return listCount;
	}
      
	//가정통신문 insert
	public int insertFLetter(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertFLetter");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getTtitle());
			pstmt.setString(2, b.getTcont());
			pstmt.setInt(3, b.getTno());
			pstmt.setInt(4, b.getBdid());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	//유치원 운영위원회 listCount
	public int listCountPreHBoard(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount =0;
		
		String query = prop.getProperty("listCountPreHBoard");
		
		try {
			stmt=con.createStatement();
			
			rset= stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		return listCount;
	}

	//유치원 운영 위원회 전체 조회용 메소드
	public ArrayList<Board> selectAllPreHBoard(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectAllPreHBoard");
		int startRow = (currentPage -1)* limit +1;
		int endRow = startRow + limit -1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			while(rset.next()) {
				Board b = new Board();
				b.setTid(rset.getInt("T_ID"));
				b.setTtitle(rset.getString("T_TITLE"));
				b.setName(rset.getString("NAME"));
				b.setTcount(rset.getInt("T_COUNT"));
				b.setTtime(rset.getDate("T_TIME"));
				b.setPno(rset.getInt("RNUM"));
				
				list.add(b);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

//유치원 운영 위원회 조회수용
   public int updatePreHBoardCount(Connection con, int num) {
      PreparedStatement pstmt = null;
      int result =0;
      
      String query = prop.getProperty("updatePreHBoardCount");
      
      try {
         pstmt = con.prepareStatement(query);
         pstmt.setInt(1, num);
         pstmt.setInt(2, num);
         
         result = pstmt.executeUpdate();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         close(pstmt);
      }
      
      return result;
   }
	
	//가정 통신문 Tid
	public int selectFLetterTid(Connection con, Board b) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("selectFLetterTid");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, b.getTno());
			pstmt.setInt(2, b.getBdid());
			
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	

	//가정통신문 updateCount false
	public int updateFLetterCount(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = prop.getProperty("updateFLetterCount");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, num);
			pstmt.setInt(2, num);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}


//유치원 운영 위원회 조회용 메소드
   public Board selectOnePreHBoard(Connection con, int num) {
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      Board b = null;
      String query = prop.getProperty("selectOnePreHBoard");
      
      try {
         pstmt = con.prepareStatement(query);
         pstmt.setInt(1, num);
         
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
            b = new Board();
            
            b.setTid(rset.getInt("T_ID"));
            b.setTtitle(rset.getString("T_TItle"));
            b.setTcont(rset.getString("T_CONT"));
            b.setName(rset.getString("NAME"));
            b.setTcount(rset.getInt("T_COUNT"));
            b.setTtime(rset.getDate("T_TIME"));
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         close(rset);
         close(pstmt);
      }
      
      
      return b;
   }

   //가정통신문 selectOne 
   public Board selectOneFLetter(Connection con, int num) {
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      Board b = null;
      
      String query = prop.getProperty("selectOneFLetter");
      
      try {
         pstmt=con.prepareStatement(query);
         pstmt.setInt(1, num);
         
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
            b= new Board();
            
            b.setTid(rset.getInt("T_ID"));
            b.setTtitle(rset.getString("T_TITLE"));
            b.setTcont(rset.getString("T_CONT"));
            b.setName(rset.getString("NAME"));
            b.setTcount(rset.getInt("T_COUNT"));
            b.setTtime(rset.getDate("T_TIME"));
            
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         close(rset);
         close(pstmt);
      }
      
      
      return b;
   }
   public  ArrayList<Attachment> selectOneFLetterImg(Connection con, int num) {
		PreparedStatement pstmt = null;
		ArrayList<Attachment> list = new ArrayList<>();
		Attachment att = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectOneFLetterImg");
		
		try {
	         pstmt = con.prepareStatement(query);
	         pstmt.setInt(1, num);
	         
	         rset = pstmt.executeQuery();
	         while(rset.next()) {
	            att = new Attachment();
	            
	            att.setFid(rset.getInt("F_ID"));
	            att.setOriginName(rset.getString("ORIGIN_NAME"));
	            att.setChangeName(rset.getString("CHANGE_NAME"));
	            att.setFilePath(rset.getString("FILE_PATH"));
	            att.setUploadDate(rset.getDate("UPLOAD_DATE"));
	            att.setFileLevel(rset.getInt("FILE_LEVEL"));
	            att.setStatus(rset.getString("STATUS"));
	            att.setType(rset.getInt("TYPE"));
	            att.setCId(rset.getInt("C_ID"));
	            att.setFeedNo(rset.getInt("FEEDNO"));
	            att.setTId(rset.getInt("T_ID"));
	            
	            list.add(att);
	         }
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }finally {
	         close(rset);
	         close(pstmt);
	      }
	      
	      return list;
	   }
  


public ArrayList<Attachment> selectOnePreHBoardImg(Connection con, int num) {
      PreparedStatement pstmt = null;
      ArrayList<Attachment> list = new ArrayList<>();
      Attachment att = null;
      ResultSet rset = null;
      
      String query = prop.getProperty("selectOnePreHBoardImg");
      
      try {
         pstmt = con.prepareStatement(query);
         pstmt.setInt(1, num);
         
         rset = pstmt.executeQuery();
         while(rset.next()) {
            att = new Attachment();
            
            att.setFid(rset.getInt("F_ID"));
            att.setOriginName(rset.getString("ORIGIN_NAME"));
            att.setChangeName(rset.getString("CHANGE_NAME"));
            att.setFilePath(rset.getString("FILE_PATH"));
            att.setUploadDate(rset.getDate("UPLOAD_DATE"));
            att.setFileLevel(rset.getInt("FILE_LEVEL"));
            att.setStatus(rset.getString("STATUS"));
            att.setType(rset.getInt("TYPE"));
            att.setCId(rset.getInt("C_ID"));
            att.setFeedNo(rset.getInt("FEEDNO"));
            att.setTId(rset.getInt("T_ID"));
            
            list.add(att);
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         close(rset);
         close(pstmt);
      }
      
      return list;
   }

	   //가정통신문 Img
   public int insertFLetterImg(Connection con, Attachment TcF, int tid) {
      PreparedStatement pstmt = null;
      int result =0;
      ArrayList<Attachment> file = null;
      String query = prop.getProperty("insertFLetterImg");
      
      try {
         pstmt = con.prepareStatement(query);
         pstmt.setString(1, TcF.getOriginName());
         pstmt.setString(2, TcF.getChangeName());
         pstmt.setString(3,	TcF.getFilePath());
         pstmt.setInt(4, tid);
         
         result = pstmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         close(pstmt);
      }
      
      return result;
   }

	
	//가정통신문 update페이지 update카운트 false
	public int updateCountTcL(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = prop.getProperty("updateCountTcL");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, num);
			pstmt.setInt(2, num);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
  
	//가정 통신문 update페이지 select
	public Board selectOneUpdateTcL(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;
		
		String query = prop.getProperty("selectOneUpdateTcL");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b= new Board();
				
				b.setTid(rset.getInt("T_ID"));
				b.setTtitle(rset.getString("T_TITLE"));
				b.setTcont(rset.getString("T_CONT"));
				b.setName(rset.getString("NAME"));
				b.setTcount(rset.getInt("T_COUNT"));
				b.setTtime(rset.getDate("T_TIME"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return b;
	}
	
	//가정통신문 
	public int updateTcFamilyLetter(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = prop.getProperty("updateTcFamilyLetter");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getTtitle());
			pstmt.setString(2, b.getTcont());
			pstmt.setInt(3, b.getTid());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
  
	//가정 통신문 삭제
	public int deleteTcFamilyLetter(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = prop.getProperty("deleteTcFamilyLetter");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}
	//앨범 리플 insert
	public int insertReplyChildImg(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertReplyChildImg");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getTcont());
			pstmt.setInt(2, b.getTwriter());
			pstmt.setInt(3, b.getTid());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	//앨범 리플 select 
	public ArrayList<Board> selectReplyChildImg(Connection con, int tid) {
		
		return null;
	}
	
	//앨범 수정 
	public int updateChildImges(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = prop.getProperty("updateChildImges");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getTtitle());
			pstmt.setString(2, b.getTcont());
			pstmt.setInt(3, b.getTid());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	//앨범 수정 하나
	public int selectTcChildImgBoardOneTid(Connection con, Board b) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("selectTcChildImgBoardOneTid");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, b.getTno());
			pstmt.setInt(2, b.getBdid());

			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	//앨범 수정 in
	public int insertTcChildBoardOneImg(Connection con, Attachment oneimgch, int tid) {
		PreparedStatement pstmt = null; 
		int result =0;
		ArrayList<Attachment> file = null;
		
		String query = prop.getProperty("insertTcChildBoardOneImg");
									
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, oneimgch.getOriginName());
			pstmt.setString(2, oneimgch.getChangeName());
			pstmt.setString(3, oneimgch.getFilePath());
			pstmt.setInt(4, tid);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertTcChildImgBoardone(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertTcChildImgBoardone");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getTtitle());
			pstmt.setString(2, b.getTcont());
			pstmt.setInt(3, b.getTno());
			pstmt.setInt(4, b.getBdid());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	

	//유치원 운영 위원회 업데이트용 메소드(수정)
	public int updatePreHBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = prop.getProperty("updatePreHBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, b.getTtitle());
			pstmt.setString(2, b.getTcont());
			pstmt.setInt(3, b.getTid());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	//유치원 운영위원회 삭제 메소드
	public int deletePreHBoard(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = prop.getProperty("deletePreHBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	//유치원 운영위원회 게시판 댓글용 메소드
	public int insertReplyPreHBoard(Connection con, Reply r) {
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = prop.getProperty("insertReplyPreHBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, r.getRname());
			pstmt.setString(2, r.getRcont());
			pstmt.setInt(3, r.getTid());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	//유치원 운영 위원회 댓글 리스트 조회
	public ArrayList<Reply> selectPreHBoardReplyList(Connection con, int tid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Reply> list = null;
		
		String query = prop.getProperty("selectReplyPreHBoardList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, tid);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Reply>();
			
			while(rset.next()) {
				Reply r = new Reply();
				r.setRid(rset.getInt("R_ID"));
				r.setRname(rset.getString("R_NAME"));
				r.setRcont(rset.getString("R_CONT"));
				r.setRdate(rset.getDate("R_DATE"));
				r.setTid(rset.getInt("T_ID"));
				r.setRstmt(rset.getString("R_STMT"));
				
				System.out.println(r.getRid());
				System.out.println(r.getRname());
				System.out.println(r.getRcont());
				System.out.println(r.getRdate());
				System.out.println(r.getTid());
				System.out.println(r.getRstmt());
				list.add(r);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	//선생님 게시판 리스트카운트용 메소드
	public int listCountTctcBoard(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount =0;
		
		String query = prop.getProperty("listCountTctcBoard");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
				
		return listCount;
	}

	//선생님 게시판 전체 조회용 메소드
	public ArrayList<Board> selectAllTctcBoard(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectAllTctcBoard");
		int startRow = (currentPage -1) * limit+1;
		int endRow = startRow + limit -1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			while(rset.next()) {
				Board b = new  Board();
				b.setTid(rset.getInt("T_ID"));
				b.setTtitle(rset.getString("T_TITLE"));
				b.setName(rset.getString("NAME"));
				b.setTcount(rset.getInt("T_COUNT"));
				b.setTtime(rset.getDate("T_TIME"));
				b.setPno(rset.getInt("RNUM"));
				
				list.add(b);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	//선생님 게시판 글 insert
	public int insertTctcBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = prop.getProperty("insertTctcBoard");
		
		try {
			pstmt =con.prepareStatement(query);
			pstmt.setString(1, b.getTtitle());
			pstmt.setString(2, b.getTcont());
			pstmt.setInt(3, b.getTno());
			pstmt.setInt(4, b.getBdid());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	//선생님 게시판 tid 찾기
	public int selectTctcBoardTid(Connection con, Board b) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result =0;
		
		String query = prop.getProperty("selectTctcBoardTid");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, b.getTno());
			pstmt.setInt(2, b.getBdid());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return result;
	}

	//선생님 게시판 이지지 삽입
	public int insertTctcImg(Connection con, ArrayList<Attachment> at, int tid) {
		PreparedStatement pstmt = null;
		int result = 0;
		ArrayList<Attachment> file = null;
		
		String query = prop.getProperty("insertTctcImg");
		
		try {
			for(int i=0; i<at.size(); i++) {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, at.get(i).getOriginName());
			
			pstmt.setString(2, at.get(i).getChangeName());
			pstmt.setString(3, at.get(i).getFilePath());
			pstmt.setInt(4, tid);
			}
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	//선생님 게시판 조히수용 메소드
	public int updateTctcBoardCount(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = prop.getProperty("updateTctcBoardCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			pstmt.setInt(2, num);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	//선생님 게시판 하나 조회용 메소드
	public Board selectOneTctcBoard(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;
		
		String query = prop.getProperty("selectOneTctcBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board();
				
				b.setTid(rset.getInt("T_ID"));
				b.setTtitle(rset.getString("T_TItle"));
				b.setTcont(rset.getString("T_CONT"));
				b.setName(rset.getString("NAME"));
				b.setTcount(rset.getInt("T_COUNT"));
				b.setTtime(rset.getDate("T_TIME"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return b;
	}

	//선생님 게시판 사진 조회용 메소드
	public ArrayList<Attachment> selectOneTctcBoardImg(Connection con, int num) {
		PreparedStatement pstmt = null;
		ArrayList<Attachment> list = new ArrayList<>();
		Attachment att = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectOneTctcBoardImg");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				att = new Attachment();
				
				att.setFid(rset.getInt("F_ID"));
				att.setOriginName(rset.getString("ORIGIN_NAME"));
				att.setChangeName(rset.getString("CHANGE_NAME"));
				att.setFilePath(rset.getString("FILE_PATH"));
				att.setUploadDate(rset.getDate("UPLOAD_DATE"));
				att.setFileLevel(rset.getInt("FILE_LEVEL"));
				att.setStatus(rset.getString("STATUS"));
				att.setType(rset.getInt("TYPE"));
				att.setCId(rset.getInt("C_ID"));
				att.setFeedNo(rset.getInt("FEEDNO"));
				att.setTId(rset.getInt("T_ID"));
				
				list.add(att);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
  
	public int updateTcChildImgOne(Connection con, Attachment tcChildImgOne) {

		PreparedStatement pstmt = null; 
		int result =0;
		ArrayList<Attachment> file = null;
		
		String query = prop.getProperty("updateTcChildImgOne");
									
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, tcChildImgOne.getOriginName());
			pstmt.setString(2, tcChildImgOne.getChangeName());
			pstmt.setString(3, tcChildImgOne.getFilePath());
			pstmt.setInt(4, tcChildImgOne.getFid());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Attachment> selectUpdateOneImg(Connection con, int fid) {
		PreparedStatement pstmt = null;
		ArrayList<Attachment> list = new ArrayList<>();
		Attachment att = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectUpdateOneImg");
		
		try {
			pstmt = con.prepareStatement(query);

			
			pstmt.setInt(1, fid);
			

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				att = new Attachment();
				att.setOriginName(rset.getString("ORIGIN_NAME"));
				att.setChangeName(rset.getString("CHANGE_NAME"));
				att.setFilePath(rset.getString("FILE_PATH"));
				att.setUploadDate(rset.getDate("UPLOAD_DATE"));
				att.setFileLevel(rset.getInt("FILE_LEVEL"));
				att.setStatus(rset.getString("STATUS"));
				att.setType(rset.getInt("TYPE"));
				att.setCId(rset.getInt("C_ID"));
				att.setFeedNo(rset.getInt("FEEDNO"));
				att.setTId(rset.getInt("T_ID"));
				
				list.add(att);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}


	public ArrayList<Board> selectQnA(Connection con, int tno) {
		ArrayList<Board> qnaList = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("selectQnA");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, tno);
			
			rset = pstmt.executeQuery();
			
			if(rset != null) {
				qnaList = new ArrayList<>();
				
				while(rset.next()) {
					Board board = new Board();
					board.setTid(rset.getInt("T_ID"));
					board.setTtitle(rset.getString("T_TITLE"));
					board.setTcont(rset.getString("T_CONT"));
					board.setName(rset.getString("NAME"));
					board.setTtime(rset.getDate("T_TIME"));
					board.setTwriter(rset.getInt("M_NO"));
					
					qnaList.add(board);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return qnaList;
	}

	//선생님 게시판 수정용 메소드나나난
	public int updateTctcBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = prop.getProperty("updateTctcBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getTtitle());
			pstmt.setString(2, b.getTcont());
			pstmt.setInt(3, b.getTid());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	//선생님 게시판 삭제용 메소드
	public int deleteTctcBoard(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = prop.getProperty("deleteTctcBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	//해당글의 모든 댓글 가져오기
	public ArrayList<Reply> selectAllPreHBoardReply(Connection con,int tid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Reply> replyList = null;
		
		String query = prop.getProperty("selectAllPreHBoardReply");
  	try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, tid);
      rset = pstmt.executeQuery();
			
			replyList = new ArrayList<>();
			while(rset.next()) {
				Reply r = new Reply();
				r.setRid(rset.getInt("R_ID"));
				r.setRname(rset.getString("R_NAME"));
				r.setRcont(rset.getString("R_CONT"));
				r.setRdate(rset.getDate("R_DATE"));
				r.setTid(rset.getInt("T_ID"));
				r.setRstmt(rset.getString("R_STMT"));
				
				replyList.add(r);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
	
		return replyList;
	}
      
	public int updateQnAStatus(Connection con, int tid) {
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = prop.getProperty("updateQnAStatus");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, tid);
      result = pstmt.executeUpdate();
      
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;

	}

	//댓글의 댓글 insert
	public int insertPreHrereply(Connection con, Reply r) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertPreHrereply");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, r.getRname());
			pstmt.setString(2, r.getRcont());
			pstmt.setInt(3, r.getTid());
			pstmt.setInt(4, r.getRefrid());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
  }

	public int deleteChildImg(Connection con, int fid) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteChildImg");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, fid);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	//댓글의 댓글 클릭할때조회용 메소드
	public ArrayList<Reply> selectPreHrereplyList(Connection con, Reply r) {
		PreparedStatement pstmt = null;
		ArrayList<Reply> replyList = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectPreHrereplyList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, r.getTid());
			pstmt.setInt(2, r.getRefrid());
			
			rset = pstmt.executeQuery();
			replyList = new ArrayList<>();
			
			while(rset.next()) {
				Reply re = new Reply();
				re.setRid(rset.getInt("R_ID"));
				re.setRname(rset.getString("R_NAME"));
				re.setRcont(rset.getString("R_CONT"));
				re.setRdate(rset.getDate("R_DATE"));
				re.setTid(rset.getInt("T_ID"));
				re.setRstmt(rset.getString("R_STMT"));
				re.setRefrid(rset.getInt("REF_RID"));
				
				replyList.add(re);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
				
		return replyList;
	}
	
	
	//학부모 게시판 이미지 하나 수정
	public int updateinsertPBoardImg(Connection con, Attachment attachment) {
		PreparedStatement pstmt = null; 
		int result =0;
		ArrayList<Attachment> file = null;
		
		String query = prop.getProperty("updateinsertPBoardImg");
									
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, attachment.getOriginName());
			pstmt.setString(2, attachment.getChangeName());
			pstmt.setString(3, attachment.getFilePath());
			pstmt.setInt(4, attachment.getFid());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//학부모 게시판 이미지 하나 삭제
	public int deletePBoradImg(Connection con, int fid) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deletePBoradImg");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, fid);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	//가정통신문 이미지 하나 수정
	public int updateFLetterImg(Connection con, Attachment attachment) {
		PreparedStatement pstmt = null; 
		int result =0;
		ArrayList<Attachment> file = null;
		
		String query = prop.getProperty("updateFLetterImg");
									
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, attachment.getOriginName());
			pstmt.setString(2, attachment.getChangeName());
			pstmt.setString(3, attachment.getFilePath());
			pstmt.setInt(4, attachment.getFid());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	//가정통신문 이미지 하나 삭제
	public int deleteFLetterImg(Connection con, int fid) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteFLetterImg");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, fid);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
	





















