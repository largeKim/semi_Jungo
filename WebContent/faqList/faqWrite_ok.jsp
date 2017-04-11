<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="fdto" class="tt.faq.FaqDTO" scope="page"/>
<jsp:setProperty property="*" name="fdto"/>
<jsp:useBean id="fdao" class="tt.faq.FaqDAO" scope="page"/>

<%

int result = fdao.FaqAdd(fdto);
String msg=result>0? "글쓰기 성공!" : "글쓰기 실패";
%>
<script>
window.alert('글쓰기 성공!');
location.href="faq.jsp";
</script>