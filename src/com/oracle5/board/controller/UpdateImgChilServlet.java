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
import com.oracle5.common.Oracle5FileRenamePolicy;
import com.oracle5.common.model.vo.Attachment;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/UpdateImgServlet.tbo")
public class UpdateImgChilServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateImgChilServlet() {
        super();
    }
    
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
			int imgfid = Integer.parseInt(multiRequest.getParameter("imgfid"));
			String filePath = savePath + saveFiles.get(0);
		
			ArrayList<Attachment> fileList = new ArrayList<>();
		
			for(int i = originFiles.size() -1; i>=0; i--) {
			Attachment attchment = new Attachment();
			attchment.setFilePath(savePath);
			attchment.setOriginName(originFiles.get(i));
			attchment.setChangeName(saveFiles.get(i));
			
			fileList.add(attchment);
		}
		for(int i=0; i<fileList.size(); i++) {
			String at = fileList.get(i).getOriginName();
		}
		HashMap<String, Object> hmap = new HashMap<>();
		hmap.put("fileList", fileList);
		
		int result = new BoardService().updateinsertChildImg(hmap,imgfid);
		
		/*String page = "";
		if(result>0) {
			response.sendRedirect(request.getContextPath()+"/SelectUpdateOneImgServlet.tbo");
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 수정용 상세보기 실패");
		}*/

		request.getRequestDispatcher(page).forward(request, response);
		
		
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
