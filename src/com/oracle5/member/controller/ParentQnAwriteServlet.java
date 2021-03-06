package com.oracle5.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oracle5.board.model.vo.Board;
import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.Member;

/**
 * Servlet implementation class ParentQnAwriteServlet
 */
@WebServlet("/pQnAwrite.me")
public class ParentQnAwriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ParentQnAwriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginMember");
		int pNo = loginUser.getMemberNo();
		
		int cId = Integer.parseInt(request.getParameter("cId"));
		String stNo = request.getParameter("tNo");
		int tNo = Integer.parseInt(stNo);
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Board b = new Board();
		b.setTtitle(title);
		b.setTcont(content);
		b.setTwriter(pNo);
		b.setPno(pNo);
		b.setTno(tNo);

		int result = new MemberService().insertParentQnA(b);
		
		if(result > 0) {
			response.sendRedirect("views/common/successPage.jsp?successCode=17");
		} else {
			request.setAttribute("msg", "건의&문의 작성에 실패하셨습니다.");
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
