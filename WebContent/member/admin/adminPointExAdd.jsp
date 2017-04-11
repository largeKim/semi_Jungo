<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<jsp:useBean id="wf" class="tt.wf.WebFolderDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<%
	// 로그인이 필요한 메뉴에서는 필수적으로 사용하는 코드이기때문에 따로 저장하게 되면 모듈이 된다.
	String sid = (String) session.getAttribute("sid");
	if (sid == null || sid.equals("")) {
%>
<script>
	window.alert('로그인 후 서비스 이용이 가능합니다.');
	location.href = '/semi_Jungo/exLogin/login.jsp';
</script>
<%
	return;
	}

	String absPath = this.getServletContext().getRealPath("/");
	String saveFolder = "pointImg";
	absPath = absPath + saveFolder;
	System.out.println("absPath="+absPath);
	wf.setUsers_home(absPath);
	wf.setUser(sid);
	
	String path = absPath + "/" + wf.getUser() + "/";
	System.out.println("path="+path);
	
	String cp = request.getParameter("cp");// 사용자의 현재경로 (current path)
	if(cp==null||cp.equals("")){
		cp = wf.getUser();
	}

	wf.setCr_path(cp);
	wf.isExists();
	
%>

<html>
<head>
<meta charset="UTF-8">
<title>==== Team 2 ==== 포인트 상품 등록</title>
<link rel="stylesheet" type="text/css" href="../../css/mainLayout.css">
<script>
function imgUpload(){
		window.open('/semi_Jungo/upList/uploadForm_point.jsp','upload','width=380,height=180');
}
</script>

</head>

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
}

.p_WriteTable th {
	border-bottom: 1px solid black;
	border-right: 1px solid black;
	width: 250px;
}

.Write_td1 {
	border-bottom: 1px solid black;
	border-right: 1px solid black;
}

.Write_td2 {
	border-bottom: 1px solid black;
}

.write_bt {
	border: 1px solid black;
	background-color: white;
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
</style>

<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<h2>글쓰기</h2>
		<form name="pointAdd" action="adminPointExAdd_ok.jsp">
			<table class="p_WriteTable">
				<tr>
					<th>상품 이름</th>
					<td class="Write_td2"><input type="text" name="pname" required></td>
					<th>상품 수량</th>
					<td class="Write_td2"><input type="number" name="pnum" required></td>
				</tr>
				<tr>
					<th>상품코드</th>
					<td class="Write_td2"><input type="text" name="pcode" required></td>
					<th>가격</th>
					<td class="Write_td2"><input type="number" name="pprice" required></td>
				</tr>
				<tr>
					<th>사진 등록</th>
					<td class="Write_td1" width="200px">경로</td>
					<td class="Write_td2" align="center"><input type="button" value="사진 올리기" onclick="imgUpload()" class="write_bt"></td>
					<td class="Write_td2" align="center">
					<input type="hidden" name="etc1path" value="/semi_Jungo/<%=saveFolder%>/<%=wf.getCr_path()%>/">
					<input type="text" name="picpath" readonly="readonly"></td>
				</tr>
			</table>
			<div class="wrbtList">
			<input type="submit" value="글쓰기" class="wr_bt">
					<input type="reset" value="다시작성" class="wr_bt">
			</div>
		</form>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>