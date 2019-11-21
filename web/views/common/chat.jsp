<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
    #chat {
        position: fixed;
        bottom: 20px;
        right: 20px;
        width: 80px;
        height: 80px;
    }
    .custom.popup {
        position: fixed !important;
        bottom: 100px !important;
        right: 45px !important;
        width: 300px !important;
        height: 300px !important;
    }
</style>
<div id="chat" class="ui avatar image" data-tooltip="Add users to your feed" data-position="top right">
    <img style="width:80px; height:80px;" src="<%=request.getContextPath()%>/images/chat.png">
</div>
<div class="ui custom popup top left transition hidden">
    <form>
        <select name="receiver" id="receiver" style="width: 50%; height: 30px; margin-bottom: 10px;">
			<option>A</option>
			<option>B</option>
        </select>
        <div style="border: 1px solid black; width: 100%; height: 200px; margin-bottom: 10px;"id="chatContext">
        </div>
        <input type="text" style="width: 73%; height: 30px;" name="sendMassage" id="sendMassage">
        &nbsp;&nbsp;<input type="submit" name="sendBtn" id="sendBtn" value="보내기">
    </form>
</div>
<script>
    $('.ui.avatar.image').popup({
        popup: $('.custom.popup'),
        on: 'click',
        position : 'top right'
    })
</script>