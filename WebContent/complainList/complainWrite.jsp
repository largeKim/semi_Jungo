<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="tt.complain.*"
	import="java.io.*"%>
<jsp:useBean id="wf" class="tt.wf.WebFolderDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<style>
h2 {
	text-align: center;
	margin-top: 40px;
}

.p_WriteTable {
	border-top: 3px double black;
	margin: 0px auto;
	margin-bottom: 10px;
	width: 800px;
	border-spacing: 0px;
}

.p_WriteTable th {
	border-bottom: 1px solid black;
	border-right: 1px solid black;
	width: 250px;
}

.p_WriteTable td {
	border-bottom: 1px solid black;
}

.writeContent {
	width: 630px;
	padding: 5px;
	border: 1px solid gray;
	margin: 5px;
	border-radius: 5px;
}

.wrbtList {
	margin: 0px auto;
	height: 20px;
	width: 12%;
	margin-bottom: 25px;
}

.wr_bt {
	background-color: white;
	display: block;
	float: left;
	border: 1px solid black;
	margin: 0px 5px 0px 5px;
	padding: 5px;
}

.c_writebt {
	border: 1px solid black;
	background-color: white;
	padding: 5px 10px 5px 10px;
	margin-top: 10px;
}
.imgUpbt{
	border: 1px solid black;
	background-color: white;
}
</style>
<%
	String sid = (String) session.getAttribute("sid");
	String sgrade = (String) session.getAttribute("sgrade");
	if (sid == null || sid.equals("")) {
%>
<script>
	window.alert('로그인 후 서비스이용이 가능하십니다.');
	location.href = '/semi_Jungo/login.jsp';
</script>
<%
	return;
	}
	String absPath = this.getServletContext().getRealPath("/");
	String saveFolder = "complainImg";
	absPath = absPath + saveFolder;
	wf.setUsers_home(absPath);
	wf.setUser(sid);

	String path = absPath + "/" + wf.getUser() + "/";

	String cp = request.getParameter("writer");// 사용자의 현재경로 (current path)
	if (cp == null || cp.equals("")) {
		cp = wf.getUser();
	}

	wf.setCr_path(cp);
	wf.isExists();
%>
<script>
	function imgUpload() {
		window.open('uploadForm.jsp', 'upload', 'width=380,height=180');
	}
</script>

</head>
<body>
	<%@ include file="../header.jsp"%>
	<section>
		<article>
			<h2>고객의소리 글쓰기</h2>
			<form name="complainWrite" action="complainWrite_ok.jsp">
				<input type="hidden" name="writer" value="<%=sid%>"> <input
					type="hidden" name="type" value="신고">
				<table class="p_WriteTable">
					<tr>
						<th>제목</th>
						<td colspan="3"><input type="text" name="subject" size="45" required="required">
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3"><textarea rows="10" cols="45" name="content"
								required class="writeContent" required="required"></textarea></td>
					</tr>
					<tr>
						<th>사진 등록</th>
						<td colspan="2" width="400px">경로</td>
						<td class="Write_td2" align="center"><input type="button"
							value="사진 올리기" onclick="imgUpload()" class="imgUpbt"> <input
							type="hidden" name="etc1path"
							value="/semi_Jungo/<%=saveFolder%>/<%=wf.getCr_path()%>/">
							<input type="text" name="etc1" readonly="readonly"></td>
					</tr>
					<tr>
						<td colspan="4" align="center" style="border: hidden;"><input type="submit"
							value="글쓰기" class="c_writebt"> <input type="reset"
							value="다시" class="c_writebt"></td>
					</tr>
				</table>
			</form>
		</article>
	</section>
	<%@ include file="../footer.jsp"%>
</body>
</html>