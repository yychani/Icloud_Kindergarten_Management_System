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
 * Servlet implementation class ParentInfoChangeServlet
 */
@WebServlet("/pinfoChange.me")
public class ParentInfoChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ParentInfoChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("changeName");
		String address = request.getParameter("changeAddress1");
		String email1 = request.getParameter("changeEmail1");
		String email2 = request.getParameter("changeEmail2");
		String email = email1 + "@" + email2;
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel21");
		String tel3 = request.getParameter("tel31");
		String phone = tel1 + "-" + tel2 + tel2;
		System.out.println("이룸" + userName);
		System.out.println("주소 : " + address);
		System.out.println("이메일" + email);
		System.out.println("tel1" + tel1);
		System.out.println("tel2" + tel2);
		System.out.println("tel3" + tel3);
		
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginMember");
		int pNo = loginUser.getMemberNo();
		
		Member changeM = new Member();
		changeM.setMemberName(userName);
		changeM.setPhone(phone);
		changeM.setEmail(email);
		
		//학부모 정보 수정(member테이블 - 이름, 폰, 이메일 변경)
		int result1 = new MemberService().pInfoChange(changeM, pNo);
		//학부모 정보 수정(parent 테이블 - 주소 update)
		int result2 = new MemberService().pInfochange(address, pNo);
		
		if(result1 > 0) {
			if(result2 > 0) {
				response.sendRedirect("views/common/successPage.jsp?successCode=14");
			}else {
				request.setAttribute("msg", "주소 변경 에러");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("msg", "개인정보 변경 에러");
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
