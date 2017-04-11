<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="tt.member.MemberDAO" %>
<%@ page import="tt.member.MemberDTO" %>
<%@ page import="java.util.*" %>


<%
System.out.println("호출됨");
	String id_s = request.getParameter("id");
	MemberDAO mdao = new MemberDAO();
	MemberDTO mdto = mdao.memberInfo(id_s);
	
	String info = "";
	
	if(mdto!=null){
		
		%>
		<script>		
		 	
			opener.document.blinfo.id.value="<%=mdto.getId()%>";
			opener.document.blinfo.name.value="<%=mdto.getName()%>";
			opener.document.blinfo.addr.value="<%=mdto.getAddr()%>";
			opener.document.blinfo.email.value="<%=mdto.getEmail()%>";
			opener.document.blinfo.tel.value="<%=mdto.getTel()%>";
			opener.document.blinfo.joindate.value="<%=mdto.getJoindate()%>";
			opener.document.blinfo.grade.value="<%=mdto.getGrade()%>";
			opener.document.blinfo.point.value="<%=mdto.getPoint()%>";
	
			
			window.close();
		</script>
		<%
		
	}
%>