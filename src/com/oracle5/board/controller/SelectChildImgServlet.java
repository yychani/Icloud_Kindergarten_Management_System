package com.oracle5.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.board.model.service.BoardService;
import com.oracle5.board.model.vo.Board;
import com.oracle5.common.model.vo.Attachment;

/**
 * Servlet implementation class SelectChildImgServlet
 */
@WebServlet("/selectChildImg2.tbo")
public class SelectChildImgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectChildImgServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		String isUpdate = "false";
		
		if(request.getParameter("isUpdate")!=null) {
			isUpdate = request.getParameter("isUpdate");
		}
		Board b = new BoardService().selectOneUpdateChilImge(num, isUpdate);
		Attachment att = new BoardService().selectOneChildImg(num);
		
		String page = "";
		
		if(b != null) {
			page = "views/teacher/tcChildImgUpdate.jsp";
			request.setAttribute("b", b);
			request.setAttribute("att", att);
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "앨범 수정 상세보기 페이지 실패");
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
