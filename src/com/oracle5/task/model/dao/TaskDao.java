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

	public WorkDivision selectWork(Connection con, WorkDivision work) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		WorkDivision resultWork = null;
		String query = "";
		if(work.getPid() != 0) {
			query = prop.getProperty("selectWorkPid"); 
		}else if(work.getTno() != 0){
			query = prop.getProperty("selectWorkTno");
		}
		
		try {
			pstmt = con.prepareStatement(query);
			if(work.getPid() != 0) {
				pstmt.setInt(1, work.getPid());
			}else if(work.getTno() != 0){
				pstmt.setInt(1, work.getTno());
			}
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				resultWork = new WorkDivision();
				resultWork.setType(rset.getInt("TYPE"));
				if(rset.getInt("TYPE") == 1) {
					resultWork.setPid(rset.getInt("PID"));
					resultWork.setName(rset.getString("PNAME"));
				}else {
					resultWork.setTno(rset.getInt("M_NO"));
					resultWork.setName(rset.getString("NAME"));
				}
				resultWork.setArea(rset.getString("AREA"));
				resultWork.setContent(rset.getString("CONTENT"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return resultWork;
	}

	public int updateWork(Connection con, WorkDivision work) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "";
		if(work.getPid() != 0) {
			query = prop.getProperty("updateWorkPid"); 
		}else if(work.getTno() != 0){
			query = prop.getProperty("updateWorkTno");
		}
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, work.getContent());
			pstmt.setString(2, work.getArea());
			if(work.getPid() != 0) {
				pstmt.setInt(3, work.getPid());
			}else if(work.getTno() != 0){
				pstmt.setInt(3, work.getTno());
			}
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);		
		}
		
		return result;
	}

	public boolean checkDDuplicate(Connection con, int chargeN) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		boolean isExist = false;
		
		String query = prop.getProperty("checkDDuplicate");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, chargeN);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				isExist = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return isExist;
	}
	
	public boolean checkUDuplicate(Connection con, int chargeN) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		boolean isExist = false;
		
		String query = prop.getProperty("checkUDuplicate");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, chargeN);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				isExist = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return isExist;
	}

	public int deleteWork(Connection con, WorkDivision work) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "";
		if(work.getPid() != 0) {
			query = prop.getProperty("deleteWorkPid"); 
		}else if(work.getTno() != 0){
			query = prop.getProperty("deleteWorkTno");
		}
		try {
			pstmt = con.prepareStatement(query);
			if(work.getPid() != 0) {
				pstmt.setInt(1, work.getPid());
			}else if(work.getTno() != 0){
				pstmt.setInt(1, work.getTno());
			}
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);		
		}
		
		return result;
	}
	
}
