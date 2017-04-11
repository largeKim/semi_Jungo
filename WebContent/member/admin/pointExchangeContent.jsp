<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="tt.sendpresent.*"%>
    <jsp:useBean id="sedao" class="tt.sendpresent.SendpresentDAO" scope="page"/>
<%
String idx_s = request.getParameter("idx");
if(idx_s==null||idx_s.equals("")){
	idx_s="0";
}
int idx=Integer.parseInt(idx_s);
SendPresentDTO sedto = sedao.peContent(idx);
if(sedto==null){
	%>
	<script>
	window.alert('삭제된 게시글 또는 잘못된 접근입니다.');
	location href='complain.jsp'
	</script>
	<%
	return;
}
String sgrade_n = (String) session.getAttribute("sgrade");
if(sgrade_n==null){
	sgrade_n="1";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
</head>
<body>
<%@include file="/../header.jsp" %>
<section>
<article>
	<h2><%=sedto.getId() %>님의 배송정보</h2>
	<table border="1" width="550" cellspacing="0">
		<tr>
			<th>받는사람</th>
			<td><%=sedto.getId() %></td>
			<th>작성날짜</th>
			<td><%=sedto.getSenddate()%></td>
		</tr>	
		<tr>
			<th>주문자</th>
			<td><%=sedto.getId() %></td>
			<th>배송지</th>
			<td><%=sedto.getRaddress() %></td>
		</tr>
		<tr>
			<th>요구사항</th>
			<td colspan="4" align="left" valign="top">
			<%=sedto.getYourorder().replaceAll("\n", "<br>") %>
			</td>
		</tr>
		<tr>
			<td colspan="4" align="center">
			<a href="adminPointEx.jsp">목록보기</a>
			<%
			if(sgrade_n.equals("0")){
			%>
			&nbsp;|&nbsp;
			<a href="pointExchangeContentDelete.jsp?idx=<%=sedto.getIdx()%>">삭제하기</a>&nbsp;|&nbsp;
			<a href="pointExchangeContentModify.jsp?idx=<%=sedto.getIdx() %>">수정하기</a>
			<%
			}
			%>
			</td>
		</tr>
	</table>
</article>
</section>
<%@include file="/../footer.jsp" %>
</body>
</html>