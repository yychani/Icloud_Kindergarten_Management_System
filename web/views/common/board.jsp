<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
	<script
   	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
   	
   	<style>
        table {
            text-align: center;
            
            margin: 50px auto;
            
            padding-left: 150px;
            padding-right: 150px;
    		border:none;
        }
    	table tr:nth-of-type(1) {
    	}
        #No {
            width: 70px;
            height: 30px;
        }
    
        #title {
            width: 500px;
            height: 30px;
        }
    
        #writer {
            width: 70px;
            height: 30px;
        }
    
        #count {
            width: 70px;
            height: 30px;
        }
    
        #date {
            width: 100px;
            height: 30px;
        }
    
        td {
            border: 1px solid lightgray;
        }
        #searchArea{
        	padding-left: 10%;
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
    </style>    
    <link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    <script
    src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>



<table class="ui celled table">
        <thead>
          <tr>
          <th>번호</th>
          <th>제목</th>
          <th>작성자</th>
          <th>조회수</th>
          <th>작성일</th>
          
        </tr></thead>
        <tbody>
          <tr>
            <td id="No">James</td>
            <td id="title">24</td>
            <td id="writer">Engineer</td>
            <td id="count">1</td>
            <td id="date">2019-12-05</td>
            
          </tr>
          <tr>
                <td id="No">James</td>
                <td id="title">24</td>
                <td id="writer">Engineer</td>
                <td id="count">1</td>
                <td id="date">2019-12-05</td>
          </tr>
          <tr>
                <td id="No">James</td>
                <td id="title">24</td>
                <td id="writer">Engineer</td>
                <td id="count">1</td>
                <td id="date">2019-12-05</td>
          </tr>
          <tr>
                <td id="No">James</td>
                <td id="title">24</td>
                <td id="writer">Engineer</td>
                <td id="count">1</td>
                <td id="date">2019-12-05</td>
          </tr>
          <tr>
                <td id="No">James</td>
                <td id="title">24</td>
                <td id="writer">Engineer</td>
                <td id="count">1</td>
                <td id="date">2019-12-05</td>
          </tr>
          <tr>
                <td id="No">James</td>
                <td id="title">24</td>
                <td id="writer">Engineer</td>
                <td id="count">1</td>
                <td id="date">2019-12-05</td>
          </tr>
          <tr>
                <td id="No">James</td>
                <td id="title">24</td>
                <td id="writer">Engineer</td>
                <td id="count">1</td>
                <td id="date">2019-12-05</td>
          </tr>
          <tr>
                <td id="No">James</td>
                <td id="title">24</td>
                <td id="writer">Engineer</td>
                <td id="count">1</td>
                <td id="date">2019-12-05</td>
          </tr>
          <tr>
                <td id="No">James</td>
                <td id="title">24</td>
                <td id="writer">Engineer</td>
                <td id="count">1</td>
                <td id="date">2019-12-05</td>
          </tr>
          <tr>
                <td id="No">James</td>
                <td id="title">24</td>
                <td id="writer">Engineer</td>
                <td id="count">1</td>
                <td id="date">2019-12-05</td>
          </tr>
          <tr>
                <td id="No">James</td>
                <td id="title">24</td>
                <td id="writer">Engineer</td>
                <td id="count">1</td>
                <td id="date">2019-12-05</td>
          </tr>
          <tr>
                <td id="No">James</td>
                <td id="title">24</td>
                <td id="writer">Engineer</td>
                <td id="count">1</td>
                <td id="date">2019-12-05</td>
          </tr>
          <tr>
                <td id="No">James</td>
                <td id="title">24</td>
                <td id="writer">Engineer</td>
                <td id="count">1</td>
                <td id="date">2019-12-05</td>
          </tr>
          <tr>
                <td id="No">James</td>
                <td id="title">24</td>
                <td id="writer">Engineer</td>
                <td id="count">1</td>
                <td id="date">2019-12-05</td>
          </tr>
          <tr>
                <td id="No">James</td>
                <td id="title">24</td>
                <td id="writer">Engineer</td>
                <td id="count">1</td>
                <td id="date">2019-12-05</td>
          </tr>
         <!--  <tr>
			<td name="search" class="search" colspan="2" align="left" style="border: 0">
				<div class="ui action input" style="margin-left:5px;">
					<input type="text" placeholder="Search..." style="width: 200px; height: 36px;">
					<button class="ui button" style="margin: 0 .25em 0 0; background-color: #e0e0e0;
					color: rgba(0,0,0,.6); ">Search</button>
				</div>
			</td>
			<td name="page" class="page" colspan="6" align="center" style="border: 0"></td>
			<td name="writing" class="writing" colspan="2" style="border: 0; padding-right: 0" align="right"><button id="write">글쓰기</button></td>
		</tr> -->
		<!-- <tr>
			
				<input type="text" placeholder="Search" style="width:150px; height:30px;">
				<button class="searchBtn" style="width:100px; height:30px;">Search</button>
			
			<button align="center">글쓰기</button>
			
			
		</tr>  -->
		
        </tbody>
      </table>
      <div id="searchArea">
      		<input type="text" placeholder="Search" style="width:150px; height:30px;">
			<button class="searchBtn" style="width:100px; height:30px; margin: 0 .25em 0 0; background-color: #e0e0e0;
					color: rgba(0,0,0,.6); ">Search</button>
			
			<button style="margin-left:63%; width:100px; height:30px;">글쓰기</button>
			
      </div> 
      

   	
   	
   	
   	
   	
   	
   	
   	
   	
   	
<!-- <style>
	table {
		text-align: center;
		margin: 50px auto;
	}

	.boardNo {
		width: 100px;
		height: 30px;
	}

	.title {
		width: 500px;
		height: 30px;
	}

	.writer {
		width: 100px;
		height: 30px;
	}

	.viewCount {
		width: 100px;
		height: 30px;
	}

	.writeDate {
		width: 150px;
		height: 30px;
	}

	td {
		border: 1px solid black;
	}
</style>
<table>
	<tr>
		<th class="boardNo">번호</th>
		<th class="title" colspan="5">제목</th>
		<th class="writer">작성자</th>
		<th class="viewCount">조회수</th>
		<th class="writeDate">작성일</th>
	</tr>
	<tr>
		<td name="boardNo" class="boardNo"></td>
		<td name="title" class="title" colspan="5"></td>
		<td name="writer" class="writer"></td>
		<td name="viewCount" class="viewCount"></td>
		<td name="writeDate" class="writeDate"></td>
	</tr>
	<tr>
		<td name="boardNo" class="boardNo"></td>
		<td name="title" class="title" colspan="5"></td>
		<td name="writer" class="writer"></td>
		<td name="viewCount" class="viewCount"></td>
		<td name="writeDate" class="writeDate"></td>
	</tr>
	<tr>
		<td name="boardNo" class="boardNo"></td>
		<td name="title" class="title" colspan="5"></td>
		<td name="writer" class="writer"></td>
		<td name="viewCount" class="viewCount"></td>
		<td name="writeDate" class="writeDate"></td>
	</tr>
	<tr>
		<td name="boardNo" class="boardNo"></td>
		<td name="title" class="title" colspan="5"></td>
		<td name="writer" class="writer"></td>
		<td name="viewCount" class="viewCount"></td>
		<td name="writeDate" class="writeDate"></td>
	</tr>
	<tr>
		<td name="boardNo" class="boardNo"></td>
		<td name="title" class="title" colspan="5"></td>
		<td name="writer" class="writer"></td>
		<td name="viewCount" class="viewCount"></td>
		<td name="writeDate" class="writeDate"></td>
	</tr>
	<tr>
		<td name="boardNo" class="boardNo"></td>
		<td name="title" class="title" colspan="5"></td>
		<td name="writer" class="writer"></td>
		<td name="viewCount" class="viewCount"></td>
		<td name="writeDate" class="writeDate"></td>
	</tr>
	<tr>
		<td name="boardNo" class="boardNo"></td>
		<td name="title" class="title" colspan="5"></td>
		<td name="writer" class="writer"></td>
		<td name="viewCount" class="viewCount"></td>
		<td name="writeDate" class="writeDate"></td>
	</tr>
	<tr>
		<td name="boardNo" class="boardNo"></td>
		<td name="title" class="title" colspan="5"></td>
		<td name="writer" class="writer"></td>
		<td name="viewCount" class="viewCount"></td>
		<td name="writeDate" class="writeDate"></td>
	</tr>
	<tr>
		<td name="boardNo" class="boardNo"></td>
		<td name="title" class="title" colspan="5"></td>
		<td name="writer" class="writer"></td>
		<td name="viewCount" class="viewCount"></td>
		<td name="writeDate" class="writeDate"></td>
	</tr>
	<tr>
		<td name="boardNo" class="boardNo"></td>
		<td name="title" class="title" colspan="5"></td>
		<td name="writer" class="writer"></td>
		<td name="viewCount" class="viewCount"></td>
		<td name="writeDate" class="writeDate"></td>
	</tr>
	<tr>
		<td name="boardNo" class="boardNo"></td>
		<td name="title" class="title" colspan="5"></td>
		<td name="writer" class="writer"></td>
		<td name="viewCount" class="viewCount"></td>
		<td name="writeDate" class="writeDate"></td>
	</tr>
	<tr>
		<td name="boardNo" class="boardNo"></td>
		<td name="title" class="title" colspan="5"></td>
		<td name="writer" class="writer"></td>
		<td name="viewCount" class="viewCount"></td>
		<td name="writeDate" class="writeDate"></td>
	</tr>
	<tr>
		<td name="boardNo" class="boardNo"></td>
		<td name="title" class="title" colspan="5"></td>
		<td name="writer" class="writer"></td>
		<td name="viewCount" class="viewCount"></td>
		<td name="writeDate" class="writeDate"></td>
	</tr>
	<tr>
		<td name="boardNo" class="boardNo"></td>
		<td name="title" class="title" colspan="5"></td>
		<td name="writer" class="writer"></td>
		<td name="viewCount" class="viewCount"></td>
		<td name="writeDate" class="writeDate"></td>
	</tr>
	<tr>
		<td name="search" class="search" colspan="2" align="left" style="border: 0">
			<div class="ui action input" style="margin-left:5px;">
				<input type="text" placeholder="Search..." style="width: 200px; height: 36px;">
				<button class="ui button" style="margin: 0 .25em 0 0; background-color: #e0e0e0;
			color: rgba(0,0,0,.6); ">Search</button>
			</div>
		</td>
		<td name="page" class="page" colspan="6" align="center" style="border: 0"></td>
		<td name="writing" class="writing" colspan="2" style="border: 0; padding-right: 0" align="right"><button id="write">글쓰기</button></td>
	</tr>
</table> -->