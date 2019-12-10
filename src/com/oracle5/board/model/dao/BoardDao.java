package com.oracle5.board.model.dao;

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
import com.oracle5.board.model.vo.Schedule;
import com.oracle5.member.model.vo.Ban;
import com.oracle5.member.model.vo.Children;
import com.oracle5.member.model.vo.Parents;

import static com.oracle5.common.JDBCTemplate.*;

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

	public ArrayList<Board> selectAllBanNoticeList(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list =null;
		
		String query = prop.getProperty("selectAllBanNoticeList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, 4);
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

/*	public ArrayList<Board> selectAllParentsBoar(Connection con) {
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
	}*/

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
				b.setTwriter(rset.getInt("T_WRITER"));
				b.setTcount(rset.getInt("T_COUNT"));
				b.setTtime(rset.getDate("T_TIME"));
				b.setTno(rset.getInt("T_NO"));
				b.setPno(rset.getInt("P_NO"));
				b.setBdid(rset.getInt("BD_ID"));
				b.setTstmt(rset.getString("T_STMT"));
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

	public int deleteBanBoard(Connection con, int num) {
		// TODO Auto-generated method stub
		return 0;
	}

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
				b.setTwriter(rset.getInt("T_WRITER"));
				b.setTcount(rset.getInt("T_COUNT"));
				b.setTtime(rset.getDate("T_TIME"));
				b.setTno(rset.getInt("T_NO"));
				b.setPno(rset.getInt("P_NO"));
				b.setBdid(rset.getInt("BD_ID"));
				b.setTstmt(rset.getString("T_STMT"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return b;
	}


}













