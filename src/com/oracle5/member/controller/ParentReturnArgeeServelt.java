package com.oracle5.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.ReturnAgree;

/**
 * Servlet implementation class ParentReturnArgeeServelt
 */
@WebServlet("/returnAgree.me")
public class ParentReturnArgeeServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ParentReturnArgeeServelt() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String guideName = request.getParameter("guideName");
		String guidePhone = request.getParameter("guidePhone");

		int pNo = Integer.parseInt(request.getParameter("pNo"));
		String cId = request.getParameter("cName");

		String sapplyDate = request.getParameter("applyDate");
		Date applyDate;
		if (sapplyDate != "") {
			applyDate = java.sql.Date.valueOf(sapplyDate);
		} else {
			applyDate = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
		}

		String applyTime = request.getParameter("applyTime");

		// 전체 원아인이 확인
		if (cId.contains("/")) {
			System.out.println("문자열에 /있음");
			String[] split = cId.split("/");
			String[] splitl = new String[split.length];
			for (int i = 0; i < split.length; i++) {
				splitl[i] = split[i];
				System.out.println(splitl[i]);
			}
			ArrayList<ReturnAgree> rList = new ArrayList<ReturnAgree>();
			int acId = 0;
			
			for (int i = 0; i < splitl.length; i++) {
				acId = Integer.parseInt(splitl[i]);

				ReturnAgree ra = new ReturnAgree();
				ra.setPNo(pNo);
				ra.setApplyDate(applyDate);
				ra.setApplyTime(applyTime);
				ra.setGuideName(guideName);
				ra.setGuidePhone(guidePhone);
				ra.setCId(acId);

				rList.add(ra);
			}
			
			if (rList != null) {

				int result = new MemberService().returnApply(rList);

				if (result == rList.size()) {
					response.sendRedirect("views/common/successPage.jsp?successCode=12");
				} else {
					request.setAttribute("msg", "귀가동의서 신청 실패");

					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("msg", "입력하신 원아를 찾을 수 없습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}

		} else {
			int icId = Integer.parseInt(cId);
			System.out.println("문자열에 / 없음 : " + icId);

			if (icId != 0) {
				ReturnAgree ra = new ReturnAgree();
				ra.setPNo(pNo);
				ra.setApplyDate(applyDate);
				ra.setApplyTime(applyTime);
				ra.setGuideName(guideName);
				ra.setGuidePhone(guidePhone);
				ra.setCId(icId);

				int result = new MemberService().returnApply(ra);

				if (result > 0) {
					response.sendRedirect("views/common/successPage.jsp?successCode=12");
				} else {
					request.setAttribute("msg", "귀가동의서 신청 실패");

					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("msg", "입력하신 원아를 찾을 수 없습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}

		}

		/*
		 * if(cId != 0) { ReturnAgree ra = new ReturnAgree(); ra.setPNo(pNo);
		 * ra.setApplyDate(applyDate); ra.setApplyTime(applyTime);
		 * ra.setGuideName(guideName); ra.setGuidePhone(guidePhone); ra.setCId(cId);
		 * 
		 * int result = new MemberService().returnApply(ra);
		 * 
		 * if(result > 0) {
		 * response.sendRedirect("views/common/successPage.jsp?successCode=12"); } else
		 * { request.setAttribute("msg", "귀가동의서 신청 실패");
		 * 
		 * request.getRequestDispatcher("views/common/errorPage.jsp").forward(request,
		 * response); } } else { request.setAttribute("msg", "입력하신 원아를 찾을 수 없습니다.");
		 * request.getRequestDispatcher("views/common/errorPage.jsp").forward(request,
		 * response); }
		 */

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
