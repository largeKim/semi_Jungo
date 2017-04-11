<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="tt.member.MemberDAO" />
<jsp:useBean id="smdto" class="tt.member.MemberDTO" />
<%@ page import="java.util.*" %>


<%

	String id_s = request.getParameter("id");
	smdto = mdao.memberInfo(id_s);
	
if(smdto!=null && smdto.getId()!=null){
		
		
		%>
		<script>	
		
		
		opener.document.blinfo.id.value="<%=smdto.getId()%>";
		opener.document.blinfo.name.value="<%=smdto.getName()%>";
		opener.document.blinfo.addr.value="<%=smdto.getAddr()%>";
		opener.document.blinfo.email.value="<%=smdto.getEmail()%>";
		opener.document.blinfo.tel.value="<%=smdto.getTel()%>";
		opener.document.blinfo.joindate.value="<%=smdto.getJoindate()%>";
		opener.document.blinfo.grade.value="<%=smdto.getGrade()%>";
		opener.document.blinfo.point.value="<%=smdto.getPoint()%>";
		opener.document.blinfo.black.value="<%=smdto.getBlack()==1?"예":"아니오"%>";
		
		opener.document.addblack.id.value="<%=smdto.getId()%>";
		opener.document.delblack.id.value="<%=smdto.getId()%>";
		opener.document.memexit.id.value="<%=smdto.getId()%>";
		
		window.self.close();
		</script>
		<%
		
	}else{
		System.out.println("하하하 ");
	%>
	<script>
	window.alert('없는 아이디 입니다.');
	window.self.close();
	</script>
	<%
		
	}
%>