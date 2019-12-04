package com.oracle5.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.member.model.vo.Member;

@WebServlet("/insertParent.me")
public class ParentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String password = request.getParameter("userPwd");
		String name = request.getParameter("name");
		String userNumber1 = request.getParameter("userNumber1");
		String userNumber2 = request.getParameter("userNumber2");
		String userNumber = userNumber1 + "-" + userNumber2;
		String address = request.getParameter("address");
		String firstEmail = request.getParameter("firstEmail");
		String lastEmail = request.getParameter("lastEmail");
		String email = firstEmail + "@" + lastEmail;
		String firstPhone = request.getParameter("firstPhone");
		String midPhone = request.getParameter("midPhone");
		String lastPhone = request.getParameter("lastPhone");
		String phone = firstPhone + "-" + midPhone + "-" + lastPhone;
		
		Member signupMember = new Member();
		signupMember.setMemberId(userId);
		signupMember.setMemberName(name);
		signupMember.setMemberPwd(password);
		signupMember.setMemberRno(userNumber);
		signupMember.setEmail(email);
		signupMember.setPhone(phone);
		
		System.out.println(signupMember);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
