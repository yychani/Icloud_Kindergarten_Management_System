<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/menu.css" />
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<style>
table {
		margin: 50px auto;
		text-align: center;
	}

	#menu {
		border: 0px;
		
	}

	.menuLink,
	.submenuLink {
		font-family: 'Noto Sans KR', sans-serif;
	}

	body {
		font-family: 'Noto Sans KR', sans-serif;
	}


</style>
<table style="margin-top: 10px; width:100%;">
	<tr>
		<td rowspan="2" id="menu">
			<div id="logo">
				<a href="<%=request.getContextPath()%>"> <img src="<%=request.getContextPath()%>/images/logo.png"
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
							<li class="li"><a href="<%=request.getContextPath() %>/views/parents/newsNotice.jsp" class="submenuLink">원 공지사항</a></li>
							<li>|</li>
							<li class="li"><a href="<%=request.getContextPath() %>/views/parents/newsClassNotice.jsp" class="submenuLink">반 공지사항</a></li>
							<li>|</li>
							<li class="li"><a href="<%=request.getContextPath() %>/views/parents/newsFamilyL.jsp" class="submenuLink">가정통신문</a></li>
							<li>|</li>
							<li class="li"><a href="<%=request.getContextPath() %>/views/parents/newsCalendar.jsp" class="submenuLink">원 일정</a></li>
							<li>|</li>
							<li class="li"><a href="<%=request.getContextPath() %>/views/parents/newsMealMenu.jsp" class="submenuLink">식단표</a></li>
						</ul>
					</li>
					<li class="topMenuLi"><a class="menuLink" href="">게시판</a>
						<ul class="submenu">
							<li class="li"><a href="<%=request.getContextPath() %>/views/parents/boardThumbnailMain.jsp" class="submenuLink">아이들 사진 게시판</a></li>
							<li>|</li>
							<li class="li"><a href="<%=request.getContextPath() %>/views/parents/boardParentsBoard.jsp" class="submenuLink">학부모 게시판</a></li>
							<li>|</li>
							<li class="li"><a href="<%=request.getContextPath() %>/views/parents/boardCommittee.jsp" class="submenuLink longLink">유치원 운영위원회
									게시판</a></li>
						</ul>
					</li>
					<li class="topMenuLi"><a class="menuLink" href="">방과후 </a>
						<ul class="submenu">
							<li class="li"><a href="<%=request.getContextPath() %>/views/parents/asListMain.jsp" class="submenuLink longLink">방과후 프로그램</a></li>
							<li>|</li>
							<li class="li"><a href="<%=request.getContextPath() %>/views/parents/asApply.jsp" class="submenuLink">방과후 신청</a></li>
							<li>|</li>
							<li class="li"><a href="<%=request.getContextPath() %>/views/parents/asApplyList.jsp" class="submenuLink">방과후 신청 이력</a></li>
						</ul>
					</li>

					<li class="topMenuLi"><a class="menuLink" href="">내 아이</a>
						<ul class="submenu">
							<li class="li"><a href="<%=request.getContextPath()%>/views/parents/mykidsInfo.jsp" class="submenuLink">내 아이 정보</a></li>
							<li>|</li>
							<li class="li"><a href="<%=request.getContextPath()%>/views/parents/mykidsNote.jsp" class="submenuLink">알림장</a></li>
							<li>|</li>
							<li class="li"><a href="<%=request.getContextPath()%>/views/parents/mykidsAttendance.jsp" class="submenuLink">출결사항</a></li>
							<li>|</li>
							<li class="li"><a href="<%=request.getContextPath()%>/views/parents/mykidsDose.jsp" class="submenuLink">투약의뢰서</a></li>
							<li>|</li>
							<li class="li"><a href="<%=request.getContextPath()%>/views/parents/mykidsGohome.jsp" class="submenuLink">귀가동의서</a></li>
						</ul>
					</li>
					<li class="topMenuLi"><a class="menuLink" href="">마이페이지</a>
						<ul class="submenu">
							<li class="li"><a href="<%=request.getContextPath() %>/views/parents/myPagePassCheck.jsp"  class="submenuLink">내 정보</a></li>
							<li>|</li>
							<li class="li"><a href="<%=request.getContextPath() %>/views/parents/mypageQ&Alist.jsp" class="submenuLink">건의/문의 신청</a></li>
						</ul>
					</li>
					<li style="float: right;" class="topMenuLi">
						<div class="ui button" data-position="bottom right" style="background:none">
							<i class="bell outline icon"></i>
						</div>
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