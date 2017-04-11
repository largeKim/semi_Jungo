<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="fdto" class="tt.faq.FaqDTO" scope="page"/>
<jsp:setProperty property="*" name="fdto"/>
<jsp:useBean id="fdao" class="tt.faq.FaqDAO" scope="page"/>

<%
String cp = request.getParameter("cp");
int result = fdao.faqUpdate(fdto);

System.out.println(result);
String msg = result>0?"수정 성공!":"수정 실패!";
%>

<script>
	window.alert('<%=msg%>');
	location.href='/semi_Jungo/faqList/faq.jsp?cp=<%=cp%>';
</script>
