<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	table {
		margin: 50px auto;
	}
    #division {
        width: 80px;
        border: 1px solid black;
        border-left: none;
    }

    #charge {
        width: 120px;
        border: 1px solid black;
    }

    #task {
        width: 500px;
        border: 1px solid black;
    }

    #cleaningArea {
        width: 300px;
        border: 1px solid black;
        border-left: none;
        border-right: none;
    }

    tr>th,
    td[id="division"] {
        text-align: center;
        font-weight: bold;
        font-size: 13pt;
    }

    tr>th {
        height: 50px;
    }

    td[id="division"] {
        font-size: 11pt;
        padding-right: 0;
    }
    #workDivision {
        margin: 70px auto;
    }
</style>
<table id="workDivision">
    <tr>
        <th id="division">구분</th>
        <th id="charge">담당</th>
        <th id="task">업무 내용</th>
        <th id="cleaningArea">청소 구역</th>
    </tr>
    <tr>
        <td id="division">고유<br>업무<br>
            <input style="width: 50px; height: 30px;" type="hidden" class="add" value="추가"
                onclick="location.href='<%=request.getContextPath() %>/views/president/preUBusiness.jsp'">
        </td>
        <td id="charge"></td>
        <td id="task"></td>
        <td id="cleaningArea"></td>
    </tr>
    <tr>
        <td id="division">업무<br>분담<br>
            <input style="width: 50px; height: 30px;" type="hidden" class="add" value="추가">
        </td>
        <td id="charge"></td>
        <td id="task"></td>
        <td id="cleaningArea"></td>
    </tr>
    <tr>
        <td colspan="4">
            <div style="float: right;"><input type="button" id="edit" value="수정하기">
                <div style="float: right;"><input type="hidden" id="complete" value="완료하기">
            </div>
        </td>
    </tr>
</table>
<script>
    $("#edit").click(function() {
        $(".add").attr("type", "button");
        $(".add").attr("type", "button");
        $("#complete").attr("type", "button");
        $(this).attr("type", "hidden");
    });
    $("#complete").click(function() {
        $(".add").attr("type", "hidden");
        $(".add").attr("type", "hidden");
        $("#edit").attr("type", "button");
        $(this).attr("type", "hidden");
    });
</script>