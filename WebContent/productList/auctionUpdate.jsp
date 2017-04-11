<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="tt.product.*"%>
<%@page import="java.io.*"%>
<jsp:useBean id="pdao" class="tt.product.ProductDAO" scope="session" />
<jsp:useBean id="wf" class="tt.wf.WebFolderDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>==== Team 2 ==== 글쓰기</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
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
		window.open('/semi_Jungo/upList/uploadForm.jsp','upload','width=380,height=180');
}
</script>

</head>

<%
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
	System.out.println("absPath="+absPath);
	wf.setUsers_home(absPath);
	wf.setUser(sid);
	
	String path = absPath + "/" + wf.getUser() + "/";
	System.out.println("path="+path);
	
	String cp = request.getParameter("cp");
	if(cp==null||cp.equals("")){
		cp = wf.getUser();
	}

	wf.setCr_path(cp);
	wf.isExists();
	
%>
<%
	String idx_s = request.getParameter("idx");
	if (idx_s == null || idx_s.equals("")) {
		idx_s = "0";
	}
	int idx = Integer.parseInt(idx_s);

	ProductDTO dto = pdao.productContent(idx);
	if (dto == null) {
%>
<script>
	window.alert('삭제된 게시글 또는 잘못된 접근입니다.');
	history.back();
</script>
<%
	return;
	}
%>

<body>
<%@include file="../header.jsp" %>
<section>
	<article>
		<h2>경매물품 수정하기</h2>
		<form name="auctionUpdate" action="auctionUpdate_ok.jsp">
		<input type="hidden" name="idx" value="<%=dto.getIdx()%>">
		<input type="hidden" name="writer" value="<%=dto.getWriter()%>">
		
			<table class="p_UpdateTable">
				<tr>
					<th>카테고리</th>
						<td class="Update_td1"><select name="type">
						<option value="<%=request.getParameter("type")%>"><%=request.getParameter("type")%></option>
					</select></td>
					<th>종목</th>
					
					<td class="Update_td2">
					<select name="sort">
						<option value="<%=request.getParameter("sort")%>"><%=request.getParameter("sort") %></option>
						<option value="축구">축구</option>
						<option value="야구">야구</option>
						<option value="농구">농구</option>
						<option value="배구">배구</option>
						<option value="기타">기타</option>
					</select></td>
				</tr>
				<tr>
					<th>상품 이름</th>
					<td colspan="3" class="Update_td2"><input type="text"
							name="subject" size="60" required value="<%=dto.getSubject()%>"></td>
				</tr>
				<tr>
					<th>상품 설명</th>
					<td colspan="3" class="Update_td2"><textarea rows="10"
								cols="45" name="content" required="required"
								class="updateContent"><%=dto.getContent().replaceAll("\n", "<br>")%></textarea></td>
				
				</tr>
				
				<tr>
					<th>경매 종료일</th>
					<td colspan="2" class="Update_td1" width="400px">
					<input type="date" name="writedate_s">
					</td>
					<td class="Update_td2" align="center">
					<input type="button" value="사진 올리기" onclick="imgUpload()" class="upload_bt">
					<input type="hidden" name="etc1path" value="/semi_Jungo/<%=saveFolder%>/<%=wf.getCr_path()%>/">
					<input type="hidden" name="currentPath" value="<%=dto.getEtc1()%>">						
					<input type="text" name="etc1" readonly="readonly"></td>
				</tr>
				<tr>
					<th>경매 시작가격</th>
					<td  class="Update_td2"><input type="number" name="price" required min="1000" step="1000"></td>
					<th>즉시 구매 가격</th>
					<td  class="Write_td2"><input type="number" name="getprice" min="1000" step="1000"></td>
				</tr>
			</table>
			<div class="upbtList">
			<input type="submit" value="수정하기" class="up_bt">
					<input type="reset" value="다시작성" class="up_bt">
			</div>
		</form>
	</article>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>