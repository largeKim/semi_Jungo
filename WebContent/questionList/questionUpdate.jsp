<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="tt.question.*"%>
<jsp:useBean id="qdao" class="tt.question.QuestionDAO" scope="session" />
<!-- 추가 수정 170328 화 시작 -->
<jsp:useBean id="wf" class="tt.wf.WebFolderDAO" scope="session"></jsp:useBean>
<%
	// 로그인이 필요한 메뉴에서는 필수적으로 사용하는 코드이기때문에 따로 저장하게 되면 모듈이 된다.
	String sid = (String) session.getAttribute("sid");
	if (sid == null || sid.equals("")) {
%>
<script>
	window.alert('로그인 후 서비스 이용이 가능합니다.');
	location.href = '/semi_Jungo/login.jsp';
</script>
<%
	return;
	}
	String absPath = this.getServletContext().getRealPath("/");
	String saveFolder = "productImg";
	absPath = absPath + saveFolder;
	wf.setUsers_home(absPath);
	wf.setUser(sid);
	
	String path = absPath + "/" + wf.getUser() + "/";
	
	String cp = wf.getUser();// 사용자의 현재경로 (current path)
	wf.setCr_path(cp);
	wf.isExists();
%>
<!-- 추가 수정 170328 화 끝-->
<%
	String idx_s = request.getParameter("idx");
	if (idx_s == null || idx_s.equals("")) { // endsWith("")
		idx_s = "0";
	}
	int idx = Integer.parseInt(idx_s);

	QuestionDTO dto = qdao.questionContent(idx);
	if (dto == null) {
%>
<script>
	window.alert('삭제된 게시글 또는 잘못된 접근입니다.');
	history.back();
</script>
<%
	return; // 자바스크립트가 실행되더라도 자바가 먼저 다 실행되므로 return을 해주어야 함.
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
</head>

<style>
h2 {
	text-align: center;
	margin-top: 40px;
}

.p_UpdateTable {
	border-top: 3px double black;
	margin: 0px auto;
	margin-bottom: 10px;
	width: 800px;
}

.p_UpdateTable th {
	border-bottom: 1px solid black;
	border-right: 1px solid black;
	width: 250px;
}

.Update_td1 {
	border-bottom: 1px solid black;
	border-right: 1px solid black;
}

.Update_td2 {
	border-bottom: 1px solid black;
}

.upload_bt {
	border: 1px solid black;
	background-color: white;
}

.updateContent {
	width: 630px;
	padding: 5px;
	border: 1px solid gray;
	margin: 5px;
	border-radius: 5px;
}

.upbtList {
	margin: 0px auto;
	height: 20px;
	width: 12%;
	margin-bottom: 25px;
}

.up_bt {
	background-color: white;
	display: block;
	float: left;
	border: 1px solid black;
	margin: 0px 5px 0px 5px;
	padding: 5px;
}
</style>
<script>
function imgUpload(){
		window.open('/semi_Jungo/upList/uploadFormUpdate.jsp','upload','width=380,height=180');
}
</script>
<body>
	<%@include file="../header.jsp"%>
	<section>
		<article>
			<h2>질문게시판 글 수정</h2>
			<form name="questionUpdate" action="questionUpdate_ok.jsp">
				<input type="hidden" name="idx" value="<%=dto.getIdx()%>">
				<input type="hidden" name="writer" value="<%=dto.getWriter()%>">
					<!-- 추가 수정 부분 170328화 시작-->
					<input type="hidden" name="cp" value="<%=request.getParameter("cp")%>">
					<input type="hidden" name="type" value="<%=dto.getType()%>">
					<!-- 추가 수정 부분 170328화 끝-->
				<table class="p_UpdateTable">
					<tr>
						<th>제목</th>
						<td colspan="3" class="Update_td2"><input type="text"
							name="subject" size="60" required value="<%=dto.getSubject()%>" required="required"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3" class="Update_td2"><textarea rows="10"
								cols="45" name="content" required="required"
								class="updateContent" ><%=dto.getContent().replaceAll("\n", "<br>")%></textarea></td>
					</tr>
				</table>
				<div class="upbtList">
					<input type="submit" value="글쓰기" class="up_bt"> <input
						type="reset" value="다시작성" class="up_bt">

				</div>
			</form>
		</article>
	</section>
	<%@include file="../footer.jsp"%>
</body>
</html>