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
			pstmt.setString(1, requestTeacher.getClassName());

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

	public ArrayList<Member> selectAllMember(Connection con) {
		ArrayList<Member> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectAllMember");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset != null) {
				list = new ArrayList<>();
				while(rset.next()) {
					Member m = new Member();
					m.setMemberId(rset.getString("USER_ID"));
					m.setMemberName(rset.getString("USER_NAME"));
					m.setMemberPwd(rset.getString("USER_PWD"));
					m.setMemberRno(rset.getString("USER_RNO"));
					m.setMemberNo(rset.getInt("USER_NO"));
					m.setUType(rset.getString("USER_TYPE"));
					m.setEmail(rset.getString("EMAIL"));
					m.setPhone(rset.getString("PHONE"));
					m.setLeaveDate(rset.getDate("LEAVE_DATE"));
					
					list.add(m);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public ArrayList<Teacher> selectAllTeacher(Connection con) {
		ArrayList<Teacher> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectAllTeacher");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset != null) {
				list = new ArrayList<>();
				while(rset.next()) {
					Teacher t = new Teacher();
					t.setTeacherNo(rset.getInt("T_NO"));
					t.setTEntDate(rset.getDate("T_ENTDATE"));
					t.setTDescription(rset.getString("T_DESCRIPTION"));
					t.setImgSrc(rset.getString("IMGSRC"));
					t.setPId(Integer.parseInt(rset.getString("PID")));
					t.setClassName(rset.getString("T_CLASS"));
					
					list.add(t);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
}
