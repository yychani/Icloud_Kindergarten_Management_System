package com.oracle5.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.oracle5.member.model.dao.MemberDao;
import com.oracle5.member.model.vo.Member;
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

	public int insertTeacher(Member requestMember, Teacher requestTeacher) {
		Connection con = getConnection();
		
		int result = md.insertMemberT(con, requestMember);
		int result1 = 0;
		if(result > 0) {
			System.out.println("멤버 추가");
			result1 = md.insertTeacher(con, requestTeacher);
			if(result1 > 0) {
				commit(con);
			}else {
				rollback(con);
			}
		}else {
			rollback(con);
		}
		
		return result1;
	}

	public ArrayList<Member> selectAllMember() {
		Connection con = getConnection();

		ArrayList<Member> list = new MemberDao().selectAllMember(con);

		close(con);

		return list;
	}

	public ArrayList<Teacher> selectAllTeacher() {
		Connection con = getConnection();

		ArrayList<Teacher> list = new MemberDao().selectAllTeacher(con);

		close(con);

		return list;
	}

}
