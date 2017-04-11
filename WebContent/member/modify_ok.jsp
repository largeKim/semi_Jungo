<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="mdao" class="tt.member.MemberDAO"/>
<jsp:useBean id="mdto" class="tt.member.MemberDTO"/>
<jsp:setProperty property="*" name="mdto"/>

<%

	int count = mdao.memberModify(mdto);

	String msg = count>0?"수정성공!!":"수정실패....";
	

%>
<script>
window.alert("<%=msg%>")
location.href='../index.jsp';
</script>