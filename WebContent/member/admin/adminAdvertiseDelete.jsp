<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="adto" class="tt.advertise.AdvertiseDTO"
scope="page"/>
<jsp:setProperty property="*" name="adto"/>
<jsp:useBean id="adao" class="tt.advertise.AdvertiseDAO"
scope="session"/>
<%
int idx = Integer.parseInt(request.getParameter("idx"));

int result = adao.advDelete(idx);
String msg = result>0?"삭제완료":"삭제실패";
%>
<script>
<!-- 삭제시 알림창 -->
window.alert('<%=msg%>');
location.href='adminAdvertiseContent.jsp';
</script>