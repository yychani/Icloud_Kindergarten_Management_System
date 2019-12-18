package com.oracle5.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.member.model.service.MemberService;

@WebServlet("/selectChildCidServlet.me")
public class SelectChildCidServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectChildCidServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		int cid = new MemberService().selectCId(pno);
		
		request.setAttribute("cid", cid);
		request.getRequestDispatcher("views/parents/parMain.jsp?pno=" + pno + "&cid=" + cid).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
