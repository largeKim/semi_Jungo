<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="tt.advertise.*"%>
<jsp:useBean id="adao" class="tt.advertise.AdvertiseDAO" scope="page" />
<jsp:useBean id="mdao" class="tt.member.MemberDAO" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/mainLayout.css">
<%
	String idx_s = request.getParameter("idx");
	if (idx_s == null || idx_s.equals("")) {
		idx_s = "0";
	}
	int idx = Integer.parseInt(idx_s);
	AdvertiseDTO adto = adao.advContent(idx);
	System.out.println(adto);
	if (adto == null) {
%>
<script>
	window.alert('삭제된 게시글 또는 잘못된 접근입니다.');
	location.href = 'adminAdvertise.jsp'
</script>
<%
	return;
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

.contentImg{
	text-align: center;
	margin-top: 10px;
}
</style>
</head>
<body>
	<%@include file="/header.jsp"%>
	<section>
		<article>
			<h2>제휴/광고 문의</h2>
			<table class="p_contentTable">
				<tr>
					<th>글 번호</th>
					<td style="border-right: 1px solid black;" class="content_td"><%=adto.getRnum()%></td>
					<th>타입</th>
					<td class="content_td"><%=adto.getAtype()%></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td class="content_td" style="border-right: 1px solid black;"><%=adto.getYourname()%></td>
					<th>메일</th>
					<td class="content_td"><%=adto.getYourmail()%></td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3" align="left" class="content_td"><%=adto.getYoursub()%>
					</td>
				</tr>
				<tr height="250">
					<td colspan="4" align="left" valign="top">
						<!-- 추가 수정 부분 170401 토 시작 -->
						<div class="contentImg">
							<img src="<%=adto.getImgpath()%>" width="350px" height="400px">
						</div>
						<div class="content">
							<!-- 추가 수정 부분 170401 토 끝 -->
							<%=adto.getYourmsg().replaceAll("\n", "<br>")%>

						</div>
					</td>
				</tr>
			</table>
			<div class="btList">
				<div class="content_bt">
					<a href="adminAdvertise.jsp">목록보기</a>
				</div>
				<div class="content_bt">
					<a href="adminAdvertiseDelete.jsp?idx=<%=adto.getIdx()%>">삭제하기</a>
				</div>
				<!-- 추가 수정 부분 170401 토 시작 -->
				<%
					if (adto.getChoice() == 0) {
				%>
				<div class="content_bt">
					<a href="adminAdvertiseChoice_ok.jsp?idx=<%=adto.getIdx()%>">광고로
						설정</a>
				</div>
				<%
					} else {
				%>
				<div class="content_bt">
					<a href="adminAdvertiseCancel_ok.jsp?idx=<%=adto.getIdx()%>">광고설정
						취소</a>
				</div>
				<%
					}
				%>
				<!-- 추가 수정 부분 170401 토 끝-->
			</div>
		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>