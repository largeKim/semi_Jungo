<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

/*카테고리목록 비표시 처리*/
#category+#wrap>#category_outline {
	display: none;
}
/*체크 상태일 때 표시 처리*/
#categofy:checked+#wrap>#category_outline {
	display: block;
}
/*버튼 디자인*/
#category_inline {
	background: white;
	border: 1px solid black;
	border-radius: 5px;
	padding: 5px;
	width: 1000px;
	margin: 0px auto;
}

#category_inline ul {
	list-style-type: none;
	overflow: hidden;
}

#category_inline ul li {
	text-align: center;
	width: 200px;
	float: left;
}

#category_inline li a:link {
	color: black;
	text-decoration: none;
}

#category_inline li a:visited {
	color: black;
	text-decoration: none;
}

#category_inline li a:hover {
	color: red;
	text-decoration: none;
}

h2 {
	text-align: center;
}
</style>
</head>
<body>
	<div id="wrap">
		<header id="main_header">
			<h2>관리자 페이지</h2>
		</header>
		<div id="category_outline">
			<div id="category_inline">
				<ul>
					<li id="member"><a href="/semi_Jungo/member/admin/adminPage.jsp">회원관리</a></li>
					<li id="black"><a href="/semi_Jungo/member/admin/adminBlackList.jsp">블랙리스트 관리</a></li>
					<li id="advertise"><a href="/semi_Jungo/member/admin/adminAdvertise.jsp">광고 / 제휴 관리</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>