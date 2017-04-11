<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="sdao" class="tt.sport.SportDAO" scope="page"/>

<%
int idx = Integer.parseInt(request.getParameter("idx"));
String sort = request.getParameter("sort");
int result = sdao.deleteContent(idx);
String msg = result>0?"삭제 성공!":"삭제 실패!";

%>

<script>
	window.alert('<%=msg%>');
	location.href='/semi_Jungo/sportList/<%=sort%>List.jsp';
</script>
    