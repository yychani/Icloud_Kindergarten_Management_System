package com.oracle5.board.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.board.model.service.BoardService;
import com.oracle5.common.model.vo.Attachment;

/**
 * Servlet implementation class ChildImgDownloadServlet
 */
@WebServlet("/imgdownload.tbo")
public class ChildImgDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChildImgDownloadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		System.out.println(num);
		
		Attachment file = new BoardService().selectOneDownImg(num);
		System.out.println(file);

		BufferedInputStream buf = null;
		

		ServletOutputStream downOut = null;
		
		downOut = response.getOutputStream();
		

		File downFile = new File(request.getContextPath() + "/uploadFiles/" + file.getChangeName());
		
		response.setContentType("text/plain; charset=UTF-8"); 
		

		response.setHeader("Content-Disposition", "attachment; filename=\"" 
							+ new String(file.getOriginName().getBytes("UTF-8"), "ISO-8859-1") + "\"");
		response.setContentLength((int)(downFile.length()));
		
		FileInputStream fin = new FileInputStream(downFile);
		buf = new BufferedInputStream(fin);
		
		int readBytes = 0;
		
		while((readBytes = buf.read()) != -1) {
			downOut.write(readBytes);
		}
		
		downOut.close();
		buf.close();
		
		
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
