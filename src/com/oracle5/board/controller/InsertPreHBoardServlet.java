package com.oracle5.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oracle5.board.model.service.BoardService;
import com.oracle5.board.model.vo.Board;
import com.oracle5.common.Oracle5FileRenamePolicy;
import com.oracle5.common.model.vo.Attachment;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InsertPreHBoardServlet
 */
@WebServlet("/insertPreHBoard.bo")
public class InsertPreHBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPreHBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			
			String savePath = root+"uploadFiles/";
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath,maxSize,"UTF-8",new Oracle5FileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<>();
			
			ArrayList<String> originFiles = new ArrayList<>();
			
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
			}
			String filePath = savePath+ saveFiles.get(0);
			String title = multiRequest.getParameter("title");
			String content  = multiRequest.getParameter("content");
			int write = Integer.parseInt(multiRequest.getParameter("userNo"));
			int bdId = 1;
			
			Board b = new Board();
			b.setTtitle(title);
			b.setTcont(content);
			b.setBdid(bdId);
			b.setTno(write);
			
			ArrayList<Attachment> fileList = new ArrayList<>();
			
			for(int i=originFiles.size()-1; i>=0; i--) {
				Attachment at = new Attachment();
				at.setFilePath(savePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));
				
				fileList.add(at);
			}
			
			for(int i=0; i<fileList.size(); i++) {
				String at = fileList.get(i).getOriginName();
				System.out.println(at);
			}
			
			HashMap<String, Object>hmap = new HashMap<>();
			hmap.put("fileList", fileList);
			hmap.put("Board", b);
			
			int result = new BoardService().insertPreHBoard(hmap, b);
			
			//System.out.println("result"+result);
			
			String page="";
			if(result >0) {
				response.sendRedirect(request.getContextPath()+"/selectAllPreHBoard.bo");
			}else {
				request.setAttribute("msg", "유치원 운영위원회 게시판 등록 실패!");
				page="/views/common/errorPage.jsp";
				
				request.getRequestDispatcher(page).forward(request, response);
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




















