<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="mdao" class="tt.member.MemberDAO" scope="session"/>
    <%@ page import="java.util.*" %>
   <%@ page import="tt.product.ProductDTO" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<style>

h2{
	text-align: center;
	border-bottom-style: double;
	width: 705px;
	margin-left: 20%;
	margin-bottom: 0px;
	padding-top: 30px;
	vertical-align: middle;	
}
#cartlb{
	border-left-style:double;
	border-top-style: double;
	border-top-left-radius:10px;
	border-top-right-radius:10px;
	border-right-style: double;
	padding: 20px 20px 0px 20px;
	
	
	
	
}
.cartsec{
	width: 700px;
	margin-left: 20%;
	border-left: double;
	border-right: double;
	border-bottom-style: double;
}
.cartsec li{
	text-align: inherit;
	padding: 20px;
}
.cartsec li img{
	vertical-align: middle;
	width: 50px;
	height: 50px;
	
}
#totalp{
	padding-left: 350px;
	padding-top : 10px;
	padding-right: 10px;
	padding-bottom: 10px;
	margin-top: 10px;
	border-top: 4px;
	
	border-top-style: double;
	
	text-align: right;
	
}
.bean{
	width:100%;
	height:100%;
	
	vertical-align: middle;
	text-align: center;
	
}
a:LINK{
 	text-decoration: none;
}
a:HOVER {
	text-decoration: underline;
	background-color:#EBEBEB;
}
</style>
 <%
  int total = 0;
   String id = (String)session.getAttribute("sid");//업로드 전에 주석 제거하고 바로아래 라인 삭제
 
  
  
  String listarr[]= mdao.favorProductList2(id);
  
  if(id==null || id.equals("")){
	  %>
	  <script>
	  window.alert('로그인이 필요한 서비스 입니다.');
	  location.href="/semi_Jungo/login.jsp";
	  </script>
	  <%
	  return;
  }
  %>
  
</head>
<body>
<%@include file="../header.jsp" %>
<h2><span id="cartlb">장바구니</span></h2>
<section class="cartsec">
	<ul>
		  <% 
		  
		  if(listarr==null){
			 %>
			<li><div class="bean">장바구니가 비어있습니다!! </div></li>
			<%	
			
		  }else{
			  
			  	/* 추가 수정 부분 170329 수 시작 */
				  ArrayList<ProductDTO> al = mdao.favorProductGetInfo(listarr, id);
				/* 추가 수정 부분 170329 수 끝 */  
				if(al==null){
					%>
			<li><div class="bean"> 장바구니가 비어있습니다. </div></li>
					<%
				}else{
				  for(int i=0; i< al.size() ; i++){
					  %>
			<li>		  
					  <form action="delfavor_ok.jsp">
					  <input type="hidden" name="idx" value="<%=al.get(i).getIdx() %>">
					  <input type="hidden" name="id" value="<%=id %>">
					  <% 
					  System.out.println("i = "+i);
					  if(al.get(i).getEtc1()==null || al.get(i).getEtc1().equals("")){
						%>
						[사진X]
						<%  
					  }else{
						  if(al.get(i).getType().equals("Auction")){
						 	 %>
						  	<a href="/semi_Jungo/productList/auctionContent.jsp?idx=<%=al.get(i).getIdx()%>"><img src="<%=al.get(i).getEtc1()%>" id="img" ></a>
						  	<%
						  }else{
							%>
							<a href="/semi_Jungo/productList/productContent.jsp?idx=<%=al.get(i).getIdx()%>"><img src="<%=al.get(i).getEtc1()%>" id="img" ></a>
							<%  
						  }
					  }
					  
					  if(al.get(i).getType().equals("Auction")){
					  %>
					  <a href="/semi_Jungo/productList/auctionContent.jsp?idx=<%=al.get(i).getIdx()%>">
					  <%
					  }else{
						%>
					  <a href="/semi_Jungo/productList/productContent.jsp?idx=<%=al.get(i).getIdx()%>">
						<%  
					  }
					%>글번호&nbsp;:&nbsp;<%=al.get(i).getIdx() %>&nbsp;&nbsp;&nbsp;
					  종류&nbsp;:&nbsp;<%=al.get(i).getType() %>&nbsp;&nbsp;&nbsp;
					  글제목&nbsp;:&nbsp;<%=al.get(i).getSubject() %>&nbsp;&nbsp;&nbsp;
					  가격&nbsp;:&nbsp;<%=al.get(i).getPrice() %>
					  </a>
					  <input type="submit" value="삭제">
					  </form>
			</li>
					  <%
					  
					  total += al.get(i).getPrice();
				  }
				}
				%>
				
				<li id="totalp"><div>총액 :&nbsp;&nbsp;<%=total%></div></li>
			<%
			}
		  %>
	</ul>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>