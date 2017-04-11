<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String result = request.getParameter("ckbox");

Cookie coo = new Cookie("key",result);
coo.setMaxAge(100);
response.addCookie(coo);
%>
<script>
	window.self.close();
</script>