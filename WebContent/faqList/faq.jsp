<%@ page import="oracle.sql.ARRAY"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="tt.faq.*"%>
<jsp:useBean id="fdao" class="tt.faq.FaqDAO" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 게시판</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">

<style>
h2 {
	text-align: center;
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

.faq_write_bt {
	border: 1px solid black;
	margin: 0px auto;
	display: block;
	width: 80px;
	text-align: center;
	padding: 10px 0px 10px 0px;
	margin-bottom: 20px;
}

.faq_search {
	text-align: center;
	padding:10px 0px 10px 0px;
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
}.pr_searchbar {
	margin: 0px auto;
	margin-bottom: 20px;
	width: 300px;
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
.faq_mainpic{
	width: 800px;
	height: 200px;
	margin: 0px auto;
	background-image: url("../img/faq.png");
	background-size: cover;
	background-position: center;
}
</style>
<script>
	function messageOpen(i) {
		window.open('/semi_Jungo/member/messageWrite.jsp?writer=' + i,
				'message', 'width=510, height=420');
	}

	function writerSearch(i) {
		location.href = "/semi_Jungo/faqList/faq.jsp?skey=writer&svalue=" + i;
	}
</script>
</head>
<%
	int totalCnt = fdao.getTotalcnt();
	int listSize = 10;
	int pageSize = 5;

	String sgrade_ss = (String) session.getAttribute("sgrade");
	if (sgrade_ss == null) {
		sgrade_ss = "1";
	}
	String sid_faq = (String) session.getAttribute("sid");
	String skey = request.getParameter("skey");
	String svalue = request.getParameter("svalue");

	System.out.println("sgrade_ss:" + sgrade_ss);
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
	<%@include file="../header.jsp"%>
	<%@include file="/userCategory.jsp"%>
	<section>
		<article>
			<div class="faq_mainpic"></div>
			<table class="pr_ListTable">
				<thead>
					<tr>
						<th style="width: 10%;">글번호</th>
						<th style="width: 10%;">분류</th>
						<th style="width: 40%;">제목</th>
						<th style="width: 10%;">작성자</th>
						<th style="width: 20%;">작성일자</th>
						<th style="width: 10%;">조회수</th>
					</tr>
				</thead>
				<tbody>
					<%
						ArrayList<FaqDTO> arr = fdao.faqlist(cp, listSize);
						if (arr == null || arr.size() == 0) {
					%>
					<tr>
						<td colspan="6" align="center">등록된 게시글이 없습니다.</td>
					</tr>
					<%
						} else {
							for (int i = 0; i < arr.size(); i++) {
					%>
					<tr>
						<td align="center"><%=arr.get(i).getIdx()%></td>
						<td align="center">[<%=arr.get(i).getType()%>]
						</td>
						<td align="left" style="padding-left: 10px;">
							<%
								for (int j = 0; j < arr.get(i).getLev(); j++) {
											out.println("&nbsp;&nbsp;&nbsp;");
										}
							%> <a
							href="faqContent.jsp?idx=<%=arr.get(i).getIdx()%>&cp=<%=cp%>"><%=arr.get(i).getSubject()%></a>
						</td>
						<td align="center"><div id="tag">
								<a href="#"><%=arr.get(i).getWriter()%></a>
								<ul>

									<%
										if (!(arr.get(i).getWriter().equals(sid_faq))) {
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
						<td align="center"><%=arr.get(i).getWritedate()%>
						<td align="center"><%=arr.get(i).getReadnum()%></td>
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
							%> <a href="faq.jsp?cp=<%=(userGroup - 1) * pageSize + pageSize%>">&lt;&lt;</a>
							<%
								}
								for (int i = (userGroup * pageSize + 1); i <= (userGroup * pageSize + pageSize); i++) {
							%> &nbsp;<a href="faq.jsp?cp=<%=i%>"><%=i%></a>&nbsp; <%
 	if (i == totalPage)
 			break;
 	}
 	if (userGroup != (totalPage / pageSize - (totalPage % pageSize == 0 ? 1 : 0))) {
 %> <a href="faq.jsp?cp=<%=(userGroup + 1) * pageSize + 1%>">&gt;&gt;</a> <%
 	}
 %>
						</td>
					</tr>
				</tfoot>
			</table>
			<div class="faq_search">
				<form action="faq.jsp" class="pr_searchbar">
					<select name="skey" class="sort">
						<option value="subject">제목</option>
						<option value="content">내용</option>
						<option value="subcon">제목+내용</option>
						<option value="writer">작성자</option>
					</select> <input type="text" name="svalue" size="20" class="pr_text"> <input
						type="submit" value="검색" class="pr_searchbt">
				</form>
			</div>
			<%
				if (sgrade_ss.equals("0")) {
			%>
			<div class="faq_write_bt">
				<a href="faqWrite.jsp">글쓰기</a>
			</div>
			<%
				}
			%>
		</article>
	</section>
	<%@include file="../footer.jsp"%>
</body>
</html>