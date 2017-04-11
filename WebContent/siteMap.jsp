<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
</head>
<style>
section{
	height: 690px;
}


section h2{
	text-align: center;
	font-size: 25px;
}
#art1{
	float:left;
	padding-left:80px;
	padding-right:50px;
	margin: 0px auto;
	
}
#art2{
	float:right;
	padding-left:50px;
	padding-right:80px;
	margin: 0px auto;
}
fieldset{
	border: hidden;
}
fieldset div{
	border: 1px solid;
	border-color: grey;
}

#mhome{
	width:400px;
	padding: 10px;
	font-size: 20px;
	float: 0px auto;
	text-align: center;
}
#mhome div{					/* 작업중 */
	
	background-color: black;
	
	
}
#mhome a:LINK{
	color:white;
	text-decoration: none;
	
	
}
#mhome a:VISITED{
	color:white;
	text-decoration: none;
}
#mhome fieldset div:HOVER{
	background-color: #CCCCCC;
	
}

#mintro{
	width:400px;
	padding: 10px;
	font-size: 20px;
	float: 0px auto;
}
#lb{
	
	text-align: center;
	background-color: black;
	color: white;
}

#lb a:link{
	color: white;
	text-decoration: none;
}
#lb a:VISITED{
	color: white;
	text-decoration: none;
}

#lb:HOVER{
	background-color: #CCCCCC;
	
}



/* 인덱스 메뉴들 */
#mtrade{
	width:400px;
	padding: 10px;
	font-size: 20px;
	float: 0px auto;

}
#mtrade a:LINK{
	
	text-decoration: none;
	
}
#mtrade a:VISITED{
	
}

#mfree{
	width:400px;
	padding: 10px;
	font-size: 20px;
	float: 0px auto;
}

#mcu{
	width:400px;
	padding: 10px;
	font-size: 20px;
	float: 0px auto;
}



#mnotice{
	width:400px;
	padding: 10px;
	font-size: 20px;
	float: 0px auto;
	text-align: center;
}
#mnotice fieldset div:HOVER{
	background-color: #CCCCCC;
	
}
#mnotice div{
	background-color: black;
}
#mnotice a:LINK{
	color:white;
	text-decoration: none;
	
}
#mnotice a:VISITED{
	color:white;
}
#mnotice fieldset div:HOVER{
	background-color: #CCCCCC;
	
}

#mmypage{
	width:400px;
	padding: 10px;
	font-size: 20px;
	float: 0px auto;
}
#mmypage a:LINK{
	
	text-decoration: none;
	
}


/* 하위메뉴 */
span ol li{
	border: 1px solid;
	border-color: white;
	color: black;
}
span ol li a:LINK{
	color: black;
	text-decoration: none;
}
span ol li a:VISITED{
	color: black;
	text-decoration: none;
}
span ol li:HOVER{
	background-color: #CCCCCC;
	
}
#sub ol li a{

}
#msubli1{
	border-bottom: 1px solid;
	
}
#msubli2{
	border-bottom: 1px solid;
	
}
#msubli3{
	border-bottom: 1px solid;
	
}
#msubli4{
	border-bottom: 1px solid;
	
}



</style>
<body>
	<%@include file="../header.jsp"%>
	
	<section>	
		<h2>사이트 맵</h2>
	
		<article id="art1">
		<ul>
			
				<li>
					<div id="mhome">
					<fieldset>
					<div><a href="/semi_Jungo/index.jsp">홈</a></div>
	
					</fieldset>
					
					</div>
				</li>
				
				<li>
				<div id="mintro">
					<fieldset>
					<ul>
						<li id="lb"><a href="/semi_Jungo/intro.jsp">사이트 소개</a></li>
						<li>
							<span id="msub">
								<ol>
									<li id="msubli1"><a href="/semi_Jungo/intro.jsp">회사 소개</a></li> 
									<li><a href="/semi_Jungo/map.jsp">오시는 길</a></li>
								</ol>
							</span>
						</li>
					</ul>
					</fieldset>
					</div>		
				</li>
				
				<li>
					<div id="mtrade">
					<fieldset>
					<ul>	
						<li id="lb"><a href="/semi_Jungo/productList/productSellList.jsp">중고 거래</a></li>
						<li>
							<span id="msub">
								<ol>
									<li id="msubli1"><a href="/semi_Jungo/productList/productSellList.jsp">Sell</a></li> 
									<li id="msubli2"><a href="/semi_Jungo/productList/productBuyList.jsp">Buy</a></li> 
									<li><a href="/semi_Jungo/productList/productSwitchList.jsp">Switch</a></li>
								</ol>
							</span>
						</li>
					</ul>
					</fieldset>
					</div>
				</li>
				
				<li>
					<div id="mfree">
					<fieldset>
					<ul>
						<li id="lb"><a href="/semi_Jungo/sportList/soccerList.jsp">스포츠 / 자유</a></li>
						<li>
							<span id="msub">
								<ol>		
									<li id="msubli1"><a href="/semi_Jungo/sportList/soccerList.jsp">Soccer</a></li> 
									<li id="msubli2"><a href="/semi_Jungo/sportList/baseballList.jsp">Baseball</a></li> 
									<li id="msubli3"><a href="/semi_Jungo/sportList/basketballList.jsp">Basketball</a></li> 
									<li><a href="/semi_Jungo/sportList/etcList.jsp">ETC</a></li>
								</ol>
							</span>
						</li>
					</ul>
					</fieldset>
				</div>
				</li>
		</ul>		
		</article>
	
		<article id="art2">
		<ul>
				
				<li>
				<div id="mcu">
				
					<fieldset>
					<ul>
						<li id="lb"><a href="/semi_Jungo/complainList/complain.jsp">고객센터</a></li>
						<li>	
							<span id="msub">
								<ol>
									<li id="msubli1"><a href="/semi_Jungo/complainList/complain.jsp">고객의소리</a></li> 
									<li id="msubli2"><a href="/semi_Jungo/questionList/question.jsp">질문게시판</a></li>
									<li><a href="/semi_Jungo/faqList/faq.jsp">자주묻는질문</a></li>
								</ol>
							</span>
						</li>
					</ul>
					</fieldset>
				</div>
				</li>
				
				<li>
				<div id="mnotice">
					<fieldset>
					<div><a href="/semi_Jungo/noticeList/notice.jsp">공지사항</a></div>
					</fieldset>
				</div>
			
				<div id="mmypage">
					<fieldset>
					<ul>	
						<li id="lb"><a href="/semi_Jungo/cartList/favorCart.jsp">마이 페이지</a></li>
						<li>
							<span id="msub">
								<ol>
									<li id="msubli1"><a href="/semi_Jungo/cartList/favorCart.jsp">장바구니</a></li> 
									<li id="msubli2"><a href="/semi_Jungo/member/messageReceiveList.jsp">쪽지함</a></li>
									<li id="msubli3"><a href="/semi_Jungo/member/modifyCheck.jsp">회원정보수정</a></li> 
									<li id="msubli4"><a href="/semi_Jungo/member/memberOut.jsp">회원탈퇴</a></li> 
									<li><a href="/semi_Jungo/pointExchange/pointProductList.jsp">포인트샵</a></li>
								</ol>
							</span>
						</li>
					</ul>
					</fieldset>
				</div>
				</li>
		</ul>	
		</article>
	</section>
	<%@include file="../footer.jsp"%>
</body>
</html>