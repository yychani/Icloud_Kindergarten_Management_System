<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
</head>
<style>
	#textArea{
		margin-left: 1000px;
		text-decoration: underline overline;
	}	
	#tableArea{
 		margin-bottom: 15px;
	
	}
	#trArea{
		 margin-bottom: 15px;
		text-align: center;
	}

	button {
		width: 80px;
		height: 30px;
		border-radius: 10px;
		background: skyblue;
		color: white;
		font-weight: bold;
		border: none;
		cursor: pointer;
		}
</style>
<body>
	<%@ include file="/views/common/parentsMenu.jsp"%>
	<h2 style="margin: 0 15%;" >아이들 사진 갤러리</h2>
		<h2 align="center" style="text-decoration: underline;">가을 소풍 이거 제목</h2>
	<table id="textArea">
		<tr>
			<td><h3>조회수</h3><label>히히하하하ㅏ</label></td>
			<td><h3>작성일</h3><label>하하하</label></td>
		</tr>
	</table>
	<form>
		<div align="center">
			<table id="tableArea" border="">
			<tr id="trArea">
				<td colspan="2"><img src="<%=request.getContextPath() %>/images/child.png"></td>
			</tr>
			<tr>
				<td	colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2"><img src="<%=request.getContextPath() %>/images/child.png"><button>다운로드</button></td>

				
			</tr>
			<tr>
				<td	colspan="2">&nbsp;</td>
			</tr>

			<tr>
				<td colspan="4"><img src="<%=request.getContextPath() %>/images/child.png"><button>다운로드</button></td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4"><img src="<%=request.getContextPath() %>/images/child.png"><button>다운로드</button></td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
				
			<tr>
				<td colspan="4"><img src="<%=request.getContextPath() %>/images/child.png"><button>다운로드</button></td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
			
			<tr>
				<td colspan="4"><img src="<%=request.getContextPath() %>/images/child.png"><button>다운로드</button></td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4"><img src="<%=request.getContextPath() %>/images/child.png"><button>다운로드</button></td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4"><img src="<%=request.getContextPath() %>/images/child.png"><button>다운로드</button></td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4"><img src="<%=request.getContextPath() %>/images/child.png"><button>다운로드</button></td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4"><label>현저하게 부패를 인생을 이상 그리하였는가? 거선의 전인 커다란 공자는 청춘은 밥을 낙원을 황금시대를 기관과 것이다. 
				내려온 끝에 가슴이 같이, 인류의 것이 인생을 부패뿐이다. 길지 구할 이상의 과실이 얼음에 황금시대를 무한한 뛰노는 쓸쓸하랴? 싹이 가슴이 남는 것이다. 청춘의 피가 없으면, 
				물방아 사막이다. 있을 이상 때에, 생의 얼마나 길을 것은 아름다우냐? 이것은 예가 현저하게 것이다. 봄날의 꾸며 원질이 그러므로 용감하고 청춘의 실현에 끝까지 끓는 것이다.</label></td>
			
			</tr>
			
			</table>
		</div>
		<button>뒤로가기</button>
	</form>
	
	
	
	
	
	<script>
    $(function() {
        $(".li1").addClass("on");
        $(".topMenuLi:nth-child(2)").addClass("on");

        $(".topMenuLi").mouseover(function() {
           $(".li1").removeClass("on");
           $(".topMenuLi:nth-child(2)").removeClass("on");
        });
        $(".topMenuLi").mouseleave(function() {
           $(".li1").addClass("on");
           $(".topMenuLi:nth-child(2)").addClass("on");
        });

     });  
	</script>
	<%@ include file="/views/common/footer.jsp"%>
	<%@ include file="/views/common/chat.jsp"%>
</body>
</html>