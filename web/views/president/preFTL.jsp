<%@page import="com.oracle5.task.model.vo.Participant"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Participant> participantList = (ArrayList<Participant>)request.getAttribute("participantList");
	ArrayList<Participant> prevPartList = (ArrayList<Participant>)request.getAttribute("prevPartList");
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
	<script src="<%=request.getContextPath()%>/js/rolldate.min.js"></script>
    <title>Insert title here</title>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ad1a47dac0c888645210b4f65cbdb5ca&libraries=services"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ad1a47dac0c888645210b4f65cbdb5ca"></script>
   	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
    <style>
        table {
            margin: 50px auto;
        }

        #table1,
        #table2 {
            margin: 10px auto;
        }

        input[type=text] {
            border-radius: 10px;
            width: 300px;
            height: 30px;
        }

        input[type=checkbox] {
            width: 15px;
            height: 15px;
            vertical-align: middle;
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

        th[id="no"] {
            width: 100px;
            height: 50px;
        }

        th[id="apply"] {
            width: 50px;
            height: 50px;
            padding-right: 0;
        }

        th[id="applicantKid"], th[id="applicantP"] {
            width: 250px;
            height: 50px;
        }

        th {
            background: lightgrey;
        }

        #applyTr {
            border-bottom: 1px solid black;
        }

        td[id="applicant"] {
            height: 30px;
        }

        td[id="apply"] {
        
            padding-right: 0;
        }
        #address:focus{
        	outline: none;
        }
    </style>
    <script>
    	$(function(){
    		$.ajax({
				url:"/main/selectFieldTrip.ftl",
				type:"post",
				success:function(data){
					
					$("#paymentStart").val(data.date);
    				$("#address").val(data.field);
    				$("#materials").val(data.materials);
    				$("#payment").val(data.ftlPay);
    				if(data.ftlId != 0){
    					$("#start").prop("type", "hidden");
        				$("#end").prop("type", "button");
        				$("#paymentStart").prop("disabled", true);
    				}
        		}
			});
    	});
    </script>
</head>

<body style="overflow-x: hidden">
    <%@ include file="/views/common/presidentMenu.jsp"%>
    <div style="margin: 0 15%;">
        <h1 style="text-decoration: underline; text-underline-position: under;">현장 학습 체험</h1>
    </div>
    <select name="as" id="as" style="margin: 20px 20%;">
    	<option value="현장체험학습 작성" selected>현장체험학습 작성</option>
        <option value="신청자 리스트">신청자 리스트</option>
        <option value="이전 신청 이력">이전 신청 이력</option>
    </select>
    <div id="table0">
    		<h1 align="center">현장체험학습 작성</h1>
    	 	<table>
    	 		<tr>
    				<th style="background: white;">날짜</th>
    				<td>
    					<div class="ui mini icon input" style="float:left;">
							<input type="text" style="text-align: center; width: 200px; font-size: 12pt; padding: 0 !important;" id="paymentStart" name="startDate">
						</div>
					</td>
  				</tr>
  				<tr>
    				<th style="background: white;">장소</th>
    				
    				<td style="padding: 10px 0;"><input type="button" value="주소 검색" id="findAddress" style="width:80px; height: 30px; margin: 5px 2px; float: left" ><input style="margin: 5px 2px;border: 0;" type="text" name="address" id="address" value=""></td>
  				</tr>
  				<tr>	
  					<td></td>
    				<td colspan="3">
    					<div id="map" style="width:500px;height:400px;"></div>
    				</td>
  				</tr>
  				<tr>
    				<th style="background: white;">준비물</th>
    				<td><textarea name="materials" id="materials" style="width: 100%; margin: 5px 0; border: 1px solid rgba(0,0,0,.15); resize: none;"></textarea></td>
  				</tr>
  				<tr>
    				<th style="background: white;">현장학습 체험비</th>
    				<td><input type="text" name="payment" id="payment" placeholder="10000" style="float: left; width: 100px;margin: 5px 5px; border: 1px solid rgba(0,0,0,.15)"><span style="line-height: 3; float: left">원</span></td>
  				</tr>
    	 	</table>
    	 	<div id="btnArea" align="center">
    	 		<input type="button" id="start" value="납부 실행" style="background: green; color: white">
    	 		<input type="hidden" id="end" value="납부 종료" style="background: tomato; color:white">
    	 	</div>
    	 	<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/sha256.js"></script>
    	<script>
    		
    		new Rolldate({
            	el: '#paymentStart',
            	format: 'YYYY-MM-DD',
            	beginYear : 2019,
            	endYear : 2020,
            	lang: {
               	title: '날짜를 선택하세요',
               	cancel : '취소',
               	confirm : '완료',
             	year : '년',
             	month : '월',
             	day : '일'
            }
         });
    	
    		$("#start").click(function(){
    			var check = window.confirm("납부를 진행 하시겠습니까?");
    			if(check){
    				$(this).prop("type", "hidden");
    				$("#end").prop("type", "button");
    				$("#paymentStart").prop("disabled", true);
    				
    				var paymentStart = $("#paymentStart").val();
    				var paymentEnd = $("#paymentEnd").val();
    				var address = $("#address").val();
    				var materials = $("#materials").val();
    				var payment = $("#payment").val();
    				
    				$.ajax({
    					url:"/main/fieldTripStart.ftl",
    					data:{
    						paymentStart:paymentStart,
    						paymentEnd:paymentEnd,
    						address:address,
    						materials:materials,
    						payment:payment
    					},
    					type:"post",
    					success:function(data){
    						$("#paymentStart").val(data.date);
    	    				$("#address").val(data.field);
    	    				$("#materials").val(data.materials);
    	    				$("#payment").val(data.ftlPay);
    	    				
    					}
    				});
    			}
    		});
    		$("#end").click(function(){
    			var check = window.confirm("납부를 종료 하시겠습니까?");
    			if(check){
    				$(this).prop("type", "hidden");
    				$("#start").prop("type", "button");
    				$("#paymentStart").prop("disabled", false);
    				
    				$.ajax({
    					url:"/main/fieldTripEnd.ftl",
    					type:"post",
    					success:function(data){
							alert(data);
							$("#paymentStart").val("");
    	    				$("#address").val("");
    	    				$("#materials").val("");
    	    				$("#payment").val(0);
    					}
    				});
    			}
    		});
    	</script>
		<script>
			address = "서울특별시 강남구 강남구 테헤란로14길 6";
			$("#findAddress").click(function(){
				new daum.Postcode({
	       		 	oncomplete: function(data) {
	            		address = data.address;
	            		$("#address").val(address); 
	            		var geocoder = new daum.maps.services.Geocoder();
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
	            		            content: '<div style="width:300px;text-align:center;padding:6px 0;">' + address + '</div>'
	            		        });
	            		        infowindow.open(map, marker);

	            		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	            		        map.setCenter(coords);
	            		    }
	            		});    
	        		}
	    		}).open();
			})
		</script>
    	<script>
    		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        		mapOption = { 
            		center: new kakao.maps.LatLng(37.499002, 127.032911), // 지도의 중심좌표
            		level: 3 // 지도의 확대 레벨
        		};

   		 	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    		// 지도를 클릭한 위치에 표출할 마커입니다
    		var marker = new kakao.maps.Marker({ 
        		// 지도 중심좌표에 마커를 생성합니다 
        		position: map.getCenter() 
    		}); 
    		// 지도에 마커를 표시합니다
   		 	marker.setMap(map);

    		// 지도에 클릭 이벤트를 등록합니다
    		// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
    		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
        
        		// 클릭한 위도, 경도 정보를 가져옵니다 
        		var latlng = mouseEvent.latLng; 
        
        		// 마커 위치를 클릭한 위치로 옮깁니다
        		marker.setPosition(latlng);
        
        		var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
        		message += '경도는 ' + latlng.getLng() + ' 입니다';
        
        		var resultDiv = document.getElementById('clickLatlng'); 
        		resultDiv.innerHTML = message;
    		});
    		
		</script>
    </div>
    <table id="table1" hidden>
        <tr id="applyTH">
            <th id="no">No</th>
            <th id="applicantKid">신청 아이</th>
            <th id="applicantP">신청 학부모</th>
            <th id="applyDate">신청 날짜</th>
            <th id="apply" style="width:60px;">납부 확인</th>
        </tr>
        <% for(int i = 0; i < participantList.size(); i++){ %>
        <tr id="applyTr">
            <td id="no"><%=participantList.get(i).getRnum() %>
            <input type="hidden" id="partNo" value="<%=participantList.get(i).getParticipantNo() %>"></td>
            <td id="applicantKid"><%=participantList.get(i).getCNname() %></td>
            <td id="applicantP"><%=participantList.get(i).getPName() %></td>
            <td id="applyDate"><%=participantList.get(i).getApplyDate() %></td>
            <td id="apply" align="center"><input class="check" type="checkbox"></td>
        </tr>
        <% } %>
        <tr id="applyTrCheck">
            <th colspan="3" style="height: 30px;"></th>
            <th align="right">전체선택</th>
            <th><input id="allCheck" type="checkbox"></th>
        </tr>
        <tr>
            <td colspan="4"></td>
            <td style="float: right; padding-right: 0; padding-top: 5px;">
            <input type="button" id="accept" value="승인" style="width: 70px; height:30px"></td>

        </tr>
    </table>
    <script>
	    $("#accept").click(function() {
			var partNo = [];
			var cnt = 0;
			$('#table1 tbody').children().find("input[type=checkbox]:not('#allCheck')").each(function(index, value) {
				if($(this).is(':checked') == true) {
					partNo[cnt++] = $(this).parent().parent().find("#partNo").val();
					//console.log($(this).parent().parent().find("#partNo").val());
				}
			});
				$.ajax({
				url:"updateftlList.do",
				type:"post",
				data:{
					partNo:partNo
				},
				success:function(data) {
					alert(data +"명 납부 확인 완료되었습니다.");
					location.reload();
				},
				error:function() {
					console.log("실패")
				}
			});
		});
    </script>
    <table id="table2" hidden>
        <tr id="applyTr">
            <th id="no">No</th>
            <th id="place" style="width: 350px;">장소</th>
            <th id="applicant">신청자</th>
            <th id="applicant">참여 여부</th>
            <th id="apply" style="width: 150px;">승인 날짜</th>
        </tr>
        <% for(int i = 0; i < prevPartList.size(); i++){ %>
        <tr id="applyTr">
            <td id="no"><%=prevPartList.get(i).getRnum() %></td>
            <td id="place"><%=prevPartList.get(i).getField() %></td>
            <td id="applicant"><%=prevPartList.get(i).getCNname() %>&nbsp;학부모</td>
            <td id="apply" align="center"><% if(prevPartList.get(i).getAttend().equals("Y")){ %>
            							참여
            							<% } else { %>
            							미참여
            							<% } %></td>
			<td id="acceptDate" align="center"><% if(prevPartList.get(i).getAcceptDate() != null){ %>
            							<%=prevPartList.get(i).getAcceptDate() %>
            							<% } else { %>
            							미납
            							<% } %></td>
        </tr>
        <% } %>
        <tr id="applyTr">
            <th style="height: 20px;" colspan="3"></th>
            <th align="right"></th>
            <th></th>
        </tr>
    </table>
    <script>
        $(function () {
            $(".li8").addClass("on");
            $(".topMenuLi:nth-child(2)").addClass("on");

            $(".topMenuLi").mouseover(function () {
                $(".li8").removeClass("on");
                $(".topMenuLi:nth-child(2)").removeClass("on");
            });
            $(".topMenuLi").mouseleave(function () {
                $(".li8").addClass("on");
                $(".topMenuLi:nth-child(2)").addClass("on");
            });
            $("#allCheck").click(function () {
                if ($("#allCheck").prop("checked")) {
                    $(".check").prop("checked", true);
                } else {
                    $(".check").prop("checked", false);
                }
            });

            $("#as").change(function () {
            	if($(this).val() == "현장체험학습 작성"){
            		$("#table0").attr("hidden", false);
                    $("#table1").attr("hidden", true);
                    $("#table2").attr("hidden", true);
            	}else if ($(this).val() == "신청자 리스트") {
            		$("#table0").attr("hidden", true);
                    $("#table1").attr("hidden", false);
                    $("#table2").attr("hidden", true);
                } else if ($(this).val() == "이전 신청 이력") {
                	$("#table0").attr("hidden", true);
                    $("#table2").attr("hidden", false);
                    $("#table1").attr("hidden", true);
                }
            });
        }); 
    </script>
    <%@ include file="/views/common/footer.jsp"%>
    <%@ include file="/views/common/chat.jsp"%>
</body>

</html>