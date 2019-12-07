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
import java.util.Properties;

import com.oracle5.board.model.vo.CommonNote;

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
			
			if(rset.next()) {
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
		}finally {
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
			
			if(rset != null) {
				list = new ArrayList<>();
				while(rset.next()) {
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
	
}
