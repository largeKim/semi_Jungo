<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!-- 추가 수정부분 170403 월 시작 -->
	<%@page import="java.util.ArrayList"%>
<%@page import="tt.member.*" %>
<%@page import="tt.pointex.*"%>
<jsp:useBean id="mdao" class="tt.member.MemberDAO" />
<jsp:useBean id="podao" class="tt.pointex.PointexDAO" />
<jsp:useBean id="spdto" class="tt.sendpresent.SendPresentDTO" />

	<%
	String path = request.getParameter("path");
	String sid = (String)session.getAttribute("sid");
	String pname = request.getParameter("pname");
	int price = Integer.parseInt(request.getParameter("price"));
	if(sid==null || sid.equals("")){
		%>
		<script>
		window.alert('로그인이 필요한 서비스 입니다.');
		window.location.href='/semi_Jungo/login.jsp';
		</script>
		<%
		return;
	}
	System.out.println("sid"+sid);
	System.out.println("pname"+pname);
	
	ArrayList<PointexDTO> poarr = podao.getPresentInfo(pname);
	
	int pnumber = 0;
	%>
	<!-- 추가 수정부분 170403 월 끝 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<style type="text/css">
h2 {
	text-align: center;
}

.shopping {
	border: 1px solid black;
	width: 800px;
	margin: 0px auto;
	margin-bottom: 20px;
}

.shopping td {
	border: 1px solid black;
}

.shopCart_bt {
	margin: 0px auto;
	border: 1px solid black;
	background-color: white;
	display: block;
	width: 100px;
	text-align: center;
	padding: 10px 0px 10px 0px;
}

.shopCart_bt a:LINK {
	color: black;
	text-decoration: none;
}

.shopCart_bt a:VISITED {
	color: black;
	text-decoration: none;
}

.shopCart_bt a:HOVER {
	color: red;
	text-decoration: underline;
}

#pcolor:FOCUS {
	border-radius:3px;
	border: 1px aqua;
	color: yellow;
	text-decoration: underline;
	
}


</style>
<script>

var pnum;
var pcodecolor;
function changemax(col){
	
	if(document.getElementById(col).value == '0'){
		window.alert('품절된 상품을 선택하셨습니다.');
	}else{
	var color = document.getElementById('pcolor').value;
	var num = document.getElementById(col).value;
	document.getElementById('pmax').value = 0;
	document.getElementById('pmax').max = num;
	document.getElementById('imgcolor').value = col;
	pcodecolor = ""+col+"code";
	}
	
}


function sumPrice(){
   var sumPrice = document.cartList.count.value;
   pnum = document.cartList.count.value;
   var price = <%=price%>;
   document.cartList.sum.value = (sumPrice*price);
   
}

function oopen(){
	
	if(document.getElementById('pmax').value == ''){
		window.alert('색상을 선택해 주세요.');	
	}else if(document.getElementById('pmax').value == '0'){
		window.alert('구매수량을 선택해 주세요.');
	}else{
	var code = document.getElementById(pcodecolor).value;
	location.href='pointCart.jsp?userclick=1&pname=<%=pname%>&price=<%=price%>&path=<%=path%>&pnum='+pnum+'&pcode='+code+'&point=<%=request.getParameter("point")%>';
	}
	
}

</script>
</head>
<body>
	<%@include file="../header.jsp" %>
	<h2>| Shopping Cart |</h2>
	<section>
		<article>
		<form name="cartList">
			<table class="shopping">
				<tr>
					<th width="50%"><img src="<%=poarr.get(0).getPicpath()%>" width="300"><input type="text" id="imgcolor"></th>
					<td><table class="shoppingInfo">
							<tr>
								<td colspan="2">제품명 : <%=poarr.get(0).getPname() %></td>
							</tr>
							<tr>
								<td>판매가</td>
								<td><input type="text" id="pprice" value="<%=poarr.get(0).getPprice() %>원" readonly="readonly"></td>
							</tr>
							<tr>
								<td>색상</td>
								<td>
								
								<%
								for(int i=0 ; i < poarr.size() ; i++){
									
									String arr[] = poarr.get(i).getPcode().split("-");
									System.out.println("색상"+arr[1]);
									%>
									
									<input type="button" id="pcolor" onclick="changemax('<%=arr[1]%>')" value="<%=poarr.get(i).getPnum()==0?arr[1]+"[품절]":arr[1]%>/재고:<%=poarr.get(i).getPnum()%>" style="color:<%=arr[1]%>;">
									<input type="hidden" id="<%=arr[1]%>code" value="<%=poarr.get(i).getPcode()%>">
									<input type="hidden" id="<%=arr[1]%>" value="<%=poarr.get(i).getPnum() %>">
									<%
								}
								%>
									
								</td>
							</tr>
							<tr>
								<td>구매수량</td>
								<td><input type="number" id="pmax" onclick="sumPrice()" name="count" max="" min="0" ></td>
							</tr>
							<tr>
								<td>총 상품 금액</td>
								<td><input type="text" id="totalprice" name="sum" readonly="readonly"></td>
							</tr>
						</table></td>
				</tr>
			</table>
			</form>
			<%
				String userclick_s = request.getParameter("userclick");
				int userclick;
				if (userclick_s == null || userclick_s.equals("")) {
					userclick = 0;
				} else {
					userclick = Integer.parseInt(userclick_s);
				}
			%>
			<div class="shopCart_bt">
            <a href ="javascript:oopen();">품목결정</a>
         </div>
      </article>
      <article>
         <div class="shopAddr">
            <%
               if (userclick == 1) {
            %>
            <jsp:include page="pointCartAddr.jsp"/>
            <%
               }
            %>
         </div>
		</article>
	</section>
	<%@include file="../footer.jsp"%>
</body>
</html>