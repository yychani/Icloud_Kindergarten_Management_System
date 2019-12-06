package com.oracle5.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.oracle5.member.model.dao.MemberDao;
import com.oracle5.member.model.vo.Ban;
import com.oracle5.member.model.vo.Member;
import com.oracle5.member.model.vo.MemberAndTeacher;
import com.oracle5.member.model.vo.Parents;
import com.oracle5.member.model.vo.Teacher;

import static com.oracle5.common.JDBCTemplate.*;

public class MemberService {
	MemberDao md = new MemberDao();

	public Member loginMember(Member requestMember) {
		Connection con = getConnection();

		Member loginMember = md.loginMember(con, requestMember);

		close(con);
		return loginMember;
	}

	public int insertTeacher(HashMap<String, Object> hmap) {
		Connection con = getConnection();
		
		Member requestMember = (Member) hmap.get("Member");
		Teacher requestTeacher = (Teacher) hmap.get("Teacher");
		Ban b = (Ban) hmap.get("Ban");
		int result = md.insertMemberT(con, requestMember);
		int result1 = 0;
		if (result > 0) {
			int userId = md.searchMemberNo(con, requestMember);
			requestTeacher.setTeacherNo(userId);
		} 
		
		result1 = md.insertTeacher(con, requestTeacher);
		int result2 = md.insertBanList(con, b, requestTeacher);
		int bcno = md.searchBanListNo(con, requestTeacher.getTeacherNo());
		int result3 = 0;
		if(bcno > 0) {
			result3 = md.updateBcno(con, requestTeacher.getTeacherNo(), bcno);
		}
		
		if (result1 > 0 && result2 > 0 && result3 > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return result1;
	}

	public ArrayList<MemberAndTeacher> selectAllTeacher() {
		Connection con = getConnection();

		ArrayList<MemberAndTeacher> list = new MemberDao().selectAllTeacher(con);

		close(con);

		return list;
	}

	public int deleteTeacher(String userId) {
		Connection con = getConnection();

		int result = md.deleteTeacher(con, userId);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		return result;
	}

	public Member idCheck(String userId) {
		Connection con = getConnection();
		
		Member m = new MemberDao().idCheck(con, userId);
		
		close(con);
		return m;
	}

	public int insertParent(HashMap<String, Object> hmap) {
		Connection con = getConnection();
		
		int result = 0;
		Parents p = (Parents) hmap.get("Parent");
		Member m = (Member) hmap.get("Member");
		int result1 = new MemberDao().insertMemberP(con, m);
		
		if (result1 > 0) {
			int userId = md.searchMemberNo(con, m);
			p.setPNo(userId);
		} 
		int result2 = new MemberDao().insertParent(con, p);
		
		if (result1 > 0 && result2 > 0) {
			commit(con);
			result = 1;
		} else {
			rollback(con); 
		}
		close(con);
		return result;
	}

	public ArrayList<Ban> selectBan() {
		Connection con = getConnection();
		System.out.println("servlet");
		ArrayList<Ban> list = new MemberDao().selectBan(con);
		
		close(con);
		return list;
	}

}
