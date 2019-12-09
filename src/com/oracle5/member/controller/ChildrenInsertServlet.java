package com.oracle5.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oracle5.common.Oracle5FileRenamePolicy;
import com.oracle5.common.model.vo.Attachment;
import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.Ban;
import com.oracle5.member.model.vo.Children;
import com.oracle5.member.model.vo.FamilyRelation;
import com.oracle5.member.model.vo.Scholarly;
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
			String userNumber2 = multiRequest.getParameter("userNumber2");
			String[] subuno2 = {userNumber2.substring(0,1), userNumber2.substring(1)};
			userNumber2 = subuno2[0] + getSha512(subuno2[1]);
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
			
			ArrayList<Scholarly> scholList = new ArrayList<>();
			ArrayList<FamilyRelation> familyList = new ArrayList<>();
			
			for(int i = 0; i < date.length; i++) {
				Scholarly s = new Scholarly();
				String[] dateArr = date[i].split("/");
				String day = dateArr[2] + "-" + dateArr[0] + "-" + dateArr[1];
				System.out.println(day);
				java.sql.Date d = null;
				if(date[i] != "") {
					d = java.sql.Date.valueOf(day);
				}
				
				s.setSDate(d);
				s.setAgency(agency[i]);
				s.setUniqueness(uniqueness[i]);
				
				scholList.add(s);
			}
			for(int i = 0; i < family.length; i++) {
				FamilyRelation fr = new FamilyRelation();
				
				fr.setRelation(family[i]);
				fr.setName(familyname[i]);
				fr.setPhone(familyPhone[i]);
				
				familyList.add(fr);
			}

			ArrayList<Attachment> fileList = new ArrayList<>();

			for (int i = originFiles.size() - 1; i >= 0; i--) {
				Attachment at = new Attachment();
				at.setFilePath(savePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));

				fileList.add(at);
			}

			int banNo = Integer.parseInt(multiRequest.getParameter("className"));
			
			ArrayList<Ban> list = new MemberService().selectBan();
			String ban = "";
			for(int i = 0; i < list.size(); i++) {
				if(list.get(i).getBanNo() == banNo) {
					ban = list.get(i).getBanName();
				}
			}
			Ban b = new Ban();
			b.setBanNo(banNo);
			b.setBanName(ban);
			
			String userId = multiRequest.getParameter("userId");
			HashMap<String, Object> hmap = new HashMap<>();
			hmap.put("Children", requestChildren);
			hmap.put("scholList", scholList);
			hmap.put("familyList", familyList);
			hmap.put("fileList", fileList);
			hmap.put("Ban", b);
			
			int result = new MemberService().insertChildren(hmap, userId);
			int result1 = new MemberService().updateChildBcno(hmap, userId);
			
			if (result > 0) {
				response.sendRedirect(request.getContextPath() + "/views/signUp/login.jsp");
			} else {
				for (int i = 0; i < saveFiles.size(); i++) {
					File failedFile = new File(savePath + saveFiles.get(i));

					failedFile.delete();
				}
				int delete = new MemberService().deleteParents(userId);
				request.setAttribute("msg", "회원 등록 실패!");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
