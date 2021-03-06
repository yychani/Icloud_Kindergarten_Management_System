package com.oracle5.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.board.model.service.BoardService;


@WebServlet("/deletePbImg.pbo")
public class DeleteParentsBoardImg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public DeleteParentsBoardImg() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int fid = Integer.parseInt(request.getParameter("fid"));
		
		int result = new BoardService().deletePBoradImg(fid);
		
		if(result > 0) {
			response.getWriter().print("삭제 완료");
		}else {
			response.getWriter().print("삭제 실패");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
