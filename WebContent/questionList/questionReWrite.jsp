<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="tt.question.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<style>
h2 {
	text-align: center;
	margin-top: 40px;
}

.p_WriteTable {
	border-top: 3px double black;
	margin: 0px auto;
	margin-bottom: 10px;
	width: 800px;
}

.p_WriteTable th {
	border-bottom: 1px solid black;
	border-right: 1px solid black;
	width: 250px;
}

.Write_td1 {
	border-bottom: 1px solid black;
	border-right: 1px solid black;
}

.Write_td2 {
	border-bottom: 1px solid black;
}

.write_bt {
	border: 1px solid black;
	background-color: white;
}

.writeContent {
	width: 630px;
	padding: 5px;
	border: 1px solid gray;
	margin: 5px;
	border-radius: 5px;
}

.wrbtList {
	margin: 0px auto;
	height: 20px;
	width: 12%;
	margin-bottom: 25px;
}

.wr_bt {
	background-color: white;
	display: block;
	float: left;
	border: 1px solid black;
	margin: 0px 5px 0px 5px;
	padding: 5px;
}
</style>
</head>
<body>
<%@ include file="../header.jsp" %>
<%
String sid=(String)session.getAttribute("sid");
String subject = request.getParameter("subject");
String ref = request.getParameter("ref");
String lev = request.getParameter("lev");
String sunbun = request.getParameter("sunbun");

//로그인이 필요한 메뉴에서는 필수적으로 사용하는 코드이기때문에 따로 저장하게 되면 모듈이 된다.
String sid_com = (String) session.getAttribute("sid");
if (sid_com == null || sid_com.equals("")) {
%>
<script>
window.alert('로그인 후 서비스 이용이 가능합니다.');
location.href = '/semi_Jungo/login.jsp';
</script>
<%
return;
}
%>
<section>
	<article>
	<h2>질문게시판 답변쓰기</h2>
	<form name="questionReWrite" action="questionReWrite_ok.jsp">
	<input type="hidden" name="writer" value="<%=sid%>">
	<input type="hidden" name="ref" value="<%=ref %>">
	<input type="hidden" name="lev" value="<%=lev %>">
	<input type="hidden" name="sunbun" value="<%=sunbun %>">
	<input type="hidden" name="type" value="질문답변">
		<table class="p_WriteTable">
			<tr>
				<th>제목</th>
				<td class="Write_td2">
					<input type="text" name="subject" size="45"
					value="Re:>><%=subject%>">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td class="Write_td2">
				<textarea rows="10" cols="45" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<input type="submit" value="글쓰기">
					<input type="reset" value="다시">
				</td>
			</tr>
		</table>
	</form>
	</article>
</section>
<%@ include file="../footer.jsp" %>
</body>
</html>