<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="podto" class="tt.pointex.PointexDTO" scope="page"/>
<jsp:setProperty property="*" name="podto"/>
<jsp:useBean id="podao" class="tt.pointex.PointexDAO" scope="page"/>

<%
/* 추가 수정 170328화 시작*/
String filename = request.getParameter("picpath");

if(!(filename ==null || filename.equals(""))){
	filename = filename.substring(filename.lastIndexOf("\\")+1);
	String etc1 = request.getParameter("etc1path")+filename;
	podto.setPicpath(etc1);
	
}else{
	podto.setPicpath("");
}
/* 추가 수정 170328화 끝*/
int result = podao.pointExUpdate(podto);
String msg = result>0?"수정 성공!":"수정 실패!";

%>

<script>
	window.alert('<%=msg%>');
	location.href='/semi_Jungo/member/admin/adminPointEx.jsp';
</script>
