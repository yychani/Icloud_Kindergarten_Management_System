package com.oracle5.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.member.model.service.MemberService;

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
		String tel21 = request.getParameter("tel2");
				String tel31 = request.getParameter("tel3");
		String tel2 = request.getParameter("tel21");
		String tel3 = request.getParameter("tel31");
		System.out.println("이룸" + userName);
		System.out.println("주소 : " + address);
		System.out.println("이메일" + email);
		System.out.println("tel1" + tel1);
		System.out.println("tel2" + tel2);
		System.out.println("tel21" + tel21);
		System.out.println("tel31" + tel31);
		System.out.println("tel3" + tel3);
		
		//Member changeMember = new MemberService().pInfochange();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
