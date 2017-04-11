<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<style>
h2{
	text-align: center;
}

.login {
	border-top: double 3px black;
	border-bottom: double 3px black;
	margin: 0px auto;
	width: 500px;
	text-align: center;
	margin-bottom: 20px;
}

.login td {
	padding: 10px;
	text-align: left;
}

.login th {
	padding-left: 40px;
	padding-right: 30px;
	text-align: center;
	border-right: solid 1px gray;
}

.login_bt {
	display: block;
	background-color: white;
	margin: 0px auto;
	padding: 15px 25px 15px 25px;
	border: solid 1px black;
	padding: 15px 25px 15px 25px;
}
</style>
</head>
<%
	Cookie cks[] = request.getCookies();
	String saveid = "";
	if (cks != null) {
		for (int i = 0; i < cks.length; i++) {
			if (cks[i].getName().equals("saveid")) {
				saveid = cks[i].getValue();
			}
		}
	}
%>
<body>
	<%@include file="../header.jsp"%>
	<article class="login_article">
		<form class="login_form" name="login" action="/semi_Jungo/login_ok.jsp">
			<h2>| 로 그 인 |</h2>
			<table class="login">
				<tr>
					<th style="border-bottom: solid 1px gray;">아이디</th>
					<td style="border-bottom: solid 1px gray;"><input type="text"
						name="userid" value="<%=saveid%>" placeholder="아이디"
						required="required"><br> <input type="checkbox"
						name="saveid" value="on" <%=saveid.equals("") ? "" : "checked"%>><font
						size="2">아이디기억하기</font></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="userpwd" required="required"
						placeholder="비밀번호"></td>
				</tr>
			</table>
			<input type="submit" value="Login" class="login_bt">
		</form>
	</article>
	<%@include file="../footer.jsp"%>
</body>
</html>