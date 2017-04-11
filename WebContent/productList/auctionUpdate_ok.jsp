<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pdto" class="tt.product.ProductDTO" scope="page"/>
<jsp:setProperty property="*" name="pdto"/>
<jsp:useBean id="pdao" class="tt.product.ProductDAO" scope="session"/>

<%
int idx = Integer.parseInt(request.getParameter("idx"));


String filename = request.getParameter("etc1");
String picpath = request.getParameter("etc1path");
String currentPath = request.getParameter("currentPath");
String cp_s = request.getParameter("cp");
if(cp_s.equals("null"))cp_s="1";
int cp = Integer.parseInt(cp_s);
if(!(filename ==null || filename.equals(""))){
	filename = filename.substring(filename.lastIndexOf("\\")+1);
	String etc1 = request.getParameter("etc1path")+filename;
	pdto.setEtc1(etc1);
	System.out.println("수정 etc1 = "+etc1);
}else{
	pdto.setEtc1(currentPath);
}

int result = pdao.proUpdateOK(pdto);

String msg = result>0?"수정 성공!":"수정 실패!";

%>

<script>
	window.alert('<%=msg%>');
	location.href='/semi_Jungo/productList/product<%=pdto.getType()%>List.jsp?cp=<%=cp%>';
</script>
