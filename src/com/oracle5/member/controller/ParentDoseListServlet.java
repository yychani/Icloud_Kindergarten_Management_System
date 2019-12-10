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
import com.oracle5.member.model.vo.DoseRequest;
import com.oracle5.member.model.vo.Member;

/**
 * Servlet implementation class ParentDoseListServlet
 */
@WebServlet("/doseList.me")
public class ParentDoseListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ParentDoseListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginMember");
		
		ArrayList<DoseRequest> list = new MemberService().selectDoseList(loginUser.getMemberNo());
		
		System.out.println("투약의뢰서 리스트 서블렛 : " + list);
		String page = "";
		
		if(list != null) {
			page = "/views/parents/mykidsDoseList.jsp";
			request.setAttribute("list", list);
		} else {
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "투약의뢰서 리스트 불러오기 실패");
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
