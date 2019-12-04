package com.oracle5.member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.oracle5.member.model.vo.Member;
import com.oracle5.member.model.vo.MemberAndTeacher;
import com.oracle5.member.model.vo.Teacher;

import static com.oracle5.common.JDBCTemplate.*;

public class MemberDao {
	Properties prop = new Properties();

	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Member loginMember(Connection con, Member requestMember) {
		Member loginMember = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("loginMember");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, requestMember.getMemberId());
			pstmt.setString(2, requestMember.getMemberPwd());

			rset = pstmt.executeQuery();

			if (rset.next()) {
				loginMember = new Member();

				loginMember.setMemberId(rset.getString("USER_ID"));
				loginMember.setMemberName(rset.getString("USER_NAME"));
				loginMember.setMemberPwd(rset.getString("USER_PWD"));
				loginMember.setMemberRno(rset.getString("USER_RNO"));
				loginMember.setMemberNo(rset.getInt("USER_NO"));
				loginMember.setUType(rset.getString("USER_TYPE"));
				loginMember.setEmail(rset.getString("EMAIL"));
				loginMember.setPhone(rset.getString("PHONE"));
				loginMember.setLeaveDate(rset.getDate("LEAVE_DATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return loginMember;
	}

	public int insertTeacher(Connection con, Teacher requestTeacher) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("insertTeacher");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, requestTeacher.getTeacherNo());
			pstmt.setString(2, requestTeacher.getClassName());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertMemberT(Connection con, Member requestMember) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("insertMemberT");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, requestMember.getMemberId());
			pstmt.setString(2, requestMember.getMemberName());
			pstmt.setString(3, requestMember.getMemberPwd());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}


	public ArrayList<MemberAndTeacher> selectAllTeacher(Connection con) {
		ArrayList<MemberAndTeacher> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectAllTeacher");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset != null) {
				list = new ArrayList<>();
				while(rset.next()) {
					MemberAndTeacher mt = new MemberAndTeacher();
					mt.setMemberId(rset.getString("USER_ID"));
					mt.setMemberName(rset.getString("USER_NAME"));
					mt.setMemberPwd(rset.getString("USER_PWD"));
					mt.setMemberRno(rset.getString("USER_RNO"));
					mt.setMemberNo(rset.getInt("USER_NO"));
					mt.setUType(rset.getString("USER_TYPE"));
					mt.setEmail(rset.getString("EMAIL"));
					mt.setPhone(rset.getString("PHONE"));
					mt.setLeaveDate(rset.getDate("LEAVE_DATE"));
					mt.setTEntDate(rset.getDate("T_ENTDATE"));
					mt.setTDescription(rset.getString("T_DESCRIPTION"));
					mt.setImgSrc(rset.getString("IMGSRC"));
					mt.setPId(Integer.parseInt(rset.getString("PID")));
					mt.setClassName(rset.getString("T_CLASS"));
					mt.setPName(rset.getString("PNAME"));
					
					list.add(mt);
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

	public int deleteTeacher(Connection con, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteTeacher");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int searchMemberNo(Connection con, Member requestMember) {
		int userNo = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("searchMemberNo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, requestMember.getMemberId());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				userNo = rset.getInt("USER_NO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return userNo;
	}

	public Member idCheck(Connection con, String userId) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		Member m = null;
		
		String query = prop.getProperty("idCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member();
				m.setMemberId(rset.getString("USER_ID"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return m;
	}
}
