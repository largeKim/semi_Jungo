<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<script type="text/javascript">
	function idCheck() {
		window.open('idCheck.jsp', 'idCheck', 'width=300,height=200');
	}

	function selectEmail() {
		var e = document.join.semail.value;
		if (e == 'self') {
			document.join.email2.value = '';
			document.join.email2.readOnly = false;
		} else if (e == '') {
			document.join.email2.value = '';
			document.join.email2.readOnly = true;
		} else {
			document.join.email2.readOnly = true;
			document.join.email2.value = e;
		}
	}

	function selectTel() {
		var e = document.join.stel.value;
		if (e == 'self') {
			document.join.tel1.value = '';
			document.join.tel1.readOnly = false;
		} else if (e == '') {
			document.join.tel1.value = '';
			document.join.tel1.readOnly = true;
		}

		else {
			document.join.tel1.readOnly = true;
			document.join.tel1.value = e;
		}
	}
	
	function idcheck(){
		var id = document.join.id.value;
		if(id==null||id==""){
			alert('id를 입력해주새요');
			location.href='join.jsp';
		}
	}
</script>
<style type="text/css">
.join {
	border-top: double 3px black;
	border-bottom: double 3px black;
	margin: 0px auto;
	width: 600px;
	text-align: center;
}

.join td {
	padding: 10px;
	text-align: left;
}

.join th {
	padding-left: 40px;
	padding-right: 30px;
	text-align: center;
	border-right: solid 1px gray;
}

.join_bt {
	display: block;
	background-color: white;
	margin: 0px auto;
	padding: 15px 25px 15px 25px;
	border: solid 1px black;
	padding: 15px 25px 15px 25px;
}

h2 {
	text-align: center;
}

p {
	text-align: center;
}
</style>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<section>
		<article>
			<h2>| 회 원 가 입 |</h2>
			<form name="join" action="join_ok.jsp">
				<table class="join">
					<tr>
						<th style="border-bottom: solid 1px gray;">아이디</th>
						<td style="border-bottom: solid 1px gray;"><input type="text"
							name="id" readonly="readonly" required="required">&nbsp;<input
							type="button" name="id_bt" value="중복조회" onclick="idCheck()"></td>

					</tr>
					<tr>
						<th style="border-bottom: solid 1px gray;">비밀번호</th>
						<td style="border-bottom: solid 1px gray;"><input
							type="password" name="pwd" required="required"></td>
					</tr>
					<tr>
						<th style="border-bottom: solid 1px gray;">이름</th>
						<td style="border-bottom: solid 1px gray;"><input type="text"
							name="name" required="required"></td>
					</tr>
					<tr>
						<th style="border-bottom: solid 1px gray;">주소</th>
						<td style="border-bottom: solid 1px gray;"><font size="1">기본주소</font></br>
							<input type="text" name="addr_1" size="30" required="required"></br>
							<font size="1">상세주소</font></br> <input type="text" name="addr_2"
							size="30" required="required"></td>
					</tr>
					<tr>
						<th style="border-bottom: solid 1px gray;">이메일</th>
						<td style="border-bottom: solid 1px gray;"><input type="text"
							name="email1" size="10" required="required"> @ <input
							type="text" name="email2" required="required" readonly="readonly">
							<select name="semail" onclick="selectEmail()">
								<option value="">선택</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="gmail.com">gmail.com</option>
								<option value="nate.com">nate.com</option>
								<option value="yahoo.com">yahoo.com</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="outlook.com">outlook.com</option>
								<option value="self">직접입력</option>
						</select></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><select name="stel" onclick="selectTel()">
								<option value="">선택</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="106">106</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="self">직접입력</option>
						</select> <input type="text" name="tel1" size="5" required="required"
							readonly="readonly"> - <input type="text" name="tel2"
							size="5" required="required"> - <input type="text"
							name="tel3" size="5" required="required"></td>
					</tr>
				</table>
				<p>
					<input type="submit" value="회원가입" class="join_bt" onclick="idcheck()">
				</p>
			</form>
		</article>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>