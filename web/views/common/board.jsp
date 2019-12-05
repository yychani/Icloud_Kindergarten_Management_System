<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<style>
#outBox {
	margin: 50px 15%;	
}

#tableArea {
	width: 100%;
}

#no {
	width: 20px;
	text-align: center;
}

#title {
	width: 500px;
	text-align: center;
}

#writer {
	width: 120px;
	text-align: center;
}

#date {
	width: 100px;
	text-align: center;
}
#count {
    width: 60px;
    text-align: center;
}

#requestBtn {
	float: right;
}
        

        #writeBtnArea{
        	
        	padding-left: 85%;
        }
       	input[type='button'] {
		width: 100px;
		height: 40px;
		border-radius: 10px;
		background: rgb(63, 63, 63);
		color: white;
		font-weight: bold;
		border: none;
		cursor: pointer;
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
</style>
</head>
<body style="overflow-x: hidden">
	
	<div id="outBox">
		<table class="ui celled table" id="tableArea">
			<thead>
				<tr>
					<th id="no">번호</th>
					<th id="title">제목</th>
                    <th id="writer">작성자</th>
                    <th id="count">조회수</th>
					<th id="date">작성일</th>
				</tr>
			</thead>
			<tbody> 
				<tr>
					<td id="no">3</td>
					<td id="title">24</td>
                    <td id="writer">박주호</td>
                    <td id="count">1</td>
					<td id="date">2019-05-05</td>
				</tr>
				<tr>
					<td id="no">2</td>
					<td id="title">26</td>
                    <td id="writer">박주호</td>
                    <td id="count">1</td>
					<td id="date">2019-03-29</td>
				</tr>
				<tr>
					<td id="no">1</td>
					<td id="title">24</td>
                    <td id="writer">박주호</td>
                    <td id="count">1</td>
					<td id="date">2019-01-02</td>
                </tr>
                <tr>
                        <td id="no">1</td>
                        <td id="title">24</td>
                        <td id="writer">박주호</td>
                        <td id="count">1</td>
                        <td id="date">2019-01-02</td>
                </tr>

                <tr>
                        <td id="no">1</td>
                        <td id="title">24</td>
                        <td id="writer">박주호</td>
                        <td id="count">1</td>
                        <td id="date">2019-01-02</td>
                    </tr>
                    <tr>
                            <td id="no">1</td>
                            <td id="title">24</td>
                            <td id="writer">박주호</td>
                            <td id="count">1</td>
                            <td id="date">2019-01-02</td>
                        </tr>
                        <tr>
                                <td id="no">1</td>
                                <td id="title">24</td>
                                <td id="writer">박주호</td>
                                <td id="count">1</td>
                                <td id="date">2019-01-02</td>
                            </tr>
                            <tr>
                                    <td id="no">1</td>
                                    <td id="title">24</td>
                                    <td id="writer">박주호</td>
                                    <td id="count">1</td>
                                    <td id="date">2019-01-02</td>
                                </tr>
                                <tr>
                                        <td id="no">1</td>
                                        <td id="title">24</td>
                                        <td id="writer">박주호</td>
                                        <td id="count">1</td>
                                        <td id="date">2019-01-02</td>
                                    </tr>
                                    <tr>
                                            <td id="no">1</td>
                                            <td id="title">24</td>
                                            <td id="writer">박주호</td>
                                            <td id="count">1</td>
                                            <td id="date">2019-01-02</td>
                                        </tr>
			</tbody>
		</table>
		<br>
        <div id="searchArea">
                <input type="text" placeholder="Search" style="width:150px; height:30px;">
              <button class="searchBtn" style="width:100px; height:30px; margin: 0 .25em 0 0; background-color: #e0e0e0;
                      color: rgba(0,0,0,.6); ">Search</button>
              
              <button style="float:right; width:100px; height:30px;" onclick="location.href='../common/boardWrite.jsp'">글쓰기</button>
              
        </div> 
	</div>

</body>
</html>