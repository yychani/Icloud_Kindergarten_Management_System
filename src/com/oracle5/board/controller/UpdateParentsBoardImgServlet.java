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

import com.google.gson.Gson;
import com.oracle5.board.model.service.BoardService;
import com.oracle5.common.Oracle5FileRenamePolicy;
import com.oracle5.common.model.vo.Attachment;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class UpdateParentsBoardImgServlet
 */
@WebServlet("/updatePImg.pbo")
public class UpdateParentsBoardImgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateParentsBoardImgServlet() {
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
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize,"UTF-8", new Oracle5FileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<>();
			
			ArrayList<String> originFiles = new ArrayList<>();
			
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
			}
			int imgfid = Integer.parseInt(multiRequest.getParameter("fid"));
			int tid = Integer.parseInt(multiRequest.getParameter("tidImg"));
			String filePath = savePath + saveFiles.get(0);
		
			ArrayList<Attachment> fileList = new ArrayList<>();
		
			for(int i = originFiles.size() -1; i>=0; i--) {
				Attachment attchment = new Attachment();
				attchment.setFilePath(savePath);
				attchment.setOriginName(originFiles.get(i));
				attchment.setChangeName(saveFiles.get(i));
				
				fileList.add(attchment);
			
			}
			Attachment attachment = new Attachment();
			attachment = fileList.get(0);
			attachment.setTId(tid);
			attachment.setFid(imgfid);
	
			int result = new BoardService().updateinsertPBoardImg(attachment);
			
			if(result > 0) {
				response.setContentType("application/json");
				new Gson().toJson(attachment, response.getWriter());
			}else {
				
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
