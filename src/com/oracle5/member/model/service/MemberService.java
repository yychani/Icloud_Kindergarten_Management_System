package com.oracle5.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.oracle5.common.model.vo.Attachment;
import com.oracle5.member.model.dao.MemberDao;
import com.oracle5.member.model.vo.Ban;
import com.oracle5.member.model.vo.Children;
import com.oracle5.member.model.vo.FamilyRelation;
import com.oracle5.member.model.vo.Member;
import com.oracle5.member.model.vo.MemberAndTeacher;
import com.oracle5.member.model.vo.Parents;
import com.oracle5.member.model.vo.Scholarly;
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
		close(con);
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
		close(con);
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
		ArrayList<Ban> list = new MemberDao().selectBan(con);
		
		close(con);
		return list;
	}

	public int insertChildren(HashMap<String, Object> hmap, String userId) {
		Connection con = getConnection();
		
		Children c = (Children)hmap.get("Children");
		ArrayList<Scholarly> s = (ArrayList<Scholarly>) hmap.get("scholList");
		ArrayList<FamilyRelation> f = (ArrayList<FamilyRelation>) hmap.get("familyList");
		ArrayList<Attachment> fileList = (ArrayList<Attachment>) hmap.get("fileList");
		Ban b = (Ban) hmap.get("Ban");
		Member requestMember = new Member();
		requestMember.setMemberId(userId);
		System.out.println(userId);
		int mNo = new MemberDao().searchMemberNo(con, requestMember);
		c.setPno(mNo);
		int result = 0;
		// 원아 테이블 insert
		int result1 = new MemberDao().insertChildren(con, c);
		
		// 원아 번호
		int cNo = new MemberDao().searchChildNo(con, c);
		Attachment childImg = fileList.get(0);
		childImg.setCId(cNo);
		// 업로드파일 테이블 insert
		int result2 = new MemberDao().insertChildImg(con, childImg);
		// 학적사항 테이블 insert
		int result3 = new MemberDao().insertScholar(con, s, cNo);
		// 가족관계 테이블 insert
		int result4 = new MemberDao().insertFamily(con, f, cNo);
		// 반변경 이력 테이블 insert
		// 반에 해당하는 선생 번호 조회
		int tNo = new MemberDao().selectTno(con, b);
		int result5 = new MemberDao().insertBanList(con, b, cNo, tNo);
		//원아테이블 반변경이력 추가
		int result6 = new MemberDao().updateChildBcno(con, cNo);
		if(result1 > 0 && result2 > 0 && result3 > s.size() - 1 && result4 > f.size() - 1 && result5 > 0 && result6 > 0) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int deleteParents(String userId) {
		Connection con = getConnection();
		Member requestMember = new Member();
		requestMember.setMemberId(userId);
		int mNo = new MemberDao().searchMemberNo(con, requestMember);
		
		int delete = new MemberDao().deleteParents(con, mNo);
		int delete1 = new MemberDao().deleteMember(con, mNo);
		
		if(delete > 0 && delete1 > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return delete;
	}

}
