<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="overflow-x: hidden">
	<%@ include file="/views/common/parentsMenu.jsp"%>
	<h1 align="center">내아이 투약의뢰서</h1>
	<form>
		<table align="center">
			<tr>
				<td><label>유아명 : </label></td>
				<td><input type="text" name="kidsName" placeholder="유아명 입력"></td>
			</tr>
			<tr>
				<td><label>증상명 : </label></td>
				<td><input type="text" name="disease" placeholder="증상명 입력"></td>
			</tr>
			<tr>
				<td><label>약의 종류 및 용량 : </label></td>
				<td><input type="text" name="medician"
					placeholder="약의 종류 및 용량 입력해"></td>
			</tr>
			<tr>
				<td><label>약의 보관 방법 :</label></td>
				<td><input type="radio" name="keepMedicine" value="상온"
					id="ordinary">
				<label for="ordinary">상온</label>
				<input type="radio" name="keepMedicine" value="냉온"
					id="freeze"><label for="freeze">냉온</label></td>
			</tr>
			<tr>
				<td><label>투약 의뢰 기간 : </label></td>
				<td><input type="text" name="dosingPeriod"
					placeholder="투약의뢰 기간 입력"></td>
			</tr>
			<tr>
				<td><label>투약 의뢰 시간 : </label></td>
				<td><input type="text" name="dosingTime"
					placeholder="투약의뢰 시간 입력"></td>
			</tr>
			<tr>
				<td><label>비고 : </label></td>
				<td><input type="text" name="note" placeholder="내용 입력"></td>
			</tr>
			<tr>
				<td><label>의뢰자 : </label></td>
				<td><input type="text" name="requestor" placeholder="의뢰자 이름 입력"></td>
			</tr>
			<tr>
				<td></td>
			</tr>
	
		</table>
		<label align="center">*투약으로 인한 책임은 의뢰자에게 있습니다.</label>
	</form>
</body>
</html>
