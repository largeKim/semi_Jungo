<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="tt.message.*"%>
<jsp:useBean id="medao" class="tt.message.MessageDAO" scope="session" />
<%
	String sid = (String)session.getAttribute("sid");
	System.out.println("sid = " + sid);
	
	/** 	추가 수정부분 170329 수 시작	 */ 
	if(sid==null){
		sid = "";
	}
	/** 	추가 수정부분 170329 수 끝 	*/
	
	String idx_s = request.getParameter("idx");
	if (idx_s == null || idx_s.equals("")) { // endsWith("")
		idx_s = "0";
	}
	int idx = Integer.parseInt(idx_s);
	
	MessageDTO dto = medao.messageContent(idx);
	System.out.println("dto.getSender()"+dto.getSender());
	if (dto == null) {
%>
<script>
	window.alert('삭제된 게시글 또는 잘못된 접근입니다.');
	window.location.href = 'productBuyList.jsp';
</script>
<%
	return; 	// 자바스크립트가 실행되더라도 자바가 먼저 다 실행되므로 return을 해주어야 함.
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<style type="text/css">
h2 {
	text-align: center;
	margin-top: 40px;
}

.p_contentTable {
	border-top: 3px double black;
	margin: 0px auto;
	margin-bottom: 10px;
	width: 800px;
}

.p_contentTable th {
	border-bottom: 1px solid black;
	border-right: 1px solid black;
	width: 150px;
}

.p_contentTable td {
	padding-left: 5px;
}

.content_td {
	border-bottom: 1px solid black;
}

.content {
	width: 800px;
	height: 400px;
	margin: 0px auto;
	margin-top: 10px;
	padding: 10px;
	border: 1px solid gray;
	border-radius: 5px;
}

.btList {
	height: 40px;
	width: 28%;
	margin: 0px auto;	
}

.content_bt {
	border: 1px solid black;
	display: block;
	float: left;
	text-align: center;
	margin: 0px 5px 0px 5px;
	padding: 8px 10px 8px 10px;
	font-size: 13px;
}

.content_bt a:LINK {
	color : black;
	text-decoration: none;
}
.content_bt a:VISITED {
	color : black;
	text-decoration: none;
}
.content_bt a:HOVER {
	color : red;
}

</style>
</head>
<body>
	<%@include file="../header.jsp"%>
	<section>
		<h2>
			|
			쪽 지 |
		</h2>
		<article>
			<form name="messageWrite">
				<table class="p_contentTable">
					<tr>
						<th>작성자</th>
						<td class="content_td" style="border-right: 1px solid black;"><%=dto.getSender()%></td>
						<th>받는사람</th>
						<td class="content_td" ><%=dto.getReceiver()%></td>
					</tr>
					<tr>
						<th>제목</th>
						<td class="content_td" style="border-right: 1px solid black;"><%=dto.getSubject()%></td>
						<th>날짜</th>
						<td class="content_td"><%=dto.getWritedate()%></td>
					</tr>
					<tr height="350">
						<td colspan="4" align="left" valign="top">
						<div class="content"><%=dto.getContent().replaceAll("\n", "<br>")%></div>
						</td>
					</tr>
				</table>
				<div class="btList">
					<div class="content_bt">
					<!-- 	추가 수정 부분 170328 화 		시작-->
					<a href="javascript:history.back()">목록보기</a>
					</div>
					<div class="content_bt">
						<a href="messageDelete.jsp?idx=<%=dto.getIdx()%>&cp=<%=request.getParameter("cp")%>">삭제하기</a>
					</div>
				
					<div class="content_bt">
						<a href="messageReWrite.jsp?sender=<%=dto.getSender()%>">답변하기</a>	
					</div>
	
					<!-- 	추가 수정 부분 170328 화 		끝-->
				</div>
			</form>
		</article>
	</section>
	<%@include file="../footer.jsp"%>
</body>
</html>