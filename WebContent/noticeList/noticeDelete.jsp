<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="ndto" class="tt.notice.NoticeDTO"
scope="page"/>
<jsp:setProperty property="*" name="ndto"/>
<jsp:useBean id="ndao" class="tt.notice.NoticeDAO"
scope="session"/>
<%
int idx = Integer.parseInt(request.getParameter("idx"));

int result = ndao.noticeDelete(idx);
String msg = result>0?"삭제완료":"삭제실패";
%>
<<script type="text/javascript">
<!-- 삭제시 알림창 -->
window.alert('<%=msg%>');
location.href='/semi_Jungo/noticeList/notice.jsp';
</script>