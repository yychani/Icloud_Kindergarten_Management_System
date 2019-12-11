package com.oracle5.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.DoseRequest;

/**
 * Servlet implementation class ParentDoseRequest
 */
@WebServlet("/doseRequest.me")
public class ParentDoseRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ParentDoseRequest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String kidsName = request.getParameter("kidsName");
		String symptom = request.getParameter("symptom");
		String kinds = request.getParameter("kinds");
		String keep = request.getParameter("keep");
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		String sDate = request.getParameter("startDate");
		Date startDate;
		if(sDate != "") {
			startDate = java.sql.Date.valueOf(sDate);
		} else {
			startDate = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
		}
		
		String eDate = request.getParameter("endDate");
		Date endDate;
		if(sDate != "") {
			endDate = java.sql.Date.valueOf(eDate);
		} else {
			endDate = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
		}
	
		String dosingTimeSum = request.getParameter("dosingTimeSum");
	
		String remarks = request.getParameter("remarks");

		
		
		DoseRequest dr = new DoseRequest();
		dr.setSymptom(symptom);
		dr.setKinds(kinds);
		dr.setKeep(keep);
		dr.setStartDate(startDate);
		dr.setRemarks(remarks);
		dr.setPNo(pNo);
		dr.setEndDate(endDate);
		dr.setDosingTime(dosingTimeSum);
		
		//투약의뢰서 테이블 INSERT
		int result1 = new MemberService().doseRequest(dr);
		
		//넣은 투약의뢰서 가져오기
		DoseRequest requestDose = new MemberService().selectDoseReq(pNo);
		System.out.println("requestDose : " + requestDose);
		
		//투약 시간 테이블 INSERT
		int result = new MemberService().doseTimeInsert(requestDose, dr.getDosingTime());
		
		if(result > 0) {
			response.sendRedirect("views/common/successPage.jsp?successCode=13");
		} else {
			request.setAttribute("msg", "투약의뢰서 신청 실패");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
