<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/mainLayout.css">
<style>
h3 {
	text-align: center;
}

body {
	overflow-y: scroll;
}

.blackList {
	max-width: 1000px;
	height: 450px;
	margin: 0px auto;
	border-bottom: 3px double black;
	border-top: 3px double black;
}

.blackList_div {
	width: 300px;
	height: 400px;
	float: left;
	margin-left: 25px;
	padding-top: 10px;
	text-align: center;
}

.blackList_div input[type="text"]{
	border-bottom: 2px solid black;
	border-top: hidden;
	border-left: hidden;
	border-right: hidden;
}

.list {
	width: 280px;
}

.blackList_div input[type="submit"] {
	border: 1px solid black;
	background-color: white;
	padding: 5px 10px 5px 10px;
	margin-top: 10px;
}

.blackTable {
	border-spacing: 5px;
}

.blackTable th {
	text-align: right;
	font-size: 13px;
	width: 35%;
	padding-right: 5px;
}

.blackTable td {
	border-left: 2px solid black;
	border-bottom: hidden;
	border-right: hidden;
	border-top: hidden;
	padding-left: 10px;
}

.blackTable input[type="text"] {
	border: hidden;
}
</style>
<script>
	function ch(id) {
		var id_s = id;
		window.open('adminBlackListGetInfo_ok.jsp?id=' + id_s, 'getinfo',
				'width=5, height=5');
	}
</script>
</head>
<body>
	<%@include file="../../header.jsp"%>
	<jsp:useBean id="mdao" class="tt.member.MemberDAO" />
	<%@include file="adminCategory.jsp"%>
	<h2>블랙리스트 관리</h2>
	<section class="blackList">
		<div class="blackList_div">
			<h3>블랙리스트 관리</h3>
			<form action="adminBlackListDel_ok.jsp">
				<select name="id" size="15" class="list">
					<option selected="selected" style="text-align: center;">-------블랙리스트-------</option>
					<%
						ArrayList<String> bl = mdao.totalBlack();
						if (bl != null) {
							for (int i = 0; i < bl.size(); i++) {
					%>
					<option value='<%=bl.get(i)%>' onclick="ch('<%=bl.get(i)%>')"><%=bl.get(i)%></option>
					<%
						}
						}
					%>
				</select> <br> <input type="submit" id="blbt" value="블랙리스트 삭제">
			</form>
		</div>
		<div class="blackList_div">
			<h3>사용자 정보</h3>
			<form name="blinfo">
				<fieldset>
					<table class="blackTable">
						<tr>
							<th>아이디</th>
							<td><input type="text" name="id" readonly="readonly"></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input type="text" name="name" readonly="readonly"></td>
						</tr>
						<tr>
							<th>주소</th>
							<td><input type="text" name="addr" readonly="readonly"></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="text" name="email" readonly="readonly"></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type="text" name="tel" readonly="readonly"></td>
						</tr>
						<tr>
							<th>가입일자</th>
							<td><input type="text" name="joindate" readonly="readonly"></td>
						</tr>
						<tr>
							<th>등급</th>
							<td><input type="text" name="grade" readonly="readonly"></td>
						</tr>
						<tr>
							<th>포인트</th>
							<td><input type="text" name="point" readonly="readonly"></td>
						</tr>

					</table>
				</fieldset>
			</form>
		</div>

		<div class="blackList_div">
			<form action="adminBlackListAdd_ok.jsp">
				<h3>블랙리스트 추가</h3>
				<b> 아이디 | </b> <input type="text" name="id"> <input
					type="submit" id="blbt" value="블랙리스트 추가">
			</form>
		</div>

	</section>
	<%@include file="../../footer.jsp"%>
</body>
</html>