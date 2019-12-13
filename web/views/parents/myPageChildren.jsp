<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.oracle5.member.model.vo.*"%>
<%
ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이 정보</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시멘틱ui -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
	
	
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<style>
.ui.raised.card{
	margin: auto auto;
	width: 1000px;
	font-family: 'Nanum Gothic Coding', monospace;
	font-weight:bold;
	color:black;
}
tr{
	height:50px;
}
#plusBtn{
	height:20px;
}
</style>
</head>


<body  style="overflow-x: hidden">
<%@ include file="/views/common/parentsMenu.jsp"%>


<h1 align="center">아이정보</h1>
	<br><br>
	
<select id="cSelect">
<% for(int i = 0; i < ((ArrayList<HashMap<String, Object>>)list).size(); i++) {%>
	<option value="<%= i + 1 %>"><%= ((Children)list.get(i).get("c")).getName() %></option>
<% } %>
</select>

<div class="ui raised card" id="cDiv1">
<button onclick="birth();">test</button>
  <div class="content">
    <div class="header" align="center"> <img class="ui avatar image" src="<%= request.getContextPath() %>/uploadFiles/5racle_2019121016462761291.jpg"> <%= ((Children) list.get(0).get("c")).getName() %></div>
    <div class="meta" align="center">
      <span class="category" id="birth"></span>
    </div>
    <div class="description">
      <table>
      	<tr>
      		<td>성별 : </td>
      		<td colspan="3" style="text-align: left;">
	      		<div class="ui radio checkbox">
		      		<div style="display:inline-block;">
		      			 <input type="radio" name="gender" value="f" checked="checked"><label>여</label>
		      		</div>
		      		<div style="display:inline-block;">
		      			<input type="radio" name="gender" value="m"><label>남</label>
		      		</div>
	  			 </div>
			</td>
      	</tr>
      	<tr>
      		<td>혈액형 : </td>
      		<td><div class="ui input"><input type="text" value="<%= ((Children) list.get(0).get("c")).getBloodType() %>"></div></td>
      	</tr>
      	<tr>
      		<td>거주지 : </td>
      		<td colspan="3"><div class="ui fluid icon input">
  			<input type="text" value="<%= ((Parents) list.get(0).get("p")).getPAddress() %>"></div> </td>
      	</tr>
      	<tr>
      		<td>본적 : </td>
      		<td colspan="3"><div class="ui fluid icon input">
  			<input type="text" value="<%= ((Children) list.get(0).get("c")).getOriginAddr() %>"></div> </td>
      	</tr>
      	<tr>
      		<td>입학전 학적사항 : </td>
      		<td colspan="3" id="scholarInfo">
      		<% for(int i = 0; i < ((ArrayList<Scholarly>)list.get(0).get("slist")).size(); i++) { %>
      		<div id="scholarValue" class="ui input">
      		<input type="date" value="<%= ((ArrayList<Scholarly>) list.get(0).get("slist")).get(i).getSDate()%>">
      		<input type="text" placeholder="기관명 입력" value="<%= ((ArrayList<Scholarly>) list.get(0).get("slist")).get(i).getAgency()%>">
      		<input type="text" placeholder="특이사항 입력" value="<%= ((ArrayList<Scholarly>) list.get(0).get("slist")).get(i).getUniqueness()%>"></div>
      		<% } %>
      		</td>
      		
      	</tr>
      	<tr id="plusBtn"><td colspan="4"><img id="addScholar" width="20px" src="<%=request.getContextPath() %>/images/add.png" onclick=""></td></tr>
      	<tr>
      		<td>가족 사항 : </td>
      		<td colspan="3" id="familyInfo">
      		<% for(int i = 0; i < ((ArrayList<FamilyRelation>)list.get(0).get("flist")).size(); i++) { %>
      		<div id="familyValue" class="ui fluid icon input">
      		<input  name="fRelation"  type="text" placeholder="관계입력"  value="<%= ((ArrayList<FamilyRelation>) list.get(0).get("flist")).get(i).getRelation()%>">
      		<input name="fName" type="text" placeholder="이름 입력"  value="<%= ((ArrayList<FamilyRelation>) list.get(0).get("flist")).get(i).getName()%>">
      		<input name="fPhone" type="text" placeholder="연락처 입력"  value="<%= ((ArrayList<FamilyRelation>) list.get(0).get("flist")).get(i).getPhone()%>"></div>
      		<% } %>
      		</td>
      	</tr>

      	<tr id="plusBtn"><td colspan="4"><img id="addFamily" width="20px" src="<%=request.getContextPath() %>/images/add.png" onclick=""></td></tr>
      	<tr>
      		<td>특이사항 : </td>
      		<td colspan="3"><div class="ui fluid icon input">
  			<input type="text" placeholder="아이 특이사항 입력란" value="<%= ((Children) list.get(0).get("c")).getDescription() %>"></div></td>
      	</tr>
      </table>
    </div>
  </div>
  <div class="extra content">
    <div class="right floated author">
    <button class="ui teal basic button">아이 추가하기</button>
    <button class="ui green basic button">아이정보 변경</button>
    </div>
  </div>
</div>

<% for(int j = 1; j < ((ArrayList<HashMap<String, Object>>)list).size(); j++) {%>
<div class="ui raised card" id="cDiv<%= j+1 %>" >
<button onclick="birth();">test</button>
  <div class="content">
    <div class="header" align="center"> <img class="ui avatar image" src="<%= request.getContextPath() %>/uploadFiles/5racle_2019121016462761291.jpg"> <%= ((Children) list.get(j).get("c")).getName() %></div>
    <div class="meta" align="center">
      <span class="category" id="birth"></span>
    </div>
    <div class="description">
      <table>
      	<tr>
      		<td>성별 : </td>
      		<td colspan="3" style="text-align: left;">
	      		<div class="ui radio checkbox">
		      		<div style="display:inline-block;">
		      			 <input type="radio" name="gender" value="f" checked="checked"><label>여</label>
		      		</div>
		      		<div style="display:inline-block;">
		      			<input type="radio" name="gender" value="m"><label>남</label>
		      		</div>
	  			 </div>
			</td>
      	</tr>
      	<tr>
      		<td>혈액형 : </td>
      		<td><div class="ui input"><input type="text" value="<%= ((Children) list.get(j).get("c")).getBloodType() %>"></div></td>
      	</tr>
      	<tr>
      		<td>거주지 : </td>
      		<td colspan="3"><div class="ui fluid icon input">
  			<input type="text" value="<%= ((Parents) list.get(j).get("p")).getPAddress() %>"></div> </td>
      	</tr>
      	<tr>
      		<td>본적 : </td>
      		<td colspan="3"><div class="ui fluid icon input">
  			<input type="text" value="<%= ((Children) list.get(j).get("c")).getOriginAddr() %>"></div> </td>
      	</tr>
      	<tr>
      		<td>입학전 학적사항 : </td>
      		<td colspan="3" id="scholarInfo">
      		<% for(int i = 0; i < ((ArrayList<Scholarly>)list.get(j).get("slist")).size(); i++) { %>
      		<div id="scholarValue" class="ui input">
      		<input type="date" value="<%= ((ArrayList<Scholarly>) list.get(j).get("slist")).get(i).getSDate()%>">
      		<input type="text" placeholder="기관명 입력" value="<%= ((ArrayList<Scholarly>) list.get(j).get("slist")).get(i).getAgency()%>">
      		<input type="text" placeholder="특이사항 입력" value="<%= ((ArrayList<Scholarly>) list.get(j).get("slist")).get(i).getUniqueness()%>"></div>
      		<% } %>
      		</td>
      		
      	</tr>
      	<tr id="plusBtn"><td colspan="4"><img id="addScholar" width="20px" src="<%=request.getContextPath() %>/images/add.png" onclick=""></td></tr>
      	<tr>
      		<td>가족 사항 : </td>
      		<td colspan="3" id="familyInfo">
      		<% for(int i = 0; i < ((ArrayList<FamilyRelation>)list.get(j).get("flist")).size(); i++) { %>
      		<div id="familyValue" class="ui fluid icon input">
      		<input  name="fRelation"  type="text" placeholder="관계입력"  value="<%= ((ArrayList<FamilyRelation>) list.get(j).get("flist")).get(i).getRelation()%>">
      		<input name="fName" type="text" placeholder="이름 입력"  value="<%= ((ArrayList<FamilyRelation>) list.get(j).get("flist")).get(i).getName()%>">
      		<input name="fPhone" type="text" placeholder="연락처 입력"  value="<%= ((ArrayList<FamilyRelation>) list.get(j).get("flist")).get(i).getPhone()%>"></div>
      		<% } %>
      		</td>
      	</tr>

      	<tr id="plusBtn"><td colspan="4"><img id="addFamily" width="20px" src="<%=request.getContextPath() %>/images/add.png" onclick=""></td></tr>
      	<tr>
      		<td>특이사항 : </td>
      		<td colspan="3"><div class="ui fluid icon input">
  			<input type="text" placeholder="아이 특이사항 입력란" value="<%= ((Children) list.get(j).get("c")).getDescription() %>"></div></td>
      	</tr>
      </table>
    </div>
  </div>
  <div class="extra content">
    <div class="right floated author">
    <button class="ui teal basic button">아이 추가하기</button>
    <button class="ui green basic button">아이정보 변경</button>
    </div>
  </div>
</div>
<% } %>

<script>
	

	/* select 값 가져오기 */
	$("#cSelect").change(function() {
		if($("#cSelect option:selected").val()==1){
			$(".card").hide();
			$("#cDiv1").show();
		}else if($("#cSelect option:selected").val()==2){
			$(".card").hide();
			var d = $("#cSelect option:selected").val();
			$("#cDiv2").show();
		}else if($("#cSelect option:selected").val()==3){
			$(".card").hide();
			var d = $("#cSelect option:selected").val();
			$("#cDiv3").show();
		}  
	})
	
	/* 학적사항 추가 버튼 */
		$("#addScholar").click(function(){
			$("#scholarValue").clone(true).appendTo($("#scholarInfo:last-child"));
			return false;
		});
	
	/* 가족관계 추가 버튼 */
	    $("#addFamily").click(function(){
			$("#familyValue").clone(true).appendTo($("#familyInfo:last-child"));
			return false;
		});  
	
	/* 생일 */
		function birth(){
			var birth = "<%= ((Children) list.get(0).get("c")).getRno()%>";
			console.log(birth);
			var frontRno = birth.split('-');
			$("#birth").text(frontRno[0]);
			
		};
	
	
</script>

	<%@ include file="/views/common/footer.jsp"%>
	<%@ include file="/views/common/chat.jsp"%>
</body>
</html>