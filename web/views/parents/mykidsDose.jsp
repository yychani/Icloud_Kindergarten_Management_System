<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">

<title>Document</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시멘틱ui -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>


<!-- 글꼴  -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<!-- dater picker -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<!-- <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> -->

<!-- timepicker2  -->
 <link rel="stylesheet"
   href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script
   src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

<style>
.ui, .olive, .inverted, .segment, .outBox {
   font-family: 'Noto Sans KR', sans-serif;
}

h1 {
   font-family: 'Noto Sans KR', sans-serif;
   font-weight: bold;
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
   <div class="ui olive inverted segment outBox" style="margin: 5% 30%;" align="center">
      <div class="ui raised segment">
         <br>
         <h1 align="center">투약의뢰서 작성</h1>
         <form id="dosingRequest" action="<%=request.getContextPath()%>/views/parents/mykidsDoseList.jsp" onsubmit="return true">
            <table align="center" class="doesTable">
               <tr>
                  <td id="labelText"><label>유아명 : </label></td>
                  <td><div class="ui mini icon input">
                        <input type="text" placeholder="유아명 입력" name="kidsName">
                     </div></td>
               </tr>
               <tr>
                  <td id="labelText"><label>증상명 : </label></td>
                  <td>
                     <div class="ui mini icon input">
                        <input type="text" placeholder="증상명 입력" name="disease">
                     </div>
                  </td>
               </tr>
               <tr>
                  <td id="labelText"><label>약의 종류 및 용량 : </label></td>
                  <td>
                     <div class="ui mini icon input">
                        <input type="text" placeholder="약의 종류 및 용량 입력" name="medician">
                     </div>
                  </td>
               </tr>
               <tr>
                  <td id="labelText"><label>약의 보관 방법 :</label></td>
                  <td>

                     <div class="ui form">
                        <div class="grouped fields">
                           <div class="field">
                              <div class="ui radio checkbox">
                                 <input type="radio" name="keepMedicine" value="상온" id="ordinary" checked="checked"> <label for="ordinary">상온</label>
                              </div>
                              <div class="ui radio checkbox">
                                 <input type="radio" name="keepMedicine" value="냉온" id="freeze"> <label for="freeze">냉온</label>
                              </div>
                           </div>
                        </div>
                     </div>
                  </td>
               </tr>
               <tr>
                  <td id="labelText"><label>투약 의뢰 기간 : </label></td>
                  <td>
                     <div class="ui mini icon input">
                        <input type="date" id="dosingPeriodStart">~ <input
                           type="date" id="dosingPeriodEnd">
                     </div>
                  </td>
               </tr>
               <tr>
                  <td id="labelText"><label>투약 의뢰 시간 : </label></td>
                  <td width="340px">
                     <div id="dosingTimeArea" class="ui mini icon input" style="display:inline-block">
                        <input class="timepicker" id='dosingTime' name='dosingTime'>
                        <button class="ui icon button timeplus" onclick="return addtimepicker()">
                           <i class="plus icon"></i>
                        </button>
                     </div>
                  </td>
               </tr>
               <tr>
                  <td id="labelText"><label>비고 : </label></td>
                  <td><div class="ui mini icon input">
                        <input type="text" placeholder="내용 입력" name="note">
                     </div></td>
               </tr>
               <tr>
                  <td id="labelText"><label>의뢰자 : </label></td>
                  <td>
                     <div class="ui mini icon input">
                        <input type="text" placeholder="의뢰자 이름 입력" name="requestor">
                     </div>
                  </td>
               </tr>
            </table>
            <div align="center">
               <label align="center" id="caution">*투약으로 인한 책임은 의뢰자에게 있습니다.</label>
               <br> <Br>
               <button type="submit" class="ui green basic button">제출하기</button>

               <button type="button" class="ui teal basic button"
                  onclick="insertDosingRequest();">투약의뢰 리스트보기</button>
            </div>
         </form>

         <script>
         $('.timepicker').timepicker({
               timeFormat: 'h:mm p',
               interval: 10,
               minTime: '10',
               maxTime: '6:00pm',
               defaultTime: '11',
               startTime: '10:00',
               dynamic: true,
               dropdown: true,
               scrollbar: true
           });
            function insertDosingRequest(){
               location.href="<%=request.getContextPath()%>/views/parents/mykidsDoseList.jsp";
               }
            function addtimepicker() {
               console.log(($('#dosingTime').clone()).append('<br>'));
               $("#dosingTimeArea").append($('#dosingTime').clone()).append("<div style='display:inline-block; width:43px;'>").append('<br>');
               return false;
            };
            $(document).on("click", "#dosingTime", function(){
                $('.timepicker').timepicker({
                    timeFormat: 'h:mm p',
                    interval: 10,
                    minTime: '10',
                    maxTime: '6:00pm',
                    defaultTime: '11',
                    startTime: '10:00',
                    dynamic: true,
                    dropdown: true,
                    scrollbar: true
                });
            });
         </script>
      </div>
   </div>
   


</body>
</html>