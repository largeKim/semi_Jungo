<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="tt.member.MemberDAO"/>
<jsp:useBean id="mdto" class="tt.member.MemberDTO"/>
<jsp:setProperty property="*" name="mdto"/>
<% 

	String sid = (String) session.getAttribute("sid");
	int count = mdao.getPoint(mdto,sid);
	session.setAttribute("point", count);

%>
<script>
	location.href='/semi_Jungo/index.jsp';
</script>