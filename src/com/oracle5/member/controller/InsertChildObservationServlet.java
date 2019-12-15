package com.oracle5.member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.Member;
import com.oracle5.member.model.vo.Observation;

@WebServlet("/insertChildOb.me")
public class InsertChildObservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int selectAge = Integer.parseInt(request.getParameter("selectAge"));
		
		int result1 = 0;
		int result2 = 0;
		int check = 0;
		
		int cid = Integer.parseInt(request.getParameter("cid"));
		
		String fdate = request.getParameter("fdate");
		String sdate = request.getParameter("sdate");
		
		if(!fdate.equals("") && sdate.equals("")) {
			int round1 = 1;
			String f1 = request.getParameter("f1");
			String f2 = request.getParameter("f2");
			String f3 = request.getParameter("f3");
			String f4 = request.getParameter("f4");
			String f5 = request.getParameter("f5");
			String f6 = request.getParameter("f6");
			String f7 = request.getParameter("f7");
			String f8 = request.getParameter("f8");
			String f9 = request.getParameter("f9");
			String f10 = request.getParameter("f10");
			String f11 = request.getParameter("f11");
			String f12 = request.getParameter("f12");
			String f13 = request.getParameter("f13");
			String f14 = request.getParameter("f14");
			String f15 = request.getParameter("f15");
			String f16 = request.getParameter("f16");
			String f17 = request.getParameter("f17");
			String f18 = request.getParameter("f18");
			String f19 = request.getParameter("f19");
			String f20 = request.getParameter("f20");
			String f21 = request.getParameter("f21");
			String f22 = request.getParameter("f22");
			String f23 = request.getParameter("f23");
			String f24 = request.getParameter("f24");
			String f25 = request.getParameter("f25");
			String fscore = f1 + "/" + f2 + "/" + f3 + "/" + f4 + "/" + f5 + "/" + f6 + "/" + f7 + "/" + f8 + "/" + f9 + "/" + f10 + "/" +
							f11 + "/" + f12 + "/" + f13 + "/" + f14 + "/" + f15 + "/" + f16 + "/" + f17 + "/" + f18 + "/" + f19 + "/" + f20 + "/" +
							f21 + "/" + f22 + "/" + f23 + "/" + f24 + "/" + f25;
			
			String ftotal = request.getParameter("ftotal");
			
			Member loginUser = ((Member) request.getSession().getAttribute("loginMember"));
			int tno = loginUser.getMemberNo();
			
			Date d = Date.valueOf(fdate);
			
			Observation ob = new Observation();
			ob.setRound(round1);
			ob.setAge(selectAge);
			ob.setCid(cid);
			ob.setEval(ftotal);
			ob.setTno(tno);
			ob.setEscore(fscore);
			ob.setEDate(d);
			
			check = new MemberService().checkChildOb(ob);
			
			if(check == 0) {
				result1 = new MemberService().insertChildOb(ob);
			} else {
				result1 = new MemberService().updateChildOb(ob);
			}
		}  else if(!fdate.equals("") && !sdate.equals("")) {
			int round2 = 2;
			String s1 = request.getParameter("s1");
			String s2 = request.getParameter("s2");
			String s3 = request.getParameter("s3");
			String s4 = request.getParameter("s4");
			String s5 = request.getParameter("s5");
			String s6 = request.getParameter("s6");
			String s7 = request.getParameter("s7");
			String s8 = request.getParameter("s8");
			String s9 = request.getParameter("s9");
			String s10 = request.getParameter("s10");
			String s11 = request.getParameter("s11");
			String s12 = request.getParameter("s12");
			String s13 = request.getParameter("s13");
			String s14 = request.getParameter("s14");
			String s15 = request.getParameter("s15");
			String s16 = request.getParameter("s16");
			String s17 = request.getParameter("s17");
			String s18 = request.getParameter("s18");
			String s19 = request.getParameter("s19");
			String s20 = request.getParameter("s20");
			String s21 = request.getParameter("s21");
			String s22 = request.getParameter("s22");
			String s23 = request.getParameter("s23");
			String s24 = request.getParameter("s24");
			String s25 = request.getParameter("s25");
			
			String sscore = s1 + "/" + s2 + "/" + s3 + "/" + s4 + "/" + s5 + "/" + s6 + "/" + s7 + "/" + s8 + "/" + s9 + "/" + s10 + "/" +
					s11 + "/" + s12 + "/" + s13 + "/" + s14 + "/" + s15 + "/" + s16 + "/" + s17 + "/" + s18 + "/" + s19 + "/" + s20 + "/" +
					s21 + "/" + s22 + "/" + s23 + "/" + s24 + "/" + s25;
			
			String stotal = request.getParameter("stotal");
			
			Member loginUser = ((Member) request.getSession().getAttribute("loginMember"));
			int tno = loginUser.getMemberNo();
			
			Date d = Date.valueOf(sdate);
			
			Observation ob = new Observation();
			ob.setRound(round2);
			ob.setAge(selectAge);
			ob.setCid(cid);
			ob.setEval(stotal);
			ob.setTno(tno);
			ob.setEscore(sscore);
			ob.setEDate(d);
			
			check = new MemberService().checkChildOb(ob);

			if(check == 0) {
				result2 = new MemberService().insertChildOb(ob);
			} else {
				result2 = new MemberService().updateChildOb(ob);
			}
		} 
		
		if(result1 > 0 || result2 > 0) {
			request.getRequestDispatcher("/views/teacher/tcChildObserve.jsp?cid=" + cid + "&age=" + selectAge).forward(request, response);
		} else {
			request.setAttribute("msg", "관찰척도 입력 실패");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
