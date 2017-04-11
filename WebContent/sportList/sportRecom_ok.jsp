<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sdao" class="tt.sport.SportDAO" scope="page"/>
<jsp:useBean id="srdao" class="tt.sport.recom.RecomDAO" scope="page"/>
<%
String idx = request.getParameter("idx");
String id = request.getParameter("id");
String cp = request.getParameter("cp");

String idcode = id+idx;
int result = 0;

if(srdao.chkRecom(idcode)){ //idcode를 조작하더라도 중복 추천이 되지 않게 검사
	result = sdao.recomContent(Integer.parseInt(idx)) + srdao.addRecom(idcode);
}

if(result==2){
%>
<script>
	window.alert('추천되었습니다.');
	location.href='/semi_Jungo/sportList/sportContent.jsp?idx=<%=idx%>&cp=<%=cp%>';
</script>
<%
}else{
%>
<script>
	window.alert('오류가 발생하였습니다.');
	location.href='/semi_Jungo/sportList/sportContent.jsp?idx=<%=idx%>&cp=<%=cp%>';
</script>
<%
}
%>