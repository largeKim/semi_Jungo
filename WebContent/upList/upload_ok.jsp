<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.*" %>
<jsp:useBean id="wf" class="tt.wf.WebFolderDAO" scope="session"></jsp:useBean>
<% 
String savepath = wf.getUsers_home()+"/"+wf.getCr_path(); // 경로 설정
String upload = request.getParameter("upload");

try{
	MultipartRequest mr = new MultipartRequest(request,savepath,wf.getFreeSize(),"UTF-8"); // 1.리퀘스트 객체 그 자체, 2.경로, 3.남은 파일사이즈, 4.변환방식
	
}catch(Exception e){
	e.printStackTrace();
	%>
	<script>
		window.alert('너무 큰 용량이거나 예기치 못한 상황이 발생함.');
	</script>
	<%
}

%>

	<script>
		location.reload();
		window.alert('파일 업로드 성공');
		window.self.close();
	</script>
