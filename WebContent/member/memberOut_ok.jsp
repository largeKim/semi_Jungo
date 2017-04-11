<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdto" class="tt.member.MemberDTO"></jsp:useBean>
<jsp:useBean id="mdao" class="tt.member.MemberDAO"></jsp:useBean>
	<jsp:setProperty property="*" name="mdto"/>
	
<%
	System.out.println("mdto.getId()"+mdto.getId());
	System.out.println("mdto.getPwd()"+mdto.getPwd());
	
	int result = mdao.memberOut(mdto.getId(), mdto.getPwd());
		
	String msg = result>0?"회원탈퇴 성공.":"회원탈퇴중 문제가 발생하였습니다.";

	if(result>0){
		session.invalidate();
	}
%>
<script>
window.alert('<%=msg%>');
<%
if(result>0){
	%>
	location.href='../index.jsp';
	<%
}else{
	%>
	location.href='memberOut.jsp';
	<%
}
%>
</script>