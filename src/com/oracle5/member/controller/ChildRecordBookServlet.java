package com.oracle5.member.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.member.model.service.MemberService;

@WebServlet("/childRecordBook.me")
public class ChildRecordBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChildRecordBookServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cId = Integer.parseInt(request.getParameter("cId"));
		
		System.out.println(cId);
		
		HashMap<String, Object> hmap = new MemberService().childRecordBook(cId);
		
		String page = "";
		if(hmap != null) {
			page = "views/president/preChildRecord.jsp";
			request.setAttribute("hmap", hmap);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "선생 정보 전체 조회 실패!");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
