<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="tt.member.MemberDAO"/>


<%
	String name = request.getParameter("name");
	String tel = request.getParameter("tel1") +"-"+ request.getParameter("tel2") +"-"+ request.getParameter("tel3");
	System.out.println("name:"+name);
	System.out.println("tel:"+tel);
	
	String id = mdao.findId(name, tel);

	if(id==null || id.equals("")){
		%>
		<script>
		window.alert('아이디 찾기 실패');
		location.href='findIdPwd.jsp';
		</script>
		<%
	}else{
		%>
		<script>
		window.alert('당신의 아이디는 <%=id%> 입니다.');
		location.href='findIdPwd.jsp';
		</script>
		<%
		
	}
%>