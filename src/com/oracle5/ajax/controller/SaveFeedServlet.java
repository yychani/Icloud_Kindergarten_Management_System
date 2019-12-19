package com.oracle5.ajax.controller;

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
import com.oracle5.common.Oracle5FileRenamePolicy;
import com.oracle5.common.model.vo.Attachment;
import com.oracle5.websocket.Feed;
import com.oracle5.websocket.model.service.ChatService;
import com.oracle5.websocket.model.service.FeedService;
import com.oracle5.websocket.model.vo.Chat;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/saveFeed.feed")
public class SaveFeedServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SaveFeedServlet() {
        super();
    }

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
			String filePath = request.getContextPath() + "/uploadFiles/" + saveFiles.get(0);
			//System.out.println("file : " + filePath);
			int cid = Integer.parseInt(multiRequest.getParameter("reciever"));
			int sendUser = Integer.parseInt(multiRequest.getParameter("sendUser"));
			String message = "";
			if(!multiRequest.getParameter("message").equals("")) {
				message = multiRequest.getParameter("message");
			}else {
				message = filePath;
			}
			Attachment at = new Attachment();
			at.setFilePath(filePath);
			at.setOriginName(originFiles.get(0));
			at.setChangeName(saveFiles.get(0));
			
			//System.out.println("message : " + message); 
			int result = new FeedService().saveFeed(cid, message, at); 
			
			if(result > 0) {
				response.setContentType("application/json");
				new Gson().toJson(at, response.getWriter());
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
