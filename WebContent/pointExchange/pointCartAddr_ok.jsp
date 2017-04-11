<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="tt.member.*"%>
<jsp:useBean id="spdao" class="tt.sendpresent.SendpresentDAO"></jsp:useBean>
<jsp:useBean id="spdto" class="tt.sendpresent.SendPresentDTO"></jsp:useBean>
<jsp:setProperty property="*" name="spdto"/>

<%
	String userid =	(String)session.getAttribute("sid"); //주문자 아이디

	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String Raddress = addr1+"|"+addr2;
	
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	String Stel = tel1+"-"+tel2+"-"+tel3;
	
	String pnum = request.getParameter("pnum");
	int pnumber = Integer.parseInt(pnum);
	String total = request.getParameter("total");
	int pointTotal = Integer.parseInt(total);
	
	spdto.setId(request.getParameter("name"));
	spdto.setRaddress(Raddress);
	spdto.setStel(Stel);
	spdto.setYourorder(request.getParameter("etc"));
	spdto.setPname(request.getParameter("pcode")); // 상품코드
	spdto.setPnumber(pnumber);
	spdto.setUserid(userid);
	
	int result = spdao.orderPresent(spdto);
	int rusult2 = spdao.pointCal(userid, pointTotal);
	
	String oriPoint = request.getParameter("point");
	int ori = Integer.parseInt(oriPoint);
	int newPoint = ori-pointTotal;
	String msg = result>0?"주문되었습니다.":"주문실패\n확인부탁드립니다.";
%>
		<script>
			window.alert('<%=msg%>');
			location.href='/semi_Jungo/pointExchange/pointProductList.jsp?point=<%=newPoint%>';
		</script>