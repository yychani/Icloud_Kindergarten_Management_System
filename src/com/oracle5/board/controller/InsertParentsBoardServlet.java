package com.oracle5.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oracle5.board.model.service.BoardService;
import com.oracle5.board.model.vo.Board;
import com.oracle5.common.Oracle5FileRenamePolicy;
import com.oracle5.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InsertParentsBoardServlet
 */
@WebServlet("/insert.pbo")
public class InsertParentsBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertParentsBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		if (ServletFileUpload.isMultipartContent(request)) {

			int maxSize = 1024 * 1024 * 10;

			String root = request.getSession().getServletContext().getRealPath("/");

			String savePath = root + "uploadFiles/";

			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new Oracle5FileRenamePolicy());

			ArrayList<String> saveFiles = new ArrayList<>();

			ArrayList<String> originFiles = new ArrayList<>();

			Enumeration<String> files = multiRequest.getFileNames();

			while (files.hasMoreElements()) {
				String name = files.nextElement();

				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));

			} 
			String filePath = savePath + saveFiles.get(0);
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			int write = Integer.parseInt(multiRequest.getParameter("userNo"));
			int bdId = 6;
			
			System.out.println(title + " " + content);
			
			Board b = new Board();
			
			b.setTtitle(title);
			b.setTcont(content);
			b.setBdid(bdId);
			b.setTno(write);
			
			int result = new BoardService().inserParentsBoard(b);
			
			if(result>0) {
				response.sendRedirect(request.getContextPath() + "/selectAll.pbo");
			}else {
				 request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
			
		}

	}
		
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
