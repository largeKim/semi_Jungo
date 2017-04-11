<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="tt.notice.*"%>
<jsp:useBean id="ndao" class="tt.notice.NoticeDAO" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<style>
.n_ModifyTable {
	margin: 0px auto;
	margin-bottom: 10px;
	width: 800px;
	border-spacing: 0px;
	border-top: 3px double black;
}

.n_ModifyTable_top {
	text-align: center;
}

.n_ModifyTable th {
	border-bottom: 1px solid black;
	border-right: 1px solid black;
	width: 150px;
}

.n_ModifyTable td {
	border-bottom: 1px solid black;
}

.n_ModifyBtn {
	background-color: white;
	border: 1px solid black;
	margin: 0px 5px 0px 5px;
}

.n_ModifyContent {
	width: 630px;
	padding: 5px;
	border: 1px solid gray;
	margin: 5px;
	border-radius: 5px;
}
</style>
</head>
<%
	String idx_s = request.getParameter("idx");
	if (idx_s == null || idx_s.equals("")) { // endsWith("")
		idx_s = "0";
	}
	int idx = Integer.parseInt(idx_s);

	NoticeDTO dto = ndao.noticeContent(idx);
	if (dto == null) {
%>
<script>
	window.alert('삭제된 게시글 또는 잘못된 접근입니다.');
	window.location.href = 'bbsList.jsp';
</script>
<%
	return; // 자바스크립트가 실행되더라도 자바가 먼저 다 실행되므로 return을 해주어야 함.
	}
%>
<body>
	<%@include file="/header.jsp"%>
	<section>
		<article>
			<h2 class="n_ModifyTable_top">공지사항 내용 수정하기</h2>
			<form action="noticeModify_ok.jsp">
				<input type="hidden" name="idx" value="<%=dto.getIdx()%>"> <input
					type="hidden" name="writer" value="<%=dto.getWriter()%>">
				<table class="n_ModifyTable">
					<tr>
						<th>글</th>
						<td style="border-right: 1px solid black;"><%=dto.getType()%></td>
						<th>작성날짜</th>
						<td class="n_ModifyTable_tdcol"><%=dto.getWritedate()%></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td style="border-right: 1px solid black;"><%=dto.getWriter()%></td>
						<th>조회수</th>
						<td><%=dto.getReadnum()%></td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="3" align="left"><input type="text"
							name="subject" size="50%"></td>
					</tr>
					<tr height="250" align="center">
						<td colspan="4" valign="top" style="border: hidden;"><textarea
								class="n_ModifyContent" rows="15" cols="100%" name="content"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="4" align="center" style="border: hidden;"><input class="n_ModifyBtn"
							type="submit" value="적용하기"></td>
					</tr>
				</table>
			</form>
		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</body>
</html>