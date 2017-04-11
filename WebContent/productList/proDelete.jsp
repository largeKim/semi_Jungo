<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pdto" class="tt.product.ProductDTO" scope="page"/>
<jsp:setProperty property="*" name="pdto"/>
<jsp:useBean id="pdao" class="tt.product.ProductDAO" scope="session"/>

<%
int idx = Integer.parseInt(request.getParameter("idx"));

int result = pdao.proDelete(idx);
String msg = result>0?"삭제 성공!":"삭제 실패!";

%>

<script>
	window.alert('<%=msg%>');
	location.href='/semi_Jungo/productList/product<%=pdto.getType()%>List.jsp';
</script>
