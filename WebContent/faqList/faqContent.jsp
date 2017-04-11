<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="tt.faq.*"%>
<jsp:useBean id="fdao" class="tt.faq.FaqDAO" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<%
	String idx_s = request.getParameter("idx");
	if (idx_s == null || idx_s.equals("")) {
		idx_s = "0";
	}
	int idx = Integer.parseInt(idx_s);
	FaqDTO dto = fdao.faqContent(idx);
	if (dto == null) {
%>
<script>
	window.alert('삭제된 게시글 또는 잘못된 접근입니다.');
	location
	href = 'faq.jsp'
</script>
<%
	return;
	}
%>
<style>
h2 {
	text-align: center;
}

.p_contentTable {
	border-top: 3px double black;
	margin: 0px auto;
	margin-bottom: 10px;
	width: 800px;
	border-spacing: 0px;
}

.p_contentTable th {
	border-bottom: 1px solid black;
	border-right: 1px solid black;
	width: 150px;
}

.p_contentTable td {
	padding-left: 5px;
	border-bottom: 1px solid black;
}

.btList {
	height: 40px;
	width: 28%;
	margin: 0px auto;
}

.content_bt {
	border: 1px solid black;
	display: block;
	float: left;
	text-align: center;
	margin: 0px 5px 0px 5px;
	padding: 8px 10px 8px 10px;
	font-size: 13px;
}

.content_bt a:LINK {
	color: black;
	text-decoration: none;
}

.content_bt a:VISITED {
	color: black;
	text-decoration: none;
}

.content_bt a:HOVER {
	color: red;
}

.btList_none {
	width: 170px;
	height: 40px;
	margin: 0px auto;
	margin-top: 10px;
}
</style>
</head>
<body>
	<%@include file="../header.jsp"%>
	<section>
		<article>
			<h2>자주 묻는 질문</h2>
			<table class="p_contentTable">
				<tr>
					<th>글</th>
					<td style="border-right: 1px solid black;"><%=dto.getType()%></td>
					<th>작성날짜</th>
					<td><%=dto.getWritedate()%></td>
				</tr>
				<tr>
					<th>ID</th>
					<td style="border-right: 1px solid black;"><%=dto.getWriter()%></td>
					<th>조회수</th>
					<td><%=dto.getReadnum()%></td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3" align="left"><%=dto.getSubject()%></td>
				</tr>
				<tr height="250">
					<td class="content_td" colspan="4" align="left" valign="top">
						<%=dto.getContent().replaceAll("\n", "<br>")%>
					</td>
				</tr>
			</table>
			<div class="btList">
				<div class="content_bt">
					<a
						href="faq.jsp?cp=<%=request.getParameter("cp") == null ? "1" : request.getParameter("cp")%>">목록보기</a>
				</div>
				<%
					if (sgrade_s.equals("0")) {
				%>
				<div class="content_bt">
					<a href="faqDelete.jsp?idx=<%=dto.getIdx()%>&cp=<%=request.getParameter("cp")%>">삭제하기</a>
				</div>
				<div class="content_bt">
					<a href="faqUpdate.jsp?idx=<%=dto.getIdx()%>&cp=<%=request.getParameter("cp")%>">수정하기</a>
				</div>
				<%
					}
				%>
			</div>
		</article>
	</section>
	<%@include file="../footer.jsp"%>
</body>
</html>