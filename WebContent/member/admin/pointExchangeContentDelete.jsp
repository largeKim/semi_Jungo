<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sedto" class="tt.sendpresent.SendPresentDTO"
scope="page"/>
<jsp:setProperty property="*" name="sedto"/>
<jsp:useBean id="sedao" class="tt.sendpresent.SendpresentDAO"
scope="session"/>
<%
int idx = Integer.parseInt(request.getParameter("idx"));

int result = sedao.peDelete(idx);
String msg = result>0?"삭제완료":"삭제실패";
%>
<<script type="text/javascript">
<!-- 삭제시 알림창 -->
window.alert('<%=msg%>');
location.href='/semi_Jungo/member/admin/adminPointEx.jsp';
</script>