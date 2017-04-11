<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
</head>
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
dd{
	color:#5A5A5A ;
}
dt{
	margin-left:10px;
}
#intro00{
	margin-left: 0px;
}
</style>
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
						<h3>기업 소개</h3>
						<div id="history">
							<a class="home" href="/semi_Jungo/index.jsp" title="Home"><img alt="home" src="img/home_s.png"></a> &gt; <a
								href="/semi_Jungo/intro.jsp">사이트 소개</a> &gt; <a
								href="/semi_Jungo/intro.jsp">기업 소개</a>
						</div>
					</div>
					<div id="content">
					<dl id="intro00" name="info">
					<dt><img src="/semi_Jungo/img/intro00.png" height="85px" ></dt>
						<dd>
							<img alt="logo" src="/semi_Jungo/img/intromain.png" style="width: 800px;height: 300px;"><br>
							Ksport 중고 마켓은 정보통신 기술 발전과 타 분야와의 기술 융합에 따라 무수히 생성되는 정보통신용어를 해설하고
							표준화하여, 전문가뿐만 아니라 비전문가들도 올바르게 활용할 수 있도록 정보통신용어사전을 서비스하고 있습니다. PC
							또는 스마트폰으로 웹에 직접 접속하시거나 모바일 앱 마켓에서 정보통신용어사전 앱을 내려 받아 이용하실 수 있습니다.
						</dd>
					</dl>
					<div>
					<dl name="f_age">
						<dt><img src="/semi_Jungo/img/intro01.jpg"></dt>
						<dd>2017년, 한국 서울특별시 역삼동에서 컴퓨터 프로그래머를 꿈꾸는 tt조원들이 ‘세미중고’(semi_Jungo) 란 이름으로 개인
						경매 사이트를 오픈합니다.  그가 웹사이트에 올린 첫 품목은 부서진 키보드. 자신에겐 쓸모 없어진 이 낡은 물건이 만5천원에 팔리는
						것을 본 tt조원들은 인터넷 경매의 가능성을 발견했고, 이후 본격적으로 사업을 시작하며 인터넷 경매시장에 더넓은 지평을 활짝 열었습
						니다. 2017년 ‘semi_Jungo’에서 ‘케이스포츠’(kSport)로 사명을 변경한 이래 케이스포츠는 전국에 걸쳐 5여명의 임직원들을 
						두고 있으며, 로컬 Marketplace(협약 음식점) , 새로배움카드(출석체크), 그리고 k-Sport Point (e-commerce 마케팅 
						솔루션 제공) 사업에 주력을 두고 있는 명실공히 e-commerce의 로컬 리더입니다. 또한, 온라인 벼룩시장 상품게시판을 비롯하여 
						온라인 경매사이트 Auction게시판, e-commerce 개발자를 위한 열린 플랫폼 K Commerce, 중대형 e-commerce 생활비 및 
						교통비를 제공하는 수당지급 등 다양한 혜택을 운영하며 온라인 마켓플레이스 분야를 선도하고 있습니다.</dd>
					</dl>
					</div>
					<div>
					<dl>
						<dt><img src="/semi_Jungo/img/intro02.jpg"></dt>
						<dd>차별화된 전자상거래 플랫폼과 서비스를 바탕으로 줄곧 가파른 성장세를 유지해 온 케이스포츠코리아는 2017년 현재, 동네 유수의 
						중고거래 사이트를 제치고 명실공히 localHost 쇼핑업계 1위를 수상하고 있습니다. tt마켓, 짭션, G9인 등 저마다의 강점을 지닌 
						강력한 브랜드를 바탕으로 동네 전자상거래 시장의 양적 성장에 기여할 뿐만 아니라, 동네 중소상인들의 전국 유통을 적극 장려하며 업계의
						 질적 발전을 선도하고 있습니다. 또한, 2017년부터 현재까지 역삼동 39여개 번지에 진출한 모기업인 케이스포츠코리아의 로컬플랫폼을 
						 통해 동네 셀러들의 전국 진출기반 마련에 앞장서 왔습니다. 이스포츠 코리아는 고객들에게 안전하고 편리한 쇼핑환경을 제공하기 위해
						 항상 고민합니다. 2017년부터 업계 최초로 ‘3중 예외(Exception) 복구시스템’을 도입, 어떠한 위험 상황에서도 고객들이 안전하게
						 쇼핑을 즐길 수 있도록 최선의 노력을 기울이고 있으며 tt마켓과 짭션은 상표권자가 가품으로 의심되는 상품을 신고하면 즉시 해당 상품의
						 거래를 중지 시키는 ‘VERO’(Verified Rights Owner) 제도를 도입하여 거래의 신뢰성을 한 단계 끌어올렸습니다. 앞으로도 케이
						 스포츠코리아는 고객편의성을 확대하기 위한 노력을 다각도로 펼쳐 나갈 것입니다.</dd>
					</dl>
					</div>
					<div>
					<dl>
						<dt><img src="/semi_Jungo/img/intro03.jpg"></dt>
						<dd>2000년 4월 첫 선을 보인 tt마켓은 업계 최초 연간 거래 액 4조 억 돌파, 월 거래 액 3천억 원을 달성하는 놀라운 성장세를 
						기록하며 국내 온라인쇼핑 No.1 브랜드 로서의 위치를 확고히 다졌습니다. G마켓은 ‘최초’라는 단어가 익숙합니다. 온라인 커머스 최초로
						 스타 마케팅을 활용한 스타샵 서비스, 해외 배송 서비스, 무료 모바일 구매 어플리케이션 개발에 이르기까지 ‘업계 최초’라는 수식어에 
						 걸맞은 참신한 서비스를 꾸준히 선보여 왔습니다. 또한 여행 · 컨텐츠 · 생활서비스 · 식품 · 생필품에 이르기까지 여러 분야에서 신 
						 성장 동력 발굴을 위한 끊임없는 연구를 거듭하고 있습니다. t마켓은 외형의 성장만을 중요하게 생각하지 않습니다. tt마켓은 설립 초기
						 부터 온라인 판매에만 치중하지 않고 중소상공인 및 지방자치단체와의 적극적인 협업 을 통해 소규모 상인들의 온라인 판로 개척에 앞장서
						  왔습니다. 시작부터 끝까지 tt마켓”이란 슬로건을 내걸고 연간 20억 원 이상의 기금을 조성 하여 다양한 사회공헌활동을 펼치고 있습니
						  다. 앞으로 tt마켓은 더욱 혁신적이고 가치 있는 서비스를 통해 오픈 마켓의 한계를 뛰어넘어 상거래서비스의 글로벌 리더로 성장해 나갈
						   것입니다.</dd>
					
					</dl>
					</div>
					</div>
					<div>
						<div>
							<dt><img src="/semi_Jungo/img/intro04.jpg"></dt>
						</div>
						
						<div>
							<dt><img src="/semi_Jungo/img/intro05.jpg"></dt>
						</div>
						<div>
							<dt><img src="/semi_Jungo/img/intro07.jpg"></dt>
							<dd>‘ttLOVE’는 세계 각국에 청년봉사단원을 파견하는 G마켓의 사회공헌활동입니다.

							대한민국의 젊은이들이 우리와 다른 문화에 대해 이해하고 개발도상국 현지에서의 경험을 통해 용기와 도전정신을 배양하고 더불어 
							살아가는 방법을 배우는 것이 그 목적입니다. 2006년 1기 활동을 시작으로 2014년 현재(22기) 약 2,000여 명의 봉사자가 
							케냐 · 에티오피아 · 인도·몽골 · 네팔 · 캄보디아 등지에서 봉사활동을 펼쳤습니다. 매년 2회에 걸쳐 정기적으로 노력봉사, 
							교육봉사, 문화봉사 등 다양한 활동범위의 자원봉사자를 모집하는 ttLOVE는 서류전형 및 면접, 합숙교육을 통해 최종 선발자를 
							선정하며 참가자 전원에게 봉사활동 확인증을 발급하고 우수 단원에게는 표창장을 수여합니다.
							
							현지에서의 다양한 체험활동을 통해 봉사정신을 기르고, 글로벌 리더십을 함양할 수 있는 좋은 기회인만큼 매 시즌 경쟁이 
							치열합니다. 취업포털 사이트 잡코리아에서 대학생을 대상으로 한 “꼭 한번 활동해보고 싶은 대외활동” 조사에서 1위에 
							꼽히기도 했습니다. </dd>
						</div>
						<div>
							<dt><img src="/semi_Jungo/img/intro08.jpg"></dt>
							<dd>tt마켓이 후원하는 ‘초록숲길 가꾸기’ 사업은 서울에 소재한 산의 등산로 및 숲길을 대상으로 주요 안내 시설물 정비, 나무 심기 등을 통해 더욱 풍성하고 아름다운 숲길을 만드는 사업입니다. 

난 2008년 ‘관악산 숲길 가꾸기’ 캠페인을 시작으로 현재까지 수락산, 초안산 등 총 4곳의 초록숲길이 탄생했습니다. 
2012년 7월에는 ‘수락산 아름다운 숲길 가꾸기’ 캠패인을 진행했습니다. 방향. 위치, 계도, 자연해설 안내판 등 약 50개소의 안내 시설물을 설치하였고, 노후화된 종합안내판 2개소를 재정비했습니다. 특히 각 안내판에는 QR코드를 부착하여 자세한 위치정보를 제공하는 한편 자연해설 안내판을 웹페이지에 연동시켜 등산객들이 더욱 자세한 정보를 얻을 수 있게 했습니다.

2013년 3월, tt마켓은 서울시 생명의숲과 '초록숲길 조성' MOU를 체결하고 2015년까지 초록숲길 연중 사업추진예산 4억 5천만 원 후원을 약속하였습니다. 

향후 도봉구 초안산 일원 ‘걷고 싶은 서울길’ 등 서울 시내 10여 곳에 tt마켓의 초록숲길이 구축될 계획입니다.
							</dd>
						</div>
					</div>
				</div>
			</div>
		</article>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>