<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="tt.question.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<%
	String sid = (String) session.getAttribute("sid");
	String sgrade = (String) session.getAttribute("sgrade");
	if (sid == null || sid.equals("")) {
%>
<script>
	window.alert('로그인 후 서비스이용이 가능하십니다.');
	location.href = '/semi_Jungo/login.jsp';
</script>
<%
	return;
	}
%>
<style>
h2 {
	text-align: center;
}

.p_WriteTable {
	border-top: 3px double black;
	margin: 0px auto;
	margin-bottom: 10px;
	width: 800px;
	border-spacing: 0px;
}

.p_WriteTable th {
	border-bottom: 1px solid black;
	border-right: 1px solid black;
	width: 250px;
}

.p_WriteTable td {
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


.c_writebt {
	border: 1px solid black;
	background-color: white;
	padding: 5px 10px 5px 10px;
	margin-top: 10px;
}

.writeContent {
	width: 630px;
	padding: 5px;
	border: 1px solid gray;
	margin: 5px;
	border-radius: 5px;
}
</style>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<section>
		<article>
			<h2>질문게시판 글쓰기</h2>
			<form name="questionWrite" action="questionWrite_ok.jsp">
				<input type="hidden" name="writer" value="<%=sid%>"> <input
					type="hidden" name="type" value="질문">
				<table class="p_WriteTable">
					<tr>
						<th>제목</th>
						<td><input type="text" name="subject" size="45" required="required"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="10" cols="45" name="content"
								class="writeContent" required="required"></textarea></td>
					</tr>
					<tr>
						<td colspan="2" align="center" style="border: hidden;"><input type="submit"
							value="글쓰기" class="c_writebt"> <input type="reset"
							value="다시" class="c_writebt"></td>
					</tr>
				</table>
			</form>
		</article>
	</section>
	<%@ include file="../footer.jsp"%>
</body>
</html>