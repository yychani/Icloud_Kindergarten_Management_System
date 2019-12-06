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
import com.oracle5.member.model.vo.MemberAndTeacher;
import com.oracle5.member.model.vo.Teacher;

@WebServlet("/selectTeacher.do")
public class SelectTeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectTeacherServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<MemberAndTeacher> list = new MemberService().selectTeacher();
		
		JSONArray result = new JSONArray();
		JSONObject teacherInfo = null;
		
		for(MemberAndTeacher mt: list) {
			teacherInfo = new JSONObject();
			
			teacherInfo.put("tNo", mt.getMemberNo());
			teacherInfo.put("name", URLEncoder.encode(mt.getMemberName(), "UTF-8"));
			
			result.add(teacherInfo);
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
