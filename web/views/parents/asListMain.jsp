<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시멘틱ui -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>

<style>

.outer {
	/* margin:0 auto; */
	display: flex;
	
}
.in{
	margin:0 auto;
	display: flex;
}
#img {
	width: 150px;
	height:150px;
}
.ui.inverted.orange.segment, .yellow.segment, olive.segment, green.segment{
	margin: 1%;
	width:250px;
}
.ui.inverted.olive.segment, .green.segment {
	margin: 1%;
	width:250px;
}
#font{
	font-size: 17px;
}
</style>
</head>
<body>

	<%@ include file="/views/common/parentsMenu.jsp"%>
	<div class="outer" align="center">
		<div class="in">
			<div class="ui orange inverted segment">
				<div class="ui segment" style="height:350px;">
					<p id="font"><B>Music</B></p>
					<p><img src="<%=request.getContextPath() %>/images/as1.png" id="img"><br><br>
					말하기, 노래부르기, 신체표현 악기연주 등 다양한 음악활동을 통해
                                             기초 음악 개념을 형성하고 몸으로 자연스럽게 리듬을 느끼는 음악 프로그램 입니다. </p>
				</div>
			</div>
			
			<div class="ui yellow inverted segment">
				<div class="ui segment" style="height:350px;">
					<p id="font"><B>Language</B></p>
					<p><img src="<%=request.getContextPath() %>/images/as2.png" id="img"><br><br>
					언어 기본단계와 유아의 특성을 반영 하여 
                                              알파벳 모양을 흥미롭게 익히며기초과정을 완성하고 
                                              다양한 언어를 처음 접할때  즐겁게 배울 수 있도록 하는 프로그램 입니다.</p>
				</div>
			</div>
		
		
			<div class="ui olive inverted segment">
				<div class="ui segment" style="height:350px;">
					<p id="font"><B>Play</B></p>
					<p><img src="<%=request.getContextPath() %>/images/as3.png" id="img"><br><br>
					다양한 신체단련활동을 통해 성장 발달에 도움이 되는 놀이 프로그램을 통해
                                             근육발달과 지구력을 키울수 있는 활동 입니다.                    </p>
				</div>
			</div>

			<div class="ui green inverted segment" style="height:380px;">
				<div class="ui segment" style="height:350px;">
					<p id="font"><B>Art</B></p>
					<p><img src="<%=request.getContextPath() %>/images/as4.png" id="img"><br><br>
					만들고 그리며 노는 과정에서 아이의 마음이 가장 자유롭게 펼쳐지도록 창의표현, 생각을 이끌어 내는
                                             아이들의 이야기 미술 프로그램 입니다.                </p>
				</div>
			</div>
		</div>
	</div>
	<!-- outer end -->
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>