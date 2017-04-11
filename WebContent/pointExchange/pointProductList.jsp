<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tt.member.*"%>
<%@page import="tt.pointex.*"%>
<%@page import="tt.sendpresent.*"%>
<jsp:useBean id="mdao" class="tt.member.MemberDAO" />
<jsp:useBean id="podao" class="tt.pointex.PointexDAO" />
<jsp:useBean id="sendao" class="tt.sendpresent.SendpresentDAO"
	scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/semi_Jungo/css/mainLayout.css">
<style>
h2 {
	text-align: center;
}

.pointTable {
	width: 800px;
	height: 150px;
	text-align: center;
	border-spacing: 0px;
	margin: 0px auto;
	border-bottom: 3px double black;
}

.pointTable th {
	border-bottom: 1px dotted black;
	border-top: 1px dotted black;
}

a:link { /* 링크가 걸려있는 리스트 모양 */
	color: black;
	text-decoration: none;
}

a:visited { /* 링크를 누른 후 모양 */
	color: black;
	text-decoration: none;
}

a:hover { /* 마우스를 가져다 댈 때 모양 */
	color: red;
}

.peList_table {
	margin: 0px auto;
	width: 800px;
	border-bottom: 3px double black;
	border-top: 3px double black;
	border-spacing: 0px;
}

.peList_table th {
	border-bottom: 3px double black;
}

.peList_table td {
	text-align: center;
}
</style>
</head>
<%
	String id_p = (String) session.getAttribute("sid");//업로드 전에 주석 제거하고 바로아래 라인 삭제
	String point_p = request.getParameter("point");
	if (id_p == null || id_p.equals("")) {
%>
<script>
	window.alert('로그인이 필요한 서비스 입니다.');
	location.href = "/semi_Jungo/login.jsp";
</script>
<%
	return;
	}
	int totalCnt = podao.getTotalCnt();
	int listSize = 10;
	int pageSize = 5;

	//현재 페이지 설정
	String cp_s = request.getParameter("cp");
	if (cp_s == null || cp_s.equals("")) {
		cp_s = "1";
	}

	int cp = Integer.parseInt(cp_s);

	//페이징 관련
	int totalPage = (totalCnt / listSize) + 1;
	if (totalCnt % listSize == 0)
		totalPage--;

	int userGroup = cp / pageSize;
	if (cp % pageSize == 0)
		userGroup--;

	if (point_p == null && id_p != null) {
		point_p = "" + mdao.getPoint2(id_p);
	}
%>
<body>
	<%@include file="../header.jsp"%>
	<Section>
		<article>
			<h2>포 인 트 상 점</h2>
			<table class="pointTable">
				<tr>
					<td colspan="3">내 포인트 : <%=point_p%></td>
				</tr>
				<tr>
					<th colspan="3">포인트로 교환하신 상품은 취소 / 환불이 불가능 합니다.</th>
				</tr>
				<tr>
					<%
						ArrayList<PointexDTO> arr = podao.pointList(1, 3);
					%>
					<%
						for (int i = 0; i < arr.size(); i++) {
					%>
					<%
						if (arr.get(i).getPicpath() == null || arr.get(i).getPicpath().equals("")) {
					%>
					<td width="400">상품명 : <%=arr.get(i).getPname()%><br> <a
						href="/semi_Jungo/pointExchange/pointCart.jsp?pname=<%=arr.get(i).getPname()%>&price=<%=arr.get(i).getPprice()%>&point=<%=request.getParameter("point")%>"><img
							alt="상품이미지" src="img/img05.jpg" height="100px" width="140px"></a><br>
						<%=arr.get(i).getPprice()%> Point !<br>

					</td>
					<%
						} else {
					%>
					<td width="400">상품명 : <%=arr.get(i).getPname()%><br> <a
						href="/semi_Jungo/pointExchange/pointCart.jsp?pname=<%=arr.get(i).getPname()%>&price=<%=arr.get(i).getPprice()%>&path=<%=arr.get(i).getPicpath()%>&point=<%=request.getParameter("point")%>"><img
							src="<%=arr.get(i).getPicpath()%>" height="100px" width="140px"></a><br>
						<%=arr.get(i).getPprice()%> Point !<br>
					</td>
					<%
						}
						}
					%>
				</tr>
			</table>
			<hr />
			<section>
				<article class="peList_article">
					<h2 class="peList_title">포인트 주문 현황</h2>

					<table class="peList_table">
						<thead>
							<tr>
								<th>번호</th>
								<th>주문자</th>
								<th>받는분</th>
								<th>상품</th>
								<th>배송지</th>
								<th>전화번호</th>
							</tr>
						</thead>
						<tbody>
							<%
								ArrayList<SendPresentDTO> arr2 = sendao.peList2(id_p, cp, listSize);
								if (arr2 == null || arr2.size() == 0) {
							%>
							<tr>
								<td colspan="6" align="center">등록된 게시글이 없습니다.</td>
							</tr>
							<%
								} else {
									for (int i = 0; i < arr2.size(); i++) {
							%>
							<tr>
								<td><%=arr2.get(i).getRnum()%></td>
								<td><%=arr2.get(i).getUserid()%></td>
								<td><%=arr2.get(i).getId()%></td>
								<td><a
									href="pointBuyList.jsp?idx=<%=arr2.get(i).getIdx()%>"><%=arr2.get(i).getPname()%></a></td>
								<td><%=arr2.get(i).getRaddress()%></td>
								<td><%=arr2.get(i).getStel()%></td>
							</tr>
							<%
								}
								}
							%>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="6" align="center">
									<%
										if (userGroup != 0) {
									%> <a
									href="pointExchangeList.jsp?cp=<%=(userGroup - 1) * pageSize + pageSize%>">&lt;&lt;</a>
									<%
										}
										for (int i = (userGroup * pageSize + 1); i <= (userGroup * pageSize + pageSize); i++) {
									%> &nbsp;<a href="pointExchangeList.jsp?cp=<%=i%>"><%=i%></a>&nbsp;
									<%
										if (i == totalPage)
												break;
										}
										if (userGroup != (totalPage / pageSize - (totalPage % pageSize == 0 ? 1 : 0))) {
									%> <a
									href="pointExchangeList.jsp?cp=<%=(userGroup + 1) * pageSize + 1%>">&gt;&gt;</a>
									<%
										}
									%>
								</td>
							</tr>
						</tfoot>
					</table>

				</article>
			</section>
		</article>
	</Section>
	<%@include file="../footer.jsp"%>
</body>
</html>