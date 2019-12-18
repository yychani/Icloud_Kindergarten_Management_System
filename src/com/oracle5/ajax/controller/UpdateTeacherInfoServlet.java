package com.oracle5.ajax.controller;

import static com.oracle5.wrapper.LoginWrapper.getSha512;

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

import com.google.gson.Gson;
import com.oracle5.common.Oracle5FileRenamePolicy;
import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.Member;
import com.oracle5.member.model.vo.Teacher;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/updateTeacherInfo.me")
public class UpdateTeacherInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member) request.getSession().getAttribute("loginMember");
		
		int result = 0;
		
		if (ServletFileUpload.isMultipartContent(request)) {

			int maxSize = 1024 * 1024 * 10;

			String root = request.getSession().getServletContext().getRealPath("/");

			String savePath = root + "uploadFiles/";

			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new Oracle5FileRenamePolicy());
	
			String currentPass = getSha512(multiRequest.getParameter("currentPass"));
			if(currentPass.equals(loginUser.getMemberPwd())) {

				ArrayList<String> saveFiles = new ArrayList<>();
	
				ArrayList<String> originFiles = new ArrayList<>();
	
				Enumeration<String> files = multiRequest.getFileNames();
	
				while (files.hasMoreElements()) {
					String name = files.nextElement();
	
					saveFiles.add(multiRequest.getFilesystemName(name));
					originFiles.add(multiRequest.getOriginalFileName(name));
	
				} 
				
				String filePath = request.getContextPath() + "/uploadFiles/" + saveFiles.get(0);
				String password = getSha512(multiRequest.getParameter("userPwd"));
				String userNumber1 = multiRequest.getParameter("userNumber1");
				String userNumber2 = multiRequest.getParameter("userNumber1").substring(0, 1) + getSha512(multiRequest.getParameter("userNumber1").substring(1));
				String userNumber = userNumber1 + "-" + userNumber2;
				String tel1 = multiRequest.getParameter("tel1");
				String tel2 = multiRequest.getParameter("tel21");
				String tel3 = multiRequest.getParameter("tel31");
				String tel = tel1 + "-" + tel2 + "-" + tel3;
				String firstEmail = multiRequest.getParameter("firstEmail");
				String lastEmail = multiRequest.getParameter("lastEmail");
				String email = firstEmail + "@" + lastEmail;
				String desc = multiRequest.getParameter("desc");
				
//				System.out.println(filePath);
//				System.out.println(password);
//				System.out.println(userNumber);
//				System.out.println(tel);
//				System.out.println(email);
//				System.out.println(desc);
				
				Teacher t = new Teacher();
				t.setImgSrc(filePath);
				t.setTDescription(desc);
				
				Member m = new Member();
				m.setMemberPwd(password);
				m.setMemberRno(userNumber);
				m.setEmail(email);
				m.setPhone(tel);
				
				result = new MemberService().updateTeacherInfo(loginUser.getMemberNo(), t, m);
				
				if (result > 0) {
					Member updateMember = new Member();
					updateMember.setMemberId(loginUser.getMemberId());
					updateMember.setMemberPwd(loginUser.getMemberPwd());
					Member loginMember = new MemberService().loginMember(updateMember);
					
					request.getSession().setAttribute("loginMember", loginMember);
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					new Gson().toJson("성공", response.getWriter());
				} else {
					for (int i = 0; i < saveFiles.size(); i++) {
						File failedFile = new File(savePath + saveFiles.get(i));

						failedFile.delete();
					}
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					new Gson().toJson("에러", response.getWriter());
				}
			} else {
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				new Gson().toJson("실패", response.getWriter());
			}
		} 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
