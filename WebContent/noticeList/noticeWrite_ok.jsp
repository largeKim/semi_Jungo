<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="ndto" class="tt.notice.NoticeDTO" scope="page"/>
<jsp:setProperty property="*" name="ndto"/>
<jsp:useBean id="ndao" class="tt.notice.NoticeDAO" scope="page"/>

<%

int result = ndao.noticeWrite(ndto);
String msg=result>0? "글쓰기 성공!" : "글쓰기 실패";
%>
<script>
window.alert('글쓰기 성공!');
location.href="notice.jsp";
</script>