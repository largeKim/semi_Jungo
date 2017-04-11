<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="adao" class="tt.advertise.AdvertiseDAO"></jsp:useBean>

<%
int idx = Integer.parseInt(request.getParameter("idx"));

int count = adao.advChoice(idx);

if(count > 0){
	%>
	<script>
	window.alert('광고 설정 성공!');
	window.location.href='../../index.jsp'
	</script>
	<%
}else{
	%>
	<script>
	window.alert('광고 설정 실패..');
	window.location.href='../../index.jsp'
	</script>
	<%
}
%>
