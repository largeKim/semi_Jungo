<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
<style>
li {
	display: list-item;
}
a {
    text-decoration: none;
    color: #000;
}
#center {
	overflow: hidden;
	width: 1200px;
	margin: 0 auto;
	margin-top: 29px;
	text-align: left;
}

#sub_wrap {
	float: left;
}

#sub_menu {
	margin: 0 0px 0 0;
	width: 160px;
}

#sub_menu ul {
	border: 1px solid #b9b9b9;
	border-bottom: 2px solid #555;
}

#sub_menu ul li {
	text-align: left;
	border-bottom: 1px solid #999;
	background-color: #f9f9f9;
}

#sub_menu ul li.depth1 {
	display: block;
	padding: 20px;
	background: #555;
	color: #fff;
	font-size: 16px;
	font-weight: bold;
}

#sub_menu ul li a {
	display: block;
	color: #000;
	font-weight: normal;
	font-size: 13px;
	padding: 14px;
}

#content_wrap {
	float: left;
	width: 900px;
	text-align: left;
	margin-left: 20px;
}
#pagetop {
	padding: 12px 0;
	border-bottom: 1px solid #B9B9B9;
	height: 38px;
}

#content_wrap h3 {
	color: #555;
	letter-spacing: -0.05em;
}

#history {
    float: right;
    position: relative;
    top: -40px;
    color: #999;
    font-family: dotum;
    text-align: left;
}

#history .home {
	display: inline-block;
	width: 25px;
	height: 25px;
	background: url(/image/common/ico_home.gif) no-repeat;
}

#history a {
	color: #999;
}

#maptb {
	margin: 0px auto;
	width: 800px;
	height: 500px;
}

#maptb th {
	width: 70px;
}

.maptb {
	margin: 0px auto;
}

</style>
</head>
<body>
	<%@include file="header.jsp"%>
	<section>
		<article>
			<div id="center">
				<div id="sub_wrap">
					<div class="f1" id="sub_menu">
						<ul>
							<li class="depth1">사이트 소개</li>
							<li><a href="/semi_Jungo/intro.jsp">회사 소개</a></li>
							<li><a href="/semi_Jungo/map.jsp">오시는 길</a></li>
						</ul>
					</div>
				</div>
				<div id="content_wrap">
					<div id="pagetop">
						<h3>오시는 길</h3>
						<div id="history">
							<a class="home" href="/semi_Jungo/index.jsp" title="Home"><img alt="home" src="img/home_s.png"></a> &gt; <a
								href="/semi_Jungo/intro.jsp">사이트 소개</a> &gt; <a
								href="/semi_Jungo/map.jsp">오시는 길</a>
						</div>
					</div>
					<table class="maptb">
						<tr>
							<th>주소</th>
							<td>서울특별시 강남구 테헤란로 14길 남도빌딩 2F,3F,4F(T: 1544-9970 / F:
								070-8290-2689)</td>
						</tr>
						<tr>
							<th>버스</th>
							<td>역삼역 포스코 P&S 타워 정류장<br> <img alt="파란버스"
								src="img/bluebus.png"> 146/ 740/ 341/ 360 &nbsp;&nbsp; <img
								alt="빨간버스" src="img/redbus.png"> 1100/ 1700/ 2000/ 7007/
								8001
							</td>
						</tr>
						<tr>
							<th>지하철</th>
							<td><img alt="지하철2호선" src="img/linenum2.jpg">지하철 2호선
								역삼역 3번출구 100m</td>
						</tr>
						<tr>
							<td colspan="2"><img alt="지도" src="img/kh.png"
								height="300px" width="800px"></td>
						</tr>
					</table>
				</div>
			</div>
		</article>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>