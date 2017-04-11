<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="tt.faq.*"%>
<jsp:useBean id="fdao" class="tt.faq.FaqDAO" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<%
String sid=(String)session.getAttribute("sid");
String sgrade = (String)session.getAttribute("sgrade");
if(!(sgrade.equals("0"))){
	%>
	<script>
	window.alert('관리자계정만 사용가능합니다');
	location.href='faq.jsp';
	</script>
	<%
	return;
}
String cp = request.getParameter("cp");
int idx = Integer.parseInt(request.getParameter("idx"));
FaqDTO dto = fdao.faqContent(idx);

if (dto == null) {
%>
<script>
window.alert('삭제된 게시글 또는 잘못된 접근입니다.');
location.href = '/semi_Jungo/faqList/faq.jsp';
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

.writebt {
	border: 1px solid black;
	background-color: white;
	padding: 5px 10px 5px 10px;
	margin-top: 10px;
}
</style>
</head>
<body>
<%@ include file="../header.jsp" %>
<section>
	<article>
	<h2>자주묻는질문 수정하기</h2>
	<form name="faqWrite" action="faqUpdate_ok.jsp">
	<input type="hidden" name="idx" value="<%=idx%>">
	<input type="hidden" name="writer" value="<%=sid%>">
	<input type="hidden" name="cp" value="<%=cp%>">
	<input type="hidden" name="type" value="공지">
		<table class="p_WriteTable">
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="subject" size="45" value="<%=dto.getSubject()%>" required="required">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
				<textarea rows="10" cols="45" name="content"
				class="writeContent" required="required"><%=dto.getContent().replaceAll("\n", "<br>") %></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" style="border: hidden;">
					<input type="submit" value="글쓰기" class="writebt">
					<input type="reset" value="다시" class="writebt">
				</td>
			</tr>
		</table>
	</form>
	</article>
</section>
<%@ include file="../footer.jsp" %>
</body>
</html>