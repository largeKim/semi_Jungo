<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pdao" class="tt.product.ProductDAO"/>
<jsp:useBean id="pdto" class="tt.product.ProductDTO"/>
<jsp:setProperty property="*" name="pdto"/>

<%
int count = pdao.proReWrite(pdto);


String msg = count>0?"댓글쓰기 성공!":"댓글쓰기 실패!";

%>

<script>
	window.alert('<%=msg%>');
	location.href='/semi_Jungo/productList/product<%=pdto.getType()%>List.jsp';

</script>