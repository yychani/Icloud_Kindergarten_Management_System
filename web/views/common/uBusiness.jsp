<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
    #charge {
        width: 120px;
        border: 1px solid black;
        vertical-align: middle;
        border-left: none;
    }

    #task {
        width: 500px;
        border: 1px solid black;
    }

    #cleaningArea {
        width: 300px;
        border: 1px solid black;
        border-right: none;
    }

    tr>th {
        text-align: center;
        font-weight: bold;
        font-size: 13pt;
        height: 50px;
    }
    textarea {
        border-radius: 10px;
        resize: none;
    }
    #workDivision {
        margin: 70px auto;
    }
</style>
<table id="workDivision" align="center">
    <tr>
        <th id="charge">담당</th>
        <th id="task">업무 내용</th>
        <th id="cleaningArea">청소 구역</th>
    </tr>
    <tr>
        <td id="charge" style="padding-right: 0;">
            <select name="chargeN" id="chargeN" style="margin-left: 10px; width: 100px; height: 30px;">
                <option value="원장">원장</option>
                <option value="원장">ooo선생</option>
            </select>
        </td>
        <td id="task" style="padding-left: 20px; padding-right: 0;"><textarea name="taskText" id="taskText" cols="61" rows="10" placeholder="담당업무를 줄단위로 입력해 주세요"></textarea></td>
        <td id="cleaningArea" style="padding-left: 20px; padding-right: 0;"><textarea name="cleaningText" id="cleaningText" cols="34" rows="10" placeholder="청소구역을 줄단위로 입력해 주세요"></textarea></td>
    </tr>
    <tr>
        <td colspan="3"><div style="float: right;"><input type="button" value="확인" onclick="location.href='<%=request.getContextPath() %>/views/president/preWorkD.jsp'">&nbsp;&nbsp;
            <input type="button" value="취소" onclick="location.href='<%=request.getContextPath() %>/views/president/preWorkD.jsp'">
        </div></td>
    </tr>
</table>
