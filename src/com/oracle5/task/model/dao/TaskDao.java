package com.oracle5.task.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.oracle5.task.model.vo.Position;
import com.oracle5.task.model.vo.WorkDivision;

import static com.oracle5.common.JDBCTemplate.*;

public class TaskDao {
	Properties prop = new Properties();
	
	public TaskDao() {
		String fileName = TaskDao.class.getResource("/sql/task/task-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertUBusiness(Connection con, WorkDivision work ) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertUBusiness");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, work.getContent());
			pstmt.setString(2, work.getArea());
			pstmt.setInt(3, work.getTno());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);		
		}
		
		return result;
	}

	public ArrayList<WorkDivision> selectWorkList(Connection con) {
		ArrayList<WorkDivision> list = null;
		ResultSet rset = null;
		Statement stmt = null;
		
		String query = prop.getProperty("selectWorkList");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset != null) {
				list = new ArrayList<>();
				while(rset.next()) {
					WorkDivision work = new WorkDivision();
					work.setType(rset.getInt("TYPE"));
					if(rset.getInt("TYPE") == 1) {
						work.setPid(rset.getInt("PID"));
						work.setName(rset.getString("PNAME"));
					}else {
						work.setTno(rset.getInt("M_NO"));
						work.setName(rset.getString("NAME"));
					}
					work.setArea(rset.getString("AREA"));
					work.setContent(rset.getString("CONTENT"));
					
					
					list.add(work);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return list;
	}

	public ArrayList<Position> selectPosition(Connection con) {
		ArrayList<Position> list = null;
		ResultSet rset = null;
		Statement stmt = null;
		
		String query = prop.getProperty("selectPosition");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset != null) {
				list = new ArrayList<>();
				while(rset.next()) {
					Position p = new Position();
					
					p.setPid(rset.getInt("PID"));
					p.setPname(rset.getString("PNAME"));
					
					list.add(p);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return list;
	}

	public int insertDBusiness(Connection con, WorkDivision work) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertDBusiness");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, work.getContent());
			pstmt.setString(2, work.getArea());
			pstmt.setInt(3, work.getPid());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);		
		}
		
		return result;
	}
	
	
	
	
}
