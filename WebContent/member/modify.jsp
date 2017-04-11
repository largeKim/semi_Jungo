<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="tt.member.MemberDAO" />
<%@ page import="tt.member.MemberDTO"%>
<%
	String sid = (String) session.getAttribute("sid");

	if (sid == null || sid.equals("")) {
%>
<script>
	window.alert('로그인이 필요한 서비스 입니다.');
	history.back();
</script>
<%
	return;
	}
	MemberDTO dto = mdao.memberInfo(sid);
	System.out.println(sid);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<script type="text/javascript">
	
</script>
<style type="text/css">
.modiftTable {
	border-top: double 3px black;
	border-bottom: double 3px black;
	margin: 0px auto;
	width: 600px;
	text-align: center;
	border-spacing: 0px;
}

.modiftTable td {
	padding: 10px;
	text-align: left;
}

.modiftTable th {
	padding-left: 40px;
	padding-right: 30px;
	text-align: center;
	border-right: solid 1px gray;
}

h2 {
	text-align: center;
}

p {
	text-align: center;
}

.modify_bt {
	border: 1px solid black;
	background-color: white;
	margin-left: 8px;
}

.m_bt_div {
	width: 165px;
	margin: 0px auto;
}
</style>
</head>
<body>
	<%@ include file="../header.jsp"%>

	<h2>| 회 원 정 보 수 정 |</h2>
	<form action="modify_ok.jsp">
		<table class="modiftTable">
			<tr>
				<th style="border-bottom: solid 1px gray;">아이디</th>
				<td style="border-bottom: solid 1px gray;"><input type="hidden"
					name="id" value="<%=dto.getId()%>"><%=dto.getId()%></td>

			</tr>
			<tr>
				<th style="border-bottom: solid 1px gray;">비밀번호</th>
				<td style="border-bottom: solid 1px gray;"><input
					type="password" name="pwd" required="required"></td>

			</tr>
			<tr>
				<th style="border-bottom: solid 1px gray;">이름</th>
				<td style="border-bottom: solid 1px gray;"><input type="hidden"
					name="name" value="<%=dto.getName()%>"><%=dto.getName()%></td>

			</tr>
			<tr>
				<th style="border-bottom: solid 1px gray;">주소</th>
				<td style="border-bottom: solid 1px gray;"><input type="text"
					name="addr" value="<%=dto.getAddr()%>"></td>

			</tr>
			<tr>
				<th style="border-bottom: solid 1px gray;">이메일</th>
				<td style="border-bottom: solid 1px gray;"><input type="text"
					name="email" value="<%=dto.getEmail()%>"></td>

			</tr>
			<tr>
				<th style="border-bottom: solid 1px gray;">전화번호</th>
				<td style="border-bottom: solid 1px gray;"><input type="text"
					name="tel" value="<%=dto.getTel()%>"></td>

			</tr>
			<tr>
				<th style="border-bottom: solid 1px gray;">가입일자</th>
				<td style="border-bottom: solid 1px gray;"><%=dto.getJoindate()%></td>

			</tr>
			<tfoot>
				<tr>

					<td colspan="2" align="center">
						<div class="m_bt_div">
							<input type="submit" value="수정하기" class="modify_bt">&nbsp;<input
								type="reset" value="다시작성" class="modify_bt">
						</div>
					</td>
				</tr>
			</tfoot>
		</table>

	</form>

	<%@ include file="../footer.jsp"%>
</body>
</html>
