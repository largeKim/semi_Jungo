<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="tt.notice.*"%>
<jsp:useBean id="ndao" class="tt.notice.NoticeDAO" scope="session"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<%
String idx_s = request.getParameter("idx");
if(idx_s==null||idx_s.equals("")){
	idx_s="0";
}
int idx=Integer.parseInt(idx_s);
NoticeDTO dto = ndao.noticeContent(idx);
if(dto==null){
	%>
	<script>
	window.alert('삭제된 게시글 또는 잘못된 접근입니다.');
	location href='notice.jsp'
	</script>
	<%
	return;
}
String sgrade_n = (String) session.getAttribute("sgrade");
if(sgrade_n==null){
	sgrade_n="1";
}
%>   
<style>
.n_ContentTable{
	margin: 0px auto;
	margin-bottom: 10px;
	width: 800px;
	border-spacing: 0px;
	border-top: 3px double black;
}
.n_ContentTable_top{

	text-align: center;
}
.n_ContentTable th {
	border-bottom: 1px solid black;
	border-right: 1px solid black;
	width: 150px;
}
.n_ContentTable td {
	border-bottom: 1px solid black;
}

.n_ContentBtn {
	background-color: white;
	border: 1px solid black;
	margin: 0px 5px 0px 5px;
	padding: 5px 10px 5px 10px;
	font-size: 13px;
}
.n_ContentContent {
	width: 630px;
	padding: 5px;
	border: 1px solid gray;
	margin: 5px;
	border-radius: 5px;
}
.n_ContentTable a:link { /* 링크가 걸려있는 리스트 모양 */
	color: black;
	text-decoration: none;
}

.n_ContentTable a:visited { /* 링크를 누른 후 모양 */
	color: black;
	text-decoration: none;
}

.n_ContentTable a:hover { /* 마우스를 가져다 댈 때 모양 */
	color: red;
}
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
<article>
	<h2 class="n_ContentTable_top">공지사항 내용보기</h2>
	<table class="n_ContentTable">
		<tr>
			<th>글</th>
			<td style="border-right: 1px solid black;"><%=dto.getType() %></td>
			<th>작성날짜</th>
			<td><%=dto.getWritedate() %></td>
		</tr>	
		<tr>
			<th>작성자</th>
			<td style="border-right: 1px solid black;"><%=dto.getWriter() %></td>
			<th>조회수</th>
			<td><%=dto.getReadnum() %></td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3" align="left">
			<%=dto.getSubject() %>
			</td>
		</tr>
		<tr height="250">
			<td colspan="4" align="center" valign="top" style="border: hidden;">
			<textarea class="n_ContentContent" rows="15" cols="100%" name="content" readonly="readonly"><%=dto.getContent().replaceAll("\n", "<br>") %></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="4" align="center" style="border: hidden;">
			<a class="n_ContentBtn" href="notice.jsp">목록보기</a>
			<%
			if(sgrade_n.equals("0")){
			%>
			<a class="n_ContentBtn" href="noticeDelete.jsp?idx=<%=dto.getIdx()%>">삭제하기</a>
			<a class="n_ContentBtn" href="noticeModify.jsp?idx=<%=dto.getIdx() %>">수정하기</a>
			<%
			}
			%>
			</td>
		</tr>
	</table>
</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>