package com.oracle5.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.board.model.service.BoardService;
import com.oracle5.board.model.vo.Board;
import com.oracle5.common.model.vo.PageInfo;
import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.Ban;
import com.oracle5.member.model.vo.Member;
import com.oracle5.member.model.vo.Teacher;

/**
 * Servlet implementation class SelectAllBanNoticeListServlet
 */
@WebServlet("/selectAllBanList")
public class SelectAllBanNoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAllBanNoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage ; 
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		int tno = 0;
		if(request.getParameter("tno") !=null) {
			tno = Integer.parseInt(request.getParameter("tno"));
		};
		int pno =0;
		if(request.getParameter("pno") !=null) {
			pno = Integer.parseInt(request.getParameter("pno"));
		};
		int[] tnoArr = new int [10];
		if(tno == 0) {
			ArrayList<Teacher> teacherList = new MemberService().selectMyTeacher(pno);
			System.out.println(teacherList);
			for(int i = 0; i < teacherList.size(); i++) {
				tnoArr[i] = teacherList.get(i).getTeacherNo();
			}
		}else if(request.getParameter("tno") !=null){
			tnoArr[0] = tno;
		}
		System.out.println(tno);
			
		currentPage= 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		limit =10;
		
		int listCount = new BoardService().getListCountBan(tno);
		
		maxPage = (int)((double)listCount/limit+0.9);
		System.out.println(maxPage);
		
		startPage = (((int)((double)currentPage/limit+0.9))-1)*10 +1;
		
		endPage = startPage + 10-1;
		System.out.println(endPage);
		
		if(maxPage<endPage) {
			endPage = maxPage;
		}
		
		
	
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		
		ArrayList<Board> list = new BoardService().selectAllBanNoticeList(currentPage,limit,tnoArr);
		
		Member loginUser = (Member) request.getSession().getAttribute("loginMember");
	
		//System.out.println("list : "+list);
		String page="";
		if(list != null) {
			if((loginUser).getUType().equals("교사")) {
				page="views/teacher/tcClassNotice.jsp";	
			}else {
				page="views/parents/newsClassNotice.jsp";
			}
			
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		}else {
			request.setAttribute("msg", "반 공지사항 조회 실패");
			page="views/common/errorPage.jsp";
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
