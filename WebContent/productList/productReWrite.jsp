<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String sid = (String) session.getAttribute("sid");
if (sid == null || sid.equals("")) {
	%>
	<script>
		window.alert('로그인 후 서비스 이용이 가능합니다.');
		location.href = '/semi_Jungo/login.jsp';
	</script>
<%
		return;
		}


int ref = Integer.parseInt(request.getParameter("ref"));
int lev = Integer.parseInt(request.getParameter("lev"));
int sunbun = Integer.parseInt(request.getParameter("sunbun"));


String subject = "    Re:"+request.getParameter("subject");
%>
<html>
<head>
<meta charset="UTF-8">
<title>==== Team 2 ==== 글쓰기</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">

</head>

<style>
h2 {
	text-align: center;
	margin-top: 40px;
}

.p_WriteTable {
	border-top: 3px double black;
	margin: 0px auto;
	margin-bottom: 10px;
	width: 800px;
}

.p_WriteTable th {
	border-bottom: 1px solid black;
	border-right: 1px solid black;
	width: 250px;
}

.Write_td1 {
	border-bottom: 1px solid black;
	border-right: 1px solid black;
}

.Write_td2 {
	border-bottom: 1px solid black;
}

.write_bt {
	border: 1px solid black;
	background-color: white;
}

.writeContent {
	width: 630px;
	padding: 5px;
	border: 1px solid gray;
	margin: 5px;
	border-radius: 5px;
}

.wrbtList {
	margin: 0px auto;
	height: 20px;
	width: 12%;
	margin-bottom: 25px;
}

.wr_bt {
	background-color: white;
	display: block;
	float: left;
	border: 1px solid black;
	margin: 0px 5px 0px 5px;
	padding: 5px;
}
</style>

<body>
<%@include file="../header.jsp" %>
<section>
	<article>
		<h2>답글쓰기</h2>
		<form name="productReWrite" action="productReWrite_ok.jsp">
		
		<input type="hidden" name="writer" value="<%=sid%>">
		<input type="hidden" name="ref" value="<%=ref%>">
		<input type="hidden" name="lev" value="<%=lev%>">
		<input type="hidden" name="sunbun" value="<%=sunbun%>">
		
			<table class="p_WriteTable">
				<tr>
					<th>카테고리</th>
						<td class="Write_td1"><select name="type">
						<option value="<%=request.getParameter("type")%>"><%=request.getParameter("type")%></option>
					</select></td>
					<th>종목</th>
					
					<td class="Write_td2">
					<select name="sort">
						<option value="<%=request.getParameter("sort")%>"><%=request.getParameter("sort")%></option>
					</select></td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3" class="Write_td2">
					<input type="text" name="subject" size="45" value="<%=subject%>" required></td>
				</tr>
				<tr>
					<th>답글 내용</th>
					<td colspan="3" class="Write_td2"><textarea rows="10"
					cols="45" name="content" id="content" required="required"
					class="writeContent"></textarea>
					</td>
				</tr>
				
			</table>
			<div class="wrbtList">
			<input type="submit" value="글쓰기" class="wr_bt">
					<input type="reset" value="다시작성" class="wr_bt">
			</div>
		</form>
	</article>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>