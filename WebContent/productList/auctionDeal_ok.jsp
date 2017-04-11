<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*" %>
 	<%@ page import="java.sql.Date" %>

<jsp:useBean id="pdao" class="tt.product.ProductDAO" scope="session"/>

<%


String dealprice_s = request.getParameter("dealprice");
int dealprice = 0;
if(dealprice_s!=null || !dealprice_s.equals("")){
	
	dealprice = Integer.parseInt(dealprice_s);
	
}

String dealid = request.getParameter("dealid");
request.getParameter("");

String idx_s = request.getParameter("idx");
int idx = 0;
if(idx_s!=null || !idx_s.equals("")){
	
	idx = Integer.parseInt(idx_s);
	
}

String etc2 = request.getParameter("etc2");


int result = pdao.dealAuction(dealid, dealprice, idx);


String msg = result>0?"경매 성공!":"경매 실패!";

%>

<script>
	window.alert('<%=msg%>');
	location.href='/semi_Jungo/productList/productAuctionList.jsp';

</script>