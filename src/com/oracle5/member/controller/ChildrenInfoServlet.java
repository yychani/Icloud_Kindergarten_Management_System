package com.oracle5.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.Children;
import com.oracle5.member.model.vo.FamilyRelation;
import com.oracle5.member.model.vo.Member;
import com.oracle5.member.model.vo.Parents;
import com.oracle5.member.model.vo.Scholarly;

/**
 * Servlet implementation class ChildrenInfoServlet
 */
@WebServlet("/cInfo.me")
public class ChildrenInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChildrenInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginMember");
		int pNo = loginUser.getMemberNo();
		
		int cId = Integer.parseInt(request.getParameter("cId"));
		System.out.println("아이 정보 불러오기 : " + cId);
		Children c = new MemberService().selectChildren(cId);
		ArrayList<FamilyRelation> fr = new MemberService().selectFamilyRelation(cId);
		ArrayList<Scholarly> sc = new MemberService().selectScholarly(cId);
		String address = new MemberService().selectParentsAddress(cId);
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("c", c);
		hmap.put("fr", fr);
		hmap.put("sc", sc);
		hmap.put("address", address);
		
		if(hmap != null) {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(hmap, response.getWriter());
		}
		
		
		
		
		//ArrayList<HashMap<String, Object>> list = new MemberService().selectCInfo(pNo);

		
		/*if(list != null) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("/views/parents/myPageChildren.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "아이 정보 불러오기 에러");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
