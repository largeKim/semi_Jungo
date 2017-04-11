<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cdto" class="tt.complain.ComplainDTO" scope="page"/>
<jsp:setProperty property="*" name="cdto"/>
<jsp:useBean id="cdao" class="tt.complain.ComplainDAO" scope="session"/>

<%
int idx = Integer.parseInt(request.getParameter("idx"));

/* 추가 수정 170328화 시작*/
String filename = request.getParameter("etc1");

if(!(filename ==null || filename.equals(""))){
	filename = filename.substring(filename.lastIndexOf("\\")+1);
	String etc1 = request.getParameter("etc1path")+filename;
	cdto.setEtc1(etc1);
	System.out.println("수정 etc1 = "+etc1);
	
}else{
	cdto.setEtc1("");
}
/* 추가 수정 170328화 끝*/
int result = cdao.complainUpdateOK(cdto);
String msg = result>0?"수정 성공!":"수정 실패!";
System.out.println(request.getParameter("cp"));
%>

<script>
	window.alert('<%=msg%>');
	location.href='/semi_Jungo/complainList/complain.jsp?cp=<%=request.getParameter("cp")%>';
</script>
