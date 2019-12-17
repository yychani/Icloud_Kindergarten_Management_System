<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.oracle5.member.model.vo.Member"%>
<%@page import="java.net.InetAddress"%>
    <% InetAddress inet = InetAddress.getLocalHost();
		String svrIP = inet.getHostAddress();
		int svrPort = request.getServerPort();%>
<%
	Member loginUser = (Member) session.getAttribute("loginMember");
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/menu.css" />
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
	table {
		margin: 50px auto; 
		text-align: center;
	}
	#menu {
		border: 0;
	}
	.menuLink, .submenuLink{
		font-family: 'Noto Sans KR', sans-serif;
	}
	body {
        font-family: 'Noto Sans KR', sans-serif;
        overflow-x:hidden;
    }
	input[type='button'] {
		width: 100px;
		height: 40px;
		border-radius: 10px;
		background: rgb(63, 63, 63);
		color: white;
		font-weight: bold;
		border: none;
		cursor: pointer;
	}
	
	input[type='button']:hover {
        background: rgb(44, 44, 44) !important;
        color: rgb(255, 255, 255) !important;
    }
</style>

<script>
	$(function(){
		$.ajax({
			url : "/main/selectBanChildList.do",
			data:{
				tno:<%=loginUser.getMemberNo() %>
			},
			type : "post",
			success : function(data) {
				$select = $("#receiver");
				$select.find("option").remove();
				$select.append("<option value='1' selected>원장 선생님</option>");
				for (var i = 0; i < data.length; i++) {
					var name = decodeURIComponent(data[i].name);
					$select.append("<option value='" + data[i].bcNo + "'>" + name + " 학부모</option>");
				}
				$("#receiver").trigger("change");
			},
			error : function(data) {
				console.log("실패!");
			}
		});
	});
</script>

<%
	if (loginUser == null || !loginUser.getUType().equals("교사")) {
		request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
		request.getRequestDispatcher("../common/errorPage.jsp").forward(request, response);
	} else {
%>
<table style="margin-top: 10px; width: 100%;">
	<tr>
		<td rowspan="2" id="menu">
			<div id="logo">
				<a href="<%=request.getContextPath()%>/teacher">
					<img src="<%=request.getContextPath() %>/images/logo.png"
						style="width: 300px; display: inline-block;"></a>
			</div>
		</td>
		<td id="menu">
			<div style="float: right;">
				<input type="button" style="margin-right:20px;"
					onclick="logout();" value="로그아웃">
			</div>
		</td>
	</tr>
	<tr>
		<td id="menu">
			<nav id="topMenu">
				<ul>
					<li class="topMenuLi"><a class="menuLink" href="">소식</a>
						<ul class="submenu">
							<li class="li"><a href="<%= request.getContextPath() %>/views/teacher/tcPreNotice.jsp" class="submenuLink">원 공지사항</a></li>
							<li>|</li>
							<li class="li"><a href="<%= request.getContextPath() %>/selectAllBanList" class="submenuLink">반 공지사항</a></li>
							<li>|</li>
							<li class="li"><a href="<%= request.getContextPath() %>/selectFLetterList.tbo" class="submenuLink">가정통신문</a></li>
							<li>|</li>
							<li class="li"><a href="<%= request.getContextPath() %>/views/teacher/tcSchedule.jsp" class="submenuLink">일정표</a></li>
							<li>|</li>
							<li class="li"><a href="<%= request.getContextPath() %>/views/teacher/tcMenu.jsp" class="submenuLink">식단표</a></li>
						</ul>
					</li>
					<li class="topMenuLi"><a class="menuLink" href="">업무</a>
						<ul class="submenu">
							<li class="li"><a href="<%= request.getContextPath() %>/selectWorkList.task" class="submenuLink">업무분장</a></li>
							<li>|</li> 
							<li class="li"><a href="<%= request.getContextPath() %>/selectAllTcNote?tno=<%= loginUser.getMemberNo() %>" class="submenuLink">반 공통 알림장</a></li>
							<li>|</li>
							<li class="li"><a href="<%= request.getContextPath() %>/views/teacher/tcSelectNoteDate.jsp" class="submenuLink">원아별 알림장</a></li>
							<li>|</li>
							<li class="li"><a href="<%= request.getContextPath() %>/selectBanAttend.me" class="submenuLink">출석 관리</a></li>
							<li>|</li>
							<li class="li"><a href="<%= request.getContextPath() %>/selectBanChildren.me" class="submenuLink">원아 관리</a></li>
							<li>|</li>
							<li class="li"><a href="<%= request.getContextPath() %>/views/teacher/tcParentAccount.jsp" class="submenuLink">학부모 관리</a></li>
							<li>|</li>
							<li class="li"><a href="<%= request.getContextPath() %>/selectBanAsList.me?tno=<%= loginUser.getMemberNo() %>" class="submenuLink">방과후 신청 관리</a></li>
							<li>|</li>
							<li class="li"><a href="<%= request.getContextPath() %>/selectBanDoseList.me" class="submenuLink">투약 의뢰서 관리</a></li>
							<li>|</li>
							<li class="li"><a href="<%= request.getContextPath() %>/views/teacher/tcRtnList.jsp" class="submenuLink">귀가 동의서 관리</a></li>
						</ul>
					</li>
					<li class="topMenuLi"><a class="menuLink" href="">게시판</a>
						<ul class="submenu">
							<li class="li"><a href="<%= request.getContextPath() %>/selectAllTctc.bo" class="submenuLink">선생님 게시판</a></li>
							<li>|</li>
							<li class="li"><a href="<%= request.getContextPath() %>/views/teacher/tcHBoard.jsp" class="submenuLink longLink">유치원 운영위원회 게시판</a></li>

						</ul>
					</li>
					<li class="topMenuLi"><a class="menuLink" href="<%= request.getContextPath() %>/selectListChImg.tbo">아이들 사진</a></li>
					<li class="topMenuLi"><a class="menuLink" href="">마이페이지</a>
						<ul class="submenu">
							<li class="li"><a href="<%= request.getContextPath() %>/views/teacher/tcMyInfo.jsp" class="submenuLink">내 정보</a></li>
							<li>|</li>
							<li class="li"><a href="<%= request.getContextPath() %>/views/teacher/tcMypageGuessMain.jsp" class="submenuLink">건의/문의 확인</a></li>

						</ul>
					</li>
					<li style="float: right;" class="topMenuLi">
						<div class="ui button" data-position="bottom right" style="background:none"><i
								class="bell outline icon"></i></div>
					</li>
					<script>
						var alarm = '<dl><dt>새소식</dt><a href="#"><dd>내용</dd></a><a href="#"><dd>내용</dd></a><a href="#"><dd>내용</dd></a></ul>';
						$('.ui.button').popup({
							on: 'click',
							position: 'data-position',
							target: '.bell.outline.icon',
							html: alarm
						});

						function logout() {
                        	var check = window.confirm("로그아웃 하시겠습니까?");
            				
            				if(check) {
            					location.href = '<%=request.getContextPath()%>/logout';
            				}
                        }
					</script>

				</ul>
			</nav>
		</td>
	</tr>
</table>
<%
	}
%>