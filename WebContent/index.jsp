<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="tt.member.MemberDAO" scope="session" />
<jsp:useBean id="mdto" class="tt.member.MemberDTO" scope="session" />
<!-- 추가 수정 부분 170401 토 시작 -->
<jsp:useBean id="adto" class="tt.advertise.AdvertiseDTO" scope="session" />
<jsp:useBean id="adao" class="tt.advertise.AdvertiseDAO" scope="session" />
<!-- 추가 수정 부분 170401 토 시작 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>== T E A M 2 INDEX ==</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
<style type="text/css">
body {
	overflow-y: scroll;
}

.banner {
	float: left;
	margin-right: 20px;
}

.login {
	float: left;
	height: 180px;
	width: 380px;
}

.login ul li {
	list-style-type: none;
	margin-left: 40px;
	margin-right: 30px;
	padding-bottom: 20px;
	display: inline;
	width: 40%;
	float: left;
	padding-bottom: 20px;
}

.login ul {
	margin-top: 30px;
}

.login a:link {
	color: black;
	text-decoration: none;
}

.login a:visited {
	color: black;
	text-decoration: none;
}

.login a:hover {
	color: red;
}

.login_menu {
	clear: both;
	margin-left: 35px;
	margin-top: 10px;
	font-size: 11px;
	margin-left: 35px;
}

.login_bt {
	display: block;
	background-color: white;
	margin-top: 20px;
	padding: 25px;
	border: solid 1px black;
}

.contentMenu {
	clear: both;
	float: left;
	background-color: black;
	width: 800px;
	margin-right: 20px;
	margin-top: 30px;
	height: 30px;
	padding-top: 5px;
	margin-top: 30px;
	display: block;
}

.contentMenu ul li {
	float: left;
	list-style-type: none;
	margin: 0 0 0 30px;
	list-style-type: none;
}

.contentMenu a:VISITED {
	color: white;
	text-decoration: none;
}

.contentMenu a:HOVER {
	color: red;
}

.contentMenu a:LINK {
	color: white;
	text-decoration: none;
}

.content {
	clear: both;
	width: 799px;
	height: 400px;
	float: left;
	margin-bottom: 10px;
	margin-right: 20px;
	border: solid 1px black;
}

.notice {
	float: left;
	margin-top: 18px;
	border-bottom: solid 2px black;
	width: 380px;
	height: 30px;
	padding-bottom: 15px;
	margin-top: 18px;
	display: block;
}

.notice h3 {
	float: left;
	display: block;
}

.notice h3 a:HOVER {
	color: red;
}

.notice h3 a:VISITED {
	text-decoration: none;
	color: black;
}

.notice h3 a:LINK {
	color: black;
	text-decoration: none;
}

.login_come {
	margin-bottom: 10px;
	padding-top: 15px;
	display: block;
	padding: 15px 10px 0px 60px;
	//
	상
	우
	하
	좌
}

.login_user1 {
	font-size: 20px;
	float: left;
	display: block;
	width: 90px;
	text-align: center;
	padding-right: 7px;
	padding-left: 7px;
	border-bottom: solid 1px black;
}

.login_user2 {
	text-align: left;
	font-size: 18px;
	margin-top: 7px;
}

.login_done {
	border: solid 1px black;
	float: left;
	display: block;
	padding: 15px;
	font-size: 13px;
	margin-right: 15px;
	margin-top: 10px;
	text-align: center;
}

.logout {
	height: 80px;
	padding: 0px 0px 0px 30px;
}

.userInfo1 {
	display: block;
	float: left;
	width: 35%;
	text-align: center;
	margin-bottom: 8px;
	display: block;
	margin-left: 60px;
}

.userInfo2 {
	display: block;
	float: left;
	width: 35%;
	text-align: left;
	margin-bottom: 8px;
	display: block;
}

.infoText {
	border: hidden;
}

.searchBar {
	width: 1000px;
	padding-left: 170px;
}

.searchText {
	margin: 10px 0px 10px 45%;
	width: 30%;
	height: 30px;
	border: 3px solid black;
	padding: 0px 30px 0px 10px;
}

.searchBt {
	width: 80px;
	height: 36px;
	border: 1px solid black;
	background-color: black;
	text-align: center;
	color: white;
	margin-left: -10px;
}

.login_host {
	float: right;
	text-align: right;
	background-color: black;
	text-align: right;
	padding: 5px;
}

h1 {
	width: 1200px;
	text-align: center;
	font-size: 50px;
	color: black;
	text-shadow: 5px 5px 5px gray;
}

.noticeList {
	height: 130px;
	width: 375px;
	float: left;
	margin-bottom: 10px;
	margin-top: -35px;
}

.indexAdvertise {
	width: 340px;
	height: 320px;
	float: left;
	margin-top: -270px;}

.indexFooter {
	max-width: 1200px;
	height: 100px;
	background-color: pink;
}

.indexPointshop {
	float: left;
	width: 360px;
	margin-bottom: 20px;
	border: 3px double black;
	border-radius: 10px;
	text-align: center;
	font-size: 30px;
	padding-bottom: 5px;
}

.indexshop_img {
	padding-top: 5px;
	float: left;
	text-align: right;
	background-color: pink;
}

.indexshop_a {
	
}

.bestsport {
	clear: both;
	width: 799px;
	height: 180px;
	float: left;
	margin-right: 30px;
	margin-bottom: 10px;
	border: 1px solid black;
}

.bestSportMenu {
	background-color: black;
	width: 795px;
	height: 30px;
	color:white;
	float: left;
	padding-left: 5px;
}
</style>
</head>
<%
	Cookie cks[] = request.getCookies(); // 아이디 쿠키저장
	String saveid = "";
	if (cks != null) {
		for (int i = 0; i < cks.length; i++) {
			if (cks[i].getName().equals("saveid")) {
				saveid = cks[i].getValue();
			}
		}
	}
%>
<%
	String sname_i = (String) session.getAttribute("sname"); // 이름 받아오기
	String sid_in = (String) session.getAttribute("sid");
	String sgrade_i = (String) session.getAttribute("sgrade");
	if (sgrade_i == null) {
		sgrade_i = "1";
	}

	int count = 0;

	if (!(sid_in == null || sid_in.equals(""))) { // 아이디가 있으면 포인트를 가져옴
		if (!(sgrade_i.equals("0"))) { // 관리자가 아닌 1 이상의 등급일 때 가져옴
			count = mdao.getPoint(sid_in);
			mdao.pointRank(count, sid_in);
			System.out.println("count:" + count);
		}
	}
	if (sid_in == null || sid_in.equals("")) {
		sgrade_i = "1";
	} else {
		sgrade_i = mdao.getGrade(sid_in);
	}
%>
<body>
	<%@include file="header.jsp"%>
	<section>
		
		<h1>T E A M 2</h1>
		<!-- 배너 -->
		<div class="banner">
			<img alt="배너" src="img/img03.jpg" height="180px" width="800px">
		</div>
		<!-- 로그인 -->
		<div class="login">
			<form name="login" action="/semi_Jungo/login_ok.jsp">
				<fieldset style="height: 162px;">
					<%
						if (sname_i == null || sname_i.equals("")) {
					%>
					<ul>
						<li><input type="text" name="userid" placeholder="아이디"
							size="15px" value="<%=saveid%>"></li>
						<li><input type="password" name="userpwd" placeholder="비밀번호"
							size="15px"></li>
					</ul>
					<input type="submit" value="LOGIN" height="30px" class="login_bt">
					<div class="login_menu">
						<label><input type="checkbox" name="saveid" value="on"
							<%=saveid.equals("") ? "" : "checked"%>>아이디저장</label>&nbsp;&nbsp;|&nbsp;&nbsp;
						<a href="/semi_Jungo/member/findIdPwd.jsp">아이디/비밀번호찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp;
						<a href="/semi_Jungo/exJoin/joinCheck.jsp">회원가입</a>
					</div>
					<%
						} else {
					%>
					<%
						if (sgrade_i.equals("0")) {
					%>
					<span class="login_host"><font size="2" color="white">관리자</font></span>
					<%
						}
					%>
					<div class="login_come">
						<div class="login_user1">
							<%=sname_i%></div>
						<div class="login_user2">님 환영합니다</div>
					</div>
					<%
						if (!(sname_i == null)) {
					%>
					<div class="userInfo1">
						포인트&nbsp;<b>|</b>&nbsp;<input type="text" id="points"
							name="userpoint" value="<%=count%>점" size="3" readonly="readonly"
							class="infoText">
					</div>
					<div class="userInfo2">
						등급&nbsp;<b>|</b>&nbsp;<input type="text" id="grades"
							name="userpoint" value="<%=sgrade_i%>등급" size="3"
							readonly="readonly" class="infoText">
					</div>
					<%
						}
					%>
					<div class="logout">
						<div class="login_done">
							<a href="/semi_Jungo/member/messageReceiveList.jsp">내쪽지함</a>
						</div>
						<div class="login_done">
							<a href="/semi_Jungo/member/modifyCheck.jsp">정보수정</a>
						</div>
						<div class="login_done">
							<a href="/semi_Jungo/logout.jsp">로그아웃</a>
						</div>
					</div>
					<%
						}
					%>

				</fieldset>
			</form>
		</div>
		<!-- 게시판 상단메뉴 -->
		<div class="contentMenu">
			<%
				String userclick_s = request.getParameter("userclick");
				int userclick;
				if (userclick_s == null || userclick_s.equals("")) {
					userclick = 0;
				} else {
					userclick = Integer.parseInt(userclick_s);
				}
			%>
			<ul>
				<li><a href="index.jsp?userclick=1">Sell</a></li>
				<li><a href="index.jsp?userclick=2">Buy</a></li>
				<li><a href="index.jsp?userclick=3">Switch</a></li>
				<li><a href="index.jsp?userclick=4">Auction</a></li>
 
			</ul>
		</div>

		<!-- 게시판 -->
		<div class="content">
			<%
				if (userclick == 1) {
			%>
			<jsp:include page="/indexList/indexSellList.jsp" />
			<%
				} else if (userclick == 2) {
			%>
			<jsp:include page="/indexList/indexBuyList.jsp" />
			<%
				} else if (userclick == 3) {
			%>
			<jsp:include page="/indexList/indexSwitchList.jsp" />
			<%
				} else if (userclick == 4) { 
			%> 
			<jsp:include page="/indexList/indexAuctionList.jsp" /> 
			<% 
				} else {
			%>
			<jsp:include page="/indexList/indexSellList.jsp" />
			<%
				}
			%>
		</div>
		<div class="noticeList">
			<jsp:include page="/indexList/indexNoticeList.jsp" />
		</div>
		<!-- 포인트샵으로 이동 -->
		<div class="indexPointshop">
			<div class="indexshop_img">
				<img src="img/cart.png">
			</div>
			<div class="indexshop_a">
				<a
					href="/semi_Jungo/pointExchange/pointProductList.jsp?point=<%=count%>">Point
					Shop</a>
			</div>
		</div>
		<!-- best 게시판 상단메뉴 -->
		<div class="bestSportMenu">
			<font>HIT 게시판</font>
		</div>
		<!-- best 게시판 -->
		<div class="bestsport">
			<jsp:include page="/indexList/indexBestSport.jsp" />
		</div>
		<!-- 수정 추가부분 170401 토 시작 -->
		<%
			adto = adao.advList();
			if (adto.getImgpath() != null) {
		%>
		<div class="indexAdvertise">
			<a href="<%=adto.getUrl()%>"> <img src="<%=adto.getImgpath()%>"
				width="375px" height="320px">
			</a>
		</div>
		<%
			} else {
		%>
		<div class="indexAdvertise">
			광고가 없습니다.<br> [170412 local에서 더한내용]광고문의는 홈페이지 하단 광고문의 참조
		</div>
		<%
			}
		%>
		<!-- 수정 추가부분 170401 토 끝 -->
	</section>
	<span class="indexFooter"> <%@include file="footer.jsp"%>
	</span>
</body>
</html>