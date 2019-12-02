<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
    <style>
        table {
            margin: 50px auto;
        }

        input[type=text] {
            background: none;
            border: none;
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

        #teacher {
            border-radius: 10px;
            background: rgba(216, 216, 216, 0.486);
        }

        #pictureTd {
            width: 300px;
            height: 250px;
            padding-right: 0;
        }

        #picture {
            width: 250px;
            height: 250px;
            border: 1px solid black;
        }

        th {
            border-top: 1px solid black;
            border-bottom: 1px solid black;
            background: rgba(216, 216, 216, 0.486);
        }

        #no {
            width: 50px;
        }

        #name {
            width: 120px;
        }

        #class,
        #parents {
            width: 200px;
        }

        #children {
            margin-top: 20px;
            text-align: center;
        }

        .no,
        .name,
        .class,
        .parents {
            padding: 5px 0;
            border-bottom: 1px solid black;
        }
        input[type='submit'] {
            width: 80px;
            height: 40px;
            border-radius: 10px;
            background: rgb(63, 63, 63);
            color: white;
            font-weight: bold;
            border: none;
            cursor: pointer;
        }
        input[type='text'] {
            text-align: center;
        }
        input:focus {outline:none;}
    </style>
</head>

<body style="overflow-x: hidden">
    <%@ include file="/views/common/presidentMenu.jsp"%>
    <div style="margin: 0 15%;">
        <h1 style="text-decoration: underline; text-underline-position: under;">원아 관리</h1>
    </div>
    <form action="<%=request.getContextPath()%>/views/president/preKManagement.jsp" method="get">
        <div align="center" style="margin-top: 50px;">
            <select name="yearSelect" id="year">
                <option value="none">년도 선택</option>
                <option value="all">전체</option>
                <option value="2019">2019</option>
                <option value="2018">2018</option>
                <option value="2017">2017</option>
                <option value="2016">2016</option>
                <option value="2015">2015</option>
            </select>
            <label> 년도</label>
            <select name="classSelect" id="year">
                <option value="none">반 선택</option>
                <option value="all">전체</option>
                <option value="sunflower">해바라기</option>
                <option value="rose">장미</option>
                <option value="tulip">튤립</option>
            </select>
            <label> 반</label>
            <input type="submit" value="검색" style="margin-left: 20px; width: 50px; height: 30px;">
            <input type="submit" value="전체보기" style="margin-left: 35%; width: 70px; height: 30px;">
        </div>
    </form>
    <table id="children">
        <tr>
            <th id="no">No</th>
            <th id="name">이름</th>
            <th id="class">반</th>
            <th id="parents">학부모</th>
            <th id="detail">상세</th>
        </tr>
        <tr>
            <form action="<%=request.getContextPath()%>/views/president/preKdetail.jsp" method="get">
                <td class="no"><input type="text" name="no" style="background: none" value="1" readonly></td>
                <td class="name"><input type="text" name="name" style="background: none" value="윤재영" readonly></td>
                <td class="class"><input type="text" name="class" style="background: none" value="해바라기" readonly></td>
                <td class="parents"><input type="text" name="parents" style="background: none" value="김경숙" readonly></td>
                <td class="detail" style="padding-right: 0;"><input type="submit" class="detailBtn"
                        style="width: 60px; font-size: 8pt; height: 20px;" class="submit" value="상세보기"></td>
            </form>
        </tr>
        <tr>
            <td id="moreTd" colspan="5"
                style="padding: 0 0; text-align: center; background: rgba(216, 216, 216, 0.486);">
                <button id="more"
                    style="width: 100%; font-size: 8pt; background: none; height: 7px; color: black;">더보기</button></td>
        </tr>
    </table>
    <script>
        $(function () {
            $(".topMenuLi:nth-child(5)").addClass("on");

            $(".topMenuLi").mouseover(function () {
                $(".topMenuLi:nth-child(5)").removeClass("on");
            });
            $(".topMenuLi").mouseleave(function () {
                $(".topMenuLi:nth-child(5)").addClass("on");
            });
        }); 
    </script>
    <%@ include file="/views/common/footer.jsp"%>
    <%@ include file="/views/common/chat.jsp"%>
</body>

</html>