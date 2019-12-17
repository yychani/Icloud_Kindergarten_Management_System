package com.oracle5.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.Member;

/**
 * Servlet implementation class ParentFtlApplyServlet
 */
@WebServlet("/ftlApply.me")
public class ParentFtlApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ParentFtlApplyServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

		int cId = Integer.parseInt(request.getParameter("cName"));

		String page = "";

		if (cId != 0) {
			// 이미 신청했는지 확인
			int check = new MemberService().checkFtlApply(cId);
			
			if (check == 0) {
				// 현장학습신청서 insert
				int result = new MemberService().insertFtlApply(cId);

				if (result > 0) {
					response.sendRedirect("views/common/successPage.jsp?successCode=13");
				} else {
					page = "views/common/errorPage.jsp";
					request.setAttribute("msg", "현장학습 신청 에러");
					request.getRequestDispatcher(page).forward(request, response);
				}
			} else {
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "이미 신청하셨습니다.");
				request.getRequestDispatcher(page).forward(request, response);
			}
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "입력하신 원아를 찾을 수 없습니다.");
			request.getRequestDispatcher(page).forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
