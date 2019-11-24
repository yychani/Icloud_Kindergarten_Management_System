<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/menu.css" />
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>

	table {
		text-align: center;
		margin: 50px auto;
	}
	#menu {
		border: 0;

	.menuLink, .submenuLink{
		font-family: 'Noto Sans KR', sans-serif;

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
</style>
<table style="margin-top: 10px;">
	<tr>
		<td rowspan="2" id="menu">
			<div id="logo">
				<a href="<%=request.getContextPath()%>">
					<img src="<%=request.getContextPath() %>/images/logo.png"
						style="width: 300px; display: inline-block;"></a>
			</div>
		</td>
		<td id="menu">
			<div style="float: right;">
				<input type="button" style="margin-right:20px;"
					onclick="location.href='<%=request.getContextPath() %>/index.jsp'" value="로그아웃">
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
							<li class="li"><a href="<%= request.getContextPath() %>/views/teacher/tcClassNotice.jsp" class="submenuLink">반 공지사항</a></li>
							<li>|</li>
							<li class="li"><a href="<%= request.getContextPath() %>/views/teacher/tcFamilyLetter.jsp" class="submenuLink">가정통신문</a></li>
							<li>|</li>
							<li class="li"><a href="<%= request.getContextPath() %>/views/teacher/tcSchedule.jsp" class="submenuLink">일정표</a></li>
							<li>|</li>
							<li class="li"><a href="<%= request.getContextPath() %>/views/teacher/tcMenu.jsp" class="submenuLink">식단표</a></li>
						</ul>
					</li>
					<li class="topMenuLi"><a class="menuLink" href="">업무</a>
						<ul class="submenu">
							<li class="li"><a href="" class="submenuLink">업무분장</a></li>
							<li>|</li>
							<li class="li"><a href="<%= request.getContextPath() %>/views/teacher/tcCommonNote.jsp" class="submenuLink">반 공통 알림장</a></li>
							<li>|</li>
							<li class="li"><a href="<%= request.getContextPath() %>/views/teacher/tcNote.jsp" class="submenuLink">원아별 알림장</a></li>
							<li>|</li>
							<li class="li"><a href="" class="submenuLink">출석 관리</a></li>
							<li>|</li>
							<li class="li"><a href="<%= request.getContextPath() %>/views/teacher/tcChildMgmt.jsp" class="submenuLink">원아 관리</a></li>
							<li>|</li>
							<li class="li"><a href="<%= request.getContextPath() %>/views/teacher/tcParentAccount.jsp" class="submenuLink">학부모 관리</a></li>
							<li>|</li>
							<li class="li"><a href="" class="submenuLink">현장체험학습</a></li>
						</ul>
					</li>
					<li class="topMenuLi"><a class="menuLink" href="">게시판</a>
						<ul class="submenu">
							<li class="li"><a href="" class="submenuLink">선생님 게시판</a></li>
							<li>|</li>
							<li class="li"><a href="" class="submenuLink longLink">유치원 운영위원회 게시판</a></li>

						</ul>
					</li>
					<li class="topMenuLi"><a class="menuLink" href="">아이들 사진</a></li>
					<li class="topMenuLi"><a class="menuLink" href="">마이페이지</a>
						<ul class="submenu">
							<li class="li"><a href="" class="submenuLink">내 정보</a></li>
							<li>|</li>
							<li class="li"><a href="" class="submenuLink">방과후 신청 리스트</a></li>
							<li>|</li>
							<li class="li"><a href="" class="submenuLink">건의/문의 확인</a></li>

						</ul>
					</li>
					<li style="float: right;" class="topMenuLi">
						<div class="ui button" data-tooltip="Add users to your feed" data-position="bottom right"><i
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


					</script>

				</ul>
			</nav>
		</td>
	</tr>
</table>