<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="fdao" class="tt.faq.FaqDAO" scope="page"/>

<%
int idx = Integer.parseInt(request.getParameter("idx"));
String cp = request.getParameter("cp");
int result = fdao.faqDelete(idx);
String msg = result>0?"삭제 성공!":"삭제 실패!";

%>

<script>
	window.alert('<%=msg%>');
	location.href='/semi_Jungo/faqList/faq.jsp?cp=<%=cp%>';
</script>
