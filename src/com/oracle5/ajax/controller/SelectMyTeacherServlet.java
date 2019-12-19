package com.oracle5.ajax.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.Teacher;

@WebServlet("/selectMyTeacher.me")
public class SelectMyTeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectMyTeacherServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		ArrayList<Teacher> teacher = new MemberService().selectMyTeacher(pno);
		response.setContentType("application/json");
		new Gson().toJson(teacher, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
