package com.oracle5.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.Ban;
import com.oracle5.member.model.vo.BodyInfo;
import com.oracle5.member.model.vo.Children;

/**
 * Servlet implementation class ParentsMyKidsInfoServlet
 */
@WebServlet("/myKidsInfo.me")
public class ParentsMyKidsInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ParentsMyKidsInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cId = Integer.parseInt(request.getParameter("cId"));
		System.out.println(cId);
		
		//내아이 정보 - 이름, 사진, 만 나이 불러오기
		Children c = new MemberService().selectCnamePhoto(cId);
		System.out.println(c);
		
		//최근 신체정보 불러오기
		BodyInfo b = new MemberService().selectRecentBodyInfo(cId);
		System.out.println(b);
		
		//반 가져오기
		Ban ban = new MemberService().selectNoteBan(cId);
		
		//신체정보 리스트 불러오기
		ArrayList<BodyInfo> bList = new MemberService().selectBodyInfoList(cId);
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("c", c);
		hmap.put("b", b);
		hmap.put("ban", ban);
		
		if(hmap != null) {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(hmap, response.getWriter());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
