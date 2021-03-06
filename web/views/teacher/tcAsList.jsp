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
            width: 60%;
            text-align: center;
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
    .ui .modal {
		top:25%;
		left:20%;
	}
	.ui.labeled.icon.button>.icon:before {
		top: 67% !important;
	}
     td#applicant:nth-of-type(n+1) {
    	cursor:pointer;
    }
    #as{
	   width:161px;
	   height:34px;
	   border-radius:4px;
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
  		
  		
  		$('.ui.modal').modal('show');
  	});      
    </script>
</head>

<body style="overflow-x: hidden; overflow-y:hidden">
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
    <table id="table1" class="asTable ui celled table" >
        <tr id="applyTr" style="background:#e3fad0">
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
                <th style="height: 30px; border-top: 1px solid rgba(34, 36, 38, .1)"></th>
                <th align="right" style="border-left:none; border-top: 1px solid rgba(34, 36, 38, .1)"">전체선택</th>
                <th style="border-left:none; border-top: 1px solid rgba(34, 36, 38, .1)""><input id="allCheck" type="checkbox"></th>
        </tr>
    </table>
    
    <table id="table2" class="asTable ui celled table" hidden>
        <tr id="applyTr">
            <th id="no" style="background: #e3fad0">No</th>
            <th id="applicant" style="background: #e3fad0">신청자</th>
            <th id="apply" style="background: #e3fad0">선택</th>
        </tr>
            <% for(int i = 0; i < oklist.size(); i++) { %>
            <tr id="applyTr">
                <td id="no"><%= i + 1 %><input type="hidden" name="cid" id="cid" value="<%= oklist.get(i).getCId() %>" /></td>
                <td id="applicant"><%= oklist.get(i).getName() %></td>
                <td id="apply" align="center"><%= oklist.get(i).getEntDate() %></td>
            </tr>
            <% } %>
        </table>
    <div style="margin: 0 20%" align="right">
    	<input type="button" id="accept" value="승인" style="width: 70px; height:30px">
    </div>
    
    
    
    
    <div class="ui modal">
	  <i class="close icon"></i>
	  <div class="header">
	    	아이상세보기
	  </div>
	  <div class="image content">
	    <div class="ui medium image">
	      <img id="childImg">
	    </div>
	    <div class="description">
	      <div class="ui header" id="childName"></div>
	      	<p id="childGender"></p>
	      	<p id="childBirth"></p>
	    </div>
	  </div>
	  <div class="actions">
	    <div class="ui positive right labeled icon button">
	      	확인
	      <i class="checkmark icon"></i>
	    </div>
	  </div>
	</div>
    <script>
        $(function () {
        	 $(".li:nth-child(13)").addClass("on");
       	  
             $(".topMenuLi:nth-child(1)").addClass("on");
            
             $(".topMenuLi").mouseover(function() {
               $(".li:nth-child(13)").removeClass("on");
               $(".topMenuLi:nth-child(1)").removeClass("on");
            });
           
             $(".topMenuLi").mouseleave(function() {
               $(".li:nth-child(13)").addClass("on");
               $(".topMenuLi:nth-child(1)").addClass("on");
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
                    $("#accept").show();
                 }else if($(this).val() == "이전 신청 이력"){
                    $("#table1").attr("hidden", true);
                    $("#table2").attr("hidden", false);
                    $("#accept").hide();
                 }
            });
          }); 
    		
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