<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*" %>
 
<jsp:useBean id="pdto" class="tt.product.ProductDTO" scope="page"/>
<jsp:setProperty property="*" name="pdto"/>
<jsp:useBean id="pdao" class="tt.product.ProductDAO" scope="session"/>

<%



System.out.println("getEtc:"+pdto.getEtc1());

String filename = request.getParameter("etc1");

if(!(filename ==null || filename.equals(""))){
	filename = filename.substring(filename.lastIndexOf("\\")+1);
	String etc1 = request.getParameter("etc1path")+filename;
	pdto.setEtc1(etc1);
	System.out.println("글쓰기etc1 = "+etc1);
	
}else{
	pdto.setEtc1("");
}

int result = pdao.proAdd(pdto);
String msg = result>0?"글쓰기 성공!":"글쓰기 실패!";

%>

<script>
	window.alert('<%=msg%>');
	location.href='/semi_Jungo/productList/product<%=pdto.getType()%>List.jsp';

</script>