<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="Stylesheet" type="text/css" href="css/mainLayout.css">
<style>
li {
	list-style-type: none;
}

.gotop {
	position: fixed;
	bottom: 50px;
	right: 50px;
	color: blue;
	background-color: grey;
}

.copyright {
	text-align: center;
	margin: 20px 0px 20x 0px;
	max-width: 1200px;
	height: 30px;
}

#footMenu {
	clear: both;
	width: 1200px;
	padding: 10px 0 35px 0;
	background-color: white;
	border: 1px solid black;
	border-radius: 30px;
	margin: 0 0 20 0;
}

#footMenuList li {
	float: left;
	margin: 0 0 0 0;
	padding: 0 0 0 60px;
}

#footMenu a {
	font-family: 맑은고딕;
	font-size: 12px;
}

#footMenu a:link { /* 링크가 걸려있는 리스트 모양 */
	color: black;
	text-decoration: none;
}

#footMenu a:visited { /* 링크를 누른 후 모양 */
	color: black;
	text-decoration: none;
}

#footMenu a:hover { /* 마우스를 가져다 댈 때 모양 */
	color: red;
}
.footTable{
	width: 1200px;
	height: 100px;
}
</style>
</head>
<footer>
<br>
	<hr>
	<div id="footMenu">
		<ul id="footMenuList">
			<li><a href="/semi_Jungo/advertise.jsp">광고문의</a></li>
			<li><a href="/semi_Jungo/uselaw.jsp">이용약관</a></li>
			<li><a href="/semi_Jungo/userData.jsp">개인정보 취급방침</a></li>
		</ul>
	</div>
	<div>
	<table class="footTable">
		<tr>
			<th>
			대표이사 : 배병욱입니다.<br>
			전화번호 : 010 - 9378 - 4713
			</th>
			<th>
			서울특별시 강남구 테헤란로 14길 남도빌딩 4F<br>
			git hub 서버에서 바꾼 내용<br>
			(T: 1544-9970) / F: 070-8290-2689)
			</th>
			<th>
			<img alt="풋터로고" src="/semi_Jungo/img/black.png" height="80px" width="250px">
			</th>
		</tr>
	</table>
	</div>
	<div class="gotop">
		<a href="#top">▲TOP</a>
	</div>
	<div class="copyright">Copyright &copy; team2. All Rights
		Reserved.</div>
</footer>
