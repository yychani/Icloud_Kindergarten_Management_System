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
		String kidName = request.getParameter("cName");
		
		
		if(kidName.contains("/")) {
			String[] split = kidName.split("/");
			String[] splitl = new String[split.length];
			for (int i = 0; i < split.length; i++) {
				splitl[i] = split[i];
				System.out.println(splitl[i]);
			}
			
			if(splitl != null) {
				int result = new MemberService().asRequest(splitl);
				
				if(result == splitl.length) {
					response.sendRedirect("views/common/successPage.jsp?successCode=8");
				}else {
					response.sendRedirect("views/common/successPage.jsp?successCode=9");

				}
			}
		} else {
			int cId = Integer.parseInt(kidName);
			//해당 월 신청 이력 확인
			Calendar calendar = new GregorianCalendar(Locale.KOREA);
			int currentMonth = 0;
			currentMonth = calendar.get(Calendar.MONTH) + 1;
			int currentYear = calendar.get(Calendar.YEAR);
			
			int check = new MemberService().selectAsCheck(cId, currentMonth, currentYear);


			if(cId != 0) {
				if(check == 0) {
					int result = new MemberService().asRequest(cId);
					
					if(result > 0) {
						response.sendRedirect("views/common/successPage.jsp?successCode=8");
					}else {
						response.sendRedirect("views/common/successPage.jsp?successCode=9");

					}
				} else {
					request.setAttribute("msg", "이번 달에 이미 신청하셨습니다.");
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				}
				
			} else {
				request.setAttribute("msg", "입력하신 원아를 찾을 수 없습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
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
