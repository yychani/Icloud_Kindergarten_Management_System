<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.oracle5.board.model.vo.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 시멘틱ui -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>

<script>
$(function(){
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
				
			}
			
		},
		error:function(data){
			console.log("faileㅠㅠ");
		}
	});

	$("#datepicker").change(function(){
		var date = $(this).val();
		console.log(date);
		
		var cId = $("#cNameSelect").val();
		console.log(cId);

		var cData = {"cId":cId, "date":date};
		$.ajax({
			url:"<%=request.getContextPath()%>/pSelectCNote.me",
			data:{cId, date},
			type:"get",
			success:function(data){
				console.log(data);
				$("#uniqueness").text(data.unique);
				$("#materials").text(data.materials);
				$("input:radio[id='example2']:input[value='data.health']").prop("checked",true);
				var check = $('[name=example2]:checked').val();
			},
			error:function(data){
				console.log("실패임");
			}
		});
	
	});
});
</script>

<style>
#outBox {
	margin: 0 20%;
}
</style>


</head>
<body>
	<%@ include file="/views/common/parentsMenu.jsp"%>
	<h1 align="center">내아이 알림장</h1>



	<div class="ui olive segment" id="outBox" align="center">
		<br>
		<h2>해바라기 반 알림장</h2>
		<select id="cNameSelect"></select>

		<div class="ui mini icon input">
			<input type="date" id="datepicker" name="datepicker">
		</div>
		<div class="ui piled segment">
			<h4 class="ui header">원장님 알림사항</h4>
			<label id=""></label>
		</div>

		<div class="ui piled segment">
			<h4 class="ui header">선생님 알림사항</h4>
			<label id="teacherNotice"></label>
		</div>

		<div class="ui piled segment">
			<h4 class="ui header">건후 하루 특이사항</h4>
			<label id="uniqueness"></label>
		</div>

		<div class="ui piled segment">
			<h4 class="ui header">준비물</h4>
			<label id="materials"></label>
		</div>

		<div class="ui piled segment">
			<h4 class="ui header">오늘 하루 컨디션</h4>
			<div class="ui form">
				<div class="grouped fields">
					<div class="field">
						<div class="ui radio checkbox">
							<input type="radio" name="example2" value="좋음"> <label>좋음</label>
						</div>
					</div>
					<div class="field">
						<div class="ui radio checkbox">
							<input type="radio" name="example2"  value="보통"> <label>보통</label>
						</div>
					</div>
					<div class="field">
						<div class="ui radio checkbox">
							<input type="radio" name="example2"  value="나쁨"> <label>나쁨</label>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>
	<br>
	<Br>

	<!-- 날짜 선택 -->
	<script>
 	$(function() {
        //input을 datepicker로 선언
        $(".datepicker").datepicker({
            dateFormat: 'yy-mm-dd' //Input Display Format 변경
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
            ,changeYear: true //콤보박스에서 년 선택 가능
            ,changeMonth: true //콤보박스에서 월 선택 가능                
            ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
            ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
            ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
            ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
            ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
        
        });                    
        
        //초기값을 오늘 날짜로 설정
        $('#datepicker').datepicker('setDate', '-1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
    }); 

		
	</script>
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
	

	
	

	
	<%-- $("#cNameSelect").change(function(){
		var check = $(this).val();
		console.log(check);
		var day = $("#today").val();
		console.log(day);
		$.ajax({
			url:"<%=request.getContextPath()%>/pSelectCNote.me",
			data:{"check":check, "date":day},
			type:"get",
			success:function(data){
				consol.log(data);
			}
		}); 
	}); --%>
	
	
	</script>
	<%@ include file="/views/common/chat.jsp"%>
</body>
</html>