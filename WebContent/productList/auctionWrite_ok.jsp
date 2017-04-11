<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*" %>
 	<%@ page import="java.sql.Date" %>
<jsp:useBean id="pdto" class="tt.product.ProductDTO" scope="page"/>
<jsp:setProperty property="*" name="pdto"/>
<jsp:useBean id="pdao" class="tt.product.ProductDAO" scope="session"/>

<%
String getprice_s = request.getParameter("getprice");
if(!(getprice_s==null || getprice_s.equals(""))){	//즉시구매가가 있을때
	int getprice = Integer.parseInt(getprice_s);
	
	if(getprice<pdto.getPrice()){
		%>
		<script>
		window.alert('즉시구매가는 경매시작가보다 커야합니다.');
		history.back();
		</script>
		<%
		return;
	}
	
	pdto.setEtc2(getprice_s+"/");
	
}

String writedate_s = request.getParameter("writedate_s");

String datearr_s[] = writedate_s.split("-");


int year=0;
int mon=0;
int day=0;

if(datearr_s!=null && datearr_s.length==3){
year = Integer.parseInt(datearr_s[0]);
mon = Integer.parseInt(datearr_s[1]);
day = Integer.parseInt(datearr_s[2]);
System.out.println("year = " + year);
System.out.println("mon = " + mon);
System.out.println("day = " + day);
}
java.sql.Date writedate = new java.sql.Date(year-1900,mon-1,day);



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


int result = pdao.auctionAdd(pdto, writedate);

String msg = result>0?"글쓰기 성공!":"글쓰기 실패!";

%>

<script>
	window.alert('<%=msg%>');
	location.href='/semi_Jungo/productList/product<%=pdto.getType()%>List.jsp';

</script>