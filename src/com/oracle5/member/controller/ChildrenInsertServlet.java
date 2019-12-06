package com.oracle5.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oracle5.common.Oracle5FileRenamePolicy;
import com.oracle5.common.model.vo.Attachment;
import com.oracle5.member.model.vo.Children;
import com.oreilly.servlet.MultipartRequest;
import static com.oracle5.wrapper.LoginWrapper.*;

@WebServlet("/childrenInsert.me")
public class ChildrenInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChildrenInsertServlet() {
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
			String filePath = savePath + saveFiles.get(0);
			String name = multiRequest.getParameter("name");
			//
			String userNumber1 = multiRequest.getParameter("userNumber1");
			String userNumber2 = getSha512(multiRequest.getParameter("userNumber2"));
			//
			String userNumber = userNumber1 + "-" + userNumber2;
			String address = multiRequest.getParameter("address1");
			String bloodType = multiRequest.getParameter("bloodType");
			String emergency = multiRequest.getParameter("emergency");
			
			// 학적사항
			String[] date = multiRequest.getParameterValues("date");
			String[] agency = multiRequest.getParameterValues("agency");
			String[] uniqueness = multiRequest.getParameterValues("uniqueness");
			
			// 가족사항
			String[] family = multiRequest.getParameterValues("family");
			String[] familyname = multiRequest.getParameterValues("familyName");
			String[] familyPhone = multiRequest.getParameterValues("familyPhone");
			
			String kidUnique = multiRequest.getParameter("kidUnique");
			
			Children requestChildren = new Children();
			requestChildren.setName(name);
			requestChildren.setRno(userNumber);
			requestChildren.setOriginAddr(address);
			requestChildren.setBloodType(bloodType);
			requestChildren.setEmergency(emergency);
			requestChildren.setDescription(kidUnique);
			requestChildren.setImgSrc(filePath);
			System.out.println(requestChildren);
			
			for(int i = 0; i < date.length; i++) {
				System.out.println(date[i] + " " + agency[i] + " " + uniqueness[i]);
			}
			for(int i = 0; i < family.length; i++) {
				System.out.println(family[i] + " " + familyname[i] + " " + familyPhone[i]);
			}

//			// Attatchment 객세 생성해서 ArrayList에 담기
//			ArrayList<Attachment> fileList = new ArrayList<>();
//
//			// 전송 순서가 역순으로 들어왔기 때문에 반복문을 역순으로 돌려 ArrayList에 담기
//			for (int i = originFiles.size() - 1; i >= 0; i--) {
//				Attachment at = new Attachment();
//				at.setFilePath(savePath);
//				at.setOriginName(originFiles.get(i));
//				at.setChangeName(saveFiles.get(i));
//
//				fileList.add(at);
//			}
//
//			int result = new BoardService().insertThumbnail(b, fileList);
//
//			if (result > 0) {
//				response.sendRedirect(request.getContextPath() + "/selectList.tn");
//			} else {
//				for (int i = 0; i < saveFiles.size(); i++) {
//					File failedFile = new File(savePath + saveFiles.get(i));
//
//					failedFile.delete();
//				}
//				request.setAttribute("msg", "게시판 등록 실패!");
//				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
//			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
