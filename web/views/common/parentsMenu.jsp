<%@page import="com.oracle5.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.net.InetAddress"%>
    <% InetAddress inet = InetAddress.getLocalHost();
		String svrIP = inet.getHostAddress();
		int svrPort = request.getServerPort();%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/menu.css" />
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<%
	Member loginUser = (Member) session.getAttribute("loginMember");
%> 

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
      overflow-x:hidden;
   }
	#logout {
	
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
			url: "/main/checkMenuAble.menu",
			type:"post",
			success:function(data){
				if(data == "true"){
					$(".ftl").show();
				}else {
					$(".ftl").hide();
				}
			}
		});
	});
</script>
<script>
	$(function(){
		$.ajax({
			url : "/main/selectMyTeacher.me",
			data:{
				pno:<%=loginUser.getMemberNo() %>
			},
			type : "post",
			success : function(data) {
				$select = $("#receiver");
				$select.find("option").remove();
				console.log(data);
				for(var key in data){
					var name = decodeURIComponent(data[key].className);
					$select.append("<option value='" + data[key].teacherNo + "'>" + name + " 선생님</option>");
					
				}
				
				
				$("#receiver").trigger("change");
			},
			error : function(data) {
				console.log("실패!");
			}
		});
	});
</script>
<table style="margin-top: 10px; width:100%;">
   <tr>
      <td rowspan="2" id="menu">
         <div id="logo">
            <a href="<%=request.getContextPath()%>/selectChildCidServlet.me?pno=<%=loginUser.getMemberNo() %>"> <img src="<%=request.getContextPath()%>/images/logo.png"
                  style="width: 300px; display: inline-block;"></a>
         </div>
      </td>
      <td id="menu">
         <div style="float: right;">
         	<button class="ui button" style="margin-right:20px; font-size: 8pt; font-family: 'Noto Sans KR', sans-serif; background: none;" onclick="logout();">
  				로그아웃
			</button>
         </div>
      </td>
   </tr>
   <tr>
      <td id="menu">
         <nav id="topMenu">
            <ul>
            
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
               
               <li class="topMenuLi"><a class="menuLink" href="">소식</a>
                  <ul class="submenu">
                     <li class="li"><a href="<%=request.getContextPath() %>/selectAllPreNotice.bo" class="submenuLink">원 공지사항</a></li>
                     <li>|</li>
                     <li class="li"><a href="<%=request.getContextPath() %>/selectAllBanList?pno=<%=loginUser.getMemberNo()%>" class="submenuLink">반 공지사항</a></li>
                     <li>|</li>
                     <li class="li"><a href="<%=request.getContextPath() %>/selectFLetterList.tbo" class="submenuLink">가정통신문</a></li>
                     <li>|</li>
                     <li class="li"><a href="<%=request.getContextPath() %>/selectAllSchedule.sch" class="submenuLink">원 일정</a></li>
                     <li>|</li>
                     <li class="li"><a href="<%=request.getContextPath() %>/selectAllDietTable.diet" class="submenuLink">식단표</a></li>
                  </ul>
               </li>
               <li class="topMenuLi"><a class="menuLink" href="">게시판</a>
                  <ul class="submenu">
                     <li class="li"><a href="<%=request.getContextPath() %>/selectListChImg.tbo" class="submenuLink">아이들 사진 게시판</a></li>
                     <li>|</li>
                     <li class="li"><a href="<%=request.getContextPath() %>/selectAll.pbo" class="submenuLink">학부모 게시판</a></li>
                     <li>|</li>
                     <li class="li"><a href="<%=request.getContextPath() %>/selectAllPreHBoard.bo" class="submenuLink longLink">유치원 운영위원회
                           게시판</a></li>
                  </ul>
               </li>
               
               <li class="topMenuLi"><a class="menuLink" href="">현장체험학습</a>
               <ul class="submenu">
                     <li class="li ftl"><a href="javascript: void(0);"  id="ftlA" class="submenuLink longLink">체험학습 신청</a></li>
                     <li class="ftl">|</li>
                     <li class="li"><a href="<%=request.getContextPath() %>/ftlApplyList.me" class="submenuLink">신청 이력</a></li>
                  </ul>
               </li>
               
               <li class="topMenuLi"><a class="menuLink" href="">방과후 </a>
                  <ul class="submenu">
                     <li class="li"><a href="<%=request.getContextPath() %>/views/parents/asListMain.jsp" class="submenuLink">방과후 프로그램</a></li>
                     <li>|</li>
                     <li class="li"><a href="<%=request.getContextPath() %>/views/parents/asApply.jsp" class="submenuLink">방과후 신청</a></li>
                     <li>|</li>
                     <li class="li"><a href="<%=request.getContextPath() %>/asList.me" class="submenuLink">방과후 신청 이력</a></li>
                  </ul>
               </li>

             
               <li class="topMenuLi"><a class="menuLink" href="">마이페이지</a>
                  <ul class="submenu">
                     <li class="li"><a href="<%=request.getContextPath() %>/views/parents/myPagePassCheck.jsp"  class="submenuLink">내 정보</a></li>
                     <li>|</li>
                     <li class="li"><a href="<%=request.getContextPath() %>/parentQnAList.bo" class="submenuLink">건의/문의 신청</a></li>
                  </ul>
               </li>
               <!-- <li style="float: right;" class="topMenuLi">
                  <div class="ui button" data-position="bottom right" style="background:none">
                     <i class="bell outline icon"></i>
                  </div>
               </li> -->
               <script>
                  /* var alarm = '<dl><dt>새소식</dt><a href="#"><dd>내용</dd></a><a href="#"><dd>내용</dd></a><a href="#"><dd>내용</dd></a></ul>';
                  $('.ui.button').popup({
                     on: 'click',
                     position: 'data-position',
                     target: '.bell.outline.icon',
                     html: alarm 
                  }); */
                  
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
<script>
	$("#ftlA").click(function(){
		$.ajax({
			url: "/main/checkMenuAble.menu",
			type:"post",
			success:function(data){
				if(data == "true"){
					location.href = "<%=request.getContextPath() %>/ftlInfo.me";
				}else {
					alert("현재 현장체험학습은 납부가 종료되어있습니다.");
					
				}
			}
		});
	});
</script>