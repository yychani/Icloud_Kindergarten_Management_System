<%@page import="com.oracle5.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/* String msg = (String) session.getAttribute("msg");  */
	int successCode = Integer.parseInt(request.getParameter("successCode"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		successCode = <%=successCode %>;
		console.log(successCode);
		
		var msg = "";
		var path = "<%=request.getContextPath()%>/index.jsp";
		if(successCode == 1) {
			msg = "회원가입에 성공하셨습니다.";
		} else if(successCode == 2){
			msg = "로그아웃 하셨습니다.";
			path = "<%=request.getContextPath()%>/index.jsp";
		} else if(successCode == 3){
			msg = "정보 수정이 완료 되었습니다.";
			path = "<%=request.getContextPath()%>/views/member/memberUpdateForm.jsp";
		} else if(successCode == 4){
			msg = "회원 탈퇴가 완료 되었습니다.";
			path = "<%=request.getContextPath()%>/index.jsp";
		} else if(successCode == 5){
			msg = "선생님 계정 생성이 완료 되었습니다.";
			path = "<%=request.getContextPath()%>/selectAllTeacher";	
		} else if(successCode == 6){
			msg = "선생님 계정 삭제가 완료 되었습니다.";
			path = "<%=request.getContextPath()%>/selectAllTeacher";	
		} else if(successCode == 7){
			msg = "학부모회원 탈퇴가 완료 되었습니다.";
			path = "<%=request.getContextPath()%>/index.jsp";
		} else if(successCode == 8){
			msg = "방과후 신청이 완료 되었습니다.";
			path = "<%=request.getContextPath()%>/views/parents/asApply.jsp";
		} else if(successCode == 9){
			msg = "이미 신청하셨습니다.";
			path = "<%=request.getContextPath()%>/views/parents/asApply.jsp";
		} else if(successCode == 10){
			msg = "투약의뢰서 신청이 완료 되었습니다.";
			path = "<%=request.getContextPath()%>/doseList.me";
		} else if(successCode == 11){
			msg = "해당 업무가 삭제 되었습니다.";
			path = "<%=request.getContextPath()%>/selectWorkList.task";	
  	 	}else if(successCode == 12){
			msg = "귀가동의서 신청이 완료 되었습니다.";
			path = "<%=request.getContextPath()%>/returnAgreeList.me";
		}else if(successCode == 13){
			msg = "현장체험학습 신청이 완료 되었습니다.";
			path = "<%=request.getContextPath()%>/ftlApplyList.me";
		}else if(successCode == 14){
			msg = "개인정보 변경이 완료 되었습니다.";
			path = "<%=request.getContextPath()%>/pInfo.me";
		}else if(successCode == 15){
			msg = "비밀번호 변경이 완료 되었습니다.";
			path = "<%=request.getContextPath()%>/views/parents/myPagePassCheck.jsp";
		}else if(successCode == 16){
			msg = "원아 정보 수정이 완료되었습니다.";
			path = "<%=request.getContextPath()%>/views/parents/myPageChildren.jsp";
		}else if(successCode == 17){
			msg = "건의&문의 작성이 완료되었습니다.";
			path = "<%=request.getContextPath()%>/parentQnAList.bo";
		}
		
		alert(msg);
		location.href = path;
	</script>
	<%-- <h1 align="center"><%=msg %></h1> --%>
	<h3 align="center">
		<a href="<%=request.getContextPath()%>/index.jsp">메인화면으로 가기</a>
	</h3>
</body>
</html>