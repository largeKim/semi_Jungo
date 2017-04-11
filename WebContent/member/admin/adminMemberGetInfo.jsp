<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

.info {
	max-width: 1000px;
	height: 380px;
	margin: 0px auto;
	border-bottom: 3px double black;
	border-top: 3px double black;
}

.info_div {
	width: 300px;
	height: 400px;
	float: left;
	margin-left: 25px;
	padding-top: 10px;
}

.leftText {
	border-bottom: 2px solid black;
	border-left: hidden;
	border-right: hidden;
	border-top: hidden;
}

.left_bt {
	border: 1px solid black;
	background-color: white;
	padding: 5px 10px 5px 10px;
	margin-top: 10px;
}

.centerTable {
	border-spacing: 5px;
}

.centerTable th {
	text-align: right;
	font-size: 13px;
	width: 35%;
	padding-right: 5px;
}

.centerTable td {
	border-left: 2px solid black;
	border-bottom: hidden;
	border-right: hidden;
	border-top: hidden;
	padding-left: 10px;
}

.centerTable input[type="text"] {
	border: hidden;
}

.infoRight_bt input[type="submit"] {
	border: 1px solid black;
	background-color: white;
	margin-top:10px;
	margin-bottom:10px;
	padding: 5px 10px 5px 10px;
}
</style>
<script>
	function ch() {
		var id_s = document.getElementById('searchid').value;
		window.open('adminMemberGetInfo_ok.jsp?id=' + id_s, 'getinfo',
				'width=5, height=5');
	}
</script>
</head>
<body>
	<h2>회원관리</h2>
	<section class="info">
		<div class="info_div">
			<h3>사용자 검색</h3>
			<fieldset class="infoLeft">
				<form action="javascript:ch()">
					<b>아이디 |</b> <input type="text" id="searchid" name="id"
						required="required" class="leftText"> <input type="submit"
						value="검색하기" class="left_bt">
				</form>
			</fieldset>
		</div>

		<div class="info_div">
			<h3>사용자 정보</h3>
			<fieldset class="infoCenter">
				<form name="blinfo">
					<table class="centerTable">
						<tr>
							<th>아이디</th>
							<td><input type="text" name="id" id="memberid"
								readonly="readonly" value=""></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input type="text" name="name" readonly="readonly"
								value=""></td>
						</tr>
						<tr>
							<th>주소</th>
							<td><input type="text" name="addr" readonly="readonly"
								value=""></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="text" name="email" readonly="readonly"
								value=""></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type="text" name="tel" readonly="readonly"
								value=""></td>
						</tr>
						<tr>
							<th>가입일자</th>
							<td><input type="text" name="joindate" readonly="readonly"
								value=""></td>
						</tr>
						<tr>
							<th>등급</th>
							<td><input type="text" name="grade" readonly="readonly"
								value=""></td>
						</tr>
						<tr>
							<th>포인트</th>
							<td><input type="text" name="point" readonly="readonly"
								value=""></td>
						</tr>
						<tr>
							<th>블랙리스트</th>
							<td><input type="text" name="black" readonly="readonly"
								value=""></td>
						</tr>
					</table>
				</form>
			</fieldset>
		</div>

		<div class="info_div">
			<h3>관리자 기능</h3>
			<fieldset class="infoRight">
				<form name="addblack" action="adminBlackListAdd_ok.jsp" class="infoRight_bt">
					<input type="hidden" name="id" value=""><input
						type="submit" id="mbt" value="블랙리스트 추가하기">
				</form>
				<form name="delblack" action="adminBlackListDel_ok.jsp" class="infoRight_bt">
					<input type="hidden" name="id" value=""><input
						type="submit" id="mbt" value="블랙리스트 삭제하기">
				</form>
				<form name="memexit" action="out_ok.jsp" class="infoRight_bt">
					<input type="hidden" name="id" value=""><input
						type="submit" id="mbt" value="사용자 강제탈퇴">
				</form>
			</fieldset>
		</div>
	</section>
</body>
</html>