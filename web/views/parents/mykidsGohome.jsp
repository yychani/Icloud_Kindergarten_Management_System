<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.oracle5.member.model.vo.Member, com.oracle5.member.model.vo.ReturnAgree"%>
<% %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
            crossorigin="anonymous"></script>

<!-- 글꼴  -->
<link
   href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
   rel="stylesheet">

<!-- 시멘틱ui -->
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
   src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>

<!-- timepicker2  -->
<link rel="stylesheet"
   href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script
   src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

<!-- datepicker -->
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">



<style>
h1 {
   font-family: 'Noto Sans KR', sans-serif;
   margin-top: 5%;
   margin-bottom: 5%;
   font-weight: bold;
}

h4 {
   font-weight: bolder;
   font-size: medium;
}

body {
   font-family: 'Noto Sans KR', sans-serif;
}

#testbutton {
   background-color: #87c541;
   border: none;
   margin: 10px;
}

.pricing-item text-center {
   margin: 20%;
   width: 600px;
}

#title {
   font-weight: bold;
   font-size: 500px;
   color: #87c541;
}

.goHomeTable td {
   height: 40px;
   /* vertical-align:center;    */
   vertical-align: middle;
}

label {
   margin: 0 0;
}

.ui-datepicker-trigger {
   height: 20px;
   width: 20px;
}

img {
   width: 20px;
}
#caution {
   color: rgb(209, 57, 57);
}
#labelText {
   text-align: right;
}
</style>

</head>
<body style="overflow-x: hidden">
   <%@ include file="/views/common/parentsMenu.jsp"%>
   
	<script>
      $(function() {
    	  $(".li:nth-child(9)").addClass("on");
    	  
          $(".topMenuLi:nth-child(1)").addClass("on");
         
          $(".topMenuLi").mouseover(function() {
            $(".li:nth-child(9)").removeClass("on");
            $(".topMenuLi:nth-child(1)").removeClass("on");
         });
        
          $(".topMenuLi").mouseleave(function() {
            $(".li:nth-child(9)").addClass("on");
            $(".topMenuLi:nth-child(1)").addClass("on");
         });
      }); 
</script>


   <div class="ui olive inverted segment outBox" style="margin:5% 30%;">
         <div class="ui raised segment" align="center">
         <Br>
               <h1 align="center">귀가동의서 작성</h1>   
               
               <form  id="goHomeRequest" action="<%=request.getContextPath()%>/returnAgree.me"  method="post" onsubmit="return true">
                  <table  align="center" class="goHomeTable">
                  
                        <tr>
                              <td id="labelText"><label>유아명 : </label></td>
                              <td>
                                 <div class="ui mini icon input">
                                    <input type="text" placeholder="유아명 입력" name="kidsName">
                                    <input type="hidden" name="pNo" value="<%= loginUser.getMemberNo() %>">
                                 </div>
                              </td>
                           </tr>
                           <tr>
                              <td id="labelText"><label>인솔자 명 : </label></td>
                              <td>
                                 <div class="ui mini icon input">
                                    <input type="text" placeholder="인솔자 성명 입력" name="guideName">
                                 </div>
                              </td>
      
                           </tr>
                           <tr>
                              <td id="labelText"><label>인솔자 연락처 : </label></td>
                              <td>
                                 <div class="ui mini icon input">
                                    <input type="tel" placeholder="인솔자 연락처 입력" name="guidePhone"
                                       id="phone">
                                 </div>
                              </td>
                           </tr>
                           <tr>
                              <td id="labelText"><label>일자: </label></td>
                              <td>
                                 <div class="ui mini icon input">
                                    <input type="date" id="applyDate" name="applyDate">
                                 </div>
                              </td>
                           </tr>
                           <tr>
                              <td id="labelText"><label>귀가 요청 시간 : </label></td>
                              <td>
                                 <div class="ui mini icon input">
                                    <input class="timepicker" id='timepicker' type='text'
                                       name='applyTime'>
                                 </div>
                              </td>
                           </tr>
                  </table>
                  <div class="btns">
                  <label id="caution">*유아의 귀가 시 아래의 보호자에게 인도하여 주십시오.<br>아래의 보호자 이외의 다른 사람에게 인계할 경우 사전에 반드시 연락을 취하겠습니다.</label>
                  <br><br><br><br>
                  <button type="submit" class="ui green basic button">제출하기</button>
					 </form>
					<!-- 신청이력 버튼 -->
              	 <button type="button" class="ui teal basic button" onclick="location.href='<%=request.getContextPath()%>/returnAgreeList.me'">신청이력</button>
                
                  </div>
                  <script>
                  
                  $('.timepicker').timepicker({
                        timeFormat: 'h:mm p',
                        interval: '10',
                        minTime: '10',
                        maxTime: '6:00pm',
                        defaultTime: '11',
                        startTime: '09:00',
                        dynamic: true,
                        dropdown: true,
                        scrollbar: true
                     });
                  
                  function goReturnApplyList(){
                	  location.href="<%=request.getContextPath()%>/returnAgreeList.me";
                  }
                  </script>

              

         </div>
   </div>

   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
                     <script>
         

                     
                     $(function(){
                        
                        $("#datepicker").datepicker({
                           dateFormat: 'yy-mm-dd', //날짜 표시 형식 설정
                           showOtherMonths: true, //이전 달과 다음 달 날짜를 표시
                           showMonthAfterYear:true, //연도 표시 후 달 표시
                           changeYear: true, //연도 선택 콤보박스
                           changeMonth: true, //월 선택 콤보박스
                           showOn: "both", //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
                           yearSuffix: "년", //연도 뒤에 나오는 텍스트 지정
                           monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
                           monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                           dayNamesMin: ['일','월','화','수','목','금','토'],
                           dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
                           minDate: "0D", // -1D:하루전, -1M:한달전, -1Y:일년전
                           maxDate: "+1M", // +1D:하루후, -1M:한달후, -1Y:일년후
                            buttonImage:"<%=request.getContextPath()%>/images/calendar.png" , //버튼에 띄워줄 이미지 경로
                           buttonImageOnly: true, //디폴트 버튼 대신 이미지 띄워줌
                           buttonText: "선택", //버튼 마우스오버 시 보이는 텍스트 
                           });
      
                           
                        
                        
                        
                     });
                     
                  
            //  $(function() {
            //    //input을 datepicker로 선언
            //    $("#datepicker")
            //          .datepicker(
            //                {
            //                   dateFormat : 'yy-mm-dd' //Input Display Format 변경
            //                   ,
            //                   showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            //                   ,
            //                   showMonthAfterYear : true //년도 먼저 나오고, 뒤에 월 표시
            //                   ,
            //                   changeYear : true //콤보박스에서 년 선택 가능
            //                   ,
            //                   changeMonth : true //콤보박스에서 월 선택 가능                
            //                   ,
            //                   showOn : "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
            //                   ,
            //                   buttonImage : "<%= request.getContextPath() %>/images/calendar.png" "<img style="width:80px; height:80px;" src="<%=request.getContextPath()%>/images/calendar.png">" /*  "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" */ //버튼 이미지 경로
            //                   ,
            //                   buttonImageOnly : true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
            //                   ,
            //                   buttonText : "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
            //                   ,
            //                   yearSuffix : "년" //달력의 년도 부분 뒤에 붙는 텍스트
            //                   ,
            //                   monthNamesShort : [ '1', '2', '3', '4',
            //                         '5', '6', '7', '8', '9', '10',
            //                         '11', '12' ] //달력의 월 부분 텍스트
            //                   ,
            //                   monthNames : [ '1월', '2월', '3월', '4월',
            //                         '5월', '6월', '7월', '8월', '9월',
            //                         '10월', '11월', '12월' ] //달력의 월 부분 Tooltip 텍스트
            //                   ,
            //                   dayNamesMin : [ '일', '월', '화', '수',
            //                         '목', '금', '토' ] //달력의 요일 부분 텍스트
            //                   ,
            //                   dayNames : [ '일요일', '월요일', '화요일',
            //                         '수요일', '목요일', '금요일', '토요일' ] //달력의 요일 부분 Tooltip 텍스트
            //                   ,
            //                   minDate : "0D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            //                   ,
            //                   maxDate : "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
            //                });

            //    //초기값을 오늘 날짜로 설정
            //    $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
            // }); 
            
         
         </script>


                  </table>
               
                  




         <script
            src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.bundle.min.js"
            integrity="sha384-pjaaA8dDz/5BgdFUPX6M/9SUZv4d12SUPF0axWc+VRZkx5xU3daN+lYb49+Ax+Tl"
            crossorigin="anonymous"></script>
            
            <script>
        	//메뉴바 고정
        	$(function() {
        	    $(".li1").addClass("on");
        	    $(".topMenuLi:nth-child(4)").addClass("on");

        	    $(".topMenuLi").mouseover(function() {
        	       $(".li1").removeClass("on");
        	       $(".topMenuLi:nth-child(4)").removeClass("on");
        	    });
        	    $(".topMenuLi").mouseleave(function() {
        	       $(".li1").addClass("on");
        	       $(".topMenuLi:nth-child(4)").addClass("on");
        	    });

        	 });
            
            
            
            
            
            </script>
<%@ include file="/views/common/chat.jsp"%>
         
</body>
</html>