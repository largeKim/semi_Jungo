<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="medto" class="tt.message.MessageDTO" scope="page"/>
<jsp:setProperty property="*" name="medto"/>
<jsp:useBean id="medao" class="tt.message.MessageDAO" scope="page"/>

<%

int result = medao.messageAdd(medto);
String msg=result>0? "글쓰기 성공!" : "글쓰기 실패";
%>
<script>
window.alert('글쓰기 성공!');
location.href="messageReceiveList.jsp";
</script>