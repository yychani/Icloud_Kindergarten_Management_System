package com.oracle5.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.Ban;

@WebServlet("/selectBan.do")
public class SelectBanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectBanServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Ban> list = new MemberService().selectBan();
		
		JSONArray result = new JSONArray();
		JSONObject banInfo = null;
		System.out.println("doGet");
		for(Ban b: list) {
			banInfo = new JSONObject();
			
			banInfo.put("banNo", b.getBanNo());
			banInfo.put("banName", URLEncoder.encode(b.getBanName(), "UTF-8"));
			
			result.add(banInfo);
		}
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(result.toJSONString());
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
