<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>== 메세지 보내기 ==</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
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

</head>
<%
String to = request.getParameter("sender");
String sid_m = (String)session.getAttribute("sid");
%>
<body>
<%@include file="../header.jsp" %>
<form name="message" action="messageReWrite_ok.jsp">
	쪽지 답변 보내기<br><hr>
	
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
	<input type="reset" value="다시작성">
	</p>
</form>
<%@include file="../footer.jsp" %>
</body>
</html>