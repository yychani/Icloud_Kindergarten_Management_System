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

		String cId = request.getParameter("cName");

		String page = "";
		
		if(cId.contains("/")) {
			String[] split = cId.split("/");
			String[] cIdString = new String[split.length];
			for (int i = 0; i < split.length; i++) {
				cIdString[i] = split[i];
			}

			if(cIdString != null) {
				// 이미 신청했는지 확인
				int check1 = 0;
				for(int i = 0; i < cIdString.length; i++) {
					int cid = Integer.parseInt(cIdString[i]);
					check1 += new MemberService().checkFtlApply(cid);
				}
				
				if(check1 == 0) {
					//신청이력 없으면 신청
					int result = new MemberService().insertFtlApply(cIdString);
					
					if(result == cIdString.length) {
						response.sendRedirect("views/common/successPage.jsp?successCode=13");
					} else {
						page = "views/common/errorPage.jsp";
						request.setAttribute("msg", "현장학습 신청 에러");
						request.getRequestDispatcher(page).forward(request, response);
					}
				} else {
					//신청이력 존재
					page = "views/common/errorPage.jsp";
					request.setAttribute("msg", "신청 이력이 존재하는 원아가 있습니다. 이력확인 후 다시 신청해주세요.");
					request.getRequestDispatcher(page).forward(request, response);
				}
				
				
			}
			
		} else {
			int icId = Integer.parseInt(cId);
			if (icId != 0) {
				// 이미 신청했는지 확인
				int check = new MemberService().checkFtlApply(icId);
				
				if (check == 0) {
					// 현장학습신청서 insert
					int result = new MemberService().insertFtlApply(icId);

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
