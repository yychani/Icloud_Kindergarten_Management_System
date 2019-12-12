package com.oracle5.member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.BodyInfo;

@WebServlet("/insertBodyInfo.me")
public class InsertChildBodyInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String spdate = request.getParameter("date");
		double height = Double.parseDouble(request.getParameter("height"));
		double weight = Double.parseDouble(request.getParameter("weight"));
		int cid = Integer.parseInt(request.getParameter("cid"));
		
		Date d = Date.valueOf(spdate);
		
		BodyInfo bi = new BodyInfo();
		bi.setBiDate(d);
		bi.setHeight(height);
		bi.setWeight(weight);
		
		int result = new MemberService().insertBodyInfo(cid, bi);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/selectChildBodyInfo.me?cid=" + cid);
		} else {
			request.setAttribute("msg", "아이 신체정보 입력 실패");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
