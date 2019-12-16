package com.oracle5.member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.Member;
import com.oracle5.member.model.vo.Note;

@WebServlet("/insertChildNote.me")
public class InsertChildNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cid = Integer.parseInt(request.getParameter("childList"));
		int tno = Integer.parseInt(request.getParameter("tno"));
		String date = request.getParameter("date");
		String unique = request.getParameter("unique");
		String materials = request.getParameter("materials");
		String health = request.getParameter("health");

		Date nDate = Date.valueOf(date);

		Note n = new Note();
		n.setCid(cid);
		n.setUnique(unique);
		n.setMaterials(materials);
		n.setHealth(health);
		n.setNDate(nDate);
		n.setTno(tno);
		
		int result = new MemberService().insertChildNote(n);
		
		Member m = (Member) request.getSession().getAttribute("loginMember");
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/selectChildNote.me?date=" + date + "&tno=" + m.getMemberNo() + "&cid=" + cid);
		} else {
			request.setAttribute("msg", "원아별 알림장 입력 실패!");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
