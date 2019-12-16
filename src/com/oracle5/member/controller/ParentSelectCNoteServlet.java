package com.oracle5.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.Ban;
import com.oracle5.member.model.vo.CNote;
import com.oracle5.member.model.vo.Note;

/**
 * Servlet implementation class ParentSelectCNoteServlet
 */
@WebServlet("/pSelectCNote.me")
public class ParentSelectCNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ParentSelectCNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cId = Integer.parseInt(request.getParameter("cId"));
		System.out.println(cId);
		String date = request.getParameter("date");
		System.out.println(date);
		
		Date cDate;
		if(date != "") {
			cDate = java.sql.Date.valueOf(date);
		} else {
			cDate = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
		}
		
		//날짜랑 원아번호로 원아 알림장 조회해오기
		Note cNote = new MemberService().selectCNote(cId, cDate);
		System.out.println(cNote);
		int tNo = cNote.getTno();
		
		//선생님 알림장
		CNote tNote = new MemberService().selectTNote(tNo, cDate);
		
		//원장님 알림장
		CNote pNote = new MemberService().selectPNote(cDate);
		
		//반 이름 가져오기
		Ban b = new MemberService().selectNoteBan(cId);
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("cNote", cNote);
		hmap.put("tNote", tNote);
		hmap.put("pNote", pNote);
		hmap.put("b", b);
		
		
		if(cNote != null) {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(hmap, response.getWriter());
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
