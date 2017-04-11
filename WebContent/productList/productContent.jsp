<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="tt.product.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="pdao" class="tt.product.ProductDAO" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<%
	String sid = (String) session.getAttribute("sid");
	System.out.println("sid = " + sid);

	/** 	추가 수정부분 170329 수 시작	 */
	if (sid == null) {
		sid = "";
	}
	/** 	추가 수정부분 170329 수 끝 	*/

	String idx_s = request.getParameter("idx");
	if (idx_s == null || idx_s.equals("")) { // endsWith("")
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
	return; // 자바스크립트가 실행되더라도 자바가 먼저 다 실행되므로 return을 해주어야 함.
	}
%>
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
	color: black;
	text-decoration: none;
}

.content_bt a:VISITED {
	color: black;
	text-decoration: none;
}

.content_bt a:HOVER {
	color: red;
}

.content {
	background-color: pink;
	height: 300px;
	border: 1px solid black;
	border-radius: 5px;
	margin-top: 10px;
}

.contentImg {
	width: 100%;
	background-color: skyblue;
	text-align: center;
	margin-top: 10px;
}
</style>
</head>
<body>
	<%@include file="../header.jsp"%>
	<section>
		<h2>
			|
			<%=dto.getIdx()%>번 게 시 물 |
		</h2>
		<article>
			<form name="productWrite">
				<table class="p_contentTable">
					<tr>
						<th>번호</th>
						<td style="border-right: 1px solid black;" class="content_td"><%=dto.getIdx()%></td>
						<th>날짜</th>
						<td class="content_td"><%=dto.getWritedate()%></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td class="content_td" style="border-right: 1px solid black;"><%=dto.getWriter()%></td>
						<th>조회수</th>
						<td class="content_td"><%=dto.getReadnum()%></td>
					</tr>
					<tr>
						<th>상품이름</th>
						<td colspan="3" class="content_td"><%=dto.getSubject()%></td>
					</tr>
					<tr>
						<td colspan="4" align="left" valign="top">
							<!-- 추가 수정부분 170330 목 시작 -->
							<div class="contentImg">
								<%
									if (dto.getEtc1() == null || dto.getEtc1().equals("")) {
								%>
								등록된 사진이 없습니다...<br>
								<%
									} else {
								%>
								<img src="<%=dto.getEtc1()%>" id="img" width="300px"><br>
								<%
									}
								%>
							</div>
							<div class="content">
								<%=dto.getContent() == null ? "" : dto.getContent().replaceAll("\n", "<br>")%></div>
							<!-- 추가 수정부분 170330 목 끝 -->
						</td>
					</tr>
				</table>
				<div class="btList">
					<div class="content_bt">
						<!-- 	추가 수정 부분 170328 화 		시작-->
						<a
							href="product<%=dto.getType()%>List.jsp?cp=<%=request.getParameter("cp") == null ? "1" : request.getParameter("cp")%>">목록보기</a>
					</div>
					<!-- 	추가 수정 부분 170402 화 		시작 -->
					<div class="content_bt">

						<a
							href="productReWrite.jsp?subject=<%=dto.getSubject()%>&ref=<%=dto.getRef()%>&lev=<%=dto.getLev()%>&sunbun=<%=dto.getSunbun()%>&type=<%=dto.getType()%>&sort=<%=dto.getSort()%>">답글쓰기</a>
					</div>
					<!-- 	추가 수정 부분 170402 화 		끝 -->
					<%
						if (sid.equals(dto.getWriter())) {
					%>
					<div class="content_bt">
						<a
							href="proDelete.jsp?idx=<%=dto.getIdx()%>&cp=<%=request.getParameter("cp")%>&type=<%=dto.getType()%>">삭제하기</a>
					</div>
					<div class="content_bt">
						<a
							href="proUpdate.jsp?idx=<%=dto.getIdx()%>&cp=<%=request.getParameter("cp")%>&type=<%=dto.getType()%>&sort=<%=dto.getSort()%>">수정하기</a>
					</div>
					<%
						} else if (!(sid == null || sid.equals(""))) {
					%>
					<div class="content_bt">
						<a
							href="/semi_Jungo/cartList/addfavor_ok.jsp?idx=<%=dto.getIdx()%>">장바구니에
							넣기</a>
					</div>
					<%
						}
					%>
					<!-- 	추가 수정 부분 170328 화 		끝-->
				</div>
				<!-- 수정 추가부분 170330 목 시작  -->
				<!-- 다음글 이전글 -->
				<div align="center">
					<%
						ArrayList<ProductDTO> arr = pdao.preforList(dto.getRef(), dto);

						if (arr != null || arr.size() != 0) {

							for (int i = 0; i < arr.size(); i++) {

								if (arr.get(i).getIdx() == dto.getIdx()) {

									if (i == arr.size() - 1) {
					%>
					∧ &nbsp;이전글이 없습니다. <br>
					<%
						} else {
					%>
					<a href="productContent.jsp?idx=<%=arr.get(i + 1).getIdx()%>">
						∧&nbsp;이전글&nbsp; <%=arr.get(i + 1).getSubject()%>&nbsp; <%=arr.get(i + 1).getWriter()%>&nbsp;
					</a> <br>
					<%
						}

									if (i == 0) {
					%>
					∨ &nbsp;다음글이 없습니다. <br>
					<%
						} else {
					%>
					<a href="productContent.jsp?idx=<%=arr.get(i - 1).getIdx()%>">
						∨&nbsp;다음글&nbsp;<%=arr.get(i - 1).getSubject()%>&nbsp; <%=arr.get(i - 1).getWriter()%>&nbsp;
					</a> <br>
					<%
						}

								}
							}
						}
					%>
				</div>
				<!-- 수정 추가부분 170330 목 끝  -->
				<div>
					<%=dto.getPrice()%>원
				</div>
			</form>
		</article>
	</section>
	<%@include file="../footer.jsp"%>
</body>
</html>