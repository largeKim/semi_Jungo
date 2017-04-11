<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
h4{
	text-align: center;
}
table{
	border-top: double 3px black;
	border-bottom: double 3px black;
	margin: 0px auto;
	width: 200px;
}
table td{
	text-align: center;
	padding: 10px;
}
</style>
</head>
<body>
	<form name="idCheck" action="idCheck_ok.jsp">
		<h4>| 중 복 검 사 |</h4>
		<table>
			<tr>
				<td>사용할아이디</td>
				<td><input type="text" name="userid" size="10"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="중복검사"></td>
			</tr>
		</table>
	</form>
</body>
</html>