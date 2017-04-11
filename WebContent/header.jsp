<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="memdao" class="tt.member.MemberDAO" scope="session" />
<jsp:useBean id="memdto" class="tt.member.MemberDTO" scope="session" />
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="Stylesheet" type="text/css" href="css/mainLayout.css">
<%
	String sgrade_s = (String) session.getAttribute("sgrade");
	if (sgrade_s == null) {
		sgrade_s = "1";
	}
	
	
	String sid_he = (String) session.getAttribute("sid"); // 아이디 받아오기

	int count_p = 0;

	if (!(sid_he == null || sid_he.equals(""))) { // 아이디가 있으면 포인트를 가져옴
		if (!(sgrade_s.equals("0"))) {
			count_p = memdao.getPoint(sid_he);
			System.out.println("포인트확보:" + count_p);
		}
	}
%>
<style>
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
.headerImg {
	display: block;
	margin: 0px auto;
	margin-bottom: 10px;
}
</style>
</head>
<header name="top">
	<div>
		<a href="/semi_Jungo/index.jsp"><img alt=""
			src="/semi_Jungo/img/black.png" height="150px;" class="headerImg"></a>
	</div>
	<div class="header_div">
		<ul>
			<li><a href="/semi_Jungo/index.jsp">홈</a></li>
			<li class="mainMenu_dropdown"><a href="/semi_Jungo/intro.jsp" class="mainMenu_dropbtn">사이트 소개</a>
				<div class="mainMenu_dropdown_content">
					<a href="/semi_Jungo/intro.jsp">회사 소개</a> 
					<a href="/semi_Jungo/map.jsp">오시는 길</a>
				</div></li>
			<li class="mainMenu_dropdown"><a href="/semi_Jungo/productList/productSellList.jsp" class="mainMenu_dropbtn">중고 거래</a>
				<div class="mainMenu_dropdown_content">
					<a href="/semi_Jungo/productList/productSellList.jsp">Sell</a> 
					<a href="/semi_Jungo/productList/productBuyList.jsp">Buy</a> 
					<a href="/semi_Jungo/productList/productSwitchList.jsp">Switch</a>
					<a href="/semi_Jungo/productList/productAuctionList.jsp">Auction</a>
				</div></li>
			<li class="mainMenu_dropdown"><a href="/semi_Jungo/sportList/soccerList.jsp" class="mainMenu_dropbtn">스포츠 / 자유</a>
				<div class="mainMenu_dropdown_content">
					<a href="/semi_Jungo/sportList/soccerList.jsp">Soccer</a> 
					<a href="/semi_Jungo/sportList/baseballList.jsp">Baseball</a> 
					<a href="/semi_Jungo/sportList/basketballList.jsp">Basketball</a>
					<a href="/semi_Jungo/sportList/etcList.jsp">ETC</a>
				</div></li>
			<li class="mainMenu_dropdown"><a href="/semi_Jungo/complainList/complain.jsp" class="mainMenu_dropbtn">고객센터</a>
				<div class="mainMenu_dropdown_content">
					<a href="/semi_Jungo/complainList/complain.jsp">고객의소리</a> 
					<a href="/semi_Jungo/questionList/question.jsp">질문게시판</a> 
					<a href="/semi_Jungo/faqList/faq.jsp">자주묻는질문</a>
				</div></li>
			<li><a href="/semi_Jungo/noticeList/notice.jsp">공지사항</a></li>
			<li><a href="/semi_Jungo/siteMap.jsp">사이트맵</a></li>
			<%
				if (sgrade_s.equals("0")) {
			%>
			<li class="mainMenu_dropdown"><a href="/semi_Jungo/member/admin/adminPage.jsp"
				class="mainMenu_dropbtn">관리자 페이지</a>
				<div class="mainMenu_dropdown_content">
					<a href="/semi_Jungo/member/admin/adminPage.jsp">회원정보관리</a>
					<a href="/semi_Jungo/member/messageReceiveList.jsp">쪽지함</a>
					<a href="/semi_Jungo/member/admin/adminBlackList.jsp">블랙리스트 관리</a>
					<a href="/semi_Jungo/member/admin/adminAdvertise.jsp">광고 / 제휴관리</a>
					<a href="/semi_Jungo/member/admin/adminPointEx.jsp">포인트 상품 올리기</a>
				</div></li>
			<%
				} else {
			%>
			<li class="mainMenu_dropdown"><a
				href="/semi_Jungo/cartList/favorCart.jsp" class="mainMenu_dropbtn">마이 페이지</a>
				<div class="mainMenu_dropdown_content">
					<a href="/semi_Jungo/cartList/favorCart.jsp">장바구니</a> 
					<a href="/semi_Jungo/member/messageReceiveList.jsp">쪽지함</a>
					<a href="/semi_Jungo/member/modifyCheck.jsp">회원정보수정</a> 
					<a href="/semi_Jungo/member/memberOut.jsp">회원탈퇴</a> 
					<a href="/semi_Jungo/pointExchange/pointProductList.jsp?point=<%=count_p%>">포인트샵</a>
				</div></li>
			<%
				}
			%>

		</ul>
	</div>
	<form action="/semi_Jungo/upList/searchAll.jsp">
			<span class="searchBar"> <input type="text" name="searVal"
				class="searchText"> <input type="submit" value="Search"
				class="searchBt">
			</span>
	</form>
</header>