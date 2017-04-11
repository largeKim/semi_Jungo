<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="tt.member.MemberDAO"/>
<%@ page import="tt.member.MemberDTO" %>
<%

String sid = (String)session.getAttribute("sid"); // 아이디 받아오기
	
if(sid==null || sid.equals("")){
	%>
	<script>
	window.alert('로그인이 필요한 서비스 입니다.');
	history.back();
	</script>
	<%
	return;
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<script type="text/javascript">
</script>
<style type="text/css">


h2 {
	text-align: center;
}
li{
	list-style-type: none;
}

</style>
</head>
<body>
	<%@ include file="../header.jsp"%>	
<h2>회원탈퇴</h2>
<form action="memberOut_ok.jsp">
<fieldset>
		<ul>
			<li><label>ID</label>
			<input type="hidden" name="id" value="<%=sid %>"><%=sid%> </li>
			<li><label>Password</label>
			<input type="password" name="pwd" placeholder="비밀번호"></li>
		</ul>
		
		<input type="submit" value="탈퇴">
</fieldset>
</form>

	<%@ include file="../footer.jsp"%>
</body>
</html>
