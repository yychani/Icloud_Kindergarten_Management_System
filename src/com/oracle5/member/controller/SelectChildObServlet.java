package com.oracle5.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.member.model.service.MemberService;

@WebServlet("/selectChildOb.me")
public class SelectChildObServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cid = Integer.parseInt(request.getParameter("cid"));

		ArrayList<Map<String, Object>> list = new MemberService().selectChildObservation(cid);
		
		System.out.println(list);
		
		String page = "";
		if(list != null) {
			request.setAttribute("list", list);
			page = "/views/teacher/tcChildObserve.jsp";
		} else {
			request.setAttribute("msg", "아이 관찰척도 조회 실패");
			page = "/views/common/errorPage.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
