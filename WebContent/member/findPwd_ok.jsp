<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="tt.member.MemberDAO"/>


<%
	String id = request.getParameter("id");
	String tel = request.getParameter("tel1") +"-"+ request.getParameter("tel2") +"-"+ request.getParameter("tel3");
	
	
	String pwd = mdao.findPwd(id, tel);

	if(pwd==null || pwd.equals("")){
		%>
		<script>
		window.alert('비밀번호 찾기 실패');
		location.href='findIdPwd.jsp';
		</script>
		<%
	}else{
		%>
		<script>
		window.alert('당신의 비밀번호는 <%=pwd%> 입니다.');
		location.href='findIdPwd.jsp';
		</script>
		<%
		
	}
%>