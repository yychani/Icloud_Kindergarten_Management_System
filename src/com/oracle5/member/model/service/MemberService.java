package com.oracle5.member.model.service;

import java.sql.Connection;

import com.oracle5.member.model.dao.MemberDao;
import com.oracle5.member.model.vo.Member;
import static com.oracle5.common.JDBCTemplate.*;
public class MemberService {
	MemberDao md = new MemberDao();
	
	public Member loginMember(Member requestMember) {
		Connection con = getConnection();
		
		Member loginMember = md.loginMember(con, requestMember);
		
		close(con);
		return loginMember;
	}

}
