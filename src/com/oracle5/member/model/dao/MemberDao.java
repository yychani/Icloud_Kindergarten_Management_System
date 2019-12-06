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

import com.oracle5.member.model.vo.Ban;
import com.oracle5.member.model.vo.Member;
import com.oracle5.member.model.vo.MemberAndTeacher;
import com.oracle5.member.model.vo.Parents;
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

				loginMember.setMemberId(rset.getString("ID"));
				loginMember.setMemberName(rset.getString("NAME"));
				loginMember.setMemberPwd(rset.getString("PWD"));
				loginMember.setMemberRno(rset.getString("RNO"));
				loginMember.setMemberNo(rset.getInt("M_NO"));
				loginMember.setUType(rset.getString("TYPE"));
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
					mt.setMemberId(rset.getString("ID"));
					mt.setMemberName(rset.getString("NAME"));
					mt.setMemberPwd(rset.getString("PWD"));
					mt.setMemberRno(rset.getString("RNO"));
					mt.setMemberNo(rset.getInt("M_NO"));
					mt.setUType(rset.getString("TYPE"));
					mt.setEmail(rset.getString("EMAIL"));
					mt.setPhone(rset.getString("PHONE"));
					mt.setLeaveDate(rset.getDate("LEAVE_DATE"));
					mt.setTEntDate(rset.getDate("ENTDATE"));
					mt.setTDescription(rset.getString("DESCRIPTION"));
					mt.setImgSrc(rset.getString("IMGSRC"));
					mt.setPId(Integer.parseInt(rset.getString("PID")));
					mt.setPName(rset.getString("PNAME"));
					mt.setClassName(rset.getString("B_NAME"));
					
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
			System.out.println("id : " +requestMember.getMemberId());
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				userNo = rset.getInt("M_NO");
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
				m.setMemberId(rset.getString("ID"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return m;
	}

	public int insertMemberP(Connection con, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("insertMemberP");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberName());
			pstmt.setString(3, m.getMemberPwd());
			pstmt.setString(4, m.getMemberRno());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getPhone());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertParent(Connection con, Parents p) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("insertParent");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, p.getPNo());
			pstmt.setString(2, p.getPAddress());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public ArrayList<Ban> selectBan(Connection con) {
		ResultSet rset = null;
		Statement stmt = null;	
		ArrayList<Ban> list = null;
		
		String query = prop.getProperty("selectBan");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset != null) {
				list = new ArrayList<>();
				while(rset.next()) {
					Ban b = new Ban();
					b.setBanNo(rset.getInt("B_NO"));
					b.setBanName(rset.getString("B_NAME"));
					
					list.add(b);
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

	public int insertBanList(Connection con, Ban ban, Teacher requestTeacher) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("insertBanList");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, ban.getBanNo());
			pstmt.setInt(2, requestTeacher.getTeacherNo());
			System.out.println("tno : " + requestTeacher.getTeacherNo());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int searchBanListNo(Connection con, int teacherNo) {
		int bcno = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("searchBanListNo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, teacherNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				bcno = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return bcno;
	}

	public int updateBcno(Connection con, int teacherNo, int bcno) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("updateBcno");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bcno);
			pstmt.setInt(2, teacherNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
