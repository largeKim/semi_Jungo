<%@ page import="oracle.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="tt.notice.*" %>
<jsp:useBean id="ndao" class="tt.notice.NoticeDAO" scope="session"/>
<jsp:useBean id="mdao" class="tt.member.MemberDAO" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>team 2</title>
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
	text-align: center;
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
.notice_mainpic{
	width: 800px;
	height: 200px;
	margin: 10px auto;
	background-image: url("../img/notice.png");
	background-size: cover;
	background-position: center;
}
</style>
</head>
<%
int totalCnt = ndao.getTotalCnt();
int listSize=10;
int pageSize=5;

String sgrade_ss = (String) session.getAttribute("sgrade");
if(sgrade_ss==null){
	sgrade_ss="1";
}
System.out.println("sgrade_ss:"+sgrade_ss);
String cp_s = request.getParameter("cp");
if(cp_s==null||cp_s.equals("")){
	cp_s="1";
}

int cp=Integer.parseInt(cp_s);

int totalPage = (totalCnt / listSize) + 1; 
if(totalCnt%listSize==0) totalPage--;

int userGroup = cp/pageSize;
if(cp%pageSize==0) userGroup--;

String username = (String)session.getAttribute("sid");
String uname = mdao.getUserInfo(username);// 작성자 이름 불러오기

%>
<body>
<%@include file="/header.jsp" %>
<section>
<article>

	<div class="notice_mainpic"></div>
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
		ArrayList<NoticeDTO> arr = ndao.noticeList(cp, listSize);
		if(arr==null || arr.size()==0){
			%>
			<tr>
				<td colspan="6" align="center">
				등록된 게시글이 없습니다.
				</td>
			</tr>
			<%
		}else{
			for(int i=0; i<arr.size(); i++){
				%>
				<tr>
					<td><%=arr.get(i).getRef() %></td>
					<td><%=arr.get(i).getType() %></td>
                    <td>
                    <%
                    for(int j=0; j<arr.get(i).getLev(); j++){
                    	out.println("&nbsp;&nbsp;&nbsp;");
                    }
                    %>
                    <a href="noticeContent.jsp?idx=<%=arr.get(i).getIdx()%>"><%=arr.get(i).getSubject() %></a></td>
                    <td><%=arr.get(i).getWriter() %></td>
                    <td><%=arr.get(i).getWritedate() %></td>                    
                    <td><%=arr.get(i).getReadnum() %></td>
				</tr>
				<%
			}
		}
		%>
		</tbody>
		<tfoot class="notice_tfoot">
			<tr>
				<td colspan="6" align="center">
				<%
if(userGroup!=0){
	%>
	<a href="notice.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a>
	<%
}
for(int i=(userGroup*pageSize+1); i<=(userGroup*pageSize+pageSize); i++){
	%>
	&nbsp;<a href="notice.jsp?cp=<%=i%>"><%=i%></a>&nbsp;
	<%
	if(i==totalPage)break;
}
if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
	%>
	<a href="notice.jsp?cp=<%=(userGroup+1)*pageSize+1 %>">&gt;&gt;</a>
	<%
}
%>
				</td>
			</tr>
		</tfoot>
	</table>
			<%
			if(sgrade_ss.equals("0")){
			%>
			<div class="pr_write_bt">
				<a href="noticeWrite.jsp">글쓰기</a>
			</div>
			<%	
			}	
			%>

</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>