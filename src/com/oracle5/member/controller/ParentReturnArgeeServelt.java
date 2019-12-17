package com.oracle5.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.ReturnAgree;

/**
 * Servlet implementation class ParentReturnArgeeServelt
 */
@WebServlet("/returnAgree.me")
public class ParentReturnArgeeServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ParentReturnArgeeServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String kidsName = request.getParameter("kidsName");
		String guideName = request.getParameter("guideName");
		String guidePhone = request.getParameter("guidePhone");
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		int cId = Integer.parseInt(request.getParameter("cName"));
		
		String sapplyDate = request.getParameter("applyDate");
		Date applyDate;
		if(sapplyDate != "") {
			applyDate = java.sql.Date.valueOf(sapplyDate);
		} else {
			applyDate = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
		}
		
		String applyTime = request.getParameter("applyTime");
		
		if(cId != 0) {
			ReturnAgree ra = new ReturnAgree();
			ra.setPNo(pNo);
			ra.setApplyDate(applyDate);
			ra.setApplyTime(applyTime);
			ra.setGuideName(guideName);
			ra.setGuidePhone(guidePhone);
			ra.setCId(cId);
			
			int result = new MemberService().returnApply(ra);
			
			if(result > 0) {
				response.sendRedirect("views/common/successPage.jsp?successCode=12");
			} else {
				request.setAttribute("msg", "귀가동의서 신청 실패");
				
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("msg", "입력하신 원아를 찾을 수 없습니다.");
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
