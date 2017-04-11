<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cdto" class="tt.complain.ComplainDTO" scope="page"/>
<jsp:setProperty property="*" name="cdto"/>
<jsp:useBean id="cdao" class="tt.complain.ComplainDAO" scope="page"/>

<%


System.out.println("getEtc:"+cdto.getEtc1());

String filename = request.getParameter("etc1");

if(!(filename ==null || filename.equals(""))){
	filename = filename.substring(filename.lastIndexOf("\\")+1);
	String etc1 = request.getParameter("etc1path")+filename;
	cdto.setEtc1(etc1);
	System.out.println("글쓰기etc1 = "+etc1);
	
}else{
	cdto.setEtc1("");
}

int result = cdao.complainAdd(cdto);
String msg = result>0?"글쓰기 성공!":"글쓰기 실패!";

%>

<script>
	window.alert('<%=msg%>');
	location.href='complain.jsp';

</script>