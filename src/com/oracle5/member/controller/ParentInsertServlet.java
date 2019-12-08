package com.oracle5.member.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.member.model.dao.MemberDao;
import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.Member;
import com.oracle5.member.model.vo.Parents;

@WebServlet("/insertParent.me")
public class ParentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String password = request.getParameter("userPwd");
		String name = request.getParameter("name");
		//
		String userNumber1 = request.getParameter("userNumber1");
		String userNumber2 = request.getParameter("userNumber2");
		//
		String userNumber = userNumber1 + "-" + userNumber2;
		String address = request.getParameter("address1");
		//
		String firstEmail = request.getParameter("firstEmail");
		String lastEmail = request.getParameter("lastEmail");
		//
		String email = firstEmail + "@" + lastEmail;
		//
		String firstPhone = request.getParameter("tel1");
		String midPhone = request.getParameter("tel21");
		String lastPhone = request.getParameter("tel31");
		//
		String phone = firstPhone + "-" + midPhone + "-" + lastPhone;
		
		Member requestMember = new Member();
		requestMember.setMemberId(userId);
		requestMember.setMemberName(name);
		requestMember.setMemberPwd(password);
		requestMember.setMemberRno(userNumber);
		requestMember.setEmail(email);
		requestMember.setPhone(phone);
		
		Parents requestParent = new Parents();
		requestParent.setPAddress(address);
		
		
		HashMap<String, Object> hmap = new HashMap<>();
		hmap.put("Member", requestMember);
		hmap.put("Parent", requestParent);
		System.out.println(hmap);
		int result = new MemberService().insertParent(hmap);
		
		if(result > 0) {
			response.sendRedirect("views/signUp/signUpKid.jsp?id=" + userId);
		}else {
			request.setAttribute("msg", "학부모 계정 추가 에러!!");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
