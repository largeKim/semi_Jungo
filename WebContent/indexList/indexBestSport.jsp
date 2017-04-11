<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="tt.sport.*"%>
<jsp:useBean id="sdao" class="tt.sport.SportDAO" scope="page" />
<jsp:useBean id="scdao" class="tt.sport.comment.Sport_CommentDAO" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/semi_Jungo/css/mainLayout.css">
<style>
.hitImg {
	width: 100px;
	float: left;
	padding-left: 20px;
}

.best_sub {
	width: 380px;
	text-align: left;
	font-size: 13px;
}

.best_recom {
	width: 50px;
	text-align: left;
	font-size: 13px;
}

.best_readnum {
	width: 50px;
	text-align: left;
	font-size: 13px;
}

th {
	font-size:13px;
}

.bestTableDiv {
	text-align: center;
}

.bestTable {
	margin:20px 100px;
	padding-left: 30px;
}

.bestTable td {
	text-align: left;
	padding-left: 10px;
}

.bestTable th {
	padding: 5px 0px 0px 5px;
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
</style>
</head>
<body>
<section>
	<article>
	<%
		ArrayList<SportDTO> arr = sdao.sportBestList(1, 5);
	%>
	<div class="bestTableDiv">
		<img src="/semi_Jungo/img/hit.gif" class="hitImg">
		<table class="bestTable">
			<tr>
				<th>제목</th>
				<th>추천수</th>
				<th>조회수</th>
			</tr>
			<%
			if(arr==null||arr.size()==0){
			%>
				<tr>
					<td colspan="3">베스트 글이 없습니다.</td>
				</tr>
			<%
			} else {
				
				for(int i = 0; i<arr.size();i++){
			%>
				<tr>
					<td class="best_sub">
						<a href="/semi_Jungo/sportList/sportContent.jsp?idx=<%=arr.get(i).getIdx()%>">
						[<%=arr.get(i).getSort() %>]
						<%=arr.get(i).getSubject().length()>21?arr.get(i).getSubject().substring(0,20)+"…..":arr.get(i).getSubject()%>
						</a>[<%=scdao.getCommNum(arr.get(i).getIdx()) %>]
					</td>
					<td class="best_recom"><%=arr.get(i).getRecom() %></td>
					<td class="best_readnum"><%=arr.get(i).getRecom() %></td>
				</tr>
			<%
				}
			%>
		</table>
		<%
			}
		%>
		
	</div>
	</article>
</section>

</body>
</html>