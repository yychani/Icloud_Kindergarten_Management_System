package com.oracle5.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.Children;
import com.oracle5.member.model.vo.FamilyRelation;
import com.oracle5.member.model.vo.Member;
import com.oracle5.member.model.vo.Scholarly;

/**
 * Servlet implementation class ChildInfoChangeServlet
 */
@WebServlet("/kidInfoChange.me")
public class ChildInfoChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChildInfoChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String originAdd = request.getParameter("originAddress");
		String description = request.getParameter("description");
		String bloodType  = request.getParameter("bloodType");
		int cId = Integer.parseInt(request.getParameter("cId"));
		
		Children c = new Children();
		c.setCId(cId);
		c.setBloodType(bloodType);
		c.setOriginAddr(originAdd);
		c.setDescription(description);
		
		int result1 = new MemberService().updateChildrenInfoC(c);
		
		//거주지 업데이트
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginMember");
		int pNo = loginUser.getMemberNo();
		String address = request.getParameter("address");
		int result2 = new MemberService().updateAddress(pNo, address);
		
		//가족사항
		String[] fName = request.getParameterValues("fName");
		String[] fRelation = request.getParameterValues("fRelation");
		String[] fPhone = request.getParameterValues("fPhone");
		String[] srelationId = request.getParameterValues("relationId");
		int[] relationId = new int[srelationId.length];
		
		for(int i = 0; i < relationId.length; i++) {
			relationId[i] = Integer.parseInt(srelationId[i]);
		}
		
		ArrayList<FamilyRelation> frList = new ArrayList<FamilyRelation>();
		for(int i = 0; i < fName.length; i++) {
			FamilyRelation fr = new FamilyRelation();
			fr.setName(fName[i]);
			fr.setRelation(fRelation[i]);
			fr.setPhone(fPhone[i]);
			fr.setRelationId(relationId[i]);
			
			frList.add(fr);
		}
		
		//가족관계 업데이트
		int result3 = new MemberService().updateFamilyRelatioin(frList);
		
		//학력
		String[] stDate = request.getParameterValues("sDate");
		Date[] sDate = new Date[stDate.length];
		for(int i = 0; i < stDate.length; i++) {
			if(stDate[i] != null) {
				sDate[i] = java.sql.Date.valueOf(stDate[i]);
			} else {
				sDate[i] = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
			}
		}
		String[] sAgency = request.getParameterValues("sAgency");
		String[] sUnique = request.getParameterValues("sUnique");
		ArrayList<Scholarly> sList = new ArrayList<Scholarly>();
		for(int i = 0; i < sAgency.length; i++) {
			Scholarly sc = new Scholarly();
			sc.setAgency(sAgency[i]);
			sc.setSDate(sDate[i]);
			sc.setUniqueness(sUnique[i]);
			
			sList.add(sc);
		}
		
		//학적 업데이트
		int result4 = new MemberService().updateScholarly(sList, cId);
		
		if(result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0) {
			response.sendRedirect("views/common/successPage.jsp?successCode=16");
		} else {
			request.setAttribute("msg", "원아 정보 업데이트 실패");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
