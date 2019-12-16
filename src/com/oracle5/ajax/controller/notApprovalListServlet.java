package com.oracle5.ajax.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oracle5.common.model.vo.PageInfo;
import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.Member;

@WebServlet("/notApprovalList.do")
public class notApprovalListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		Member m = (Member) request.getSession().getAttribute("loginMember");
	
		currentPage = 1;

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 10;
		
		int listCount = new MemberService().getNotAppListCount(m.getMemberNo());
		
		maxPage = (int) ((double) listCount / limit + 0.9);

		startPage = (((int) ((double) currentPage / limit + 0.9)) - 1 ) * 10 + 1;

		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		
		List<Map<String, Object>> list = new MemberService().selectNotAppList(currentPage, limit, m.getMemberNo());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pi", pi);
		map.put("list", list);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(map, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
