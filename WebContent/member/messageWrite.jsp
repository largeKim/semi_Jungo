<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>== 메세지 보내기 ==</title>
<style>
li{
	list-style-type:none;
}
label{
	width:100px;
	float:left;
}
p{
	text-align:center;
}
</style>
<script>
function goclose(){
	window.self.close();
}
</script>
</head>
<%
String to = request.getParameter("writer");
String sid_m = (String)session.getAttribute("sid");
%>
<body>
<form name="message" action="messageWrite_ok.jsp">
	쪽지보내기<br><hr>
	
	받는 사람&nbsp;&nbsp;
	<%=to%><br><hr>
	<!-- 받는사람   -->
	<input type="hidden" name="receiver" value="<%=to%>">
	<!-- 보내는사람   -->
	<input type="hidden" name="sender" value="<%=sid_m%>">
	제목&nbsp;&nbsp;<input type="text" name="subject"><br>
	<textarea rows="15" cols="65" name="content"></textarea><br>
	글자수 제한 1000자
	<p>
	<input type="submit" value="쪽지보내기">
	<input type="button" value="취소" onclick="goclose()">
	</p>
</form>
</body>
</html>