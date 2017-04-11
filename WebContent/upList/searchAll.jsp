<!-- 추가 수정부분 170329 수 시작 -->
<%@page import="tt.sport.SportDTO" %>
<!-- 추가 수정부분 170329 수 끝 -->
<%@page import="tt.complain.ComplainDTO"%>
<%@page import="tt.question.QuestionDTO"%>
<%@page import="tt.faq.FaqDTO"%>
<%@page import="tt.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.*"%>
<%@ page import="tt.product.*"%>
<jsp:useBean id="pdao" class="tt.product.ProductDAO" />
<jsp:useBean id="sdao" class="tt.search.SearchDAO" />

<%
	String sv = request.getParameter("searVal");

	ArrayList<ProductDTO> pal = sdao.searchProduct(sv);
	
	/* 추가 수정부분 170329 수 시작 */
	ArrayList<SportDTO> sal = sdao.searchSport(sv);
	/* 추가 수정부분 170329 수 끝 */
	
	ArrayList<ComplainDTO> cal = sdao.searchComplain(sv);

	ArrayList<QuestionDTO> qal = sdao.searchQuestion(sv);

	ArrayList<FaqDTO> fal = sdao.searchFaq(sv);
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<style>
h2{
	text-align: center;
}
h3{	
	height:30px;
	color:white;
	background-color: black;
	padding: 10px;
	margin-bottom: 0px;
	margin-right: 200px;
	
}
h4{
	background-color: #EEEEEE;
	margin-top: 0px;
	margin-left: 20px;
	margin-right: 220px;
	padding: 10px;
}
#searsec a:LINK{
	text-decoration: none;
	color: black;
}

#searsec a:VISITED{
	text-decoration: none;
	color: black;
}

#searsec a:HOVER{
	color: red;
}

#result{
	display:table-cell;
	height: 50px;
	padding: 20px;
	vertical-align: middle;
}

#result img{
	 vertical-align: middle;
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
</style>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<!-- 검색창 -->
		
	<section id="searsec">
	<h2>검 색 결 과</h2>
	
	<div id="sproduct">
		<ul>
		<li><h3>중고거래 게시판</h3></li>
		
			<li>
				<ol>
				<% if (pal != null && pal.size() != 0) {
						for (int i = 0; i < pal.size(); i++) { %>
					<li>
						<div id="wrap">
						<div id="result">
							<a href="/semi_Jungo/productList/productContent.jsp?idx=<%=pal.get(i).getIdx()%>">
							<img src="<%=pal.get(i).getEtc1()==null?"":pal.get(i).getEtc1()%>" height='50px' width='50px'>
							게시글번호:<%=pal.get(i).getIdx()%>종류:[<%=pal.get(i).getType()%>]글제목:<%=pal.get(i).getSubject()%>글내용:<%=pal.get(i).getContent()%></a>
						</div>
						</div>		
					</li>
				<%			if(i==5)break;
						}
					} else {
				%>
					<li><div id="result">검색결과가 없습니다.</div></li>
				<%
					}
				%>
				</ol>
			</li>
		</ul>
	</div>
	
	
	<!-- 추가 수정부분 170329 수 시작 --> 
	<div id=ssport>
		<ul>
		<li><h3>스포츠/자유 게시판</h3></li>
			<li>
				<ol>
				<%
				if(sal != null && sal.size() != 0){
					for(int i =0 ; i < sal.size(); i++){
						%>
					<li>
						<div id="result">
						<a href="/semi_Jungo/sportList/sportContent.jsp?idx=<%=sal.get(i).getIdx()%>">
						<img src="<%=sal.get(i).getPicpath()==null?"":sal.get(i).getPicpath()%>" height='50px' width='50px'>
						게시글번호:<%=sal.get(i).getIdx() %> 종류:[<%=sal.get(i).getSort() %>] 글제목:<%=sal.get(i).getSubject() %> 내용:<%=sal.get(i).getContent() %>
						</a>
						</div>
					</li>
						<%
						if(i==5)break;
					}
				}else{
					%>
					<li><div id="result">검색 결과가 없습니다.</div></li>
					<%
					
				}
				%>
				
					
				</ol>
			<li>
		</ul>
	</div>
	<!-- 추가 수정부분 170329 수 끝 -->
	
	<ul>
		<li><h3>고객센터</h3></li>
		<li>
			<ul>
			<li><h4>고객의 소리</h4></li>
			<li>
				<ol>
				
					<%
						if (cal != null && cal.size() != 0) {
							for (int i = 0; i < cal.size(); i++) {
					%>
					<li>
						
						<div id="result">
						<a
							href="/semi_Jungo/complainList/complainContent.jsp?idx=<%=cal.get(i).getIdx()%>">
							게시글번호:<%=cal.get(i).getIdx()%> 종류:[<%=cal.get(i).getType()%>] 글제목:<%=cal.get(i).getSubject()%>
							글내용:<%=cal.get(i).getContent()%>
						</a>
						</div>
						
					</li>
					
						<%
						if(i==5)break;
							}
							
						%>

						<%
						} else {
						%>

					<li><div id="result">검색결과가 없습니다.</div></li>
					<%
						}
					%>
				</ol>
			</li>
			<li><h4>질문 게시판</h4></li>
			<li>
				<ol>
					<%
						if (qal != null && qal.size() != 0){
							for (int i = 0; i < qal.size(); i++) {
					%>
					<li>
						
						<div id="result">
						<a
							href="/semi_Jungo/questionList/questionContent.jsp?idx=<%=qal.get(i).getIdx()%>">
							게시글번호 : <%=qal.get(i).getIdx()%> 종류 : [<%=qal.get(i).getType()%>]
							글제목 : <%=qal.get(i).getSubject()%> 글내용 : <%=qal.get(i).getContent()%>
						</a>
						</div>
					
					</li>
					
					<%	
					if(i==5)break;
					}
	
						} else {
					%>
					<li><div id="result">검색결과가 없습니다.</div></li>
					<%
						}
					%>
				</ol>
			</li>	
			<li><h4>자주묻는 질문</h4></li>
			<li>
				<ol>		
					<%
						if (fal != null && fal.size() != 0) {
	
							for (int i = 0; i < fal.size(); i++) {
					%>
					<li>
						
						<div id="result">
						<a
							href="/semi_Jungo/faqList/faqContent.jsp?idx=<%=fal.get(i).getIdx()%>">
							게시글번호:<%=fal.get(i).getIdx()%> 종류:[<%=fal.get(i).getType()%>] 글제목:<%=fal.get(i).getSubject()%>
							글내용:<%=fal.get(i).getContent()%>
						</a>
						</div>
					
					</li>
					<%
					if(i==5)break;
							}
	
						} else {
					%>
					<li><div id="result">검색결과가 없습니다.</div></li>
					<%
					 	}
					 %>
				</ol>
			</li>
			</ul>
		</li>
	</ul>
	
</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>