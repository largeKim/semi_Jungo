<%@ page import="oracle.sql.ARRAY"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="tt.question.*"%>
<jsp:useBean id="qdao" class="tt.question.QuestionDAO" scope="session" />
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

.qu_write_bt {
	border: 1px solid black;
	margin: 0px auto;
	display: block;
	width: 80px;
	text-align: center;
	padding: 10px 0px 10px 0px;
	margin-bottom: 20px;
}

.qu_search {
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
}
.question_mainpic{
	width: 800px;
	height: 200px;
	margin: 0px auto;
	background-image: url("../img/ques.png");
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
		location.href = "/semi_Jungo/questionList/question.jsp?skey=writer&svalue="
				+ i;
	}
</script>
</head>
<%
	int totalCnt = qdao.getTotalcnt();
	int listSize = 10;
	int pageSize = 5;
	String cp_s = request.getParameter("cp");
	if (cp_s == null || cp_s.equals("")) {
		cp_s = "1";
	}

	String sid_que = (String) session.getAttribute("sid");
	String skey = request.getParameter("skey");
	String svalue = request.getParameter("svalue");

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
			<div class="question_mainpic"></div>
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
						ArrayList<QuestionDTO> arr = qdao.questionlist(cp, listSize);
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
						<%
							if (!(arr.get(i).getLev() > 0)) {
						%>
						<td><%=arr.get(i).getIdx()%></td>
						<%
							} else {
						%>
						<td></td>
						<%
							}
						%>
						<td>[<%=arr.get(i).getType()%>]
						</td>
						<td>
							<%
								for (int j = 0; j < arr.get(i).getLev(); j++) {
											out.println("&nbsp;&nbsp;&nbsp;");
										}
							%> <a
							href="questionContent.jsp?idx=<%=arr.get(i).getIdx()%>&cp=<%=cp%>"><%=arr.get(i).getSubject()%></a>
						</td>
						<td><div id="tag">
								<a href="#"><%=arr.get(i).getWriter()%></a>
								<ul>

									<%
										if (!(arr.get(i).getWriter().equals(sid_que))) {
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
						<td><%=arr.get(i).getWritedate()%>
						<td><%=arr.get(i).getReadnum()%></td>
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
							%> <a href="question.jsp?cp=<%=(userGroup - 1) * pageSize + pageSize%>">&lt;&lt;</a>
							<%
								}
								for (int i = (userGroup * pageSize + 1); i <= (userGroup * pageSize + pageSize); i++) {
							%> &nbsp;<a href="question.jsp?cp=<%=i%>"><%=i%></a>&nbsp; <%
 	if (i == totalPage)
 			break;
 	}
 	if (userGroup != (totalPage / pageSize - (totalPage % pageSize == 0 ? 1 : 0))) {
 %> <a href="question.jsp?cp=<%=(userGroup + 1) * pageSize + 1%>">&gt;&gt;</a>
							<%
								}
							%>
						</td>
					</tr>
				</tfoot>
			</table>
			<div class="qu_search">
				<form action="question.jsp">
					<select name="skey">
						<option value="subject">제목</option>
						<option value="content">내용</option>
						<option value="subcon">제목+내용</option>
						<option value="writer">작성자</option>
					</select> <input type="text" name="svalue" size="20"> <input
						type="submit" value="검색">
				</form>
			</div>
			<div class="qu_write_bt">
				<a href="questionWrite.jsp">글쓰기</a>
			</div>
		</article>
	</section>
	<%@include file="../footer.jsp"%>
</body>
</html>