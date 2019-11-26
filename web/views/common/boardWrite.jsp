<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
input[type=text] {
	border-radius: 10px;
	width: 100%;
	height: 30px;
}
input[type='submit'] {
		width: 100px;
		height: 40px;
		border-radius: 10px;
		background: rgb(63, 63, 63);
		color: white;
		font-weight: bold;
		border: none;
		cursor: pointer;
	}
textarea {
	border-radius: 10px;
}
</style>
<div style="margin: 0 30%; margin-bottom:20px;">
	<h3 style="text-decoration: underline; text-underline-position: under; width:100%;">제목</h3>
	<input type="text" /> <br />
	<h3 style="text-decoration: underline; text-underline-position: under;">내용</h3>
	<textarea style="resize: none; width:100%;" rows="25"></textarea>
	<input type="file" />
	<input type="submit" id="boardWrite" value="완료" style="float:right"/>	
</div>
