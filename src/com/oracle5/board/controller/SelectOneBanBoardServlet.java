package com.oracle5.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.board.model.service.BoardService;
import com.oracle5.board.model.vo.Board;
import com.oracle5.common.model.vo.Attachment;
import com.oracle5.member.model.vo.Member;

/**
 * Servlet implementation class SelectBoardServlet
 */
@WebServlet("/selectOneBanBoard.bo")
public class SelectOneBanBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneBanBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println("num : " + num);
		String isUpdate = "false";
		if(request.getParameter("isUpdate") != null) {
			isUpdate = request.getParameter("isUpdate");
		}
		
		
		Board b = new BoardService().selectOneBoard(num, isUpdate);
		ArrayList<Attachment> list = new BoardService().selectOneImg(num);
		
		Member loginUser = (Member) request.getSession().getAttribute("loginMember");
		String page = "";
		
		if(b != null) {
			if((loginUser).getUType().equals("교사")) {
				page="views/teacher/tcClassNoticeDetail.jsp";
			}else {
				page="views/parents/newsClassNoticeDetail.jsp";
			}
			
			request.setAttribute("b", b);
			request.setAttribute("list", list);
			
			
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 수정용 상세보기 실패");
		}
		System.out.println("b"+b);
		System.out.println("list"+list);
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
