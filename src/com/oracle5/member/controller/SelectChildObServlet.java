package com.oracle5.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.ObservationItem;

@WebServlet("/selectChildOb.me")
public class SelectChildObServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cid = Integer.parseInt(request.getParameter("cid"));

		int age = Integer.parseInt(request.getParameter("age"));
		
		ArrayList<Map<String, Object>> list = new MemberService().selectChildObservation(cid, age);
		
		ArrayList<ObservationItem> itemList = new MemberService().selectAgeObItem(age);
		
		Map<String, Object> hmap = new HashMap<>();
		
		hmap.put("list", list);
		hmap.put("itemList", itemList);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(hmap, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
