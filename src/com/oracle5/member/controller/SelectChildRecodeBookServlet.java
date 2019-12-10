package com.oracle5.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.BodyInfo;
import com.oracle5.member.model.vo.Children;
import com.oracle5.member.model.vo.FamilyRelation;
import com.oracle5.member.model.vo.Scholarly;

@WebServlet("/selectChildRcBook.me")
public class SelectChildRecodeBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cid = Integer.parseInt(request.getParameter("cid"));
		
		Children c = new MemberService().selectOneChild(cid);
		
		if(c != null) {
			request.setAttribute("c", c);
		} else {
			request.setAttribute("msg", "아이정보 요청 실패");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}
		
		String address = new MemberService().selectParentsAddress(cid);
		
		if(!address.equals("")) {
			request.setAttribute("address", address);
		} else {
			request.setAttribute("msg", "주소 가져오기 실패");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}
		
		Map<String, Object> hmap1 = new MemberService().selectRcBookFirst(cid);
		
		if(hmap1 != null) {
			request.setAttribute("hmap", hmap1);
		} else {
			request.setAttribute("msg", "hmap1 error");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}
		
		ArrayList<FamilyRelation> fr = new MemberService().selectFamilyRelation(cid);
		
		if(fr != null) {
			request.setAttribute("fr", fr);
		} else {
			request.setAttribute("msg", "가족관계 에러");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}
		
		ArrayList<Scholarly> sc = new MemberService().selectScholarly(cid);
		
		if(sc != null) {
			request.setAttribute("sc", sc);
		} else {
			request.setAttribute("msg", "학적사항 에러");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}
		
		ArrayList<BodyInfo> bi = new MemberService().selectBodyInfo(cid);
		
		if(bi != null) {
			request.setAttribute("bi", bi);
		}else {
			request.setAttribute("msg", "신체정보 에러");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}
		
		request.getRequestDispatcher("/views/teacher/tcChildRecodeBook.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
