<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="tt.notice.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<%
String sid=(String)session.getAttribute("sid");

if(sid==null||sid.equals("")){
	%>
	<script>
	window.alert('관리자만 글을 작성하실 수 있습니다.');
	location.href='/semi_Jungo/login.jsp';
	</script>
	<%
	return;
}
%>
<style>
.n_WriteTable{
	margin: 0px auto;
	margin-bottom: 10px;
	width: 500px;
	border-spacing: 0px;
	border-top: 3px double black;
}
.n_WriteTable_top{

	text-align: center;
}
.n_WriteTable th {
	border-bottom: 1px solid black;
	border-right: 1px solid black;
	width: 150px;
}
.n_WriteTable td {
	border-bottom: 1px solid black;
}

.n_WriteBtn {
	background-color: white;
	border: 1px solid black;
	margin: 0px 5px 0px 5px;
}
.n_WriteContent {
	width: 630px;
	padding: 5px;
	border: 1px solid gray;
	margin: 5px;
	border-radius: 5px;
}
</style>
</head>
<body>
<%@ include file="/header.jsp" %>
<section>
<form name="noticeWrite" action="noticeWrite_ok.jsp">
	<article>
	<div class="noticeWrite_div">
	<h2 class="n_WriteTable_top">공지사항 글쓰기</h2>
	<input type="hidden" name="type" value="[공지]">
	<input type="hidden" name="writer" value="<%=sid%>">
	<input type="hidden" name="name" value="관리자">
		<table class="n_WriteTable">
			<tr>
				<th>말머리</th>
				<td class="n_WriteTable_tdcol">[공지]</td>
			</tr>
			<tr>
				<th>제목</th>
				<td class="n_WriteTable_tdcol" colspan="3">
					<input type="text" name="subject" size="30px" required="required">
				</td>
			</tr>
			<tr>
				<td colspan="4" style="border: hidden;">
				<textarea class="n_WriteContent" rows="15" cols="100%" name="content" required="required"></textarea>
				</td>
			</tr>
			<tr>
				<td class="n_WriteTable_tdcol" colspan="4" align="center" style="padding-bottom: 10px; border: hidden;">
					<input class="n_WriteBtn" type="submit" value="적용하기">
					<input class="n_WriteBtn" type="reset" value="다시쓰기">
				</td>
			</tr>
		</table>
	</div>
	</article>
		</form>
</section>
<%@ include file="/footer.jsp" %>
</body>
</html>