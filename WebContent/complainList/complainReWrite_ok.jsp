<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cdto" class="tt.complain.ComplainDTO" scope="page"/>
<jsp:setProperty property="*" name="cdto"/>
<jsp:useBean id="cdao" class="tt.complain.ComplainDAO" scope="page"/>

<%
int result = cdao.complainReWrite(cdto);
String msg=result>0? "답변쓰기 성공!" : "답변쓰기 실패";
%>
<script>
window.alert('글쓰기 성공!');
location.href="complain.jsp";
</script>