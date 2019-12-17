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
 * Servlet implementation class SelectOneTcFamilyLetterServlet
 */
@WebServlet("/selectOneFLetter.tbo")
public class SelectOneTcFamilyLetterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneTcFamilyLetterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		String isUpdate = "false";
		if(request.getParameter("isUpdate") != null) {
			isUpdate = request.getParameter("isUpdate");
		}
		
		
		Board b = new BoardService().selectOneFLetter(num, isUpdate);
		ArrayList<Attachment> list = new BoardService().selectOneFLetterImg(num);


		Member loginUser = (Member) request.getSession().getAttribute("loginMember");
			
			String page = "";
			
			if(b != null) {
				if((loginUser).getUType().equals("교사")) {
					page="views/teacher/tcFamilyLetterDetail.jsp";
					
				}else {
					page="views/parents/newsFamilyLDetail.jsp";
					
				}
				
				request.setAttribute("b", b);
				request.setAttribute("list", list);
			
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
