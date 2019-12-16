package com.oracle5.member.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.member.model.service.MemberService;

/**
 * Servlet implementation class ParentAsRequestServlet
 */
@WebServlet("/asRequest.me")
public class ParentAsRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ParentAsRequestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pNo = Integer.parseInt(request.getParameter("userNo"));
		String kidName = request.getParameter("kidName");
		
		// 원아명과 부모 번호 일치 확인 후 cid가져오기
		int cId = new MemberService().cNamepNoCheck(kidName, pNo);
				
		//해당 월 신청 이력 확인
		Calendar calendar = new GregorianCalendar(Locale.KOREA);
		int currentMonth;
		currentMonth = calendar.get(Calendar.MONTH) + 1;


		if(cId != 0) {
			int result = new MemberService().asRequest(cId);
			
			if(result > 0) {
				response.sendRedirect("views/common/successPage.jsp?successCode=8");
			}else {
				response.sendRedirect("views/common/successPage.jsp?successCode=9");
				
				//request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
