<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="tt.member.MemberDAO"/>

<%
String id = request.getParameter("id");

int count = mdao.addBlack(id);

String msg = count>0?"블랙리스트 추가성공!!":"블랙리스트 추가실패..블랙리스트에 이미 존재합니다.";

%>
<script>
window.alert("<%=msg%>")
location.href='adminBlackList.jsp';
</script>