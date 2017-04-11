<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="tt.advertise.*"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="adto" class="tt.advertise.AdvertiseDTO" scope="page" />
<jsp:useBean id="adao" class="tt.advertise.AdvertiseDAO" scope="page" />
<jsp:useBean id="mdao" class="tt.member.MemberDAO" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/mainLayout.css">
<style>
h2 {
	text-align: center;
}

.advertise_table {
	width: 800px;
	border-spacing: 0px;
	border-bottom: 3px double black;
	border-top: 3px double black;
	margin: 0px auto;
}

.advertise_table th {
	border-bottom: 3px double black;
}

a:link { /* 링크가 걸려있는 리스트 모양 */
	color: red;
	text-decoration: none;
}

a:visited { /* 링크를 누른 후 모양 */
	color: red;
	text-decoration: none;
}

a:hover { /* 마우스를 가져다 댈 때 모양 */
	color: black;
}
</style>
</head>
<%
	int totalCnt = adao.getTotalCnt();
	int listSize = 10;
	int pageSize = 5;

	String cp_s = request.getParameter("cp");
	if (cp_s == null || cp_s.equals("")) {
		cp_s = "1";
	}

	int cp = Integer.parseInt(cp_s);

	int totalPage = (totalCnt / listSize) + 1;
	if (totalCnt % listSize == 0)
		totalPage--;

	int userGroup = cp / pageSize;
	if (cp % pageSize == 0)
		userGroup--;
%>
<body>
	<%@include file="/header.jsp"%>
	<%@include file="adminCategory.jsp"%>
	<section>
		<article>
			<h2>광고 / 제휴 제의</h2>
			<table class="advertise_table">
				<thead>
					<tr>
						<th>번호</th>
						<th>종류</th>
						<th>제목</th>
						<th>작성자</th>
						<th>광고 설정</th>
					</tr>
				</thead>
				<tbody>
					<%
						ArrayList<AdvertiseDTO> arr = adao.advList(cp, listSize);
						if (arr == null || arr.size() == 0) {
					%>
					<tr>
						<td colspan="3" align="center">등록된 게시글이 없습니다.</td>
					</tr>
					<%
						} else {
							for (int i = 0; i < arr.size(); i++) {
					%>
					<tr>
						<!-- 추가 수정 부분 170401 토 시작 -->

						<!-- 추가 수정 부분 170401 토 끝 -->
						<td><%=arr.get(i).getRnum()%></td>
						<td><%=arr.get(i).getAtype()%></td>
						<td>
							<%
								for (int j = 0; j < 0; j++) {
											out.println("&nbsp;&nbsp;&nbsp;");
										}
							%> <a href="adminAdvertiseContent.jsp?idx=<%=arr.get(i).getIdx()%>"><%=arr.get(i).getYoursub()%></a>
						</td>
						<td><%=arr.get(i).getYourname()%></td>
						<%
							if (arr.get(i).getChoice() == 0) {
						%>
						<td>
							<form action="adminAdvertiseChoice_ok.jsp">
								<input type="hidden" name="idx"
									value="<%=arr.get(i).getIdx()%>"> <input type="submit"
									value="광고설정하기">
							</form>
						</td>
						<%
							} else if (arr.get(i).getChoice() == 1) {
						%>
						<td>
							<form action="adminAdvertiseCancel_ok.jsp">
								<input type="hidden" name="idx"
									value="<%=arr.get(i).getIdx()%>"> <input type="submit"
									value="광고취소하기">
							</form>
						</td>
						<%
							}
						%>
					</tr>
					<%
						}
						}
					%>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5" align="center">
							<%
								if (userGroup != 0) {
							%> <a
							href="adminAdvertise.jsp?cp=<%=(userGroup - 1) * pageSize + pageSize%>">&lt;&lt;</a>
							<%
								}
								for (int i = (userGroup * pageSize + 1); i <= (userGroup * pageSize + pageSize); i++) {
							%> &nbsp;<a href="adminAdvertise.jsp?cp=<%=i%>"><%=i%></a>&nbsp;
							<%
								if (i == totalPage)
										break;
								}
								if (userGroup != (totalPage / pageSize - (totalPage % pageSize == 0 ? 1 : 0))) {
							%> <a href="adminAdvertise.jsp?cp=<%=(userGroup + 1) * pageSize + 1%>">&gt;&gt;</a>
							<%
								}
							%>
						</td>
					</tr>
				</tfoot>
			</table>
		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>