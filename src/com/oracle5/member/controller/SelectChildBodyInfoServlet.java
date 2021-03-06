package com.oracle5.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.common.model.vo.PageInfo;
import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.BodyInfo;

@WebServlet("/selectChildBodyInfo.me")
public class SelectChildBodyInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cid = Integer.parseInt(request.getParameter("cid"));
		int mod;
		if(request.getParameter("mod") == null) {
			mod = 0;
		} else {
			mod = Integer.parseInt(request.getParameter("mod"));
		}
		
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 10;
		
		int listCount = new MemberService().childBodyInfoCount(cid);

		maxPage = (int) ((double) listCount / limit + 0.9);
		
		startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * 10 + 1;
		
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<BodyInfo> list = new MemberService().selectChildBodyInfoPaging(cid, currentPage, limit);
		
		if(list != null && mod == 0) {
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.getRequestDispatcher("/views/teacher/tcChildBodyInfo.jsp").forward(request, response);
		} else if(list != null && mod != 0) {
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.getRequestDispatcher("/views/teacher/tcChildBodyInfoMod.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "아이 신체정보 가져오기 에러");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
