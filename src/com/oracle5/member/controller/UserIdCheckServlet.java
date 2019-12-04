package com.oracle5.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.Member;

@WebServlet("/userIdCheck.me")
public class UserIdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserIdCheckServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		
		Member m = new MemberService().idCheck(userId);
		
		if(m != null) {
			response.getWriter().print("<span style='color:tomato' id='check' value='false'>이미 사용중인 아이디 입니다.</span>");
		}else {
			if(userId.equals("")) {
				response.getWriter().print("<span style='color:tomato' id='check' value='false'>아이디를 입력해주세요.</span>");
			}else {
				response.getWriter().print("<span style='color:green' id='check' value='true'>사용 가능한 아이디 입니다.</span>");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
