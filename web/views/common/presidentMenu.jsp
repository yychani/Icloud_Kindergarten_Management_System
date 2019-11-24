<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/menu.css" />
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<style>
    #menu {
        border: 0px;
    }
    .menuLink, .submenuLink{
		font-family: 'Noto Sans KR', sans-serif;
	}
    body {
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

    input[type='button']:hover {
        background: rgb(44, 44, 44) !important;
        color: rgb(255, 255, 255) !important;
    }
</style>
<table style="margin-top: 10px; width: 100%;">
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
                    onclick="logout();" value="로그아웃">
            </div>
        </td>
    </tr>
    <tr>
        <td id="menu">
            <nav id="topMenu">
                <ul>
                    <li class="topMenuLi"> <a class="menuLink" href="">소식</a>
                        <ul class="submenu">
                            <li class="li1"><a href="<%=request.getContextPath() %>/views/president/preKNotice.jsp"
                                    class="submenuLink">원 공지사항</a></li>
                            <li>|</li>
                            <li class="li2"><a href="<%=request.getContextPath() %>/views/president/preAnnouncement.jsp" class="submenuLink">원장님 알림장</a></li>
                        </ul>
                    </li>
                    <li class="topMenuLi"> <a class="menuLink" href="">업무</a>
                        <ul class="submenu">
                            <li class="li3"><a href="<%=request.getContextPath() %>/views/president/preWorkD.jsp"
                                    class="submenuLink">선생님 업무분장</a></li>
                            <li>|</li>
                            <li class="li4"><a href="<%=request.getContextPath() %>/views/president/menuAble.jsp"
                                    class="submenuLink">메뉴사용관리</a></li>
                            <li>|</li>
                            <li class="li5"><a href="" class="submenuLink">원 일정</a></li>
                            <li>|</li>
                            <li class="li6"><a href="<%=request.getContextPath() %>/views/president/preAs.jsp"
                                    class="submenuLink">방과후 페이지</a></li>
                            <li>|</li>
                            <li class="li7"><a href="" class="submenuLink">식단표</a></li>
                            <li>|</li>
                            <li class="li8"><a href="<%=request.getContextPath() %>/views/president/preFTL.jsp"
                                    class="submenuLink">현장체험학습</a></li>
                        </ul>
                    </li>
                    <li class="topMenuLi"> <a class="menuLink" href="">게시판</a>
                        <ul class="submenu">
                            <li class="li9"><a href="<%=request.getContextPath() %>/views/president/prePBoard.jsp"
                                    class="submenuLink">학부모 게시판</a></li>
                            <li>|</li>
                            <li class="li10"><a href="<%=request.getContextPath() %>/views/president/preHBoard.jsp"
                                    class="submenuLink longLink">유치원 운영위원회 게시판</a></li>

                        </ul>
                    </li>
                    <li class="topMenuLi"> <a class="menuLink"
                            href="<%=request.getContextPath() %>/views/president/preTManagement.jsp">선생님 관리</a></li>
                    <li class="topMenuLi"> <a class="menuLink" href="<%=request.getContextPath() %>/views/president/preKManagement.jsp">원아 관리</a> </li>
                    <li class="topMenuLi"> <a class="menuLink" href="">마이페이지</a>
                        <ul class="submenu">
                            <li class="li11"><a href="<%=request.getContextPath() %>/views/president/preKInfo.jsp" class="submenuLink">원 정보</a></li>
                            <li>|</li>
                            <li class="li12"><a href="" class="submenuLink">건의/문의 확인</a></li>

                        </ul>
                    </li>
                    <li style="float: right;" class="topMenuLi">
                        <div class="ui button" data-tooltip="Add users to your feed" data-position="bottom right"><i
                                class="bell outline icon"></i>
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