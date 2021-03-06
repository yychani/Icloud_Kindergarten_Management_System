package com.oracle5.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.Member;
import com.oracle5.member.model.vo.ReturnAgree;

/**
 * Servlet implementation class ParentReturnAgreeListServlet
 */
@WebServlet("/returnAgreeList.me")
public class ParentReturnAgreeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ParentReturnAgreeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginMember");
		System.out.println(loginUser);
		
		ArrayList<ReturnAgree> raList = new MemberService().selectRaList(loginUser.getMemberNo());
		System.out.println(raList);
		
		String page = "";
		
		if(raList != null) {
			page = "/views/parents/mykidsGoHomeList.jsp";
			request.setAttribute("raList", raList);
		} else {
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "귀가동의서 리스트 불러오기 실패");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
