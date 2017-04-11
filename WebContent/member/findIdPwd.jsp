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
/*아이디*/
.findId{
	margin-top: 20px;
	margin-left: 38%;
	
	padding: 20px;
	
}

.findId table th{
	border-bottom: solid 1px;
	border-right: solid 1px;
	padding: 10px;
}
.findId table td{
	border-bottom: solid 1px;
	padding: 10px;
}

/*비밀번호*/
.findPwd{
	margin-top: 20px;
	margin-left: 38%;
	
	padding: 20px;
}
.findPwd table th{
	border-bottom: solid 1px;
	border-right: solid 1px;
	padding: 10px;
}
.findPwd table td{
	border-bottom: solid 1px;
	padding: 10px;
}

/*공통부분*/
.findsub{
	border-top: double;
	border-bottom: double 1px;
}
.bttr1{
	padding-left: 30px;
	margin-left: 0px;
}
.bttr1 td{
	padding-left:100px;
}
.bttd1{
	border-bottom: double;
	text-align: left;
	margin-right: 100px;
	padding: 400px;
}

.bttd1 input[type="submit"]{
	display: block;
	background-color: white;
	margin-right:40px;
	padding: 10px;
	border: solid 1px black;
	height: 40px;
	width: 60px;
	vertical-align: middle;
	
}

</style>
</head>
<body>
<%@include file="../header.jsp"%>

<section>
<article>
<h2>| 아이디 비밀번호 찾기 |</h2>

<form class="findId" action="findId_ok.jsp">
		<table>
			<tr>
				<td class="findsub" colspan="2">아이디 찾기</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" size="20"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" name="tel1" size="4">-
					<input type="text" name="tel2" size="4">-
					<input type="text" name="tel3" size="4">
				</td>
			</tr>
			<tr class="bttr1">	
				<td class="bttd1" colspan="2">
					<input type="submit" value="찾기">
				</td>
			</tr>
		</table>
</form>


<form class="findPwd" action="findPwd_ok.jsp">
		<table>
			<tr>
				<td class="findsub" colspan="2">비밀번호 찾기</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="id" size="20">
				</td>
			</tr>
			<tr>	
				<th>전화번호</th>
				<td>
					<input type="text" name="tel1" size="4">-
					<input type="text" name="tel2" size="4">-
					<input type="text" name="tel3" size="4">
				</td>
			</tr>
			<tr class="bttr1">
				<td class="bttd1" colspan="2">
					<input type="submit" value="찾기">
				</td>
			</tr>
		</table>
</form>

</article>
</section>
<%@include file="../footer.jsp"%>
</body>
</html>