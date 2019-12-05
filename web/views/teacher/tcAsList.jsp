<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>신청 관리</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
    <style>
        table {
            margin: 50px auto;
        }
        #table1, #table2 {
            margin: 10px auto;
        }

        input[type=text] {
            border-radius: 10px;
            width: 300px;
            height: 30px;
        }

        td {
            padding: 0px 0px;
            padding-left: 0;
        }

        input[type=checkbox] {
            width: 15px;
            height: 15px;
            vertical-align: center;
        }

        button {
            width: 80px;
            height: 40px;
            border-radius: 10px;
            background: rgb(63, 63, 63);
            color: white;
            font-weight: bold;
            border: none;
            cursor: pointer;
        }
        th[id="no"]{
            width: 100px;
            height: 50px;
        } 
        th[id="apply"]{
            width: 50px;
            height: 50px;
            padding-right: 0;
        } 
        th[id="applicant"] {
            width: 500px;
            height: 50px;
        }
        th {
            background: lightgrey;
        }
        #applyTr{
            border-bottom: 1px solid black;
        }
        td[id="applicant"]{
            height: 30px;
        }
        td[id="apply"]{
            padding-right: 0;
        } 
        
     .modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }

    /* Modal Content/Box */
    .modal-content {
        background-color: #fefefe;
        margin: 15% auto; /* 15% from the top and centered */
        padding: 20px;
        border: 1px solid #888;
        width: 30%; /* Could be more or less, depending on screen size */                          
    }
    </style>
</head>

<body style="overflow-x: hidden">
    <%@ include file="/views/common/teacherMenu.jsp"%>
    <div style="margin: 0 15%;">
        <h1 style="text-decoration: underline; text-underline-position: under;">신청 관리 페이지</h1>
    </div>
    <select name="as" id="as" style="margin: 20px 20%;">
        <option value="신청자 리스트" selected>신청자 리스트</option>
        <option value="이전 신청 이력">이전 신청 이력</option>
    </select>
    <table id="table1">
        <tr id="applyTr">
            <th id="no">No</th>
            <th id="applicant">신청자</th>
            <th id="apply">선택</th>
        </tr>
        <tr id="applyTr">
            <td id="no">1</td>
            <td id="applicant">박건후</td>
            <td id="apply" align="center"><input id="check" type="checkbox"></td>
        </tr>
        <tr id="applyTr">
                <th style="height: 30px;"></th>
                <th align="right">전체선택</th>
                <th><input id="allCheck" type="checkbox"></th>
            
        </tr>
        <tr>
            <td></td>
            <td></td>
                <td colspan="3" style="float: right; padding-right: 0;"><input type="button" value="승인" style="width: 70px; height:30px"></td>
            
        </tr>
    </table>
    <table id="table2" hidden>
            <tr id="applyTr">
                <th id="no">No</th>
                <th id="applicant">신청자</th>
                <th id="apply">승인 날짜</th>
            </tr>
            <tr id="applyTr">
                <td id="no"></td>
                <td id="applicant"></td>
                <td id="apply" align="center"></td>
            </tr>
            <tr id="applyTr">
                    <th style="height: 20px;"></th>
                    <th align="right"></th>
                    <th></th>
            </tr>
            <tr>
                <td></td>
                <td></td>
                    <td colspan="3" style="float: right; padding-right: 0;"><input type="button" value="승인" style="width: 70px; height:30px"></td>
                
            </tr>
        </table>
        
        <!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      	<div class="modal-content">
				<table style="text-align:left">
					<tr>
						<td>이름 : 박건후</td>
						<td rowspan="4"><img src="<%= request.getContextPath() %>/images/img.jpg" alt="" width="200px" style="margin:0 10%"/></td>
					</tr>
					<tr>
						<td>성별 : 남</td>
					</tr>
					<tr>
						<td>생년월일 : 2015년 10월 10일</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
				</table>
                <p><br /></p>
            <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
                <span class="pop_bt" style="font-size: 13pt;" >
                     	닫기
                </span>
            </div>
	     </div>
 
    </div>
    <script>
        $(function () {
        	 $(".li:nth-child(13)").addClass("on");
       	  
             $(".topMenuLi:nth-child(2)").addClass("on");
            
             $(".topMenuLi").mouseover(function() {
               $(".li:nth-child(13)").removeClass("on");
               $(".topMenuLi:nth-child(2)").removeClass("on");
            });
           
             $(".topMenuLi").mouseleave(function() {
               $(".li:nth-child(13)").addClass("on");
               $(".topMenuLi:nth-child(2)").addClass("on");
            });
            
            $("#allCheck").click(function() {
                if($("#allCheck").prop("checked")) {
                    $("#check").prop("checked", true);
                } else {
                    $("#check").prop("checked", false);
                }
            });

            $("#as").change(function(){
                 if($(this).val() == "신청자 리스트"){
                    $("#table1").attr("hidden", false);
                    $("#table2").attr("hidden", true);
                 }else if($(this).val() == "이전 신청 이력"){
                    $("#table2").attr("hidden", false);
                    $("#table1").attr("hidden", true);
                 }
            });
            
            
        	$("td#applicant:nth-of-type(n+1)").click(function() {
    			$("#myModal").show();
    		});
    		
        }); 
        
        function close_pop() {
			$("#myModal").hide();
		};
    </script>
    <%@ include file="/views/common/footer.jsp"%>
    <%@ include file="/views/common/chat.jsp"%>
</body>

</html>