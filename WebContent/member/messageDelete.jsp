<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="medto" class="tt.message.MessageDTO" scope="page"/>
<jsp:setProperty property="*" name="medto"/>
<jsp:useBean id="medao" class="tt.message.MessageDAO" scope="session"/>

<%
int idx = Integer.parseInt(request.getParameter("idx"));

int result = medao.messageDelete(idx);
String msg = result>0?"삭제 성공!":"삭제 실패!";

%>

<script>
	window.alert('<%=msg%>');
	location.href='/semi_Jungo/member/messageReceiveList.jsp';
</script>
