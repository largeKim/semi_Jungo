<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sdto" class="tt.sport.SportDTO" scope="page"/>
<jsp:setProperty property="*" name="sdto"/>
<jsp:useBean id="sdao" class="tt.sport.SportDAO" scope="session"/>

<%
String filename = request.getParameter("picpath");
if(!(filename ==null || filename.equals(""))){
	filename = filename.substring(filename.lastIndexOf("\\")+1);
	String picpath = request.getParameter("picpath_path")+filename;
	sdto.setPicpath(picpath);
}else{
	sdto.setPicpath("");
}
int result = sdao.sportReWrite(sdto);
String msg = result>0?"글쓰기 성공!":"글쓰기 실패!";
%>

<script>
	window.alert('<%=msg%>');
	location.href='/semi_Jungo/sportList/<%=sdto.getSort()%>List.jsp';
	
</script>
    