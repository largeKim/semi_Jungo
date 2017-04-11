<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sdto" class="tt.sport.SportDTO" scope="page"/>
<jsp:setProperty property="*" name="sdto"/>
<jsp:useBean id="sdao" class="tt.sport.SportDAO" scope="page"/>

<%
int result = sdao.updateContent(sdto);
String msg = result>0?"수정하기 성공!":"수정하기 실패!";
%>

<script>
	window.alert('<%=msg%>');
	location.href='/semi_Jungo/sportList/<%=sdto.getSort()%>List.jsp';
</script>
    