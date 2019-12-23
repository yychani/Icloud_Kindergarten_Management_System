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

import com.oracle5.board.model.vo.Board;
import com.oracle5.common.model.vo.Attachment;
import com.oracle5.member.model.vo.AsList;
import com.oracle5.member.model.vo.Attend;
import com.oracle5.member.model.vo.Ban;
import com.oracle5.member.model.vo.BodyInfo;
import com.oracle5.member.model.vo.CNote;
import com.oracle5.member.model.vo.Children;
import com.oracle5.member.model.vo.DoseRequest;
import com.oracle5.member.model.vo.FamilyRelation;
import com.oracle5.member.model.vo.FieldLearning;
import com.oracle5.member.model.vo.Member;
import com.oracle5.member.model.vo.MemberAndTeacher;
import com.oracle5.member.model.vo.Note;
import com.oracle5.member.model.vo.Observation;
import com.oracle5.member.model.vo.ObservationItem;
import com.oracle5.member.model.vo.Parents;
import com.oracle5.member.model.vo.Participation;
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
				loginMember.setHq(rset.getString("HQ"));
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
			
			delete = pstmt.executeUpdate();
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
			
			delete = pstmt.executeUpdate();
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
					mt.setUType(rset.getString("HQ"));

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

	public List<Map<String, Object>> selectNotAppList(Connection con, int currentPage, int limit, int memberNo) {
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
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

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

				c.setCId(rset.getInt("C_ID"));
				c.setName(rset.getString("C_NAME"));
				c.setDescription(rset.getString("C_DESC"));
				c.setImgSrc(rset.getString("IMGSRC"));
				c.setName(rset.getString("C_NAME"));
				c.setRno(rset.getString("C_RNO"));
				c.setPno(rset.getInt("P_NO"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return c;
	}

	public List<Map<String, Object>> selectAcceptAppList(Connection con, int currentPage, int limit, int memberNo) {
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
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

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
	public int asRequest(Connection con, int cId) {
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

	public int getNotAppListCount(Connection con, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		int listCount = 0;

		String sql = prop.getProperty("NotApplistCount");

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, memberNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return listCount;
	}

	public int getAcceptListCount(Connection con, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		int listCount = 0;

		String sql = prop.getProperty("AcceptListCount");

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, memberNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
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


	//귀가동의서 신청기록 불러오기
	public ArrayList<ReturnAgree> selectRaList(Connection con, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReturnAgree> raList = null;
		
		String query = prop.getProperty("selectRalist");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
		
			if(rset != null) {
				raList = new ArrayList<ReturnAgree>();
				while(rset.next()) {
					ReturnAgree ra = new ReturnAgree();
					ra.setCId(rset.getInt("C_ID"));
					ra.setCName(rset.getString("C_NAME"));
					ra.setPNo(rset.getInt("P_NO"));
					ra.setApplyDate(rset.getDate("APPLY_DATE"));
					ra.setApplyTime(rset.getString("APPLY_TIME"));
					ra.setSubmitDate(rset.getDate("SUBMIT_DATE"));
					ra.setStatus(rset.getString("STATUS"));
					ra.setGuideName(rset.getString("GUIDENAME"));
					ra.setGuidePhone(rset.getString("GUIDEPHONE"));
					
					raList.add(ra);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return raList;
	}

	//원아명으로 cid가져오기
	public int selectCId(Connection con, String kidsName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int cId = 0;
		
		String query = prop.getProperty("selectCId");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, kidsName);
      	rset = pstmt.executeQuery();
			
			if(rset.next()) {
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

	public ArrayList<Children> selectBanChildren(Connection con, int bno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Children> list = null;
		Children c = null;
		
		String sql = prop.getProperty("selectBanChildren");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				c = new Children();
				
				c.setCId(rset.getInt("C_ID"));
				c.setName(rset.getString("C_NAME"));
				c.setPno(rset.getInt("ROWNUM"));
				c.setBcNo(rset.getInt("P_NO"));
				
				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int selectBanNo(Connection con, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String sql = prop.getProperty("selectBanNo");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, memberNo);

			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close(pstmt);
			close(rset);
		}
		
		return result;
	}

	//투약의뢰서 의리 리스트 불러오기
	public ArrayList<DoseRequest> selectDoList(Connection con, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<DoseRequest> list = null;
		
		String query = prop.getProperty("selectDolist");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			if(rset != null) {
				list = new ArrayList<DoseRequest>();
				while(rset.next()) {
					DoseRequest dr = new DoseRequest();
					dr.setCNo(rset.getInt("C_NO"));
					dr.setCName(rset.getString("C_NAME"));
					dr.setSymptom(rset.getString("SYMPTOM"));
					dr.setKinds(rset.getString("KINDS"));
					dr.setKeep(rset.getString("KEEP"));
					dr.setStartDate(rset.getDate("START_DATE"));
					dr.setRemarks(rset.getString("REMARKS"));
					dr.setSubmitDate(rset.getDate("SUBMIT_DATE"));
					dr.setPNo(rset.getInt("P_NO"));
					dr.setEndDate(rset.getDate("END_DATE"));
					dr.setStatus(rset.getString("STATUS"));
					dr.setDosingTime(rset.getString("D_TIME"));
					
					list.add(dr);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
  }

	//아이 상세보기 페이지 정보 가져오기
	public Map<String, Object> selectChildDetail(Connection con, int cid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Map<String, Object> hmap = null;
		
		String sql = prop.getProperty("selectChildDetail");
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cid);
			
			rset = pstmt.executeQuery();

			hmap = new HashMap<>();
			if(rset.next()) {
				Children c = new Children();
				c.setCId(cid);
				c.setName(rset.getString("C_NAME"));
				c.setDescription(rset.getString("C_DESC"));
				c.setImgSrc(rset.getString("IMGSRC").substring(rset.getString("IMGSRC").lastIndexOf("\\") + 1));
				hmap.put("c", c);
				
				Ban b = new Ban();
				b.setBanName(rset.getString("B_NAME"));
				
				hmap.put("b", b);
				
				BodyInfo bi = new BodyInfo();
				bi.setHeight(rset.getDouble("HEIGHT"));
				bi.setWeight(rset.getDouble("WEIGHT"));
				
				hmap.put("bi", bi);
				Member m = new Member();
				m.setMemberName(rset.getString("NAME"));
				m.setPhone(rset.getString("PHONE"));
				m.setUType(rset.getString("RELATION"));
				
				hmap.put("m", m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return hmap;
	}

	//생활기록부 첫칸 내용 가져오기
	public Map<String, Object> selectRcBookFirst(Connection con, int cid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Map<String, Object> hmap = null;
		int i = 0;
		String[] yearArr = new String[3];
		String[] banArr = new String[3];
		String[] nameArr = new String[3];
		
		String sql = prop.getProperty("selectRcBookFirst");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cid);
			
			rset = pstmt.executeQuery();
			
			hmap = new HashMap<String, Object>();
			
			while(rset.next()) {
				yearArr[i] = rset.getString("YEAR");
				banArr[i] = rset.getString("B_NAME");
				nameArr[i++] = rset.getString("NAME");
			}
			hmap.put("year", yearArr);
			hmap.put("ban", banArr);
			hmap.put("name", nameArr);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return hmap;
	}

	//학부모 주소 가져오기
	public String selectParentsAddress(Connection con, int cid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String address = "";
		
		String sql = prop.getProperty("selectParentsAddress");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cid);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				address = rset.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return address;
	}

	//아이 가족관계 가져오기
	public ArrayList<FamilyRelation> selectFamilyRelation(Connection con, int cid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<FamilyRelation> fr = null;
		FamilyRelation f = null;
		
		String sql = prop.getProperty("selectFamilyRelation");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cid);
			
			rset = pstmt.executeQuery();
			
			fr = new ArrayList<>();
			
			while(rset.next()) {
				f = new FamilyRelation();
				
				f.setRelation(rset.getString("RELATION"));
				f.setName(rset.getString("NAME"));
				f.setPhone(rset.getString("PHONE"));
				f.setRelationId(rset.getInt("R_ID"));
				
				fr.add(f);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return fr;
	}

	//아이 학적사항 가져오기
	public ArrayList<Scholarly> selectScholarly(Connection con, int cid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Scholarly s = null;
		ArrayList<Scholarly> sc = null;
		
		String sql = prop.getProperty("selectScholarly");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cid);
			
			rset = pstmt.executeQuery();
			
			sc = new ArrayList<>();
			
			while(rset.next()) {
				s = new Scholarly();
				
				s.setSDate(rset.getDate("S_DATE"));
				s.setAgency(rset.getString("AGENCY"));
				s.setUniqueness(rset.getString("UNIQUENESS"));
				
				sc.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return sc;
	}

	//아이 신체정보 있을때 불러오기
	public ArrayList<BodyInfo> selectBodyInfo(Connection con, int cid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		BodyInfo b = null;
		ArrayList<BodyInfo> bi = null;
		
		String sql = prop.getProperty("checkBodyInfo");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cid);
			
			rset = pstmt.executeQuery();
			
			bi = new ArrayList<>();
			
			while(rset.next()) {
				b = new BodyInfo();
				
				b.setBiDate(rset.getDate("BI_DATE"));
				b.setHeight(rset.getDouble("HEIGHT"));
				b.setWeight(rset.getDouble("WEIGHT"));
				
				bi.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return bi;
	}

	//한 아이 출석정보 가져오기
	public Map<String, Object> selectChildAttend(Connection con, int cid) {
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      Attend a = null;
	      ArrayList<Attend> ar = null;
	      Map<String, Object> hmap = null;
	      String year = "";
	      String chkyear = "";
	      int i = 3;
	      
	      String sql = prop.getProperty("selectChildAttend");
	      
	      try {
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, cid);
	         
	         rset = pstmt.executeQuery();
	         
	         hmap = new HashMap<String, Object>();
	         
	         while(rset.next()) {
	            a = new Attend();
	            
	            a.setAmDate(rset.getDate("AM_DATE"));
	            a.setCId(rset.getInt("C_ID"));
	            a.setAType(rset.getString("A_TYPE"));
	            
	            SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
	            Date d = a.getAmDate();
	            year = sdf.format(d);
	            
	            if(chkyear.equals("")) {
	               ar = new ArrayList<>();
	               chkyear = year;
	            }
	            
	            if(year.equals(chkyear)) {
	               ar.add(a);
	            } else {
	               hmap.put(String.valueOf(i++), ar);
	               ar = new ArrayList<>();
	               ar.add(a);
	            }
	            chkyear = year;
	         }
	         hmap.put(String.valueOf(i++), ar);
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
	      
	      return hmap;
	}

	//원아명 학무보pNo 일치 확인
	public int cNamepNoCheck(Connection con, String kidName, int pNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int cId = 0;
		
		String query = prop.getProperty("selectCNamePno");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pNo);
			pstmt.setString(2, kidName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
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

	//현장체험학습 MAX값 가져오기
	public int selectFtl(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int ftlMax = 0;
		
		String query = prop.getProperty("selectFtlMax");
		
		try {
			pstmt = con.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				ftlMax = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return ftlMax;
	}

	//현장체험학습 신청 insert
	public int insertFtlApply(Connection con, int cId, int ftlMax) {
		PreparedStatement pstmt = null;
		int result = 0;
		System.out.println("dao : " + cId);
		System.out.println("dao : " + ftlMax);
		String query = prop.getProperty("insertFtlApply");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, ftlMax);
			pstmt.setInt(2, cId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;

	}

	public Date presidentEntDate(Connection con) {
		ResultSet rset = null;
		Statement stmt = null;
		Date presidentEntDate = null;
		
		String query = prop.getProperty("presidentEntDate");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				presidentEntDate = rset.getDate(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		return presidentEntDate;
	}

	public int deleteTerms(Connection con, int mNo) {
		PreparedStatement pstmt = null;
		int delete = 0;

		String query = prop.getProperty("deleteTerms");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mNo);
			
			delete = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return delete;
    
  }

	//현장 체험학습 리스트 select
	public Map<String, Object> selectFtlApplyList(Connection con, int pNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Map<String, Object> hmap = null;
		
		String query = prop.getProperty("selectFtlApplyList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pNo);
			
			rset = pstmt.executeQuery();
			
			hmap = new HashMap<>();
			
			ArrayList<FieldLearning> flList = new ArrayList<FieldLearning>();
			ArrayList<Participation> pList = new ArrayList<Participation>();
			ArrayList<Children> cList = new ArrayList<Children>();
			
			while(rset.next()) {
				FieldLearning fl = new FieldLearning();
				fl.setFtlDate(rset.getDate("FTL_DATE"));
				fl.setField(rset.getString("FIELD"));
				fl.setFtlPay(rset.getInt("FTL_PAY"));
				fl.setMaterials(rset.getString("METERIALS"));
				
				flList.add(fl);
				
				Participation p = new Participation();
				p.setCId(rset.getInt("C_ID"));
				p.setPayment(rset.getString("PAYMENT"));
				p.setAttend(rset.getString("ATTEND"));
				
				pList.add(p);
				
				Children c = new Children();
				c.setName(rset.getString("C_NAME"));
				
				cList.add(c);
				
			}
			
			hmap.put("flList", flList);
			hmap.put("pList", pList);
			hmap.put("cList", cList);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return hmap;
	}

	//현장 체험학습 신청했는지 확인
	public int checkFtlApply(Connection con, int cId) {
		PreparedStatement pstmt = null;
		int check = 0;
		
		String query = prop.getProperty("checkFtlApply");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cId);
			
			check = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return check;
	}

	//현장 체험학습 신청페이지 정보 불러오기
	public FieldLearning selectFl(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		FieldLearning fl= null;
		
		String query = prop.getProperty("selectFl");
		
		try {
			pstmt = con.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				fl = new FieldLearning();
				
				fl.setFtlDate(rset.getDate("FTL_DATE"));
				fl.setField(rset.getString("FIELD"));
				fl.setFtlPay(rset.getInt("FTL_PAY"));
				fl.setMaterials(rset.getString("METERIALS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return fl;

	}
	
	//아이 신체정보 유무 확인하는 check
	public int checkBodyInfo(Connection con, int cid) {
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      int check = 0;
	      
	      String sql = prop.getProperty("checkBodyInfo");
	      
	      try {
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, cid);
	         
	         rset = pstmt.executeQuery();
	         
	         if(rset.next()) {
	            check = rset.getInt(1);
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
	      
	      return check;
	   }

	//아이 신체정보 없을경우 가져오는 select
	   public Map<String, Object> selectChildDetail2(Connection con, int cid) {
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      Map<String, Object> hmap = null;
	      
	      String sql = prop.getProperty("selectChildDetail2");
	      
	      try {
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, cid);
	         
	         rset = pstmt.executeQuery();
	         
	         hmap = new HashMap<>();
	         if(rset.next()) {
	            Children c = new Children();
	            c.setCId(cid);
	            c.setName(rset.getString("C_NAME"));
	            c.setDescription(rset.getString("C_DESC"));
	            c.setImgSrc(rset.getString("IMGSRC").substring(rset.getString("IMGSRC").lastIndexOf("\\") + 1));
	            
	            hmap.put("c", c);
	            
	            Ban b = new Ban();
	            b.setBanName(rset.getString("B_NAME"));
	            
	            hmap.put("b", b);
	            
	            BodyInfo bi = new BodyInfo();
	            bi.setHeight(0.0);
	            bi.setWeight(0.0);
	            
	            hmap.put("bi", bi);
	            
	            Member m = new Member();
	            m.setMemberName(rset.getString("NAME"));
	            m.setPhone(rset.getString("PHONE"));
	            m.setUType(rset.getString("RELATION"));
	            
	            hmap.put("m", m);
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
	      
	      return hmap;
	   }

	   //아이 신체정보 입력하기
	public int insertBodyInfo(Connection con, int cid, BodyInfo bi) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertBodyInfo");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cid);
			pstmt.setDouble(2, bi.getHeight());
			pstmt.setDouble(3, bi.getWeight());
			pstmt.setDate(4, bi.getBiDate());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	//아이 신체정보 삭제하기
	public int deleteBodyInfo(Connection con, int bino) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteBodyInfo");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bino);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	//학부모 정보 수정(member테이블 - 이름, 폰, 이메일 변경)
	public int pInfoChange(Connection con, Member changeM, int pNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updatePMemberInfo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, changeM.getMemberName());
			pstmt.setString(2, changeM.getEmail());
			pstmt.setString(3, changeM.getPhone());
			pstmt.setInt(4, pNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;

	}

	//학부모 정보 수정(parent 테이블 - 주소 update)
	public int pInfoChange(Connection con, String address, int pNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateParentAddress");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, address);
			pstmt.setInt(2, pNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int childBodyInfoCount(Connection con, int cid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		
		String sql = prop.getProperty("childBodyInfoCount");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cid);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}

	public ArrayList<BodyInfo> selectChildBodyInfoPaging(Connection con, int cid, int currentPage, int limit) {
		ArrayList<BodyInfo> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		BodyInfo b = null;
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		String sql = prop.getProperty("selectChildBodyInfoPaging");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cid);
			pstmt.setInt(2, cid);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				b = new BodyInfo();
		            
	            b.setBiNo(rset.getInt("BI_NO"));
	            b.setHeight(rset.getDouble("HEIGHT"));
	            b.setWeight(rset.getDouble("WEIGHT"));
	            b.setBiDate(rset.getDate("BI_DATE"));
	            b.setCId(rset.getInt("C_ID"));
	            b.setCName(rset.getString("C_NAME"));
	            
	            list.add(b);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
      		return list;
    }

	//학부모 주소, 개인정보 가져오기
	public Map<String, Object> selectPInfo(Connection con, int pNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Map<String, Object> hmap = null;
		
		String query = prop.getProperty("selectPInfo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pNo);
			
			rset = pstmt.executeQuery();
			
			hmap = new HashMap<>();
			Member m = new Member();
			Parents p = new Parents();
			if(rset.next()) {
				
				m.setMemberId(rset.getString("ID"));
				m.setMemberName(rset.getString("NAME"));
				m.setEmail(rset.getString("EMAIL"));
				m.setPhone(rset.getString("PHONE"));

				p.setPAddress(rset.getString("ADDRESS"));
				
			}
			
			hmap.put("p", p);
			hmap.put("m", m);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return hmap;

	}

	public ArrayList<Map<String, Object>> selectChildObservation(Connection con, int cid, int age) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Map<String, Object> hmap = null;
		ArrayList<Map<String, Object>> list = null;
		Observation ob = null;
		Member m = null;
		Children c = null;
		
		String sql = prop.getProperty("selectChildObservation");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cid);
			pstmt.setInt(2, age);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			while(rset.next()) {
				hmap = new HashMap<>();
				c = new Children();
				c.setCId(rset.getInt("C_ID"));
				c.setName(rset.getString("C_NAME"));
				
				hmap.put("c", c);
				
				ob = new Observation();
				ob.setRound(rset.getInt("ROUND"));
				ob.setAge(rset.getInt("AGE"));
				ob.setEval(rset.getString("EVALUATION"));
				ob.setObId(rset.getInt("OB_ID"));
				ob.setEscore(rset.getString("E_SCORE"));
				ob.setEDate(rset.getDate("EDATE"));
				
				hmap.put("ob", ob);
				
				m = new Member();
				m.setMemberName(rset.getString("NAME"));
				
				hmap.put("m", m);
				
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


	public int insertChildOb(Connection con, Observation ob) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertOb");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ob.getRound());
			pstmt.setInt(2, ob.getAge());
			pstmt.setInt(3, ob.getCid());
			pstmt.setString(4, ob.getEval());
			pstmt.setInt(5, ob.getTno());
			pstmt.setString(6, ob.getEscore());
			pstmt.setDate(7, ob.getEDate());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
}

	//학부모 원아정보 가져오기
	public ArrayList<HashMap<String, Object>> selectCInfo(Connection con, int pNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		ArrayList<HashMap<String, Object>> list = null;
		
		int i = 0;
		Children c = null;
		Parents p = null;
		Scholarly s = null;
		ArrayList<Scholarly> slist = null;
		FamilyRelation f = null;
		ArrayList<FamilyRelation> flist = null;
		
		String query = prop.getProperty("selectCInfo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pNo);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<>();
			
			while(rset.next()) {
				
				if(hmap == null) {
					hmap = new HashMap<>();
					slist = new ArrayList<>();
					flist = new ArrayList<>();
					
					c = new Children();
					c.setCId(rset.getInt("C_ID"));
					c.setName(rset.getString("C_NAME"));
					c.setBloodType(rset.getString("C_BTYPE"));
					c.setRno(rset.getString("C_RNO"));
					c.setDescription(rset.getString("C_DESC"));
					c.setImgSrc(rset.getString("IMGSRC"));
					c.setOriginAddr(rset.getString("C_OADDR"));
	
					hmap.put("c", c);
					
					s = new Scholarly();
					s.setSDate(rset.getDate("S_DATE"));
					s.setAgency(rset.getString("AGENCY"));
					s.setUniqueness(rset.getString("UNIQUENESS"));
					
					slist.add(s);
					
					p = new Parents();
					p.setPAddress(rset.getString("ADDRESS"));
					
					hmap.put("p", p);
		
					f = new FamilyRelation();
					f.setRelation(rset.getString("RELATION"));
					f.setName(rset.getString("NAME"));
					f.setPhone(rset.getString("PHONE"));
					flist.add(f);
				
				} else if (((Children) hmap.get("c")).getName().equals(rset.getString("C_NAME"))) {
					if(!slist.get(i-1).getAgency().equals(rset.getString("AGENCY"))) {
						s = new Scholarly();
						s.setSDate(rset.getDate("S_DATE"));
						s.setAgency(rset.getString("AGENCY"));
						s.setUniqueness(rset.getString("UNIQUENESS"));
						
						slist.add(s);
					}
					f = new FamilyRelation();
					f.setRelation(rset.getString("RELATION"));
					f.setName(rset.getString("NAME"));
					f.setPhone(rset.getString("PHONE"));
					
					flist.add(f);
				} else {
					hmap.put("slist", slist);
					hmap.put("flist", flist);
					list.add(hmap);
					
					hmap = new HashMap<>();
					slist = new ArrayList<>();
					flist = new ArrayList<>();
					
					c = new Children();
					c.setCId(rset.getInt("C_ID"));
					c.setName(rset.getString("C_NAME"));
					c.setBloodType(rset.getString("C_BTYPE"));
					c.setRno(rset.getString("C_RNO"));
					c.setDescription(rset.getString("C_DESC"));
					c.setImgSrc(rset.getString("IMGSRC"));
	
					hmap.put("c", c);
					
					s = new Scholarly();
					s.setSDate(rset.getDate("S_DATE"));
					s.setAgency(rset.getString("AGENCY"));
					s.setUniqueness(rset.getString("UNIQUENESS"));
					slist.add(s);
					
					
					p = new Parents();
					p.setPAddress(rset.getString("ADDRESS"));
					
					hmap.put("p", p);
		
					f = new FamilyRelation();
					f.setRelation(rset.getString("RELATION"));
					f.setName(rset.getString("NAME"));
					f.setPhone(rset.getString("PHONE"));
					flist.add(f);
				}
				i++;
			}	
			hmap.put("slist", slist);
			hmap.put("flist", flist);
			list.add(hmap);
			System.out.println(list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;

	}

	public int checkChildOb(Connection con, Observation ob) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String sql = prop.getProperty("checkChildOb");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ob.getRound());
			pstmt.setInt(2, ob.getCid());
			pstmt.setInt(3, ob.getAge());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int updateChildOb(Connection con, Observation ob) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateChildOb");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ob.getEscore());
			pstmt.setString(2, ob.getEval());
			pstmt.setInt(3, ob.getTno());
			pstmt.setDate(4, ob.getEDate());
			pstmt.setInt(5, ob.getRound());
			pstmt.setInt(6, ob.getAge());
			pstmt.setInt(7, ob.getCid());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertChildNote(Connection con, Note n) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertChildNote");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, n.getCid());
			pstmt.setDate(2, n.getNDate());
			pstmt.setString(3, n.getUnique());
			pstmt.setString(4, n.getMaterials());
			pstmt.setString(5, n.getHealth());
			pstmt.setInt(6, n.getTno());
			pstmt.setInt(7, n.getCid());
			pstmt.setString(8, n.getUnique());
			pstmt.setString(9, n.getMaterials());
			pstmt.setString(10, n.getHealth());
			pstmt.setDate(11, n.getNDate());
			pstmt.setInt(12, n.getTno());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Note> selectChildNote(Connection con, Date nDate, int tno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Note> list = null;
		Note n = null;
		
		String sql = prop.getProperty("selectChildNote");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setDate(1, nDate);
			pstmt.setInt(2, tno);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				n = new Note();
				
				n.setCid(rset.getInt("C_ID"));
				n.setUnique(rset.getString("UNIQUENESS"));
				n.setMaterials(rset.getString("MATERIALS"));
				n.setHealth(rset.getString("HEALTH"));
				n.setNDate(rset.getDate("N_DATE"));
				n.setTno(rset.getInt("T_NO"));
				
				list.add(n);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int insertChildAttend(Connection con, Attend a) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertChildAttend");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, a.getCId());
			pstmt.setDate(2, a.getAmDate());
			pstmt.setString(3, a.getAType());
			pstmt.setDate(4, a.getAmDate());
			pstmt.setInt(5, a.getCId());
			pstmt.setString(6, a.getAType());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Attend> selectBanChildAttend(Connection con, Date nDate, int tno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Attend> list = null;
		Attend a = null;
		
		String sql = prop.getProperty("selectBanChildAttend");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setDate(1, nDate);
			pstmt.setInt(2, tno);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				a = new Attend();
				
				a.setAType(rset.getString("A_TYPE"));
				a.setCId(rset.getInt("C_ID"));
				a.setAmDate(rset.getDate("AM_DATE"));
				
				list.add(a);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Children> selectBanOkAsList(Connection con, int tno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Children> list = null;
		Children c = null;
		
		String sql = prop.getProperty("selectBanOkAsList");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, tno);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				c = new Children();
				
				c.setCId(rset.getInt("C_ID"));
				c.setName(rset.getString("C_NAME"));
				c.setEntDate(rset.getDate("APPROVAL_DATE"));
				
				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Children> selectBanNoAsList(Connection con, int tno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Children> list = null;
		Children c = null;
		
		String sql = prop.getProperty("selectBanNoAsList");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, tno);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				c = new Children();
				
				c.setCId(rset.getInt("C_ID"));
				c.setName(rset.getString("C_NAME"));
				c.setEntDate(rset.getDate("APPROVAL_DATE"));
				
				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public String selectBanName(Connection con, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String banName = "";
		
		String sql = prop.getProperty("selectBanName");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				banName = rset.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return banName;
	}

	//학부모알림장 - 원아 이름,cid 가져오기
	public ArrayList<Children> selectCName(Connection con, int pNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Children> cNameList = null;
		Children c = null;
		
		String query = prop.getProperty("selectCName");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pNo);
			
			rset = pstmt.executeQuery();
			
			cNameList = new ArrayList<Children>();
			
			while(rset.next()) {
				c = new Children();
				
				c.setCId(rset.getInt("C_ID"));
				c.setName(rset.getString("C_NAME"));
				
				cNameList.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return cNameList;
	}

	//날짜랑 원아번호로 원아 알림장 조회해오기
	public Note selectCNote(Connection con, int cId, Date cDate) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Note cNote = null;
		
		String query = prop.getProperty("selectNote");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, cId);
			pstmt.setDate(2, cDate);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				cNote = new Note();
				cNote.setCid(rset.getInt("C_ID"));
				cNote.setUnique(rset.getString("UNIQUENESS"));
				cNote.setMaterials(rset.getString("MATERIALS"));
				cNote.setHealth(rset.getString("HEALTH"));
				cNote.setNDate(rset.getDate("N_DATE"));
				cNote.setTno(rset.getInt("T_NO"));
				
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return cNote;
	}


	//선생님 알림장
	public CNote selectTNote(Connection con, int tNo, Date cDate) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		CNote tNote = null;
		
		String query = prop.getProperty("selectTNote");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, tNo);
			pstmt.setDate(2, cDate);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				tNote = new CNote();
				tNote.setNote(rset.getString("NOTE"));
				tNote.setDate(rset.getDate("C_DATE"));
				tNote.setTNo(rset.getInt("T_NO"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return tNote;
	}

	//원장님 알림장
	public CNote selectPNote(Connection con, Date cDate) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		CNote pNote = null;
		
		String query = prop.getProperty("selectPNote");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setDate(1, cDate);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				pNote = new CNote();
				pNote.setDate(rset.getDate("C_DATE"));
				pNote.setNote(rset.getString("NOTE"));
				pNote.setTNo(rset.getInt("T_NO"));
        			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
    	return pNote;
	}

	public ArrayList<Attend> selectBanAttend(Connection con, int tno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Attend> list = null;
		Attend a = null;
		
		String sql = prop.getProperty("selectBanAttend");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, tno);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				a = new Attend();
				
				a.setAmDate(rset.getDate(1));
				
				list.add(a);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
  	return list;
	}
		


	//반 이름 가져오기
	public Ban selectNoteBan(Connection con, int cId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Ban b = null;
		
		String query = prop.getProperty("selectNoteBan");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cId);
			pstmt.setInt(2, cId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				b = new Ban();
				b.setBanNo(rset.getInt("B_NO"));
				b.setBanName(rset.getString("B_NAME"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return b;
	}

	//방과 후 신청 이력 가져오기
	public HashMap<String, Object> selectAsList(Connection con, int pNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("selectAsList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pNo);
			
			rset = pstmt.executeQuery();
			
			hmap = new HashMap<>();
			
			ArrayList<AsList> aList = new ArrayList<AsList>();
			ArrayList<Children> cList = new ArrayList<Children>();
			
			while(rset.next()) {
				Children c = new Children();
				c.setCId(rset.getInt("C_ID"));
				c.setName(rset.getString("C_NAME"));
				
				cList.add(c);
				System.out.println(c);
				
				AsList a = new AsList();
				a.setApplyDate(rset.getDate("APPLY_DATE"));
				a.setApprovalDate(rset.getDate("APPROVAL_DATE"));
				a.setEndDate(rset.getDate("END_DATE"));
				
				aList.add(a);
			}

			hmap.put("cList", cList);
			hmap.put("aList", aList);
			System.out.println(hmap);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return hmap;

  }

	public int updateAsList(Connection con, int cid, Date endDate) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateAsList");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setDate(1, endDate);
			pstmt.setInt(2, cid);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;

	}


	//cId로 출석 가져오기
	public ArrayList<Attend> selectCAttend(Connection con, int cId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Attend> list = null;
		Attend a = null;
		
		String query = prop.getProperty("selectCAttend");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cId);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Attend>();
			while(rset.next()){
				a = new Attend();
				a.setAmDate(rset.getDate("AM_DATE"));
				a.setAType(rset.getString("A_TYPE"));
				
				list.add(a);
			} 
      
    }catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<DoseRequest> selectBanDoseList(Connection con, int memberNo) {
		PreparedStatement pstmt = null;
		ArrayList<DoseRequest> list = null;
		DoseRequest dr = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBanDoseList");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				dr = new DoseRequest();
				
				dr.setCNo(rset.getInt("C_NO"));
				dr.setCName(rset.getString("C_NAME"));
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
				dr.setDosingTime(rset.getString("D_TIME"));
				
				list.add(dr);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}


	//방과후 이력 확인
	public int selectAsCheck(Connection con, int cId, int currentMonth, int currentYear) {
		PreparedStatement pstmt = null;
		int check = 0;
		
		String query = prop.getProperty("selectAsCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, currentYear);
			pstmt.setInt(2, currentMonth);
			pstmt.setInt(3, cId);
			
			check = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return check;
}

	public DoseRequest selectChildDoseReq(Connection con, int dno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		DoseRequest dr = null;
		
		String sql = prop.getProperty("selectChildDoseReq");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				dr = new DoseRequest();
				
				dr.setCNo(rset.getInt("C_NO"));
				dr.setCName(rset.getString("C_NAME"));
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
				dr.setDosingTime(rset.getString("D_TIME"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return dr;

	}


	public int updateDoseReqStatus(Connection con, int dno, String stat) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateDoseReq");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, stat);
			pstmt.setInt(2, dno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<ReturnAgree> selectBanRtnList(Connection con, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReturnAgree> list = null;
		ReturnAgree r = null;
		
		String sql = prop.getProperty("selectBanRtnList");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				r = new ReturnAgree();
				
				r.setCId(rset.getInt("C_ID"));
				r.setCName(rset.getString("C_NAME"));
				r.setApplyDate(rset.getDate("APPLY_DATE"));
				r.setApplyTime(rset.getString("APPLY_TIME"));
				r.setSubmitDate(rset.getDate("SUBMIT_DATE"));
				r.setStatus(rset.getString("STATUS"));
				r.setRaNo(rset.getInt("RA_NO"));
				r.setGuideName(rset.getString("GUIDENAME"));
				r.setGuidePhone(rset.getString("GUIDEPHONE"));
				
				list.add(r);
			}
      		
    } catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	//내아이 정보 - 이름, 사진 불러오기
	public Children selectCnamePhoto(Connection con, int cId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Children c = null;
		
		String query = prop.getProperty("selectCnamePhoto");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				c = new Children();
				c.setCId(rset.getInt("C_ID"));
				c.setName(rset.getString("C_NAME"));
				c.setImgSrc(rset.getString("IMGSRC"));
				c.setDescription(rset.getString("C_DESC"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return c;
	}

	public ReturnAgree selectChildRtn(Connection con, int rano) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ReturnAgree r = null;
		
		String sql = prop.getProperty("selectChildRtn");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rano);
      	rset = pstmt.executeQuery();
			
			if(rset.next()) {
      	r = new ReturnAgree();
				
				r.setCId(rset.getInt("C_ID"));
				r.setCName(rset.getString("C_NAME"));
				r.setApplyDate(rset.getDate("APPLY_DATE"));
				r.setApplyTime(rset.getString("APPLY_TIME"));
				r.setSubmitDate(rset.getDate("SUBMIT_DATE"));
				r.setStatus(rset.getString("STATUS"));
				r.setRaNo(rset.getInt("RA_NO"));
				r.setGuideName(rset.getString("GUIDENAME"));
				r.setGuidePhone(rset.getString("GUIDEPHONE"));
      			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return r;
	}
	//최근 신체정보 불러오기
	public BodyInfo selectRecentBodyInfo(Connection con, int cId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		BodyInfo b = null;
		
		String query = prop.getProperty("selectRecentBodyInfo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cId);
			pstmt.setInt(2, cId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new BodyInfo();
				b.setHeight(rset.getDouble("HEIGHT"));
				b.setWeight(rset.getDouble("WEIGHT"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return b;
	}

	public int updateRtnStatus(Connection con, int rano, String stat) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateRtn");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, stat);
			pstmt.setInt(2, rano);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	//신체정보 리스트 불러오기
	public ArrayList<BodyInfo> selectBodyInfoList(Connection con, int cId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<BodyInfo> bList = null;
		BodyInfo b = null;
		
		String query = prop.getProperty("selectBodyInfoList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cId);
			
			rset = pstmt.executeQuery();
			
			bList = new ArrayList<BodyInfo>();
			
			while(rset.next()) {
				b = new BodyInfo();
				b.setBiDate(rset.getDate("BI_DATE"));
				b.setHeight(rset.getDouble("HEIGHT"));
				b.setWeight(rset.getDouble("WEIGHT"));
				
				bList.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return bList;

	}

	public Teacher selectOneTeacher(Connection con, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Teacher t = null;
		
		String sql = prop.getProperty("selectOneTeacher");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
      
      rset = pstmt.executeQuery();
			
			if(rset.next()) {
        	t = new Teacher();
				
				t.setTeacherNo(rset.getInt("T_NO"));
				t.setTEntDate(rset.getDate("ENTDATE"));
				t.setTDescription(rset.getString("DESCRIPTION"));
				t.setImgSrc(rset.getString("IMGSRC"));
				t.setClassName(rset.getString("B_NAME"));
				t.setPId(rset.getInt("PID"));
				t.setBcNo(rset.getInt("BC_NO"));
        		}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
  return t;
}

	public ArrayList<Teacher> selectMyTeacher(Connection con, int pno) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		ArrayList<Teacher> teacher = null;
		Teacher t = null;
		
		String query = prop.getProperty("selectMyTeacher");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pno);
      			
			rset = pstmt.executeQuery();
			
			teacher = new ArrayList<Teacher>();
			
			while(rset.next()) {
				
				t = new Teacher();
				t.setTeacherNo(rset.getInt("T_NO"));
				t.setClassName(rset.getString("NAME"));
				
				teacher.add(t);
        	}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
  	return teacher;
}

	public int updateTeacherInfo(Connection con, int mno, Teacher t) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateTeacherInfo");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, t.getImgSrc());
			pstmt.setString(2, t.getTDescription());
			pstmt.setInt(3, mno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateTeacherMInfo(Connection con, int mno, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateTeacherMInfo");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getMemberPwd());
			pstmt.setString(2, m.getMemberRno());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getPhone());
			pstmt.setInt(5, mno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
  }

	public Children selectChildren(Connection con, int cId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Children c = null;
		
		String query = prop.getProperty("selectChildren");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				c = new Children();
				c.setOriginAddr(rset.getString("C_OADDR"));
				c.setBloodType(rset.getString("C_BTYPE"));
				c.setDescription(rset.getString("C_DESC"));
				c.setImgSrc(rset.getString("IMGSRC"));
				c.setName(rset.getString("C_NAME"));
				c.setRno(rset.getString("C_RNO"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return c;

	}

	public String selectBirth(Connection con, int cId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String birth = null;
		
		String query = prop.getProperty("selectBirth");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt .setInt(1, cId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				birth = rset.getString("BIRTH");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return birth;
	}

	//내아이 children 객체 업데이트
	public int updateChildrenInfoC(Connection con, Children c) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateChildrenInfoC");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, c.getOriginAddr());
			pstmt.setString(2, c.getDescription());
			pstmt.setString(3, c.getBloodType());
			pstmt.setInt(4, c.getCId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	//거주지 업데이트
	public int updateAddress(Connection con, int pNo, String address) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateAddress");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, address);
			pstmt.setInt(2, pNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	//가족관계 업데이트
	public int updateFamilyRelatioin(Connection con, FamilyRelation familyRelation) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateFamilyRelatioin");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, familyRelation.getRelation());
			pstmt.setString(2, familyRelation.getName());
			pstmt.setString(3, familyRelation.getPhone());
			pstmt.setInt(4, familyRelation.getRelationId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	//학적 업데이트
	public int updateScholarly(Connection con, Scholarly scholarly, int cId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateScholarly");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, scholarly.getAgency());
			pstmt.setString(2, scholarly.getUniqueness());
			pstmt.setDate(3, scholarly.getSDate());
			pstmt.setInt(4, cId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	//선생님 가져오기
	public MemberAndTeacher selectTeacherName(Connection con, int cId, int pNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MemberAndTeacher mt = null;
		
		String query = prop.getProperty("selectTeacherName");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pNo);
			pstmt.setInt(2, cId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				mt = new MemberAndTeacher();
				mt.setMemberNo(rset.getInt("T_NO"));
				mt.setMemberName(rset.getString("NAME"));
				mt.setBNo(rset.getInt("B_NO"));
				
				rset = pstmt.executeQuery();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return mt;
	}


	//학부모 건의문의 글쓰기
	public int insertParentQnA(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		Board board = null;
		
		String query = prop.getProperty("insertParentQnA");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getTtitle());
			pstmt.setString(2, b.getTcont());
			pstmt.setInt(3, b.getPno());
			pstmt.setInt(4, b.getTno());
			pstmt.setInt(5, b.getPno());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
}

	public ArrayList<ObservationItem> selectAgeObItem(Connection con, int age) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ObservationItem> itemList = null;
		ObservationItem oi = null;
		
		String sql = prop.getProperty("selectAgeObItem");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, age);
			
			rset = pstmt.executeQuery();
			
			itemList = new ArrayList<>();
			
			while(rset.next()) {
				oi = new ObservationItem();
				
				oi.setObId(rset.getInt("OB_ID"));
				oi.setAge(rset.getInt("AGE"));
				oi.setContent(rset.getString("CONTENT"));
				
				itemList.add(oi);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
		return itemList;

	}


	public int selectTeacherBcno(Connection con, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int bcno = 0;
		
		String query = prop.getProperty("selectTeacherBcno");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
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

	public int deleteBanList(Connection con, int bcno) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteBanList");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bcno);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int deleteTeacherM(Connection con, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteTeacherM");

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

	public ArrayList<Children> selectChildrenBan(Connection con, int i) {
		ArrayList<Children> childBanList = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("selectChildrenIntoBan");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, i);
			
			rset = pstmt.executeQuery();
			
			if(rset != null) {
				childBanList = new ArrayList<>();
				while(rset.next()) {
					Children c = new Children();
					
					c.setBcNo(rset.getInt("B_NO"));
					c.setPno(rset.getInt("P_NO"));
					c.setName(rset.getString("C_NAME"));
					c.setBloodType(rset.getString("HQ"));
					
					childBanList.add(c);
				}
       }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
      close(pstmt);
			close(rset);
		}
		
		return childBanList;
	}

	public ArrayList<Member> selectNotAcceptParents(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Member> checkList = null;
		Member m = null;
		
		String sql = prop.getProperty("selectNotAcceptParents");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			checkList = new ArrayList<>();
			
			while(rset.next()) {
				m = new Member();
				m.setMemberId(rset.getString(1));
				checkList.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return checkList;
	}


	public String findUserId(Connection con, String userName, String userEmail) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String userId = null;
		
		String sql = prop.getProperty("findUserId");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userName);
			pstmt.setString(2, userEmail);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				userId = rset.getString(1);
        }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return userId;
	}


	//귀가동의서 전체원아 요청
	public int returnApply(Connection con, ReturnAgree returnAgree, int i) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertReturnApply");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, returnAgree.getCId());
			pstmt.setInt(2, returnAgree.getPNo());
			pstmt.setDate(3, returnAgree.getApplyDate());
			pstmt.setString(4, returnAgree.getApplyTime());
			pstmt.setString(5, returnAgree.getGuideName());
			pstmt.setString(6, returnAgree.getGuideName());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public Member findUserPwd(Connection con, Member requestMember) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member findMember = null;
		
		String sql = prop.getProperty("findUserPwd");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, requestMember.getMemberId());
			pstmt.setString(2, requestMember.getMemberName());
			pstmt.setString(3, requestMember.getEmail());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				findMember = new Member();
				
				findMember.setMemberNo(rset.getInt("M_NO"));
				findMember.setMemberId(rset.getString("ID"));
				findMember.setMemberPwd(rset.getString("PWD"));
				findMember.setMemberRno(rset.getString("RNO"));
				findMember.setUType(rset.getString("TYPE"));
				findMember.setEmail(rset.getString("EMAIL"));
				findMember.setPhone(rset.getString("PHONE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return findMember;
	}

	public int updateMemberPwd(Connection con, int mno, String check, String userRno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String rno = "";
		
		if(userRno.endsWith("~")) {
			rno = userRno.substring(0, userRno.lastIndexOf("~"));
		} else {
			rno = userRno + "~";
		}
		
		String sql = prop.getProperty("updateMemberPwd");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, check);
			pstmt.setString(2, rno);
			pstmt.setInt(3, mno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
