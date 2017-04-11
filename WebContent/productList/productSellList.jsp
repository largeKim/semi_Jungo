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
<title>==== Team 2 ==== 판매 게시판</title>
<link rel="stylesheet" type="text/css"
	href="/semi_Jungo/css/mainLayout.css">
<style>
li {
	display: list-item;
}

a {
    text-decoration: none;
    color: #000;
}
#center {
	overflow: hidden;
	width: 1200px;
	margin: 0 auto;
	margin-top: 29px;
	text-align: left;
}

#sub_wrap {
	float: left;
}

#sub_menu {
	margin: 0 0px 0 0;
	width: 160px;
}

#sub_menu ul {
	border: 1px solid #b9b9b9;
	border-bottom: 2px solid #555;
}

#sub_menu ul li {
	text-align: left;
	border-bottom: 1px solid #999;
	background-color: #f9f9f9;
}

#sub_menu ul li.depth1 {
	display: block;
	padding: 20px;
	background: #555;
	color: #fff;
	font-size: 16px;
	font-weight: bold;
}

#sub_menu ul li a {
	display: block;
	color: #000;
	font-weight: normal;
	font-size: 13px;
	padding: 14px;
}

#content_wrap {
	float: left;
	width: 900px;
	text-align: left;
	margin-left: 20px;
}

#pagetop {
	padding: 12px 0;
	border-bottom: 1px solid #B9B9B9;
	height: 38px;
}

#content_wrap h3 {
	color: #555;
	letter-spacing: -0.05em;
}

#history {
    float: right;
    position: relative;
    top: -40px;
    color: #999;
    font-family: dotum;
    text-align: left;
}

#history .home {
	display: inline-block;
	width: 25px;
	height: 25px;
	background: url(/image/common/ico_home.gif) no-repeat;
}

#history a {
	color: #999;
}
.pr_ListTable {
	width: 800px;
	margin: 0px auto;
	border-spacing: 0px;
	margin-bottom: 20px;
	border-bottom: 3px double black;
	margin-bottom: 20px;
}

.pr_ListTable th {
	border-top: 3px double black;
	border-bottom: 3px double black;
	text-align: center;
}

.pr_ListTable td {
	border-bottom: 1px solid gray;
}

.sortSelect {
	text-align: right;
	width: 800px;
	margin: 0px auto;
	margin-bottom: 5px;
}

.pr_sel_bt {
	border: 1px solid black;
	background-color: white;
}

.pr_sell_bt {
	border: 1px solid black;
	margin: 0px auto;
	display: block;
	width: 80px;
	text-align: center;
	padding: 10px 0px 10px 0px;
	margin-bottom: 20px;
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
#tag ul{
	display: none;
	position: absolute;
}
#tag:HOVER ul{
	display: block;
	background-color: #CECEF6;
}
#tag ul li{
	float: left;
	margin: 10px 50px 10px 0;
	margin-left: 20px;
	list-style-type:none;
}
#tag ul li{
	float: none;
	margin: 5px 5px 5px 0;
}
#tag a:LINK{
	color: black;
	text-decoration: none;
}
#tag a:VISITED{
	color: black;
	text-decoration: none;
}
#tag a:HOVER{
	color: blue;
}
.p_Searchbar{
	text-align: center;
	margin-bottom: 20px;
}
.sell_mainpic{
	width: 800px;
	height: 200px;
	margin: 10px auto;
	background-image: url("../img/sell.gif");
	background-size: cover;
	background-position: center;
}
</style>
<script>
function messageOpen(i){
	window.open('/semi_Jungo/member/messageWrite.jsp?writer='+i,'message','width=510, height=420');
	}
	
function writerSearch(i){
	location.href="/semi_Jungo/productList/productSellList.jsp?skey=writer&svalue="+i;
}
</script>
</head>

<%
	//타입
	String type = "Sell";
	String sort_s = request.getParameter("sort");
	if (sort_s == null || sort_s.equals("")) {
		sort_s = "0";
	}
	String sid_sell = (String) session.getAttribute("sid");
	String sort = pdao.getSort(Integer.parseInt(sort_s));

	String skey = request.getParameter("skey");
	String svalue = request.getParameter("svalue");

	//리스트 관련
	int totalCnt = pdao.gettotalCnt(type);// 총 게시물수
	int listSize = 10; // 보여줄 리스트 수
	int pageSize = 5; // 한번에 몇개씩 보여줄 페이지 수
	String cp_s = request.getParameter("cp");
	if (cp_s == null || cp_s.equals("")) {
		cp_s = "1";
	}

	int cp = Integer.parseInt(cp_s); // 현재 페이지
	int totalPage = totalCnt / listSize + 1; // 총 페이지 수
	if (totalCnt % listSize == 0)
		--totalPage;

	int userGroup = cp / pageSize;//유저가 속해있는 그룹
	if (cp % pageSize == 0)
		--userGroup;
%>
<body>
	<%@include file="../header.jsp"%>
	<section>
		<article>
			<div id="center">
				<div id="sub_wrap">
					<div class="f1" id="sub_menu">
						<ul>
							<li class="depth1">중고 거래</li>
							<li><a href="/semi_Jungo/productList/productSellList.jsp">Sell</a></li>
							<li><a href="/semi_Jungo/productList/productBuyList.jsp">Buy</a></li>
							<li><a href="/semi_Jungo/productList/productSwitchList.jsp">Exchange</a></li>
							<li><a href="/semi_Jungo/productList/productAuctionList.jsp">Auction</a></li>
						</ul>
					</div>
				</div>
			<div id="content_wrap">
				<div id="pagetop">
						<h3>Sell</h3>
						<div id="history">
							<a class="home" href="/semi_Jungo/index.jsp" title="Home"><img alt="home" src="../img/home_s.png"></a> &gt; <a
								href="/semi_Jungo/productList/productSellList.jsp">중고 거래</a> &gt; <a
								href="/semi_Jungo/productList/productSellList.jsp">Sell</a>
						</div>
				</div>
				<div id="content">
				<div class="sell_mainpic"></div>
			<div class="sortSelect">
				<form name="f_sort" action="productSellList.jsp">
					<select name="sort">
						<option value="1">모두보기</option>
						<option value="2">축구</option>
						<option value="3">야구</option>
						<option value="4">농구</option>
						<option value="5">배구</option>
						<option value="6">기타</option>
					</select> <input type="submit" value="찾기">
				</form>
			</div>
			<table class="pr_ListTable">
				<thead>
					<tr>
						<th style="width: 10%;">글번호</th>
						<th style="width: 10%;">종목</th>
						<th style="width: 45%;">제목</th>
						<th style="width: 10%;">작성자</th>
						<th style="width: 10%;">조회수</th>
						<th style="width: 15%;">작성날짜</th>
					</tr>
				</thead>
				<tbody>
					<%
						ArrayList<ProductDTO> arr;
						if(skey==null || svalue==null){
// 추가 수정부분 170402 일 시작
							arr = pdao.productList3(type, sort, cp, listSize);
// 추가 수정부분 170402 일 끝
						}else{
							arr = pdao.productList2(type, sort, cp, listSize, skey, svalue);
						}
					/* 추가 수정부분 170329 수 끝 */
						if (arr == null || arr.size() == 0) {
					%>
					<tr>
						<td colspan="6" align="center">글이 없습니다.</td>
					</tr>
					<%
						} else {
							for (int i = 0; i < arr.size(); i++) {
					%>
				<tr>
				<%
				if(!(arr.get(i).getLev()>0)){
				%>
					<td><%=arr.get(i).getIdx() %></td>
				<%
				}else{
				%>
					<td></td>
				<%
				}
				%>
					<td style="text-align: center;">[<%=arr.get(i).getSort()%>]
					</td>
					<td style="padding-left: 10px;">
					 <%
					 if(!( arr.get(i).getEtc1()==null ||arr.get(i).getEtc1().equals(""))){
					 %>
					 <img src="img.jpg">
					 <%
					 }
 					%>
						<a href="productContent.jsp?idx=<%=arr.get(i).getIdx()%>&cp=<%=cp%>"><%=arr.get(i).getSubject().length()>20?arr.get(i).getSubject().substring(0,20)+"…..":arr.get(i).getSubject()%></a></td>
					<td><div id="tag"><a href="#"><%=arr.get(i).getWriter()%></a>
						<ul>
						
						<%
						if(!(arr.get(i).getWriter().equals(sid_sell))){
						%>
							<li><a href="javascript:messageOpen('<%=arr.get(i).getWriter()%>')">쪽지보내기</a></li>
						<%
						}
						%>	
							<li><a href="javascript:writerSearch('<%=arr.get(i).getWriter()%>')">작성글보기</a></li>
						</ul>
					</div></td>
					<td style="text-align: center;"><%=arr.get(i).getReadnum()%></td>
					<td><%=arr.get(i).getWritedate() %></td>
				</tr>
					<%
						}
					}
					%>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="6" align="center" style="clear: both;">
							<%
								if (userGroup != 0) { // user그룹이 첫번째가 아니면
							%> <a
							href="productSellList.jsp?cp=<%=(userGroup - 1) * pageSize + pageSize%>">&lt;&lt;</a>
							<%
								}
								for (int i = (userGroup * pageSize + 1)/*시작수를 현재 페이지로*/; i <= (userGroup * pageSize + pageSize); i++) {
							%> &nbsp;&nbsp;<a href="productSellList.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;
							<%
								if (i == totalPage)
										break;
								}

								if (userGroup != (totalPage / pageSize - (totalPage % pageSize == 0 ? 1 : 0))) { // 유저그룹이 마지막페이지가 아니면
							%><a
							href="productSellList.jsp?cp=<%=(userGroup + 1) * pageSize + 1%>">&gt;&gt;</a>
							<%
								}
							%>
						</td>
					</tr>
				</tfoot>
			</table>
			<div class="p_Searchbar">
			<form action="product<%=type %>List.jsp">
			<select name="skey">
				<option name="subject" value="subject">제목</option>
				<option name="content" value="content">내용</option>
				<option name="subject+content" value="subcon">제목+내용</option>
				<option name="writer" value="writer">작성자</option>
			</select>
			<input type="text" name="svalue" size="20">
			<input type="submit" value="검색">
			</form>
			</div>
			<div class="pr_sell_bt">
				<a href="productWrite.jsp?type=<%=type%>">글쓰기</a>
			</div>
			</div>
			</div>
		</div>
		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>