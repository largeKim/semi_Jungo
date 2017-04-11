<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="scdto" class="tt.sport.comment.Sport_CommentDTO" scope="page"/>
<jsp:setProperty property="*" name="scdto"/>
<jsp:useBean id="scdao" class="tt.sport.comment.Sport_CommentDAO" scope="page"/>
<%
String sid = (String)session.getAttribute("sid");
String sportidx = request.getParameter("sportidx");
String cp = request.getParameter("cp");


if(sid==null||sid.equals("")){ // 로그인 안된 상태에서 인위적으로 idx값을 넘겨줬을 경우에 확인
	%>
	<script>
		window.alert('잘못된 접근입니다.');
		history.back();
	</script>
	<%
	return;
}
String idx_s = request.getParameter("idx");
if(idx_s==null||idx_s.equals("")){
	idx_s = "0";
}

int idx = Integer.parseInt(idx_s);

int result = scdao.delComm(idx);
String msg = result>0?"삭제성공":"삭제실패";



%>

<script>
	window.alert('<%=msg%>');
	location.href='/semi_Jungo/sportList/sportContent.jsp?idx=<%=sportidx%>&cp=<%=cp%>';
</script>