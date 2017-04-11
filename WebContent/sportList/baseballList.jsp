<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="tt.sport.*"%>
<%@ page import="tt.sport.comment.*"%>
<jsp:useBean id="sdao" class="tt.sport.SportDAO" scope="session" />
<jsp:useBean id="sdto" class="tt.sport.SportDTO" scope="session" />
<jsp:useBean id="scdao" class="tt.sport.comment.Sport_CommentDAO" />
<jsp:useBean id="srdao" class="tt.sport.recom.RecomDAO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>==== Team 2 ==== 야구 게시판</title>
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

.pr_write_bt {
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

#tag ul {
	display: none;
	position: absolute;
}

#tag:HOVER ul {
	display: block;
	background-color: #CECEF6;
}

#tag ul li {
	float: left;
	margin: 10px 50px 10px 0;
	margin-left: 20px;
	list-style-type: none;
}

#tag ul li {
	float: none;
	margin: 5px 5px 5px 0;
}

#tag a:LINK {
	color: black;
	text-decoration: none;
}

#tag a:VISITED {
	color: black;
	text-decoration: none;
}

#tag a:HOVER {
	color: blue;
}

.pr_searchbar {
	margin: 0px auto;
	margin-top: 20px;
	margin-bottom: 20px;
	width: 500px;
}

.pr_searchbt {
	border: 1px solid black;
	background-color: white;
}

.sort {
	border: 1px solid black;
	height: 20px;
}

.pr_text {
	border: 1px solid black;
}

.prbt {
	border: 1px solid black;
	background-color: white;
}

.baseball_mainpic {
	width: 800px;
	height: 200px;
	margin: 10px auto;
	background-image: url("../img/baseball_one.jpg");
	background-size: cover;
	background-position: center;
}

.baseballList_Search {
	text-align: center;
}
</style>
<script>
	function messageOpen(i) {
		window.open('/semi_Jungo/member/messageWrite.jsp?writer=' + i,
				'message', 'width=510, height=420');
	}

	function writerSearch(i) {
		location.href = "/semi_Jungo/sportList/soccerList.jsp?skey=writer&svalue="
				+ i;
	}
</script>


</head>

<%
	//타입

	String sort = "baseball";
	String orderby = request.getParameter("orderby");
	if (orderby == null || orderby.equals("")) {
		orderby = "all";
	}

	String sid_base = (String) session.getAttribute("sid");
	String skey = request.getParameter("skey");
	String svalue = request.getParameter("svalue");
	//리스트 관련
	int totalCnt = sdao.getTotalCnt(sort);// 총 게시물수
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
	<%@include file="/header.jsp"%>
	<section>
		<article>
			<div id="center">
				<div id="sub_wrap">
					<div class="f1" id="sub_menu">
						<ul>
							<li class="depth1">스포츠/자유</li>
							<li><a href="/semi_Jungo/sportList/soccerList.jsp">Soccer</a></li>
							<li><a href="/semi_Jungo/sportList/baseballList.jsp">Baseball</a></li>
							<li><a href="/semi_Jungo/sportList/basketballList.jsp">Basketball</a></li>
							<li><a href="/semi_Jungo/sportList/etcList.jsp">ETC</a></li>
						</ul>
					</div>
				</div>
				<div id="content_wrap">
					<div id="pagetop">
						<h3>Baseball</h3>
						<div id="history">
							<a class="home" href="/semi_Jungo/index.jsp" title="Home"><img
								alt="home" src="../img/home_s.png"></a> &gt; <a
								href="/semi_Jungo/productList/productSellList.jsp">스포츠/자유</a>
							&gt; <a href="/semi_Jungo/sportList/baseballList.jsp">Baseball</a>
						</div>
					</div>
					<div id="content">
						<div class="baseball_mainpic"></div>
						<div class="sortSelect">
							<form style="text-align: right;" name="fob"
								action="baseballList.jsp">
								<select name="orderby" class="sort">
									<option value="all">모두보기</option>
									<option value="best">추천순</option>
									<option value="hot">조회수순</option>
								</select> <input type="submit" value="이동" class="prbt">
							</form>
						</div>
						<table class="pr_ListTable">
							<thead>
								<tr>
									<th style="width: 10%;">글번호</th>
									<th style="width: 10%;">분류</th>
									<th style="width: 30%;">제목</th>
									<th style="width: 10%;">작성자</th>
									<th style="width: 20%;">작성일자</th>
									<th style="width: 10%;">조회수</th>
									<th style="width: 10%;">추천수</th>
								</tr>
							</thead>
							<tbody>
								<%
									ArrayList<SportDTO> arr;

									if (skey == null || svalue == null) {
										arr = sdao.sportList(sort, cp, listSize, orderby);
									} else {
										arr = sdao.sportList2(sort, cp, listSize, skey, svalue);
									}

									if (arr == null || arr.size() == 0) {
								%>
								<tr>
									<td colspan="7" align="center">글이 없습니다.</td>
								</tr>
								<%
									} else {
										for (int i = 0; i < arr.size(); i++) {
								%>
								<tr>
									<td align="center">
										<%
											if (arr.get(i).getLev() == 0) {
														out.print(arr.get(i).getIdx());
													}
										%>
									</td>
									<td align="center">[<%=arr.get(i).getSort()%>]
									</td>
									<td align="left" style="padding-left: 10px;">
										<%
											for (int j = 0; j < arr.get(i).getLev(); j++) {
										%> <img src="../img/ioc-reply.gif"> <%
 	if (j == 2) {
 					break;
 				}
 			}
 %> <%
 	if (!(arr.get(i).getPicpath() == null || arr.get(i).getPicpath().equals(""))) {
 %> <img src="img.jpg"> <%
 	}
 %><a href="sportContent.jsp?idx=<%=arr.get(i).getIdx()%>&cp=<%=cp%>"><%=arr.get(i).getSubject()%></a>
										<%
											ArrayList<Sport_CommentDTO> scarr = scdao.scList(arr.get(i).getIdx());
										%> [<%=scarr.size()%>]
									</td>
									<td align="center"><div id="tag">
											<a href="#"><%=arr.get(i).getWriter()%></a>
											<ul>

												<%
													if (!(arr.get(i).getWriter().equals(sid_base))) {
												%>
												<li><a
													href="javascript:messageOpen('<%=arr.get(i).getWriter()%>')">쪽지보내기</a></li>
												<%
													}
												%>
												<li><a
													href="javascript:writerSearch('<%=arr.get(i).getWriter()%>')">작성글보기</a></li>
											</ul>
										</div></td>
									<td align="center"><%=arr.get(i).getWritedate()%></td>
									<td align="center"><%=arr.get(i).getReadnum()%></td>
									<td align="center"><%=arr.get(i).getRecom()%></td>
								</tr>
								<%
									}
									}
								%>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="7" align="center">
										<%
											if (userGroup != 0) { // user그룹이 첫번째가 아니면
										%> <a
										href="baseballList.jsp?cp=<%=(userGroup - 1) * pageSize + pageSize%>&orderby=<%=orderby%>">&lt;&lt;</a>
										<%
											}
											for (int i = (userGroup * pageSize + 1)/*시작수를 현재 페이지로*/; i <= (userGroup * pageSize + pageSize); i++) {
										%> &nbsp;&nbsp;<a
										href="baseballList.jsp?cp=<%=i%>&orderby=<%=orderby%>"><%=i%></a>&nbsp;&nbsp;
										<%
											if (i == totalPage)
													break;
											}

											if (userGroup != (totalPage / pageSize - (totalPage % pageSize == 0 ? 1 : 0))) { // 유저그룹이 마지막페이지가 아니면
										%><a
										href="baseballList.jsp?cp=<%=(userGroup + 1) * pageSize + 1%>&orderby=<%=orderby%>">&gt;&gt;</a>
										<%
											}
										%>
									</td>
								</tr>
							</tfoot>
						</table>
						<form action="<%=sort%>List.jsp" class="pr_searchbar">
							<div class="baseballList_Search">
								<select name="skey" class="sort">
									<option value="subject">제목</option>
									<option value="content">내용</option>
									<option value="subcon">제목+내용</option>
									<option value="writer">작성자</option>
								</select> <input type="text" name="svalue" size="20" class="pr_text">
								<input type="submit" value="검색" class="pr_searchbt">
							</div>
						</form>
						<div class="pr_write_bt">
							<a href="sportWrite.jsp?sort=<%=sort%>">글쓰기</a>
						</div>
					</div>
				</div>
			</div>
		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>