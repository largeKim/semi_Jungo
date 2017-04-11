<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cdto" class="tt.complain.ComplainDTO" scope="page"/>
<jsp:setProperty property="*" name="cdto"/>
<jsp:useBean id="cdao" class="tt.complain.ComplainDAO" scope="session"/>

<%
int idx = Integer.parseInt(request.getParameter("idx"));

int result = cdao.complainDelete(idx);
String msg = result>0?"삭제 성공!":"삭제 실패!";

%>

<script>
	window.alert('<%=msg%>');
	location.href='/semi_Jungo/complainList/complain.jsp';
</script>
