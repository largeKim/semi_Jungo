<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="tt.member.MemberDAO" />
<%@ page import="tt.member.MemberDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<%
	String sid = (String) session.getAttribute("sid");
	String spwd = (String) session.getAttribute("spwd");
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
<style type="text/css">
.modify_table {
	border-top: double 3px black;
	border-bottom: double 3px black;
	margin: 0px auto;
	width: 600px;
	text-align: center;
	border-spacing: 0px;
}

.modify_table td {
	padding: 10px;
	text-align: left;
}

.modify_table th {
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

.m_bt_div{
	width: 135px;
	margin: 0px auto;
}
</style>
</head>
<body>
	<%@include file="../header.jsp"%>
	<section>
		<h2>회원정보 수정</h2>
		<article>
			<form name="check" action="modifyCheck_ok.jsp">
				<table class="modify_table">
					<tr>
						<th style="border-bottom: solid 1px gray;">아이디</th>
						<td style="border-bottom: solid 1px gray;"><input
							type="hidden" name="id" value="<%=dto.getId()%>"><%=dto.getId()%></td>

					</tr>
					<tr>
						<th style="border-bottom: solid 1px gray;">비밀번호</th>
						<td style="border-bottom: solid 1px gray;"><input
							type="password" name="pwd"></td>

					</tr>

					<tfoot>
						<tr>
							<td colspan="2" align="center">
								<div class="m_bt_div">
									<input type="submit" value="확인" class="modify_bt">&nbsp;<input
										type="reset" value="다시작성" class="modify_bt">
								</div>
							</td>
						</tr>
					</tfoot>
				</table>
			</form>
		</article>
	</section>
	<%@include file="../footer.jsp"%>
</body>
</html>