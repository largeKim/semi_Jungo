<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*" %>
<jsp:useBean id="podto" class="tt.pointex.PointexDTO" scope="page"/>
<jsp:setProperty property="*" name="podto"/>
<jsp:useBean id="podao" class="tt.pointex.PointexDAO" scope="page"/>

<%
String filename = request.getParameter("picpath");

if(!(filename ==null || filename.equals(""))){
	filename = filename.substring(filename.lastIndexOf("\\")+1);
	String etc1 = request.getParameter("etc1path")+filename;
	podto.setPicpath(etc1);
	
}else{
	podto.setPicpath("");
}

int result = podao.pointExAdd(podto);
String msg = result>0?"글쓰기 성공!":"글쓰기 실패!";

%>

<script>
	window.alert('<%=msg%>');
	location.href='/semi_Jungo/member/admin/adminPointEx.jsp';

</script>