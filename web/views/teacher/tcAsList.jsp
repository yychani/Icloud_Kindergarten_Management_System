<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.oracle5.member.model.vo.*"%>
<%
	ArrayList<Children> oklist = (ArrayList<Children>) request.getAttribute("oklist");
	ArrayList<Children> nolist = (ArrayList<Children>) request.getAttribute("nolist");
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>방과후 신청  관리</title>
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
            width: 15%;
        } 
        td[id="rtn"]{
            height: 30px;
        }
        td[id="rtn"]{
            padding-right: 0;
        } 
        td[id="does"]{
            height: 30px;
        }
        td[id="does"]{
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
    <script>
    $(document).on("click",".asTable tr>td:nth-of-type(2)", function(){
  		var cid = $(this).parent().find($("[name=cid]")).val();
  		$.ajax({
  			url:"<%=request.getContextPath()%>/selectModalChild.do",
  			type:"get",
  			data:{cid:cid},
  			success:function(data) {
  				var splitrno = data.rno.split("-");
  				var name = data.name;
  				$("#childName").text("이름 : " + name);
  				
  				var birth = splitrno[0];
  				var year = splitrno[0].substring(0,2);
  				year = year > 50 ? "19" + year : "20" + year;
  				var month = splitrno[0].substring(2,4);
  				var day = splitrno[0].substring(4,6);
  				birth = year + "년 " + month + "월 " + day + "일";
  				$("#childBirth").text("생년월일 : " + birth);
  				
  				var gender = splitrno[1].substring(0,1) == 1 ? '남' : '여';
  				$("#childGender").text("성별 : " + gender);
  				
  				var imgSrc ="<%=request.getContextPath()%>/" + data.imgSrc.substring(data.imgSrc.lastIndexOf('\\') + 1);
  				$("#childImg").attr("src", imgSrc);
  			},
  			error:function(request, status, error){   
  				alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error); 
  			}

  		});
  		
  		
  		$("#myModal").show();
  	});      
    </script>
</head>

<body style="overflow-x: hidden">
    <%@ include file="/views/common/teacherMenu.jsp"%>
    <div style="margin: 0 15%;">
        <h1 style="text-decoration: underline; text-underline-position: under;">방과후 신청 관리 페이지</h1>
    </div>
    <div style="margin: 20px 20%">
	    <select name="as" id="as">
	        <option value="신청자 리스트" selected>신청자 리스트</option>
	        <option value="이전 신청 이력">이전 신청 이력</option>
	    </select>
    </div>
    <table id="table1" class="asTable" >
        <tr id="applyTr">
            <th id="no">No</th>
            <th id="applicant">신청자</th>
            <th id="apply">선택</th>
        </tr>
        <% for(int i = 0; i < nolist.size(); i++) { %>
        <tr id="applyTr">
            <td id="no"><%= i + 1 %><input type="hidden" name="cid" id="cid" value="<%= nolist.get(i).getCId() %>" /></td>
            <td id="applicant"><%= nolist.get(i).getName() %></td>
            <td id="apply" align="center"><input id="check" class="asCheck" type="checkbox"></td>
        </tr>
        <% } %>
        <tr id="applyTr">
                <th style="height: 30px;"></th>
                <th align="right">전체선택</th>
                <th><input id="allCheck" type="checkbox"></th>
        </tr>
        <tr>
            <td></td>
            <td></td>
                <td colspan="3" style="float: right; padding-right: 0;"><input type="button" id="accept" value="승인" style="width: 70px; height:30px"></td>
            
        </tr>
    </table>
    <table id="table2" class="asTable" hidden>
            <tr id="applyTr">
                <th id="no">No</th>
                <th id="applicant">신청자</th>
                <th id="apply">승인 날짜</th>
            </tr>
            <% for(int i = 0; i < oklist.size(); i++) { %>
            <tr id="applyTr">
                <td id="no"><%= i + 1 %><input type="hidden" name="cid" id="cid" value="<%= oklist.get(i).getCId() %>" /></td>
                <td id="applicant"><%= oklist.get(i).getName() %></td>
                <td id="apply" align="center"><%= oklist.get(i).getEntDate() %></td>
            </tr>
            <% } %>
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
						<td id="childName"></td>
						<td rowspan="4"><img id="childImg" alt="" width="200px" style="margin:0 10%"/></td>
					</tr>
					<tr>
						<td id="childGender"></td>
					</tr>
					<tr>
						<td id="childBirth"></td>
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
                    $(".asCheck").prop("checked", true);
                } else {
                    $(".asCheck").prop("checked", false);
                }
            });
            
            $("#as").change(function(){
                 if($(this).val() == "신청자 리스트"){
                    $("#table2").attr("hidden", true);
                    $("#table1").attr("hidden", false);
                 }else if($(this).val() == "이전 신청 이력"){
                    $("#table1").attr("hidden", true);
                    $("#table2").attr("hidden", false);
                 }
            });
          }); 
    		
        
        function close_pop() {
			$("#myModal").hide();
		};
		
		$("#accept").click(function() {
			var cid = [];
			var cnt = 0;
			$('#table1 tbody').children().find("input[type=checkbox]:not('#allCheck')").each(function(index, value) {
				if($(this).is(':checked') == true) {
					cid[cnt++] = $(this).parent().parent().find("#cid").val();
				}
			});
			
			$.ajax({
				url:"updateAsList.do",
				type:"post",
				data:{
					cid:cid
				},
				success:function(data) {
					alert(data +"명 승인 완료");
					location.reload();
				},
				error:function() {
					console.log("실패")
				}
			});
		});
    </script>
    <%@ include file="/views/common/footer.jsp"%>
    <%@ include file="/views/common/chat.jsp"%>
</body>

</html>