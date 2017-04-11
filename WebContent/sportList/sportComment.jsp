<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="scdto" class="tt.sport.comment.Sport_CommentDTO" scope="page"/>
<jsp:setProperty property="*" name="scdto"/>
<jsp:useBean id="scdao" class="tt.sport.comment.Sport_CommentDAO" scope="page"/>

<%
String cp = request.getParameter("cp");
int result = scdao.addComm(scdto);
String msg = result>0?"댓글쓰기 성공!":"댓글쓰기 실패!";
%>

<script>
	window.alert('<%=msg%>');
	location.href='/semi_Jungo/sportList/sportContent.jsp?idx=<%=scdto.getSportidx()%>&cp=<%=cp%>';
</script>
