<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="qdto" class="tt.question.QuestionDTO" scope="page"/>
<jsp:setProperty property="*" name="qdto"/>
<jsp:useBean id="qdao" class="tt.question.QuestionDAO" scope="page"/>

<%
int result = qdao.questionReWrite(qdto);
String msg=result>0? "답변쓰기 성공!" : "답변쓰기 실패";
%>
<script>
window.alert('글쓰기 성공!');
location.href="question.jsp";
</script>