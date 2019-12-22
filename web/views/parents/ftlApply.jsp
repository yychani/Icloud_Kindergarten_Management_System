<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.oracle5.member.model.vo.FieldLearning"%>
<%
	FieldLearning fl = (FieldLearning) request.getAttribute("fl");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현장체험학습 신청</title>
<!-- daum 지도 -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ad1a47dac0c888645210b4f65cbdb5ca&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ad1a47dac0c888645210b4f65cbdb5ca"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시멘틱ui -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>

<!-- 글꼴  -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

   
<style>
.ui.card {
	margin: 5% auto !important;
}

tr {
	height: 30px;
}

.header {
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: bold;
}

#caution {
	color: rgb(209, 57, 57);
}

.ui.modal>.actions {
	background: #f9fafb;
	padding: 1rem 1rem;
	border-top: 1px solid rgba(34, 36, 38, .15);
	text-align: center;
	margin: auto auto;
}
#cNameSelect{
	width:100px;
	height:34px;
	border-radius:4px;
}
</style>

</head>

<body style="overflow-x: hidden">
	<%@ include file="/views/common/parentsMenu.jsp"%>
	 <script>
      $(function() {
    	  $(".li:nth-child(1)").addClass("on");
    	  
          $(".topMenuLi:nth-child(4)").addClass("on");
         
          $(".topMenuLi").mouseover(function() {
            $(".li:nth-child(1)").removeClass("on");
            $(".topMenuLi:nth-child(4)").removeClass("on");
         });
        
          $(".topMenuLi").mouseleave(function() {
            $(".li:nth-child(1)").addClass("on");
            $(".topMenuLi:nth-child(4)").addClass("on");
         });
      }); 
</script>

	<div class="ui card" align="center" style="width: 600px;">
		<div class="content">
			<div class="header">현장 체험학습</div>
		</div>
		<div class="content">
			<div class="ui small feed">
				<div class="event">
					<div class="content">
						<div class="summary" align="center">
							<table>
								<tr>
									<td>일시 :</td>
									<td><%= fl.getFtlDate() %></td>
								</tr>
								<tr>
									<td>장소 :</td>
									<td><span id="address"><%= fl.getField() %></span></td>
								</tr>
								<tr>
									<td colspan="2">
    									<div id="map" style="width:500px;height:400px;"></div>
    								</td>
								</tr>
								<tr>
									<td>참가비 :</td>
									<td><%= fl.getFtlPay() %> 원</td>
								</tr>
								<tr>
									<td>준비물 :</td>
									<td><%= fl.getMaterials() %></td>
								</tr>
							</table>
							<p id="caution">*자세한 사항은 공지사항을 참조해주세요.</p>
						</div>
					</div>
				</div>
				<script>
					function setDraggable(draggable) {
					    // 마우스 드래그로 지도 이동 가능여부를 설정합니다
					    map.setDraggable(draggable);    
					}
					$(document).ready(function(){
						address = $("#address").text();
						console.log(address);
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					    mapOption = {
					        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					        level: 3, // 지도의 확대 레벨
					        draggable: false
					    };  
	
						// 지도를 생성합니다    
						var map = new kakao.maps.Map(mapContainer, mapOption); 
		
						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new kakao.maps.services.Geocoder();
		
						// 주소로 좌표를 검색합니다
						geocoder.addressSearch(address, function(result, status) {
		
						    // 정상적으로 검색이 완료됐으면 
						     if (status === kakao.maps.services.Status.OK) {
		
						        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
						        // 결과값으로 받은 위치를 마커로 표시합니다
						        var marker = new kakao.maps.Marker({
						            map: map,
						            position: coords
						        });
		
						        // 인포윈도우로 장소에 대한 설명을 표시합니다
						        var infowindow = new kakao.maps.InfoWindow({
						            content: '<div style="width:fit-content;text-align:center;padding:6px 0;">현장체험학습 장소 : ' + address + '</div>'
						        });
						        infowindow.open(map, marker);
		
						        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						        map.setCenter(coords);
						        
						    } 
						});    
					});
				</script>

			</div>
		</div>
		<div class="extra content">
			<button class="ui inverted green button" onclick="modalPop();">신청하기</button>
		</div>
	</div>

	<!-- 신청하기 버튼 모달 -->
	<div class="ui mini modal">
	
		<div class="ui icon header">현장체험 학습을 신청하시겠습니까?</div>
		<form id="kidNameForm" action="<%=request.getContextPath()%>/ftlApply.me" onsubmit="return ftlSubmit();">
		<div class="content" align="center">
		<br><br><br>
			<div class="ui input">
				
					

					<div align="center">
					<p>원아를 선택해주세요</p>
	<select class="ui dropdown" id="cNameSelect" name="cName"></select>
	</div>
			</div>
		</div>
		<div class="actions" align="center">
		<br><br>
			<div class="ui buttons" align="center">
				<button class="ui button">취소</button>
				<div class="or"></div>
				<button type="submit" class="ui positive button">신청</button>
			</div>
			<br><br><br>
		</div>
		</form>
	</div>

	<script>
		//모달팝업
		function modalPop() {
			$('.mini.modal').modal('show');
		}

		//신청하기 버튼
		function ftlSubmit() {
			if($("#kidName").val()==""){
				alert("원아명을 입력해주세요.");
				return false;
			} else {
				return true;
			}
		}
		
		$(function(){
			cId = 0;
			$.ajax({
				url:"<%=request.getContextPath()%>/pCName.me",
				type:"get",
				success:function(data){
					console.log(data);

					$select = $("#cNameSelect");
					$select.find("option").remove();
					
					for(var key in data){
						var $option = $("<option>");
						$option.val(data[key].cId);
						$option.text(data[key].name);
						$select.append($option);
						
						$("#cNameSelect").trigger("change");
						
					}
					
				},
				error:function(data){
					console.log("failㅠㅠ");
				}
			});
		});
	</script>






	<%@ include file="/views/common/footer.jsp"%>
	<%@ include file="/views/common/chat.jsp"%>
</body>
</html>