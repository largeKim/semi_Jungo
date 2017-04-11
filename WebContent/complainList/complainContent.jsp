<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="tt.complain.*"%>
<jsp:useBean id="cdao" class="tt.complain.ComplainDAO" scope="session" />
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
	ComplainDTO dto = cdao.complainContent(idx);
	if (dto == null) {
%>
<script>
	window.alert('삭제된 게시글 또는 잘못된 접근입니다.');
	location
	href = 'complain.jsp'
</script>
<%
	return;
	}
	String sid_c = (String) session.getAttribute("sid");
	if(sid_c==null || sid_c.equals("")){
		sid_c="";
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
}

.content_td {
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

.content {
	height: 300px;
	border: 1px solid black;
	border-radius: 5px;
	margin-top: 10px;
	padding: 5px;
}

.contentImg {
	width: 100%;
	text-align: center;
	margin-top: 10px;
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
			<h2>신고게시판 본문보기</h2>
			<table class="p_contentTable">
				<tr>
					<th>제목</th>
					<td class="content_td" colspan="3" align="left"><%=dto.getSubject()%></td>
				</tr>
				<tr>
					<th>글</th>
					<td class="content_td" style="border-right: 1px solid black;"><%=dto.getType()%></td>
					<th>작성날짜</th>
					<td class="content_td"><%=dto.getWritedate()%></td>
				</tr>
				<tr>
					<th>ID</th>
					<td class="content_td" style="border-right: 1px solid black;"><%=dto.getWriter()%></td>
					<th>조회수</th>
					<td class="content_td"><%=dto.getReadnum()%></td>
				</tr>
				<tr>
					<td class="content_td" colspan="4" align="left" valign="top">
						<!-- 추가 수정부분 170330 목 시작 -->
						<div class="contentImg">
							<%
								if (dto.getEtc1() == null || dto.getEtc1().equals("")) {
							%>
							등록된 사진이 없습니다...<br>
							<%
								} else {
							%>
							<img src="<%=dto.getEtc1()%>" id="img"><br>
							<%
								}
							%>
						</div>
						<div class="content">
							<%=dto.getContent() == null ? "" : dto.getContent().replaceAll("\n", "<br>")%></div>
						<!-- 추가 수정부분 170330 목 끝 -->
					</td>
				</tr>
			</table>
			<div class="btList">
				<%
					if (sid_c.equals(dto.getWriter())) {
				%>
				<div class="content_bt">
					<a
						href="complain.jsp?cp=<%=request.getParameter("cp") == null ? "1" : request.getParameter("cp")%>">목록보기</a>
				</div>
				<div class="content_bt">
					<a
						href="complainReWrite.jsp?subject=<%=dto.getSubject()%>&ref=<%=dto.getRef()%>&lev=<%=dto.getLev()%>&sunbun=<%=dto.getSunbun()%>&type=<%=dto.getType()%>">답글쓰기</a>
				</div>
				<div class="content_bt">
					<a
						href="complainDelete.jsp?idx=<%=dto.getIdx()%>&cp=<%=request.getParameter("cp")%>&type=<%=dto.getType()%>">삭제하기</a>
				</div>
				<div class="content_bt">
					<a
						href="complainUpdate.jsp?idx=<%=dto.getIdx()%>&cp=<%=request.getParameter("cp")%>&type=<%=dto.getType()%>">수정하기</a>
				</div>
				<%
					} else {
				%>
				<div class="btList_none">
					<div class="content_bt">
						<a
							href="complain.jsp?cp=<%=request.getParameter("cp") == null ? "1" : request.getParameter("cp")%>">목록보기</a>
					</div>
					<div class="content_bt">
						<a
							href="complainReWrite.jsp?subject=<%=dto.getSubject()%>&ref=<%=dto.getRef()%>&lev=<%=dto.getLev()%>&sunbun=<%=dto.getSunbun()%>&type=<%=dto.getType()%>">답글쓰기</a>
					</div>
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