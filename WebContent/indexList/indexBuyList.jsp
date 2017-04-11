<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="tt.product.*"%>
<jsp:useBean id="pdao" class="tt.product.ProductDAO" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>==== Team 2 ==== 구매 게시판</title>
<link rel="stylesheet" type="text/css"
	href="/semi_Jungo/css/mainLayout.css">
<style>
.indexBuyList {
	width: 799px;
	height: 600px;
	margin-top: 10px;
}

h2 {
	text-align: center;
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
	color: blue;
	text-decoration: underline;
}

.buyTable {
	width: 320px;
	float: left;
	border-spacing: 0px;
	border-bottom: 3px double black;
	border-top: 3px double black;
	margin: 20px 0px 10px 52px;
}

.buyTable td {
	text-align: left;
	padding-left: 10px;
}

.buyTable th {
	width: 150px;
	padding: 5px 0px 0px 5px;
	border-right: 1px solid black;
}
</style>
</head>
<body>
	<section class="indexBuyList">
		<article>
			<%
				ArrayList<ProductDTO> arr = pdao.productList("Buy", "all", 1, 4);
				for (int i = 0; i < arr.size(); i++) {
			%>
			<table class="buyTable">
				<%
					if (arr == null || arr.size() == 0) {
				%>
				<tr>
					<td colspan="5" align="center">구매글이 없습니다.</td>
				</tr>
				<%
					} else {
				%>
				<tr>
					<th rowspan="5">
					<%
					if(arr.get(i).getEtc1()==null || arr.get(i).getEtc1().equals("")){
					%>
						<img alt="상품이미지" src="img/img05.jpg" height="140px" width="140px">
					<%
					}else{
					%>
						<img src="<%=arr.get(i).getEtc1()%>"
						height="140px" width="140px">
					<%
					}
					%>
					</th>
					<td style="border-bottom: 1px solid black"><%=arr.get(i).getIdx()%></td>
				</tr>
				<tr>
					<td style="border-bottom: 1px solid black"><a
						href="/semi_Jungo/productList/productContent.jsp?idx=<%=arr.get(i).getIdx()%>&cp=<%=request.getParameter("cp") %>">
						<%=arr.get(i).getSubject().length()>17?arr.get(i).getSubject().substring(0,1)+"…..":arr.get(i).getSubject()%>
						</a></td>

				</tr>
				<tr>
					<td style="border-bottom: 1px solid black"><%=arr.get(i).getPrice()%>원</td>
				</tr>
				<tr>
					<td style="border-bottom: 1px solid black"><%=arr.get(i).getWriter()%></td>
				</tr>
				<tr>
					<td><%=arr.get(i).getWritedate()%></td>
				</tr>
				<%
					}
				%>
			</table>
			<%
				if (i == 3)
						break;
				}
			%>
		</article>
	</section>
</body>
</html>