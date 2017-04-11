<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="tt.member.MemberDAO" />
<%@ page import="tt.member.MemberDTO"%>

<%
	String spwd = (String) session.getAttribute("spwd");
	String pwd = request.getParameter("pwd");
	
	System.out.println("spwd:"+spwd);
	System.out.println("pwd:"+pwd);
	
	if(spwd.equals(pwd)){
		%>
		<script>
		window.alert('비밀번호 인증 성공');
		location.href='modify.jsp';
		</script>
		<%
	}else{
		%>
		<script>
		window.alert('비밀번호 인증 실패');
		location.href='modifyCheck.jsp';
		</script>
		<%
	}
%>