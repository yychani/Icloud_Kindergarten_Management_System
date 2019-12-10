package com.oracle5.member.model.dao;

import static com.oracle5.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.naming.PartialResultException;

import com.oracle5.common.model.vo.Attachment;
import com.oracle5.member.model.vo.Ban;
import com.oracle5.member.model.vo.Children;
import com.oracle5.member.model.vo.DoseRequest;
import com.oracle5.member.model.vo.FamilyRelation;
import com.oracle5.member.model.vo.Member;
import com.oracle5.member.model.vo.MemberAndTeacher;
import com.oracle5.member.model.vo.Parents;
import com.oracle5.member.model.vo.ReturnAgree;
import com.oracle5.member.model.vo.Scholarly;
import com.oracle5.member.model.vo.Teacher;

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

			if (rset != null) {
				list = new ArrayList<>();
				while (rset.next()) {
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

			rset = pstmt.executeQuery();

			if (rset.next()) {
				userNo = rset.getInt("M_NO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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

			if (rset.next()) {
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

			if (rset != null) {
				list = new ArrayList<>();
				while (rset.next()) {
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

			if (rset.next()) {
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

	public int insertChildren(Connection con, Children c) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertChildren");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, c.getOriginAddr());
			pstmt.setString(2, c.getBloodType());
			pstmt.setString(3, c.getEmergency());
			pstmt.setString(4, c.getDescription());
			pstmt.setString(5, c.getImgSrc());
			pstmt.setString(6, c.getName());
			pstmt.setString(7, c.getRno());
			pstmt.setInt(8, c.getPno());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int searchChildNo(Connection con, Children c) {
		int cNo = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("searchChildNo");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, c.getRno());

			rset = pstmt.executeQuery();

			if (rset.next()) {
				cNo = rset.getInt("C_ID");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return cNo;
	}

	public int insertChildImg(Connection con, Attachment childImg) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertChildImg");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, childImg.getOriginName());
			pstmt.setString(2, childImg.getChangeName());
			pstmt.setString(3, childImg.getFilePath());
			pstmt.setInt(4, 1);
			pstmt.setInt(5, childImg.getCId());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertScholar(Connection con, ArrayList<Scholarly> s, int cNo) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertScholar");

		try {
			for (int i = 0; i < s.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setDate(1, s.get(i).getSDate());
				pstmt.setString(2, s.get(i).getAgency());
				pstmt.setString(3, s.get(i).getUniqueness());
				pstmt.setInt(4, cNo);

				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertFamily(Connection con, ArrayList<FamilyRelation> f, int cNo) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertFamily");

		try {
			for (int i = 0; i < f.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, f.get(i).getRelation());
				pstmt.setString(2, f.get(i).getName());
				pstmt.setString(3, f.get(i).getPhone());
				pstmt.setInt(4, cNo);

				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertBanList(Connection con, Ban b, int cNo, int tNo) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("insertBanListC");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, b.getBanNo());
			pstmt.setInt(2, cNo);
			pstmt.setInt(3, tNo);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int selectTno(Connection con, Ban b) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		int tNo = 0;

		String query = prop.getProperty("selectTno");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, b.getBanNo());

			rset = pstmt.executeQuery();

			if (rset.next()) {
				tNo = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return tNo;
	}

	public int deleteParents(Connection con, int mNo) {
		PreparedStatement pstmt = null;
		int delete = 0;

		String query = prop.getProperty("deleteParents");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mNo);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return delete;
	}

	public int deleteMember(Connection con, int mNo) {
		PreparedStatement pstmt = null;
		int delete = 0;

		String query = prop.getProperty("deleteMember");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mNo);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return delete;
	}

	public int insertTermsList(Connection con, Parents p) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("insertTermsList");

		try {
			for (int i = 1; i <= 3; i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, p.getPNo());
				pstmt.setInt(2, i);

				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateChildBcno(Connection con, int bcno, int cNo) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateChildBcno");
		System.out.println("CNO : " + cNo);
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bcno);
			pstmt.setInt(2, cNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("result : " + result);
		return result;
	}

	public int selectChildBcno(Connection con, int cNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int bcno = 0;

		String query = prop.getProperty("selectChildBcno");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				bcno = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return bcno;
	}

	public ArrayList<MemberAndTeacher> selectTeacher(Connection con) {
		ArrayList<MemberAndTeacher> list = null;
		ResultSet rset = null;
		Statement stmt = null;

		String query = prop.getProperty("selectTeacher");

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(query);

			if (rset != null) {
				list = new ArrayList<>();
				while (rset.next()) {
					MemberAndTeacher mt = new MemberAndTeacher();
					mt.setMemberNo(rset.getInt("T_NO"));
					mt.setMemberName(rset.getString("NAME"));

					list.add(mt);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 학부모 비밀번호 확인 메소드
	public Member parentsPassCheck(Connection con, Member requestMember) {
		Member loginMember = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("selectParensPwd");

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

	// 학부모 비밀번호 변경 메소드
	public int updateParentsPass(Connection con, Member loginMember) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateParentsPwd");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, loginMember.getMemberPwd());
			pstmt.setString(2, loginMember.getMemberId());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public List<Map<String, Object>> selectNotAppList(Connection con, int currentPage, int limit) {
		List<Map<String, Object>> list = null;
		Map<String, Object> hmap = null;
		Parents p = null;
		Children c = null;
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectNotAppList");

		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<>();

			while (rset.next()) {
				p = new Parents();
				c = new Children();
				m = new Member();
				hmap = new HashMap<>();

				p.setPApproval(rset.getString("APPROVAL"));
				m.setMemberNo(rset.getInt("M_NO"));
				m.setMemberName(rset.getString("NAME"));
				c.setCId(rset.getInt("C_ID"));
				c.setName(rset.getString("C_NAME"));

				hmap.put("rownum", rset.getInt("RNUM"));
				hmap.put("children", c);
				hmap.put("member", m);
				hmap.put("parents", p);

				list.add(hmap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;

	}

	// 학부모 계정 삭제
	public int deleteParent(Connection con, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteParent");

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

	public Children selectOneChild(Connection con, int cid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Children c = null;

		String query = prop.getProperty("selectOneChild");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cid);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				c = new Children();

				c.setCId(cid);
				c.setName(rset.getString("C_NAME"));
				c.setRno(rset.getString("C_RNO"));
				c.setImgSrc(rset.getString("IMGSRC"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return c;
	}

	public List<Map<String, Object>> selectAcceptAppList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Map<String, Object>> list = null;
		Map<String, Object> hmap = null;
		Member m = null;
		Children c = null;
		Parents p = null;

		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		String query = prop.getProperty("selectAcceptAppList");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<>();

			while (rset.next()) {
				hmap = new HashMap<>();
				p = new Parents();
				c = new Children();
				m = new Member();

				p.setPApproval(rset.getString("APPROVAL"));
				p.setPEntDate(rset.getDate("ENT_DATE"));
				m.setMemberNo(rset.getInt("M_NO"));
				m.setMemberName(rset.getString("NAME"));
				c.setCId(rset.getInt("C_ID"));
				c.setName(rset.getString("C_NAME"));

				hmap.put("rownum", rset.getInt("RNUM"));
				hmap.put("children", c);
				hmap.put("member", m);
				hmap.put("parents", p);

				list.add(hmap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;

	}

	// 원아 id 가져오기
	public int searchCID(Connection con, int userMno) {
		PreparedStatement pstmt = null;
		int cId = 0;
		ResultSet rset = null;

		// 내 아이 원아번호 가져오기
		String query = prop.getProperty("selectChildrenCID");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userMno);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				cId = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return cId;
	}

	// 학부모 방과후 신청
	public int asRequest(Connection con, int userMno, int cId) {
		PreparedStatement pstmt = null;
		int result = 0;

		Date date = new Date(new java.util.Date().getTime());
		String query = prop.getProperty("insertAsRequest");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cId);
			pstmt.setDate(2, date);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 투약의뢰서 신청
	public int doseRequest(Connection con, DoseRequest dr) {
		PreparedStatement pstmt = null;
		int result = 0;
		System.out.println(dr);

		String query = prop.getProperty("insertDoseRequest");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, dr.getCNo());
			pstmt.setString(2, dr.getSymptom());
			pstmt.setString(3, dr.getKinds());
			pstmt.setString(4, dr.getKeep());
			pstmt.setDate(5, dr.getStartDate());
			pstmt.setString(6, dr.getRemarks());
			pstmt.setInt(7, dr.getPNo());
			pstmt.setDate(8, dr.getEndDate());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 투약의뢰서 가져오기
	public DoseRequest selectDoseReq(Connection con, int pNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		DoseRequest dr = null;

		String query = prop.getProperty("selectDoseReq");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				dr = new DoseRequest();
				dr.setCNo(rset.getInt("C_NO"));
				dr.setSymptom(rset.getString("SYMPTOM"));
				dr.setKinds(rset.getString("KINDS"));
				dr.setKeep(rset.getString("KEEP"));
				dr.setStartDate(rset.getDate("START_DATE"));
				dr.setRemarks(rset.getString("REMARKS"));
				dr.setSubmitDate(rset.getDate("SUBMIT_DATE"));
				dr.setPNo(rset.getInt("P_NO"));
				dr.setEndDate(rset.getDate("END_DATE"));
				dr.setStatus(rset.getString("STATUS"));
				dr.setDNo(rset.getInt("D_NO"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return dr;
	}

	// 투약 시간테이블 INSERT
	public int insertDoseTime(Connection con, DoseRequest requestDose, String dosingTime) {
		PreparedStatement pstmt = null;
		int result = 0;
		System.out.println("memberdao insertdosetime : " + dosingTime);
		String[] doseTimes = dosingTime.split("/");
		System.out.println("dao dosetime : " + doseTimes);
		String query = prop.getProperty("insertDoseTime");

		try {
			pstmt = con.prepareStatement(query);

			for (int i = 0; i < doseTimes.length; i++) {

				pstmt.setString(1, doseTimes[i]);
				pstmt.setInt(2, requestDose.getDNo());

				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	// 귀가동의서 테이블 INSERT
	public int insertReturnApply(Connection con, ReturnAgree ra) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertReturnApply");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, ra.getCId());
			pstmt.setInt(2, ra.getPNo());
			pstmt.setDate(3, ra.getApplyDate());
			pstmt.setString(4, ra.getApplyTime());
			pstmt.setString(5, ra.getGuideName());
			pstmt.setString(6, ra.getGuidePhone());
			
			result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
    
    		return result;
	
  }

	public int getNotAppListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;

		int listCount = 0;

		String sql = prop.getProperty("NotApplistCount");

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(sql);

			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return listCount;
	}

	public int getAcceptListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;

		int listCount = 0;

		String sql = prop.getProperty("AcceptListCount");

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(sql);

			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return listCount;
	}

	public int updateParentApproval(Connection con, int userNo) {
		PreparedStatement pstmt = null;
		int update = 0;

		String sql = prop.getProperty("updateParentApproval");

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNo);

			update = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return update;
	}

}
