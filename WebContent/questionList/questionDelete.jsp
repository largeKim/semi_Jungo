<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="qdto" class="tt.question.QuestionDTO" scope="page"/>
<jsp:setProperty property="*" name="qdto"/>
<jsp:useBean id="qdao" class="tt.question.QuestionDAO" scope="session"/>

<%
int idx = Integer.parseInt(request.getParameter("idx"));

int result = qdao.questionDelete(idx);
String msg = result>0?"삭제 성공!":"삭제 실패!";

%>

<script>
	window.alert('<%=msg%>');
	location.href='/semi_Jungo/questionList/question.jsp';
</script>
