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
		
		//해당 월 신청 이력 확인을 위한 변수
		Calendar calendar = new GregorianCalendar(Locale.KOREA);
		int currentMonth = 0;
		currentMonth = calendar.get(Calendar.MONTH) + 1;
		int currentYear = calendar.get(Calendar.YEAR);
		
		//전체원아 선택 시
		if(kidName.contains("/")) {
			String[] split = kidName.split("/");
			String[] cIdString = new String[split.length];
			for (int i = 0; i < split.length; i++) {
				cIdString[i] = split[i];
			}
			
			int check1 = 0;
			if(cIdString != null) {
				for(int i = 0; i < cIdString.length; i++) {
					int cid = Integer.parseInt(cIdString[i]);
					check1 += new MemberService().selectAsCheck(cid, currentMonth, currentYear);
				}
				//해당월 신청이력 없음 신청 INSERT
				if(check1 == 0) {
					int result = new MemberService().asRequest(cIdString);
					if(result == cIdString.length) {
						response.sendRedirect("views/common/successPage.jsp?successCode=8");
					}else {
						response.sendRedirect("views/common/successPage.jsp?successCode=9");
					}
				}else {
					request.setAttribute("msg", "당월 신청하신 원아가 존재합니다. 이력 확인 후 개별 신청해주세요.");
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				}
				
			}
		} else {
			//특정 원아 선택 시
			int cId = Integer.parseInt(kidName);

			//해당 월 이력 확인
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
