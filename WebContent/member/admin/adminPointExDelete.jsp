<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="podao" class="tt.pointex.PointexDAO" scope="page"/>

<%
int idx = Integer.parseInt(request.getParameter("idx"));

int result = podao.pointExDelete(idx);
String msg = result>0?"삭제 성공!":"삭제 실패!";

%>

<script>
	window.alert('<%=msg%>');
	location.href='/semi_Jungo/member/admin/adminPointEx.jsp';
</script>
