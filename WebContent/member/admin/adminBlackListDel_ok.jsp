<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="tt.member.MemberDAO"/>

<%

String id = request.getParameter("id");


int count = mdao.delBlack(id);
System.out.println("id:"+id);
System.out.println("count = "+count);
String msg = count>0?"블랙리스트 삭제성공!!":"블랙리스트 삭제 실패..";

%>
<script>
window.alert("<%=msg%>")
location.href='adminBlackList.jsp';
</script>