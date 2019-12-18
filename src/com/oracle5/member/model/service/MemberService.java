package com.oracle5.member.model.service;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.oracle5.common.model.vo.Attachment;
import com.oracle5.member.model.dao.MemberDao;
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
import com.oracle5.member.model.vo.Parents;
import com.oracle5.member.model.vo.ReturnAgree;
import com.oracle5.member.model.vo.Scholarly;
import com.oracle5.member.model.vo.Teacher;

import static com.oracle5.common.JDBCTemplate.*;

/**
 * @author wonky
 *
 */
/**
 * @author wonky
 *
 */
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
			int pNo = md.searchMemberNo(con, m);
			p.setPNo(pNo);
		} 
		int result2 = new MemberDao().insertParent(con, p);
		int result3 = new MemberDao().insertTermsList(con, p);
		if (result1 > 0 && result2 > 0 && result3 > 2) {
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
		System.out.println(result2);
		// 학적사항 테이블 insert
		int result3 = new MemberDao().insertScholar(con, s, cNo);
		System.out.println(result3);
		// 가족관계 테이블 insert
		int result4 = new MemberDao().insertFamily(con, f, cNo);
		System.out.println(result4);
		// 반변경 이력 테이블 insert
		// 반에 해당하는 선생 번호 조회
		int tNo = new MemberDao().selectTno(con, b);
		int result5 = new MemberDao().insertBanList(con, b, cNo, tNo);
		System.out.println(result5);
		
		
		if(result1 > 0 && result2 > 0 && result3 > s.size() - 1 && result4 > f.size() - 1 && result5 > 0) {
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
		int delete = 0;
		int delete1 = 0;
		int mNo = new MemberDao().searchMemberNo(con, requestMember);
		int delete2 = new MemberDao().deleteTerms(con, mNo);
		if(delete2 > 0) {
			System.out.println("약관 삭제 성공");
			delete = new MemberDao().deleteParents(con, mNo);
			if(delete > 0) {
				System.out.println("부모 삭제 성공");
				delete1 = new MemberDao().deleteMember(con, mNo);
				if(delete1 > 0) {
					System.out.println("멤버 삭제 성공");
					commit(con);
				}else {
					rollback(con);
				}
			}
		}
		
		close(con);
		return delete;
	}

	public int updateChildBcno(HashMap<String, Object> hmap, String userId) {
		Connection con = getConnection();
		
		Children c = (Children)hmap.get("Children");
		Member requestMember = new Member();
		requestMember.setMemberId(userId);
		System.out.println(userId);
		int mNo = new MemberDao().searchMemberNo(con, requestMember);
		c.setPno(mNo);
		
		int cNo = new MemberDao().searchChildNo(con, c);
		System.out.println(cNo);
		int bcno = new MemberDao().selectChildBcno(con, cNo);
		System.out.println(bcno);
		int result = new MemberDao().updateChildBcno(con, bcno, cNo);
		System.out.println(result);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<MemberAndTeacher> selectTeacher() {
		Connection con = getConnection();
		
		ArrayList<MemberAndTeacher> list = new MemberDao().selectTeacher(con);
		
		close(con);
		return list;
	}

	public HashMap<String, Object> childRecordBook(int cId) {
		Connection con = getConnection();
		
		HashMap<String, Object> hmap = new HashMap<>();
		
		close(con);
		return hmap;
	}


	//학부모 내정보 비밀번호 재확인
	public Member parentsPassCheck(Member requestMember) {
		Connection con = getConnection();
		
		Member loginMember = md.parentsPassCheck(con, requestMember);
		close(con);
		
		return loginMember;
	}

	//학부모 내정보 비밀번호 변경
	public int updateParentsPass(Member loginMember) {
		Connection con = getConnection();
		int result = new MemberDao().updateParentsPass(con, loginMember);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
  }
	public List<Map<String, Object>> selectNotAppList(int currentPage, int limit, int memberNo) {
		Connection con = getConnection();
		
		List<Map<String, Object>> list = new MemberDao().selectNotAppList(con, currentPage, limit, memberNo);
		
		close(con);
		
		return list;

	}


	//학부모 계정 탈퇴
	public int deleteParent(String userId) {
		Connection con = getConnection();

		int result = md.deleteParent(con, userId);
		
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);

		return result;
  }
  
	public Children selectOneChild(int cid) {
		Connection con = getConnection();
		
		Children c = new MemberDao().selectOneChild(con, cid);
		
		close(con);
		
		return c;
	}

	public List<Map<String, Object>> selectAcceptAppList(int currentPage, int limit, int memberNo) {
		Connection con = getConnection();
		
		List<Map<String, Object>> list = new MemberDao().selectAcceptAppList(con, currentPage, limit, memberNo);
		
		close(con);
		
		return list;

	}


	//학부모 방과후 신청
	public int asRequest(int cId) {
		Connection con = getConnection();
		
		int result = md.asRequest(con, cId);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	//투약의뢰서 신청
	public int doseRequest(DoseRequest dr) {
		Connection con = getConnection();
		
		//DOESREQ 테이블 INSERT
		int result = md.doseRequest(con, dr);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	//투약의뢰서 가져오기
	public DoseRequest selectDoseReq(int pNo) {
		Connection con = getConnection();
		
		DoseRequest dr = md.selectDoseReq(con, pNo);
		
		close(con);
		
		return dr;
	}

	//투약시간테이블 INSERT
	public int doseTimeInsert(DoseRequest requestDose, String dosingTime) {
		Connection con = getConnection();
		
		int result = md.insertDoseTime(con, requestDose, dosingTime);
		
		if(result > 0) {
      		commit(con);
		} else {
			rollback(con);
		}
    		
		close(con);
		
		return result;
  }

	public int getNotAppListCount(int memberNo) {
		Connection con = getConnection();
		
		int listCount = new MemberDao().getNotAppListCount(con, memberNo);
		
		close(con);
		
		return listCount;
	}

	public int getAcceptListCount(int memberNo) {
		Connection con = getConnection();
		
		int listCount = new MemberDao().getAcceptListCount(con, memberNo);
		
		close(con);
		
		return listCount;
	}

	public int updateParentApproval(String[] mno) {
		Connection con = getConnection();
		
		int update = 0;
		for(String key : mno) {
			int userNo = Integer.parseInt(key);
			update += new MemberDao().updateParentApproval(con, userNo);
		}
		
		if(mno.length == update) {
      	commit(con);
		}else {
			rollback(con);
		}
		close(con);
    
    return update;
  }

	


	//귀가동의서 INSERT
	public int returnApply(ReturnAgree ra) {
		Connection con = getConnection();
						
		int result = md.insertReturnApply(con, ra);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;

	}
	
	//교사의 담당반 원아 리스트 불러오기
	public ArrayList<Children> selectBanChilren(int memberNo) {
		Connection con = getConnection();
		
		int bno = new MemberDao().selectBanNo(con, memberNo);
		
		ArrayList<Children> list = new MemberDao().selectBanChildren(con, bno);
		
		close(con);
		
		return list;
	}

	public Map<String, Object> selectChildDetail(int cid) {
		Connection con = getConnection();
		
		Map<String, Object> hmap = new MemberDao().selectChildDetail(con, cid);
		
		close(con);
		
		return hmap;
	}

	//귀가동의서 신청기록 불러오기
	public ArrayList<ReturnAgree> selectRaList(int memberNo) {
		Connection con = getConnection();
		
		ArrayList<ReturnAgree> raList = new MemberDao().selectRaList(con, memberNo);
		
		close(con);
		
		return raList;
	}

	//유아명으로 cid가져오기
	public int selectCId(String kidsName) {
		Connection con = getConnection();
		
		int cId = md.selectCId(con, kidsName);
		
		close(con);
		
		return cId;
	}

	//투약의뢰서 외뢰기록 불러오기
	public ArrayList<DoseRequest> selectDoseList(int memberNo) {
		Connection con = getConnection();
		
		ArrayList<DoseRequest> list = new MemberDao().selectDoList(con, memberNo);
		
		close(con);
		
		return list;
	}
	//생활기록부 첫번째 값 불러오기
	public Map<String, Object> selectRcBookFirst(int cid) {
		Connection con = getConnection();
		
		Map<String, Object> hmap = new MemberDao().selectRcBookFirst(con, cid);
		
		close(con);
		
		return hmap;
	}

	//생활기록부 학부모 주소 불러오기
	public String selectParentsAddress(int cid) {
		Connection con = getConnection();
		
		String address = new MemberDao().selectParentsAddress(con, cid);
		
		close(con);
		
		return address;
	}

	public ArrayList<FamilyRelation> selectFamilyRelation(int cid) {
		Connection con = getConnection();
		
		ArrayList<FamilyRelation> fr = new MemberDao().selectFamilyRelation(con, cid);
		
		close(con);
		
		return fr;
	}

	public ArrayList<Scholarly> selectScholarly(int cid) {
		Connection con = getConnection();
		
		ArrayList<Scholarly> sc = new MemberDao().selectScholarly(con, cid);
		
		close(con);
		
		return sc;
	}

	public ArrayList<BodyInfo> selectBodyInfo(int cid) {
		Connection con = getConnection();
		
		ArrayList<BodyInfo> bi = new MemberDao().selectBodyInfo(con, cid);
		
		close(con);
		
		return bi;
	}


	public Map<String, Object> selectChildAttend(int cid) {
		Connection con = getConnection();
		
		Map<String, Object> ar = new MemberDao().selectChildAttend(con, cid);
		
		close(con);
		
		return ar;
}
  

	//원아명 학무보pNo 일치 확인
	public int cNamepNoCheck(String kidName, int pNo) {
		Connection con = getConnection();
		
		int cId = new MemberDao().cNamepNoCheck(con, kidName, pNo);
		
		close(con);
		
		return cId;
	}

	//현장체험학습 insert
	public int insertFtlApply(int cId) {
		Connection con = getConnection();
		
		//현장체험학습 MAX값 가져오기
		int ftlMax = new MemberDao().selectFtl(con);
		System.out.println(ftlMax);
		
		//insert
		int result = new MemberDao().insertFtlApply(con, cId, ftlMax);
		
		close(con);
		
		return result;

	}


	public Date presidentEntDate() {
		Connection con = getConnection();
		
		Date presidentEntDate = new MemberDao().presidentEntDate(con);
		
		close(con);
		return presidentEntDate;
}

	//학부모 pno로 원아cid가져오기
	public int selectCId(int pNo) {
		Connection con = getConnection();
		
		int cId = md.searchCID(con, pNo);;
		
		return cId;
	}

	//현장 체험학습 리스트 select
	public Map<String, Object> selectFtlApplyList(int pNo) {
		Connection con = getConnection();
		
		Map<String, Object> hmap = new MemberDao().selectFtlApplyList(con, pNo);
		
		close(con);
		
		return hmap;
	}

	//현장 체험학습 신청했는지 확인
	public int checkFtlApply(int cId) {
		Connection con = getConnection();
		
		int check = md.checkFtlApply(con, cId);
		
		close(con);
		
		return check;
	}

	//현장 체험학습 신청페이지 정보 불러오기
	public FieldLearning selectfl() {
		Connection con = getConnection();
		
		FieldLearning fl = md.selectFl(con);
		
		close(con);
		
		return fl;

	}

	public int checkBodyInfo(int cid) {
		Connection con = getConnection();
		
		int check = new MemberDao().checkBodyInfo(con, cid);
		
		close(con);
		
		return check;
	}

	public Map<String, Object> selectChildDetail2(int cid) {
		Connection con = getConnection();
		
		Map<String, Object> hmap = new MemberDao().selectChildDetail2(con, cid);
		
		close(con);
		
		return hmap;
	}

	public int insertBodyInfo(int cid, BodyInfo bi) {
		Connection con = getConnection();
		
		int result = new MemberDao().insertBodyInfo(con, cid, bi);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	//학부모 정보 수정(member테이블 - 이름, 폰, 이메일 변경)
	public int pInfoChange(Member changeM, int pNo) {
		Connection con = getConnection();
		
		int result = md.pInfoChange(con, changeM, pNo);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
			
		return result;
	}

	//학부모 정보 수정(parent 테이블 - 주소 update)
	public int pInfochange(String address, int pNo) {
		Connection con = getConnection();
		
		int result = md.pInfoChange(con, address, pNo);
    
    if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	
	public int deleteBodyInfo(int bino) {
		Connection con = getConnection();
		
		int result = new MemberDao().deleteBodyInfo(con, bino);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}


	public int childBodyInfoCount(int cid) {
		Connection con = getConnection();
		
		int count = new MemberDao().childBodyInfoCount(con, cid);
		
		close(con);
		
		return count;
	}

	public ArrayList<BodyInfo> selectChildBodyInfoPaging(int cid, int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<BodyInfo> list = new MemberDao().selectChildBodyInfoPaging(con, cid, currentPage, limit);
		
		close(con);
		
		return list;
  }
  
	//학부모 주소, 개인정보 가져오기
	public Map<String, Object> selectPInfo(int pNo) {
		Connection con = getConnection();
		
		Map<String, Object> hmap = md.selectPInfo(con, pNo);
		
		close(con);
		
		return hmap;

	}

	//아이 관찰 척도 가져오기
	public ArrayList<Map<String, Object>> selectChildObservation(int cid, int age) {
		Connection con = getConnection();
		
		Children c = new MemberDao().selectOneChild(con, cid);
		
		ArrayList<Map<String, Object>> list = new MemberDao().selectChildObservation(con, cid, age);
		
		if(list.size() == 0) {
			list = new ArrayList<>();
			Map<String, Object> hmap = new HashMap<String, Object>();
			
			hmap.put("c", c);
			list.add(hmap);
		}
		
		close(con);
		
		return list;
	}

	public int insertChildOb(Observation ob) {
		Connection con = getConnection();
		
		int result = new MemberDao().insertChildOb(con, ob);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
}

	//학부모 원아정보 가져오기
	public ArrayList<HashMap<String, Object>> selectCInfo(int pNo) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = md.selectCInfo(con, pNo);
		
		close(con);
		
		return list;

	}

	public int checkChildOb(Observation ob) {
		Connection con = getConnection();
		
		int check = new MemberDao().checkChildOb(con, ob);
		
		close(con);
		
		return check;
	}

	public int updateChildOb(Observation ob) {
		Connection con = getConnection();
		
		int result = new MemberDao().updateChildOb(con, ob);
		
		close(con);
		
		return result;
	}

	public int insertChildNote(Note n) {
		Connection con = getConnection();
		
		int result = new MemberDao().insertChildNote(con, n);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<Note> selectChildNote(Date nDate, int tno) {
		Connection con = getConnection();
		
		ArrayList<Note> list = new MemberDao().selectChildNote(con, nDate, tno);
		
		close(con);
		
		return list;
	}

	public int insertChildAttend(Attend a) {
		
		return 0;
	}

	public int insertChildAttend(String date, String[] cidArr, String[] attArr) {
		Connection con = getConnection();
		
		int result = 0;
		
		for(int i = 0; i < cidArr.length; i++) {
			Attend a = new Attend();
			a.setAmDate(Date.valueOf(date));
			a.setAType(attArr[i]);
			a.setCId(Integer.parseInt(cidArr[i]));
			
			result += new MemberDao().insertChildAttend(con, a);
		}
		
		if(result == cidArr.length) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<Attend> selectBanChildAttend(Date nDate, int tno) {
		Connection con = getConnection();
		
		ArrayList<Attend> list = new MemberDao().selectBanChildAttend(con, nDate, tno);
		
		close(con);
		
		return list;
	}

	public ArrayList<Children> selectBanOkAsList(int tno) {
		Connection con = getConnection();
		
		ArrayList<Children> list = new MemberDao().selectBanOkAsList(con, tno);
		
		close(con);
		
		return list;
	}

	public ArrayList<Children> selectBanNoAsList(int tno) {
		Connection con = getConnection();
		
		ArrayList<Children> list = new MemberDao().selectBanNoAsList(con, tno);
		
		close(con);
		
		return list;
	}

	public String selectBanName(int memberNo) {
		Connection con = getConnection();
		
		String banName = new MemberDao().selectBanName(con, memberNo);
		
		close(con);
		
		return banName;
	}

	//학부모알림장 - 원아 이름,cid 가져오기
	public ArrayList<Children> selectCName(int pNo) {
		Connection con = getConnection();
		
		ArrayList<Children> cNameList = md.selectCName(con, pNo);
		
		close(con);
		
		return cNameList;
	}

	//날짜랑 원아번호로 원아 알림장 조회해오기
	public Note selectCNote(int cId, Date cDate) {
		Connection con = getConnection();
		
		Note cNote = md.selectCNote(con, cId, cDate);
		
		close(con);
		
		return cNote;
	}


	//선생님 알림장
	public CNote selectTNote(int tNo, Date cDate) {
		Connection con = getConnection();
		
		CNote tNote = md.selectTNote(con, tNo, cDate);
		
		close(con);
		
		return tNote;
	}

	//원장님 알림장
	public CNote selectPNote(Date cDate) {
		Connection con = getConnection();
		
		CNote pNote = md.selectPNote(con, cDate);
		
		close(con);
		
		return pNote;
	}

	//반 이름 가져오기
	public Ban selectNoteBan(int cId) {
		Connection con = getConnection();
		
		Ban b = md.selectNoteBan(con, cId);
		
		close(con);
		
		return b;
	}

	//방과 후 신청 이력 가져오기
	public HashMap<String, Object> selectAsList(int pNo) {
		Connection con = getConnection();
		
		HashMap<String, Object> hmap = md.selectAsList(con, pNo);
		
		close(con);
		
		return hmap;
  }

	public ArrayList<Attend> selectBanAttend(int tno) {
		Connection con = getConnection();
		
		ArrayList<Attend> list = new MemberDao().selectBanAttend(con, tno);
		
		close(con);
		
		return list;
	}

	public int updateAsList(String[] cid, Date endDate) {
		Connection con = getConnection();
		
		int result = 0;
		
		for(int i = 0; i < cid.length; i++) {
			result += new MemberDao().updateAsList(con, Integer.parseInt(cid[i]), endDate);
		}
		
		if(result == cid.length) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;

	}

	//cId로 출석 가져오기
	public ArrayList<Attend> selectCAttend(int cId) {
		Connection con = getConnection();
		
		ArrayList<Attend> list = md.selectCAttend(con, cId);
  	close(con);
		
		return list;
	}

	public ArrayList<DoseRequest> selectBanDoseList(int memberNo) {
		Connection con = getConnection();
		
		ArrayList<DoseRequest> list = new MemberDao().selectBanDoseList(con, memberNo);
		
		close(con);
		
		return list;
	}

	//방과후 이력 확인
	public int selectAsCheck(int cId, int currentMonth, int currentYear) {
		Connection con = getConnection();
		
		int check = md.selectAsCheck(con, cId, currentMonth, currentYear);
		
		if(check > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return check;
}
  
	public DoseRequest selectChildDoseReq(int dno) {
		Connection con = getConnection();
		
		DoseRequest dr = new MemberDao().selectChildDoseReq(con, dno);
		
		close(con);
		
		return dr;

	}


	public int updateDoseReqStatus(int dno, String stat) {
		Connection con = getConnection();
		
		int result = new MemberDao().updateDoseReqStatus(con, dno, stat);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<ReturnAgree> selectBanRtnList(int memberNo) {
		Connection con = getConnection();
		
		ArrayList<ReturnAgree> list = new MemberDao().selectBanRtnList(con, memberNo);
		
		close(con);
		
		return list;
	}

	public ReturnAgree selectChildRtn(int rano) {
		Connection con = getConnection();
		
		ReturnAgree r = new MemberDao().selectChildRtn(con, rano);
		
		close(con);
		
		return r;
	}

	public int updateRtnStatus(int rano, String stat) {
		Connection con = getConnection();
		
		int result = new MemberDao().updateRtnStatus(con, rano, stat);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
  }

	//내아이 정보 - 이름, 사진 불러오기
	public Children selectCnamePhoto(int cId) {
		Connection con = getConnection();
		
		Children c = md.selectCnamePhoto(con, cId);
		
		close(con);
		
		return c;
	}

	//최근 신체정보 불러오기
	public BodyInfo selectRecentBodyInfo(int cId) {
		Connection con = getConnection();
		
		BodyInfo b = md.selectRecentBodyInfo(con, cId);
		
		close(con);
		
		return b;
	}

	//신체정보 리스트 불러오기
	public ArrayList<BodyInfo> selectBodyInfoList(int cId) {
		Connection con = getConnection();
		
		ArrayList<BodyInfo> bList = md.selectBodyInfoList(con, cId);
		
		close(con);
		
		return bList;

	}


	public Teacher selectOneTeacher(int memberNo) {
		Connection con = getConnection();
		
		Teacher t = new MemberDao().selectOneTeacher(con, memberNo);
		
		close(con);
		
		return t;
  }
  
	public Teacher selectMyTeacher(int pno) {
		Connection con = getConnection();
		
		Teacher teacher = new MemberDao().selectMyTeacher(con, pno);
		
		close(con);
		return teacher;

	}

	public int updateTeacherInfo(int mno, Teacher t, Member m) {
		Connection con = getConnection();
		
		int result = 0;
		
		int result1 = new MemberDao().updateTeacherInfo(con, mno, t);
		
		int result2 = new MemberDao().updateTeacherMInfo(con, mno, m);
		
		if(result1 > 0 && result2 > 0) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
}

	public Children selectChildren(int cId) {
		Connection con = getConnection();
		
		Children c = md.selectChildren(con, cId);
		
		close(con);
		
		return c;

	}

	public String selectBirth(int cId) {
		Connection con = getConnection();
		
		String birth = md.selectBirth(con, cId);
		
		close(con);
		
		return birth;
	}

	//내아이 children 객체 업데이트
	public int updateChildrenInfoC(Children c) {
		Connection con = getConnection();
		
		int result = md.updateChildrenInfoC(con, c);
		
		close(con);
		
		return result;
	}

	//거주지 업데이트
	public int updateAddress(int pNo, String address) {
		Connection con = getConnection();
		
		int result = md.updateAddress(con, pNo, address);
		
		close(con);
		
		return result;
	}

	//가족관계 업데이트
	public int updateFamilyRelatioin(ArrayList<FamilyRelation> frList) {
		Connection con = getConnection();
		int result = 0;
		
		for(int i = 0; i < frList.size(); i++) {
			result += md.updateFamilyRelatioin(con, frList.get(i));
		}
		
		if(result == frList.size()) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	//학적 업데이트
	public int updateScholarly(ArrayList<Scholarly> sList, int cId) {
		Connection con = getConnection();
		int result = 0;
		
		for(int i = 0; i < sList.size(); i++) {
			result += md.updateScholarly(con, sList.get(i), cId);
			
		}
		
		if(result == sList.size()) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public MemberAndTeacher selectTeacherName(int cId, int pNo) {
		Connection con = getConnection();
		
		MemberAndTeacher mt = md.selectTeacherName(con, cId, pNo);
		
		close(con);
		
		return mt;
	}

}
